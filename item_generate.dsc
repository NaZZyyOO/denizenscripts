item_generate:
    type: procedure
	definitions: item
	debug: false
	script:
	    - define script <script[<[item].script.name>]||null>
	    - define lore_for_item <list[]>
		- if <[script]> = null:
		  - stop
		- define gemstone "<&8>[Пустой слот] - Инкрустация."
		- define gemstone_upgrade <[script].data_key[data.stats.upgrades.gemstone]||null>
		- if <[gemstone_upgrade]> = true:
		  - if <[item].has_flag[gemstone]> = true:
		    - if <[item].flag[gemstone]> != false:
			  - define gemstone "<&7>[Инкрустация] - <item[<[item].flag[gemstone]>].display><&7>."
			- else:
			  - define gemstone "<&7>[Пустой слот] - Инкрустация."
		  - else:
		    - define gemstone "<&8>[Пустой слот] - Инкрустация."
		- else:
		  - define gemstone ""
		- define poison "<&8>[Пустой слот] - Яд."
	    - define poison_upgrade <[script].data_key[data.stats.upgrades.poison]||null>
		- if <[poison_upgrade]> = true:
		  - if <[item].has_flag[poison]> = true:
		    - if <[item].flag[poison]> != false:
			  - define gemstone "<&7>[Яд] - <item[<[item].flag[poison]>].display><&7>."
			- else:
			  - define poison "<&7>[Пустой слот] - Яд."
		  - else:
			- define poison "<&8>[Пустой слот] - Яд."
	    - else:
		  - define poison ""
		- if <[script].data_key[data.stats].contains[lore]> = true:
	      - foreach <[script].data_key[data.stats.lore].keys.exclude[item].exclude[rare].exclude[type]> as:line:
		    - define lore_for_item <[lore_for_item].as_list.include[<[script].data_key[data.stats.lore.<[line]>].parsed>]>
		    - define item <[item].with[lore=<[lore_for_item]>]>
	    - if <[script].data_key[data.stats].contains[custom_model_data]> = true:
		  - define custom_model_data <[script].data_key[data.stats.custom_model_data]>
		  - define item <[item].with[custom_model_data=<[custom_model_data]>]>
	    - if <[script].data_key[data.stats].contains[display]> = true:
		  - define display <[script].data_key[data.stats.display].parsed>
		  - define rarity <[script].data_key[data.stats.rarity]>
		  - define color <script[rarity_colors].data_key[<[rarity]>.color]>
		  - define item <[item].with[display=<[color]><[display]>]>
		- define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>]>]>
	    - determine <[item]>
item_generate_event:
    type: world
	debug: false
	events:
		on player picks up item:
		  - define item <context.item.script.name||null>
		  - if <[item]> != null:
		    - run item_generate def:<context.item> save:item
			- define item <entry[item].created_queue.determination.get[1]>
			- determine passively ITEM:<[item]>