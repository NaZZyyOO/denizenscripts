stats_calculation_all_slots:
    type: procedure
	debug: false
	definitions: player
	script:
	    - define slots <list[<[player].held_item_slot>|41|37|38|39|40]>
		- define stats_map <map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
		- foreach <[slots]>:
		  - if <[player].inventory.slot[<[value]>].material.name> = air:
  		    - foreach next
		  - define item <[player].inventory.slot[<[value]>]>
		  - if <[item]> = null:
		    - foreach next
		  - define item_script <[item].script.name||null>
		  - define script <script[<[item_script]>]||null>
		  - if <[script]> = null:
		    - foreach next
		  - if <[script].data_key[data.stats].keys.contains[attribute_modifiers]> = true:
		    - if <[value]> = <[player].held_item_slot>:
		      - if <[script].data_key[data.stats.attribute_modifiers.<[script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> != hand:
			    - foreach next
		  - if <[script].data_key[data.stats].contains[attribute_modifiers]> = true:
		    - define attributes <[script].data_key[data.stats.attribute_modifiers]>
		    - foreach <[attributes].keys> as:attribute:
		      - if <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.type]> = vanilla:
		        - define attribute_value <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.amount]>
			    - define stats_map_value <[stats_map].get[<[attribute]>]>
				- define stats_map_value <[stats_map_value].add[<[attribute_value]>]>
		        - define stats_map <[stats_map].with[<[attribute]>].as[<[stats_map_value]>]>
			  - else if <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.type]> = custom:
			    - define attribute_value <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.amount]>
			    - define custom_stats_map_value <[player].flag[custom_stats_map].get[<[attribute]>]>
			    - if <[player].flag[custom_stats_map].contains[<[attribute]>]> = false:
			      - flag <[player]> custom_stats_map:<[player].flag[custom_stats_map].as_map.with[<[attribute]>].as[<[custom_stats_map_value].add[<[attribute_value]>]>
		- determine <[stats_map]>
stats_calculation_slot:
    type: procedure
	debug: false
	definitions: script|proc
	script:
	    - define script <[script]||null>
		- if <[script]> = null:
		  - stop
		- if <[script].data_key[data.stats].contains[attribute_modifiers]> = true:
	      - define attributes <[script].data_key[data.stats.attribute_modifiers]>
		- else:
		  - stop
		- define stats_map <map[]>
		- define custom_stats_map <map[]>
		- foreach <[attributes].keys> as:attribute:
		  - if <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.type]> = vanilla:
	        - define stats_map_value <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.amount]>
		    - define stats_map <[stats_map].as_map.with[<[attribute]>].as[<[stats_map_value]>]>
		  - if <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.type]> = custom:
	        - define custom_stats_map_value <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.amount]>
		    - define custom_stats_map <[custom_stats_map].as_map.with[<[attribute]>].as[<[custom_stats_map_value]>]>
		- define final_stats <map[]>
		- foreach <player.flag[stats_map].keys> as:attribute:
		  - if <[stats_map].contains[<[attribute]>]> = true:
		    - define stats_map_value <[stats_map].get[<[attribute]>]>
		  - else:
		    - define stats_map_value <element[0]>
		  - if <[proc]> = include:
			- define attribute_value <player.flag[stats_map].get[<[attribute]>]>
			- define attribute_value <[attribute_value].add[<[stats_map_value]>]>
			- define final_stats <[final_stats].as_map.with[<[attribute]>].as[<[attribute_value]>]>
	      - if <[proc]> = exclude:
			- define attribute_value <player.flag[stats_map].get[<[attribute]>]>
		    - define attribute_value <[attribute_value].sub[<[stats_map_value]>]>
			- define final_stats <[final_stats].as_map.with[<[attribute]>].as[<[attribute_value]>]>
	    - foreach <player.flag[custom_stats_map].keys> as:custom_attribute:
		  - if <[custom_stats_map].contains[<[custom_attribute]>]> = true:
		    - define custom_stats_map_value <[custom_stats_map].get[<[attribute]>]>
		  - else:
		    - define custom_stats_map_value <element[0]>
		  - if <[proc]> = include:
		    - define custom_attribute_value <player.flag[custom_stats_map].get[<[custom_attribute]>]>
			- define custom_attribute_value <[custom_attribute_value].add[<[stats_map_value]>]>
			- flag <player> custom_stats_map:<player.flag[custom_stats_map].as_map.with[<[custom_attribute]>].as[<[custom_attribute_value]>]>
		  - if <[proc]> = exclude:
		    - define custom_attribute_value <player.flag[custom_stats_map].get[<[custom_attribute]>]>
			- define custom_attribute_value <[custom_attribute_value].sub[<[stats_map_value]>]>
			- flag <player> custom_stats_map:<player.flag[custom_stats_map].as_map.with[<[custom_attribute]>].as[<[custom_attribute_value]>]>
        - determine <[final_stats]>
