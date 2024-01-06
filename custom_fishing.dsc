fishing_enter:
    type: world
    debug: false
    events:
        on player fishes item while CAUGHT_FISH:
		  - define biome <context.hook.location.biome.name>
		  - define mob_chance <element[10]>
		  - if <placeholder[mystery_legacy].player[<player>]> != WATER:
			- define mob_chance <element[10]>
	      - if <placeholder[mystery_legacy].player[<player>]> = WATER:
			- define mob_chance <element[20]>
		  - if <player.item_in_hand.has_flag[sea_creature_chance]> = true:
		    - define mob_chance <[mob_chance].add[<player.item_in_hand.flag[sea_creature_chance]>]>
		# Если шанс сбудется, спавнит моба и кидает его к игроку, если нет, начинает искать список предметов этого биома.
          - if <util.random.int[1].to[100]> < <[mob_chance]>:
		    - if <context.hook.fish_hook_in_open_water> = true:
			  - define mobs <script[<[biome]>_mobs]||null>
			  - if <[mobs]> = null:
			    - stop
			  - define count <[mobs].list_keys.exclude[type].size>
			  - repeat <[count].mul[2]>:
			    - define mob <[mobs].list_keys.exclude[type].random>
			    - define spawn_chance <[mobs].data_key[<[mob]>.chance]>
			    - if <util.random.decimal[1].to[100]> < <[spawn_chance]>:
				  - determine passively cancelled
                  - mythicspawn <[mob]> <context.hook.location>
			      - foreach <context.hook.location.find.living_entities.within[4].exclude[<player>]>:
				    - if <[value]> != null:
				      - push <[value]> destination:<player.location> origin:<[value].location> speed:1
			      - remove <context.hook>
			      - stop    
		    - else: 
			  - determine passively cancelled
			  - remove <context.hook>
			  - actionbar "<&6><&l>Вы не можете здесь рыбачить."
	      - else:
		    - if <context.hook.fish_hook_in_open_water> = true:
			  - define item_list <script[<[biome]>]||null>
			  - if <[item_list]> = null:
			    - stop
			  # Поиск списка для рыболовли по названию биома.
              - define count <[item_list].list_keys.exclude[type].size>
			  - repeat <[count].mul[2]>:
		        - define item <[item_list].list_keys.exclude[type].random>
			    - define drops_chance <[item_list].data_key[<[item]>.chance]>
			    - if <placeholder[mystery_legacy].player[<player>]> = WATER:
			      - if <[item_list].data_key[<[item]>].contains[legacy]> = true:
				    - define drops_chance <[drops_chance].mul[1.1]>
		# Проверяем, если этот предмет должен вылавливаться только в указанном регионе, если нет, вернутся к обычным предметам.
			    - if <[item_list].data_key[<[item]>].contains[area]> = true:
			      - define drops_area <[item_list].data_key[<[item]>.area]>
				  - if <context.hook.location.is_within[<[drops_area]>]> = true:
				    - if <util.random.decimal[1].to[100]> < <[drops_chance]>:
				      - determine passively CAUGHT:<item[<[item]>]>
				      - remove <context.hook>
			          - stop		
		# Выбор предметов из списка.
			    - if <util.random.decimal[1].to[100]> < <[drops_chance]>:
				  - determine passively CAUGHT:<item[<[item]>]>
			      - remove <context.hook>
			      - stop
            - else:
			  - determine passively cancelled
			  - remove <context.hook>
			  - actionbar "<&6><&l>Вы не можете здесь рыбачить."
        on player fishes while FISHING:
		  - waituntil <context.hook.fish_hook_in_open_water> = true
		  - define radius <element[6]>
          - define steprange <element[0.7]>
          - define count <[radius].div[<[steprange]>].round>
          - define range <element[0.0]>
		  - define loc <context.hook.location.add[0,-1,0]>
          - repeat <[count]>:
            - wait 1t
            - define range <[range].add[<[steprange]>]>
            - define frequency <element[80]>
            - define circle <element[360]>
            - define step <[circle].div[<[frequency]>].round>
            - define angle <element[0]>
            - repeat <[frequency]>:
              - define cosx <[angle].cos>
              - define sinx <[angle].sin>
              - define x <[range].mul[<[cosx]>]>
              - define y <[range].mul[<[sinx]>]>
              - define angle <[angle].add[<[step]>]>
              - define xy <[loc].add[<[x]>,0.0,<[y]>]>
              - playeffect effect:REDSTONE quantity:1 offset:0.3 at:<[xy]> special_data:1.4|white visibility:50
              - playeffect effect:REDSTONE quantity:1 offset:0.3 at:<[xy]> special_data:1.4|<color[aqua].hex> visibility:50