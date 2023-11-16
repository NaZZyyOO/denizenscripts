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
item_upgrading_generate:
    type: procedure
	definitions: item
	debug: false
	script:
	    - if <[item].raw_nbt.contains[Lingo]> = true && <[item].raw_nbt.get[Lingo]> != <element[string:en]>:
		  - define script <script[<[item].script.name>]>
		  - define rarity <[script].data_key[data.stats.rarity]>
		  - define color <script[rarity_colors].data_key[<[rarity]>.color]>
		  - define display_name <element[<[color]><[item].display>].parsed>
		  - define updated_display <[item].display.replace_text[<[item].display>].with[<[display_name]>]>
	      - define item <[item].with[display=<[updated_display]>]>
		  - define lore <[item].lore>
		  - define eng_poison "<&8>[Empty Slot] - Poison."
		  - define eng_gemstone "<&8>[Empty Slot] - Gemstone."
		  - if <[item].has_flag[poison]> = true:
		    - if <[item].flag[poison]> = false:
		      - define eng_poison "<&7>[Empty Slot] - Poison."
			- if <[item].flag[poison]> != false:
		      - define poison_color <element[<script[rarity_colors].data_key[<script[<[item].flag[poison]>].data_key[data.stats.rarity]>.color]>
	          - define eng_poison "<&7>[Poison] - <[poison_color]><item[<[item].flag[poison]>].display>]><&7>."
		  - if <[item].has_flag[gemstone]> = true:
		    - if <[item].flag[gemstone]> = false:
		      - define eng_gemstone "<&7>[Empty Slot] - Gemstone."
		    - if <[item].flag[gemstone]> != false:
		      - define gemstone_color <element[<script[rarity_colors].data_key[<script[<[item].flag[gemstone]>].data_key[data.stats.rarity]>.color]>
		      - define eng_gemstone "<&7>[Gemstone] - <[gemstone_color]><item[<[item].flag[gemstone]>].display>]><&7>."
		  - if <[item].raw_nbt.get[Lingo]> = <element[string:ua]>:
		    - define poison "<&8>[Пустий слот] - Отрута."
			- define gemstone "<&8>[Пустий слот] - Інкрустація."
			- if <[item].has_flag[poison]> = true:
			  - if <[item].flag[poison]> = false:
			    - define poison "<&7>[Пустой слот] - Отрута."
			  - if <[item].flag[poison]> != false:
				- define poison "<&7>[Отрута] - <[poison_color]><item[<[item].flag[poison]>].display>].parsed><&7>."
			- define lore <[lore].replace_text[<[eng_poison]>].with[<[poison]>]>
			- narrate <[lore]>
			- if <[item].has_flag[gemstone]> = true:
			  - if <[item].flag[gemstone]> = false:
		        - define gemstone "<&7>[Пустий слот] - Інкрустація."
			  - if <[item].flag[gemstone]> != false:
				- define poison "<&7>[Інкрустація] - <[gemstone_color]><item[<[item].flag[gemstone]>].display>].parsed><&7>."
			- define lore <[lore].replace_text[<[eng_gemstone]>].with[<[gemstone]>]>
			- narrate <[lore]>
		  - if <[item].raw_nbt.get[Lingo]> = <element[string:ru]>:
			- define poison "<&8>[Пустой слот] - Яд."
		    - define gemstone "<&8>[Пустой слот] - Инкрустация."
			- if <[item].has_flag[poison]> = true:
			  - if <[item].flag[poison]> = false:
			    - define poison "<&7>[Пустой слот] - Яд."
			  - if <[item].flag[poison]> != false:
				- define poison "<&7>[Яд] - <[poison_color]><item[<[item].flag[poison]>].display>].parsed><&7>."
			- define lore <[lore].replace_text[<[eng_poison]>].with[<[poison]>]>
			- if <[item].has_flag[gemstone]> = true:
			  - if <[item].flag[gemstone]> = false:
			    - define gemstone "<&7>[Пустой слот] - Инкрустация."
			  - if <[item].flag[gemstone]> != false:
				- define poison "<&7>[Инкрустация] - <[gemstone_color]><item[<[item].flag[gemstone]>].display>].parsed><&7>."
			- define lore <[lore].replace_text[<[eng_gemstone]>].with[<[gemstone]>]>
			- narrate <[lore]>
		  - define item <[item].with[lore=<[lore]>]>
		- narrate <[lore]>
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
		on player right clicks block:
		  - wait 1s
		  - define item_script <context.item.script.name||null>
		  - if <[item_script]> != null:
		    - define item <context.item>
		    - if <[item].raw_nbt.contains[Lingo]> = true && <[item].raw_nbt.get[Lingo]> != <element[string:en]>:
		    - define script <script[<[item].script.name>]>
		    - define rarity <[script].data_key[data.stats.rarity]>
		    - define color <script[rarity_colors].data_key[<[rarity]>.color]>
		    - define display_name <element[<[color]><[item].display>].parsed>
		    - define updated_display <[item].display.replace_text[<[item].display>].with[<[display_name]>]>
			- inventory adjust slot:hand display:<[updated_display]>
		    - define lore <[item].lore>
			- define eng_poison "<&8>[Empty Slot] - Poison."
		    - define eng_gemstone "<&8>[Empty Slot] - Gemstone."
		    - if <[item].has_flag[poison]> = true:
		      - if <[item].flag[poison]> = false:
		        - define eng_poison "<&7>[Empty Slot] - Poison."
			  - if <[item].flag[poison]> != false:
		        - define poison_color <element[<script[rarity_colors].data_key[<script[<[item].flag[poison]>].data_key[data.stats.rarity]>.color]>
	            - define eng_poison "<&7>[Poison] - <[poison_color]><item[<[item].flag[poison]>].display>]><&7>."
		    - if <[item].has_flag[gemstone]> = true:
		      - if <[item].flag[gemstone]> = false:
		        - define eng_gemstone "<&7>[Empty Slot] - Gemstone."
		      - if <[item].flag[gemstone]> != false:
		        - define gemstone_color <element[<script[rarity_colors].data_key[<script[<[item].flag[gemstone]>].data_key[data.stats.rarity]>.color]>
		        - define eng_gemstone "<&7>[Gemstone] - <[gemstone_color]><item[<[item].flag[gemstone]>].display>]><&7>."
			- if <[item].raw_nbt.get[Lingo]> = <element[string:ru]>:
			  - define poison "<&8>[Пустой слот] - Яд."
			  - if <[item].has_flag[poison]> = true:
			    - if <[item].flag[poison]> = false:
			      - define poison "<&7>[Пустой слот] - Яд."
			    - if <[item].flag[poison]> != false:
			  	  - define poison "<&7>[Яд] - <[poison_color]><item[<[item].flag[poison]>].display>].parsed><&7>."
			  - define gemstone "<&8>[Пустой слот] - Инкрустация."
			  - define lore <[lore].replace_text[<[eng_poison]>].with[<[poison]>]>
			  - if <[item].has_flag[gemstone]> = true:
			    - if <[item].flag[gemstone]> = false:
			      - define gemstone "<&7>[Пустой слот] - Инкрустация."
			    - if <[item].flag[gemstone]> != false:
				  - define poison "<&7>[Инкрустация] - <[gemstone_color]><script[ru_displays].data_key[<[item].flag[gemstone]>.display]>].parsed><&7>."
			  - define lore <[lore].replace_text[<[eng_gemstone]>].with[<[gemstone]>]>
			  - inventory adjust slot:hand lore:<[lore]>
		    
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
