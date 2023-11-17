item_generate:
    type: procedure
	definitions: item
	debug: false
	script:
	    - define script <script[<[item].script.name>]||null>
	    - define lore_for_item <list[]>
		- if <[script]> = null:
		  - stop
		- define gemstone "<&8>[Empty Slot] - Gemstone."
		- define gemstone_upgrade <[script].data_key[data.stats.upgrades.gemstone]||null>
		- if <[gemstone_upgrade]> = true:
		  - if <[item].has_flag[gemstone]> = true:
		    - if <[item].flag[gemstone]> != false:
			  - define gemstone "<&7>[Gemstone] - <element[<script[rarity_colors].data_key[<script[<[item].flag[gemstone]>].data_key[data.stats.rarity]>.color]><item[<[item].flag[gemstone]>].display>].parsed><&7>."
			- else:
			  - define gemstone "<&7>[Empty Slot] - Gemstone."
		  - else:
		    - define gemstone "<&8>[Empty Slot] - Gemstone."
		- else:
		  - define gemstone ""
		- define poison "<&8>[Empty Slot] - Poison."
	    - define poison_upgrade <[script].data_key[data.stats.upgrades.poison]||null>
		- if <[poison_upgrade]> = true:
		  - if <[item].has_flag[poison]> = true:
		    - if <[item].flag[poison]> != false:
			  - define poison "<&7>[Poison] - <element[<script[rarity_colors].data_key[<script[<[item].flag[poison]>].data_key[data.stats.rarity]>.color]><item[<[item].flag[poison]>].display>].parsed><&7>."
			- else:
			  - define poison "<&7>[Empty Slot] - Poison."
		  - else:
			- define poison "<&8>[Empty Slot] - Poison."
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
		  - define display <[script].data_key[data.stats.display]>
		  - define rarity <[script].data_key[data.stats.rarity]>
		  - define color <script[rarity_colors].data_key[<[rarity]>.color]>
		  - define display_name <element[<[color]><[display]>].parsed>
		  - define item <[item].with[display=<[display_name]>]>
		- define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>]>]>
		- define item <[item].with[raw_nbt=<map[Lingo=string:en]>]>
	    - determine <[item]>
item_lore_regenerate:
    type: procedure
	debug: false
	definitions: item
	script:
	      - define item_hand <[item].script.name||null>
		  - if <[item_hand]> = null:
		    - stop
		  - else:
			- if <player.has_flag[cd_regenerate]> = true:
			  - stop
		    - if <[item].raw_nbt.contains[Lingo]> = true:
		      - define script <script[<[item].script.name>]>
		      - define rarity <[script].data_key[data.stats.rarity]>
		      - define color <script[rarity_colors].data_key[<[rarity]>.color]>
		      - define display_name <element[<[color]><[item].display>].parsed>
		      - define updated_display <[item].display.replace_text[<[item].display>].with[<[display_name]>]>
			  - inventory adjust slot:hand display:<[updated_display]>
		      - define lore <[item].lore>
			  - if <[item].raw_nbt.get[Lingo]> = <element[string:ru]>:
			    - define poison_origin "<&8>[Пустой Слот] - Яд."
			    - if <[item].has_flag[poison]> = true:
			      - if <[item].flag[poison]> = false:
			        - define poison "<&7>[Пустой Слот] - Яд."
			      - if <[item].flag[poison]> != false:
				    - define poison_color <script[rarity_colors].data_key[<script[<[item].flag[poison]>].data_key[data.stats.rarity]>.color]>
				    - define poison "<&7>[Яд] - <element[<[poison_color]><script[ru_displays].data_key[<[item].flag[poison]>.display]>].parsed><&7>."
				  - define lore <[lore].replace_text[<[poison_origin]>].with[<[poison]>]>
				  - inventory adjust slot:hand lore:<[lore]>
			    - define gemstone_origin "<&8>[Пустой Слот] - Инкрустация."
			    - if <[item].has_flag[gemstone]> = true:
			      - if <[item].flag[gemstone]> = false:
			        - define gemstone "<&7>[Пустой Слот] - Инкрустация."
			      - if <[item].flag[gemstone]> != false:
				    - define gemstone_color <script[rarity_colors].data_key[<script[<[item].flag[gemstone]>].data_key[data.stats.rarity]>.color]>
				    - define gemstone "<&7>[Инкрустация] - <element[<[gemstone_color]><script[ru_displays].data_key[<[item].flag[gemstone]>.display]>].parsed><&7>."
			      - define lore <[lore].replace_text[<[gemstone_origin]>].with[<[gemstone]>]>
	      - determine <[lore]>
item_generate_event:
    type: world
	debug: false
	events:
		on player picks up item:
		  - ratelimit <player> 1s
		  - define item <context.item.script.name||null>
		  - if <[item]> != null:
		    - run item_generate def:<context.item> save:item
			- define item <entry[item].created_queue.determination.get[1]>
			- determine passively ITEM:<[item]>
		    - wait 1s
			- foreach <player.inventory.map_slots>:
			  - if <player.inventory.slot[<[value]>].material.name> = air:
			    - foreach next
			  - define item <player.inventory.map_slots.get[<[value]>]>
			  - if <[item].script.name||null> != null:
			    - if <script[<[item]>].data_key[data.stats].keys.contains[lore]> = true:
		        - run item_lore_regenerate run:<context.item> save:item
			    - define item <entry[item].created_queue.determination.get[1]>
			    - inventory set slot:<[value]> item:<[item]> 
		    - flag <player> cd_regenerate expire:5s
ua_displays:
    type: data
	debug: false
	item_ruby:
	    display: Рубін
	item_saphire:
	    display: Сапфір
    item_thopaz:
	    display: Топаз
	item_chaorit:
	    display: Чаорит
	item_onix:
	    display: Онікс
	item_avanturin:
	    display: Авантюрин
    item_geliodor:
	    display: Геліодор
	item_granat:
	    display: Гранат
	item_brilliant:
	    display: Діамант
	item_demantoid:
	    display: Демантоїд
	item_spinel:
	    display: Шпінель
	item_alexandrite:
	    display: Олександрит
ru_displays:
    type: data
	debug: false
	item_ruby:
	    display: Рубин
	item_saphire:
	    display: Сапфир
    item_thopaz:
	    display: Топаз
	item_chaorit:
	    display: Чаорит
	item_onix:
	    display: Оникс
	item_avanturin:
	    display: Авантюрин
    item_geliodor:
	    display: Гелиодор
	item_granat:
	    display: Гранат
	item_brilliant:
	    display: Бриллиант
	item_demantoid:
	    display: Демантоид
	item_spinel:
	    display: Шпинель
	item_alexandrite:
	    display: Александрит
