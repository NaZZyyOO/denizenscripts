items_upgrades_menu:
    type: inventory
    debug: false
    inventory: chest
    title: "<&l>Модификаторы предметов"
    size: 27
    slots:
    - [empty] [empty] [empty] [empty] [] [empty] [empty] [empty] [empty]
	- [] [empty] [empty] [empty] [empty] [empty] [empty] [empty] []
	- [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
item_upgrading_process:
  type: item
  debug: false
  material: lime_stained_glass_pane
  display name: "<&7>Улучшение..."
  flags:
    GUI:
items_upgrades_menu_clicks:
    type: world
	debug: false
	events:
	    on player !CONTROL_DROP clicks item in inventory:
		  - if <context.clicked_inventory.script.name||null> = items_upgrades_menu:
		    - if <context.click> != RIGHT:
		      - define old_lore_gemstone "<&7>[Empty Slot] - Gemstone."
			  - define old_lore_poison "<&7>[Empty Slot] - Poison."
		      - if <context.slot> = 5:    
			    - if <context.action> = PLACE_ALL:
			      - if <context.cursor_item.has_flag[modifiers]> = true:
				    - define process_gem <list[4|3|2|1]>
					- define process_poison <list[6|7|8|9]>
					- define gemstone <context.cursor_item.flag[gemstone]>
					- if <[gemstone]> != false:
				      - define new_lore_gemstone "<&7>[Gemstone] - <item[<[gemstone]>].display><&7>."
					- define poison <context.cursor_item.flag[poison]>
					- if <[poison]> != false:
			          - define new_lore_poison "<&7>[Poison] - <item[<[poison]>].display><&7>."
				    - if <context.cursor_item.flag[gemstone]> != false:
					  - flag <player> uprading_process expire:9s
					  - foreach <[process_gem]>:
					    - wait 1s
						- inventory set d:<context.clicked_inventory> slot:<[value]> item:item_upgrading_process
						- wait 1s
						- inventory set d:<context.clicked_inventory> slot:<[value]> item:empty
				      - give <context.cursor_item.flag[gemstone]> quantity:1 to:<context.clicked_inventory> slot:10
                      - inventory slot:5 d:<context.clicked_inventory> flag gemstone:false
					  - if <[gemstone]> != false:
				        - inventory adjust slot:5 d:<context.clicked_inventory> lore:<context.clicked_inventory.slot[5].lore.replace_text[<[new_lore_gemstone]>].with[<[old_lore_gemstone]>]>
				    - if <context.cursor_item.flag[poison]> != false:
					  - flag <player> uprading_process expire:9s
					  - foreach <[process_poison]>:
					    - wait 1s
						- inventory set d:<context.clicked_inventory> slot:<[value]> item:item_upgrading_process
						- wait 1s
						- inventory set d:<context.clicked_inventory> slot:<[value]> item:empty
			          - give <context.cursor_item.flag[poison]> quantity:1 to:<context.clicked_inventory> slot:18
				      - inventory slot:5 d:<context.clicked_inventory> flag poison:false
					  - if <[poison]> != false:
				        - inventory adjust slot:5 d:<context.clicked_inventory> lore:<context.clicked_inventory.slot[5].lore.replace_text[<[new_lore_poison]>].with[<[old_lore_poison]>]>
		        - if <context.action> = PICKUP_ALL:
				  - if <player.has_flag[uprading_process]> = true:
				    - determine passively cancelled
				  - define gemstone_flag <context.clicked_inventory.slot[10].script.name||null>
				  - if <[gemstone_flag]> = null:
				    - define gemstone_flag false
				  - define poison_flag <context.clicked_inventory.slot[18].script.name||null>
				  - if <[poison_flag]> = null:
				    - define poison_flag false
				  - if <[gemstone_flag]> != false:
				    - define new_lore_gemstone "<&7>[Gemstone] - <item[<[gemstone_flag]>].display><&7>."
				  - if <[poison_flag]> != false:
			        - define new_lore_poison "<&7>[Poison] - <item[<[poison_flag]>].display><&7>."
				  - if <context.clicked_inventory.slot[10].material> != air:
				    - inventory slot:5 d:<context.clicked_inventory> flag gemstone:<[gemstone_flag]>
				    - if <[gemstone_flag]> != false:
				      - inventory adjust slot:5 d:<context.clicked_inventory> lore:<context.clicked_inventory.slot[5].lore.replace_text[<[old_lore_gemstone]>].with[<[new_lore_gemstone]>]>
				    - if <context.clicked_inventory.slot[5].flag[gemstone]> = item_ruby:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_ruby]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_saphire:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_saphire]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_thopaz:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_thopaz]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_chaorit:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_chaorit]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_onix:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_onix]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_avanturin:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_avanturin]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_geliodor:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_geliodor]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_granat:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_granat]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_brilliant:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_brilliant]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_demantoid:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_demantoid]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_spinel:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_spinel]>
					- if <context.clicked_inventory.slot[5].flag[gemstone]> = item_alexandrite:
					  - define gemstone <element[<context.clicked_inventory.slot[5].script.name>_alexandrite]>
					- inventory adjust slot:5 d:<context.clicked_inventory> raw_nbt:<map[ItemLingo=string:<[gemstone]>]>
					- inventory adjust slot:10 d:<context.clicked_inventory> material:air
					- if <player.has_flag[uprading_process]> = false:
					  - playsound sound:BLOCK_ANVIL_USE volume:1 pitch:0.8 <player>
				  - if <context.clicked_inventory.slot[18].material> != air:
				    - inventory slot:5 d:<context.clicked_inventory> flag poison:<[poison_flag]>
				    - if <[poison_flag]> != false:
				      - inventory adjust slot:5 d:<context.clicked_inventory> lore:<context.clicked_inventory.slot[5].lore.replace_text[<[old_lore_poison]>].with[<[new_lore_poison]>]>
				    - inventory adjust slot:18 d:<context.clicked_inventory> material:air
					- if <player.has_flag[uprading_process]> = false:
					  - playsound sound:BLOCK_ANVIL_USE volume:1 pitch:0.8 <player>
			  - if <context.slot> = 10:
			    - if <context.action> = PLACE_ALL:
			      - if <context.cursor_item.has_flag[gem_modifier]> = false:
				    - determine passively cancelled
			    - if <context.action> = PICKUP_ALL:
			      - if <context.item.has_flag[gem_modifier]> = false:
				    - determine passively cancelled
			  - if <context.slot> = 18:
			    - if <context.action> = PLACE_ALL:
			      - if <context.cursor_item.has_flag[poison_modifier]> = false:
				    - determine passively cancelled
			    - if <context.action> = PICKUP_ALL:
			      - if <context.item.has_flag[poison_modifier]> = false:
				    - determine passively cancelled
			  - if <context.clicked_inventory.slot[5]> != air:
			    - if <context.slot> != 5:
			      - if <context.slot> != 10 && <context.slot> != 18:
			        - determine passively cancelled
			  - if <context.cursor_item.quantity> > 1:
			    - determine passively cancelled
			  - if <context.action> = HOTBAR_SWAP || <context.action> = HOTBAR_MOVE_AND_READD:
		        - determine passively cancelled
			  - if <context.clicked_inventory.slot[5]> = air:
			    - determine passively cancelled
			- else:
			  - determine passively cancelled
	    on player closes inventory:
		  - if <context.inventory.script.name||null> = items_upgrades_menu:
		    - if <context.inventory.slot[5]> != air:
			  - drop <context.inventory.slot[5]> quantity:<context.inventory.slot[5].quantity> <player.location>
			- if <context.inventory.slot[10]> != air:
			  - drop <context.inventory.slot[10]> quantity:<context.inventory.slot[10].quantity> <player.location>
			- if <context.inventory.slot[18]> != air:
			  - drop <context.inventory.slot[18]> quantity:<context.inventory.slot[18].quantity> <player.location>
slots_activate:
    type: world
	debug: false
	events:
	    on player right clicks block:
		  - if <context.item.script.name> = null:
		    - stop
		  - define hand_script <script[<context.item.script.name>]||null>
		  - if <[hand_script]> = null:
		    - stop
		  - if <player.item_in_hand.material.name> != air && <player.item_in_offhand.material.name> != air:
		    - define offhand_script <script[<player.item_in_offhand.script.name>]||null>
		    - if <[offhand_script]> = null:
		      - stop
		    - if <[hand_script].data_key[data.stats].contains[upgrading]> = true:
		      - define context_upgrading <[hand_script].data_key[data.stats.upgrading]>
			  - if <player.item_in_offhand.has_flag[<[context_upgrading]>]> = false:
			    - if <[offhand_script].data_key[data.stats.rarity]> = <[hand_script].data_key[data.stats.rarity]>:
				  - inventory flag slot:offhand <[context_upgrading]>:false
				  - inventory set slot:hand item:air
		        - else if <[offhand_script].data_key[data.stats.rarity]> != <[hand_script].data_key[data.stats.rarity]>:
		          - actionbar "<&6><&l>Редкость активатора слота и предмета не совпадают."