server_loottable_mechanics:
    type: task
	debug: false
	definitions: loottable_name|loc|player
	script:
	# Переменная карма поделенная на 100.
	- define carma <placeholder[mystery_dcarma].player[<player>]>
	# Делим ещё на 10.
    - define carma_percante <[carma].div[10]>
	- if <player[Korvinius].is_online> = true:
	  - if <placeholder[essentials_vanished].player[<player>]> = no:
	    - define carma_percante <[carma_percante].add[0.01]>
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
            - drop <[value]> quantity:<util.random.int[<[random_item_min_quantity]>].to[<[random_item_max_quantity]>]> <[loc]>
		- if <[script].data_key[<[value]>].contains[weight]> = true:
          - define type_random <[type_random].with[<[value]>].as[<[final_chance]>]>
	- define size <[type_random].size>
	- if <[size]> > 1:
	  - foreach <[type_random].keys.random[<[size]>]>:
	    - define random_item_min_quantity <[script].data_key[<[value]>.min_quantity]>
		- define random_item_max_quantity <[script].data_key[<[value]>.max_quantity]>
	    - define final_chance <[script].data_key[<[value]>.chance]> 
	    - if <util.random.decimal[0].to[100]> <= <[final_chance]>:
	      - drop <[value]> <[loc]> quantity:<util.random.int[<[random_item_min_quantity]>].to[<[random_item_max_quantity]>]>
		  - stop
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
		      - if <context.entity.has_flag[raid_boss]> = false:
			    - run server_loottable_mechanics def:<[loottable_name]>|<[loc]>|<player>
			  - else:
			    - run raid_boss_drop def:<[loottable_name]>|<player>
		on entity damages entity:
		  - if <context.entity> != null:
		    - if <context.has_flag[raid_boss]> = true:
			  - if <context.entity.has_flag[damagers_top]> = false:
			    - flag <context.entity> damagers_top:<map[]>