stats_calculation_event:
    type: world
	debug: false
	events:
		on player !CONTROL_DROP clicks item in inventory:
		  - ratelimit <player> 1t
		  - define item <context.item.script.name||null>
		  - define proc <element[exclude]>
		  - if <[item]> = null:
			- define item <context.cursor_item.script.name||null>
			- define proc <element[include]>
		  - define script <script[<[item]>]||null>
		  - if <script[<[item]>].data_key[data]||null> = null:
            - stop		  
		  - if <player.is_online> = true:
		    - if <player.held_item_slot> = <context.slot>:
			  - if <[script]> = null:
			    - stop
			  - else:
			    - if <script[<[item]>].data_key[data.stats].keys.contains[attribute_modifiers]> = true:
				  - if <script[<[item]>].data_key[data.stats.attribute_modifiers.<script[<[item]>].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
		            - run stats_calculation_slot def:<[script]>|<[proc]> save:attributes
	                - define attributes <entry[attributes].created_queue.determination.get[1]>
		            - flag <player> stats_map:<[attributes]>
			- if <element[41]> = <context.slot>:
			  - if <[script]> = null:
			    - stop
			  - else:
			    - if <script[<[item]>].data_key[data.stats].keys.contains[attribute_modifiers]> = true:
				  - if <script[<[item]>].data_key[data.stats.attribute_modifiers.<script[<[item]>].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = offhand:
		            - run stats_calculation_slot def:<[script]>|<[proc]> save:attributes
	                - define attributes <entry[attributes].created_queue.determination.get[1]>
		            - flag <player> stats_map:<[attributes]>
		            - flag <player> stats_map:<[attributes]>
		  - if <context.click> = SWAP_OFFHAND:
		    - determine passively cancelled
		  - run stats_give
		on player equips item:
		  - ratelimit <player> 1t
		  - define item_new <context.new_item.script.name||null>
		  - define script <script[<[item_new]>]||null>
		  - if <[script]> = null:
		    - stop
		  - else:
		    - if <script[<[item_new]>].data_key[data]||null> = null:
              - stop
		    - run stats_calculation_slot def:<[script]>|include save:attributes_new
		    - define attributes_new <entry[attributes_new].created_queue.determination.get[1]>
			- flag <player> stats_map:<[attributes_new]>
		  - run stats_give
		on player unequips item:
		  - ratelimit <player> 1t
		  - define item_old <context.old_item.script.name||null>
		  - define script <script[<[item_old]>]||null>
		  - if <[script]> = null:
		    - stop
		  - else:
		    - if <script[<[item_old]>].data_key[data]||null> = null:
              - stop
		    - run stats_calculation_slot def:<[script]>|exclude save:attributes_old
		    - define attributes_old <entry[attributes_old].created_queue.determination.get[1]>
			- flag <player> stats_map:<[attributes_old]>
		  - run stats_give
		on player scrolls their hotbar:
		  - ratelimit <player> 1t
		  - define old_slot <player.inventory.slot[<context.previous_slot>].script.name||null>
		  - define script <script[<[old_slot]>]||null>
		  - if <[script]> != null:
		    - if <script[<[old_slot]>].data_key[data]||null> != null:
		      - if <[script].data_key[data.stats].keys.contains[attribute_modifiers]> = true:
		        - if <[script].data_key[data.stats.attribute_modifiers.<[script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
		          - run stats_calculation_slot def:<[script]>|exclude save:attributes_old
			      - define attributes_old <entry[attributes_old].created_queue.determination.get[1]>
			      - flag <player> stats_map:<[attributes_old]>
		  - define new_slot <player.inventory.slot[<context.new_slot>].script.name||null>
		  - define script <script[<[new_slot]>]||null>
		  - if <[script]> != null:
		    - if <script[<[new_slot]>].data_key[data]||null> != null:
		      - if <[script].data_key[data.stats].keys.contains[attribute_modifiers]> = true:
		        - if <[script].data_key[data.stats.attribute_modifiers.<[script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
		          - run stats_calculation_slot def:<[script]>|include save:attributes_new
			      - define attributes_new <entry[attributes_new].created_queue.determination.get[1]>
			      - flag <player> stats_map:<[attributes_new]>
		  - run stats_give
		on player swaps items:
		  - ratelimit <player> 1t
		  - define mainhand_slot <context.main.script.name||null>
		  - define hand_script <script[<[mainhand_slot]>]||null>
		  - define offhand_slot <context.offhand.script.name||null>
		  - define offhand_script <script[<[offhand_slot]>]||null>
		  - if <[hand_script]> != null && <[offhand_script]> = null:
		    - if <script[<[mainhand_slot]>].data_key[data]||null> = null:
              - stop
		    - if <[hand_script].data_key[data.stats.attribute_modifiers.<[hand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
		      - define proc <element[include]>
			- else if <[hand_script].data_key[data.stats.attribute_modifiers.<[hand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = offhand:
			  - define proc <element[exclude]>
			- run stats_calculation_slot def:<[hand_script]>|<[proc]> save:attributes_old
			- define attributes_old <entry[attributes_old].created_queue.determination.get[1]>
		    - flag <player> stats_map:<[attributes_old]>
		  - if <[offhand_script]> != null && <[hand_script]> = null:
		    - if <script[<[offhand_slot]>].data_key[data]||null> = null:
              - stop
		    - if <[offhand_script].data_key[data.stats.attribute_modifiers.<[offhand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = offhand:
		      - define proc <element[include]>
			- else if <[offhand_script].data_key[data.stats.attribute_modifiers.<[offhand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
			  - define proc <element[exclude]>
			- run stats_calculation_slot def:<[offhand_script]>|<[proc]> save:attributes_new
			- define attributes_new <entry[attributes_new].created_queue.determination.get[1]>
			- flag <player> stats_map:<[attributes_new]>
		  - if <[offhand_script]> != null && <[hand_script]> != null:
		    - if <script[<[mainhand_slot]>].data_key[data]||null> = null:
              - stop
		    - if <[hand_script].data_key[data.stats.attribute_modifiers.<[hand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
		      - define proc <element[include]>
			- else if <[hand_script].data_key[data.stats.attribute_modifiers.<[hand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = offhand:
			  - define proc <element[exclude]>
			- run stats_calculation_slot def:<[hand_script]>|<[proc]> save:attributes_old
			- define attributes_old <entry[attributes_old].created_queue.determination.get[1]>
		    - flag <player> stats_map:<[attributes_old]>
			- if <script[<[offhand_slot]>].data_key[data]||null> = null:
              - stop
			- if <[offhand_script].data_key[data.stats.attribute_modifiers.<[offhand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = offhand:
		      - define proc <element[include]>
			- else if <[offhand_script].data_key[data.stats.attribute_modifiers.<[offhand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
			  - define proc <element[exclude]>
			- run stats_calculation_slot def:<[offhand_script]>|<[proc]> save:attributes_new
			- define attributes_new <entry[attributes_new].created_queue.determination.get[1]>
			- flag <player> stats_map:<[attributes_new]>
		  - run stats_give
		on player breaks held item:
		  - ratelimit <player> 1t
		  - if <context.item> = null:
		    - stop
		  - else:
		    - run stats_calculation_slot def:<script[<context.item.script.name>]>|exclude save:attributes
		    - define attributes <entry[attributes].created_queue.determination.get[1]>
			- flag <player> stats_map:<[attributes]>
		    - run stats_give
		on player drops item:
		  - ratelimit <player> 1t
		  - define item_script <context.item.script.name||null>
		  - define script <script[<[item_script]>]||null>
		  - if <[script]> != null:
		    - if <script[<[item_script]>].data_key[data]||null> = null:
              - stop
		    - if <[script].data_key[data.stats].keys.contains[attribute_modifiers]> = true:
		      - if <[script].data_key[data.stats.attribute_modifiers.<[script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
		        - run stats_calculation_slot def:<[script]>|exclude save:attributes_old
			    - define attributes_old <entry[attributes_old].created_queue.determination.get[1]>
			    - flag <player> stats_map:<[attributes_old]>
		  - else:
		    - stop
		  - run stats_give
		on player picks up item:
		  - ratelimit <player> 1t
		  - define item_script <context.item.script.name||null>
		  - define script <script[<[item_script]>]||null>
		  - if <[script]> != null:
		    - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
            - flag <player> custom_stats_map:<map[GENERIC_REEACH_DISTANCE=0;GENERIC_SWING_OF_BLOW=1;GENERIC_DEEPTH_OF_WOUND=0;METALURGIST=0;PRISTINE=0]>
		    - wait 1s
		    - run stats_calculation_all_slots def:<player> save:attributes
		    - define attributes <entry[attributes].created_queue.determination.get[1]>
		    - flag <player> stats_map:<[attributes]>
		  - run stats_give
		on player dies:
		  - ratelimit <player> 1t
		  - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
		  - flag <player> custom_stats_map:<map[GENERIC_REEACH_DISTANCE=0;GENERIC_SWING_OF_BLOW=1;GENERIC_DEEPTH_OF_WOUND=0;METALURGIST=0;PRISTINE=0]>
		on player respawns:
		  - ratelimit <player> 1t
		  - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
		  - flag <player> custom_stats_map:<map[GENERIC_REEACH_DISTANCE=0;GENERIC_SWING_OF_BLOW=1;GENERIC_DEEPTH_OF_WOUND=0;METALURGIST=0;PRISTINE=0]>
		  - run stats_calculation_all_slots def:<player> save:attributes
		  - define attributes <entry[attributes].created_queue.determination.get[1]>
		  - flag <player> stats_map:<[attributes]>
		  - run stats_give
		on player changes world from world to world:
		  - ratelimit <player> 1t
		  - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
          - flag <player> custom_stats_map:<map[GENERIC_REEACH_DISTANCE=0;GENERIC_SWING_OF_BLOW=1;GENERIC_DEEPTH_OF_WOUND=0;METALURGIST=0;PRISTINE=0]>
		  - run stats_calculation_all_slots def:<player> save:attributes
		  - define attributes <entry[attributes].created_queue.determination.get[1]>
		  - flag <player> stats_map:<[attributes]>
		  - run stats_give
		on player enters cuboid:
		  - ratelimit <player> 1t
		  - if <context.area.has_flag[attribute_remove]> = true:
		    - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
			- flag <player> custom_stats_map:<map[GENERIC_REEACH_DISTANCE=0;GENERIC_SWING_OF_BLOW=1;GENERIC_DEEPTH_OF_WOUND=0;METALURGIST=0;PRISTINE=0]>
stats_give:
    type: task
	debug: false
	script:
	  - define stats_map <player.flag[stats_map]>
	  - define stats <map[]>
	  - foreach <[stats_map].keys> as:attribute:
	    - define attribute_value <[stats_map].get[<[attribute]>]>
		- if <[attribute]> = generic_movement_speed:
		  - define stats <[stats].with[<[attribute]>].as[<map[name=<[attribute]>;operation=ADD_SCALAR;amount=<[attribute_value]>;slot=any]>]>
		- else:
	      - define stats <[stats].with[<[attribute]>].as[<map[name=<[attribute]>;operation=ADD_NUMBER;amount=<[attribute_value]>;slot=any]>]>
	  - adjust <player> attribute_modifiers:<[stats]>  