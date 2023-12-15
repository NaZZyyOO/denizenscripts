item_generate:
    type: procedure
	definitions: item
	debug: false
	script:
	  - define script <script[<[item].script.name>]||null>
	  - define lore_for_item <list[]>
      - if <[script]> = null:
		- stop
	  - else:
	    - if <[script].data_key[data.stats].contains[custom_model_data]> = true:
		  - define custom_model_data <[script].data_key[data.stats.custom_model_data]>
		  - define item <[item].with[custom_model_data=<[custom_model_data]>]>
		- define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>]>]>
		- if <[item].has_flag[gemstone]> = true:
		  - if <[item].flag[gemstone]> = false:
		    - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_gemact]>]>
		  - if <[item].flag[gemstone]> != false:
		    - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_gemact_<[item].flag[gemstone]>]>]>
	    - else:
		  - if <[item].has_flag[poison]> = true:
		    - if <[item].flag[poison]> = false:
		      - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_poisonact]>]>
		    - if <[item].flag[poison]> != false:
		      - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_poisonact_<[item].flag[poison]>]>]>
		- if <[item].has_flag[gemstone]> = true && <[item].has_flag[poison]> = false:
		  - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_gemact]>]>
		- if <[item].has_flag[gemstone]> = false && <[item].has_flag[poison]> = true:
		  - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_poisonact]>]>
		- if <[item].has_flag[gemstone]> = true && <[item].has_flag[poison]> = true:
		  - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_gemact_poisonact]>]>
		  - if <[item].flag[gemstone]> != false && <[item].flag[poison]> = false:
		    - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_gemact_poisonact_<[item].flag[gemstone]>]>]>
		  - if <[item].flag[gemstone]> = false && <[item].flag[poison]> != false:
		    - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_gemact_poisonact_<[item].flag[poison]>]>]>
		  - if <[item].flag[gemstone]> != false && <[item].flag[poison]> != false:
		    - define item <[item].with[raw_nbt=<map[ItemLingo=string:<[script].name>_gemact_poisonact_<[item].flag[gemstone]>_<[item].flag[poison]>]>]>
	    - determine <[item]>
item_generate_event:
    type: world
	debug: false
	events:
		on player picks up item:
		  - define item <context.item.script.name||null>
		  - if <[item]> != null:
		    - if <script[<[item]>].data_key[data]||null> != null:
		      - run item_generate def:<context.item> save:item
			  - define item <entry[item].created_queue.determination.get[1]>
			  - determine passively ITEM:<[item]>
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