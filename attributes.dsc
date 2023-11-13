stats_calculation_all_slots:
    type: procedure
	debug: false
	definitions: player
	script:
	    - define slots <list[<[player].held_item_slot>|41|37|38|39|40]>
		- define stats_map <map[]>
		- define stats_map_context <map[]>
		- foreach <[slots]>:
		  - if <[player].inventory.slot[<[value]>].material.name> = AIR:
  		    - foreach next
		  - define item <[player].inventory.slot[<[value]>]>
		  - define script <script[<[item].script.name>]>
		  - if <[script].data_key[data.stats].contains[attribute_modifiers]> = true:
		    - define attributes <[script].data_key[data.stats.attribute_modifiers]>
		    - foreach <[attributes].keys> as:attribute:
		      - if <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.type]> = vanilla:
		        - define attribute_value <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.amount]>
		        - if <[stats_map].as_map.contains[<[attribute]>]> = false:
			      - define stats_map <[stats_map].as_map.include[<[attribute]>=<[attribute_value]>]>
			    - else:
			      - define stats_map_value <[stats_map].get[<[attribute]>]>
		          - define stats_map <[stats_map].as_map.with[<[attribute]>].as[<[stats_map_value].add[<[attribute_value]>]>
			  - else if <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.type]> = custom:
			    - define attribute_value <[script].data_key[data.stats.attribute_modifiers.<[attribute]>.amount]>
			    - define custom_stats_map_value <player.flag[custom_stats_map].get[<[attribute]>]>
			    - if <player.flag[custom_stats_map].contains[<[attribute]>]> = false:
			      - flag <player> custom_stats_map:<player.flag[custom_stats_map].as_map.with[<[attribute]>].as[<[custom_stats_map_value].add[<[attribute_value]>]>
		- foreach <player.flag[stats_map].keys> as:attribute:
		  - define attribute_flag_value <player.flag[stats_map].get[<[attribute]>]>
		  - if <[stats_map].contains[<[attribute]>]> = true:
		    - define stats_map_value <[stats_map].get[<[attribute]>]>
		  - else:
		    - define stats_map_value <element[0]>
		  - define attribute_value <[attribute_flag_value].add[<[stats_map_value]>]>
		  - define stats_map_context <[stats_map_context].with[<[attribute]>].as[<[attribute_value]>]>
		- determine <[stats_map_context]>
stats_calculation_slot:
    type: procedure
	debug: false
	definitions: script|proc
	script:
	    - define script <[script]||null>
		- if <[script]> = null:
		  - stop
	    - define attributes <[script].data_key[data.stats.attribute_modifiers]>
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
		  - define item <context.item.script.name||null>
		  - define proc <element[exclude]>
		  - if <[item]> = null:
			- define item <context.cursor_item.script.name||null>
			- define proc <element[include]>
		  - define script <script[<[item]>]||null>
		  - if <context.clicked_inventory> = <player.inventory>:
		    - if <player.held_item_slot> = <context.slot>:
			  - if <script[<[item]>].data_key[data.stats.attribute_modifiers.<script[<[item]>].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
			    - if <[script]> = null:
			      - stop
			    - else:
		          - run stats_calculation_slot def:<[script]>|<[proc]> save:attributes
	              - define attributes <entry[attributes].created_queue.determination.get[1]>
		          - flag <player> stats_map:<[attributes]>
			- if <element[41]> = <context.slot>:
			  - if <script[<[item]>].data_key[data.stats.attribute_modifiers.<script[<[item]>].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = offhand:
			    - if <[script]> = null:
			      - stop
			    - else:
		          - run stats_calculation_slot def:<[script]>|<[proc]> save:attributes
	              - define attributes <entry[attributes].created_queue.determination.get[1]>
		          - flag <player> stats_map:<[attributes]>
		          - flag <player> stats_map:<[attributes]>
		  - run stats_give
		on player equips item:
		  - define item_new <context.new_item.script.name||null>
		  - define script <script[<[item_new]>]||null>
		  - if <[script]> = null:
		    - stop
		  - else:
		    - run stats_calculation_slot def:<[script]>|include save:attributes_new
		    - define attributes_new <entry[attributes_new].created_queue.determination.get[1]>
			- flag <player> stats_map:<[attributes_new]>
		  - run stats_give
		on player unequips item:
		  - define item_old <context.old_item.script.name||null>
		  - define script <script[<[item_old]>]||null>
		  - if <[script]> = null:
		    - stop
		  - else:
		    - run stats_calculation_slot def:<[script]>|exclude save:attributes_old
		    - define attributes_old <entry[attributes_old].created_queue.determination.get[1]>
			- flag <player> stats_map:<[attributes_old]>
		  - run stats_give
		on player scrolls their hotbar:
		  - define old_slot <player.inventory.slot[<context.previous_slot>].script.name||null>
		  - define script <script[<[old_slot]>]||null>
		  - if <[script]> != null:
		    - if <[script].data_key[data.stats.attribute_modifiers.<[script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
		      - run stats_calculation_slot def:<[script]>|exclude save:attributes_old
			  - define attributes_old <entry[attributes_old].created_queue.determination.get[1]>
			  - flag <player> stats_map:<[attributes_old]>
		  - define new_slot <player.inventory.slot[<context.new_slot>].script.name||null>
		  - define script <script[<[new_slot]>]||null>
		  - if <[script]> != null:
		    - if <[script].data_key[data.stats.attribute_modifiers.<[script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
		      - run stats_calculation_slot def:<[script]>|include save:attributes_new
			  - define attributes_new <entry[attributes_new].created_queue.determination.get[1]>
			  - flag <player> stats_map:<[attributes_new]>
		  - run stats_give
		on player swaps items:
		  - define mainhand_slot <context.main.script.name||null>
		  - define hand_script <script[<[mainhand_slot]>]||null>
		  - define offhand_slot <context.offhand.script.name||null>
		  - define offhand_script <script[<[offhand_slot]>]||null>
		  - if <[hand_script]> != null && <[offhand_script]> = null:
		    - if <[hand_script].data_key[data.stats.attribute_modifiers.<[hand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = hand:
		      - define proc <element[include]>
			- else:
			  - define proc <element[exclude]>
			- run stats_calculation_slot def:<[hand_script]>|exclude save:attributes_old
			- define attributes_old <entry[attributes_old].created_queue.determination.get[1]>
		    - flag <player> stats_map:<[attributes_old]>
		  - if <[offhand_script]> != null && <[hand_script]> = null:
		    - if <[offhand_script].data_key[data.stats.attribute_modifiers.<[offhand_script].data_key[data.stats.attribute_modifiers].keys.first>.slot]> = offhand:
		      - define proc <element[include]>
			- else:
			  - define proc <element[exclude]>
			- run stats_calculation_slot def:<[offhand_script]>|<[proc]> save:attributes_new
			- define attributes_new <entry[attributes_new].created_queue.determination.get[1]>
			- flag <player> stats_map:<[attributes_new]>
		  - run stats_give
		on player breaks held item:
		  - if <context.item> = null:
		    - stop
		  - else:
		    - run stats_calculation_slot def:<script[<context.item.script.name>]>|exclude save:attributes
		    - define attributes <entry[attributes].created_queue.determination.get[1]>
			- flag <player> stats_map:<[attributes]>
		    - run stats_give
		on player dies:
		  - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
		  - flag <player> custom_stats_map:<map[GENERIC_REEACH_DISTANCE=0;GENERIC_DEEPTH_OF_WOUND=0;METALURGIST=0;PRISTINE=0]>
		on player respawns:
		  - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
		  - flag <player> custom_stats_map:<map[GENERIC_REEACH_DISTANCE=0;GENERIC_DEEPTH_OF_WOUND=0;METALURGIST=0;PRISTINE=0]>
		  - run stats_calculation_all_slots def:<player> save:attributes
		  - define attributes <entry[attributes].created_queue.determination.get[1]>
		  - flag <player> stats_map:<[attributes]>
		  - run stats_give
		on player changes world from world to world:
		  - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
          - flag <player> custom_stats_map:<map[GENERIC_REEACH_DISTANCE=0;GENERIC_DEEPTH_OF_WOUND=0;METALURGIST=0;PRISTINE=0]>
		  - run stats_calculation_all_slots def:<player> save:attributes
		  - define attributes <entry[attributes].created_queue.determination.get[1]>
		  - flag <player> stats_map:<[attributes]>
		  - run stats_give
		on player joins:
		  - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
          - flag <player> custom_stats_map:<map[GENERIC_REEACH_DISTANCE=0;GENERIC_DEEPTH_OF_WOUND=0;METALURGIST=0;PRISTINE=0]>
		  - run stats_calculation_all_slots def:<player> save:attributes
		  - define attributes <entry[attributes].created_queue.determination.get[1]>
		  - flag <player> stats_map:<[attributes]>
		  - run stats_give
		on player enters cuboid:
		  - if <context.area.has_flag[attribute_remove]> = true:
		    - flag <player> stats_map:<map[GENERIC_ATTACK_DAMAGE=0;GENERIC_ATTACK_SPEED=0;GENERIC_MAX_HEALTH=0;GENERIC_MOVEMENT_SPEED=0;GENERIC_ARMOR=0;GENERIC_ARMOR_TOUGHNESS=0;GENERIC_ATTACK_DAMAGE=0;GENERIC_KNOCKBACK_RESISTANCE=0]>
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