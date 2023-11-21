server_loottable_mechanics:
    type: task
	debug: false
	definitions: loottable_name|loc|player
	script:
	# Переменная карма поделенная на 100.
	- define carma <placeholder[mystery_dcarma].player[<player>]>
	# Делим ещё на 10.
    - define carma_percante <[carma].div[10]>
	# Влияние эффекта удачи на шанс
	- define luck_amount <element[0]>
	- if <player.has_effect[luck]> = true:
	  - define luck_amount <element[<util.random.decimal[0.001].to[0.003]>]>
	- define final_coef <[carma_percante].add[<[luck_amount]>]>
	# Пробегаемся по всем предметам в таблице.
	- define script <script[<[loottable_name]>]||null>
	- if <[script]> = null:
	  - stop
	- define ench_lvl <element[0]>
	- if <[player].item_in_hand.enchantment_map.contains[looting]> = true:
	  - define ench_lvl <[player].item_in_hand.enchantment_map.get[looting]>
	- define type_random <map[]>
	- foreach <script[<[loottable_name]>].list_keys.exclude[type]>:
	  - if <[value]> = xp:
	    - define quantity <[script].data_key[<[value]>.quantity]>
		- drop xp quantity:<[quantity]> <[loc]>
	  - if <[value]> != xp:
	    - define random_item_chance <[script].data_key[<[value]>.chance]>
	    - define random_item_min_quantity <[script].data_key[<[value]>.min_quantity]>
	    - define random_item_max_quantity <[script].data_key[<[value]>.max_quantity]>
	    - define final_chance <[random_item_chance].mul[<[final_coef].add[1]>]>
		- if <[player].item_in_hand.enchantment_map.contains[looting]> = true:
		  - if <[ench_lvl]> > 0:
		    - if <[random_item_min_quantity]> > 3:
		      - define random_item_max_quantity <[random_item_max_quantity].add[<[ench_lvl]>]>
			  - define random_item_min_quantity <[random_item_min_quantity].add[<[ench_lvl]>]>
		    - define final_chance <[final_chance].mul[<[ench_lvl].div[100].add[1]>]>
	    - if <[final_chance]> > 100:
	      - define final_chance <element[100]>
	    - if <[final_chance]> <= 0:
	      - define final_chance <element[0.00001]>
		- if <[script].data_key[<[value]>].contains[weight]> = false:
	      - if <util.random.decimal[0].to[100]> < <[final_chance]>:
		    - if <script[<[value]>]||null> != null:
		      - run item_generate def:<item[<[value]>]> save:item
			  - define item <entry[item].created_queue.determination.get[1]>
              - drop <[item]> quantity:<util.random.int[<[random_item_min_quantity]>].to[<[random_item_max_quantity]>]> <[loc]>
			- else:
			  - drop <[value]> quantity:<util.random.int[<[random_item_min_quantity]>].to[<[random_item_max_quantity]>]> <[loc]>
		- if <[script].data_key[<[value]>].contains[weight]> = true:
          - define type_random <[type_random].with[<[value]>].as[<[final_chance]>]>
	- define size <[type_random].size>
	- if <[size]> > 0:
	  - foreach <[type_random].keys.random[<[size]>]>:
	    - define random_item_min_quantity <[script].data_key[<[value]>.min_quantity]>
		- define random_item_max_quantity <[script].data_key[<[value]>.max_quantity]>
	    - define final_chance <[type_random].get[<[value]>]> 
	    - if <util.random.decimal[0].to[100]> <= <[final_chance]>:
		  - if <script[<[value]>]||null> != null:
		    - run item_generate def:<item[<[value]>]> save:item
		    - define item <entry[item].created_queue.determination.get[1]>
	        - drop <[item]> <[loc]> quantity:<util.random.int[<[random_item_min_quantity]>].to[<[random_item_max_quantity]>]>
		    - stop
		  - else:
		    - drop <[value]> <[loc]> quantity:<util.random.int[<[random_item_min_quantity]>].to[<[random_item_max_quantity]>]>
custom_drop_event:
    type: world
	debug: false
	events:
	     on mythicmob mob killed by:player:
		   - if <context.mob> != null:
		     - if <context.entity.has_flag[no_drop]> = false:
		       - define loottable_name <context.mob.internal_name.as_element||null>
			   - if <[loottable_name]> = null:
			     - stop
			   - define loc <context.entity.location>
			   - run server_loottable_mechanics def:<[loottable_name]>|<[loc]>|<player>