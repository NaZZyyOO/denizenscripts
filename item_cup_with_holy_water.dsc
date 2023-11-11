item_cup_with_holy_water:
    type: item
    debug: false
    material: gold_ingot
    display name: "<&5><&l>Чаша с водой"
    lore:
    - "<&6>Морской артефакт, обладающий большой"
    - "<&6>силой магии воды. Такой предмет может"
	- "<&6>моментально исцелить все глубокие раны."
    - ""
    - "<&7>Использование:"
    - "<&a>- Восстановит столько сердец, сколько"
	- "<&a>уровня у игрока, поглотит ману, в размен"
	- "<&a>1 сердце за 2 ед. маны. "
	- "<&7>Использовани с зажатым shift:"
	- "<&a>- Создаст круг исцеления, который частично"
	- "<&a>восстановит уровень здоровья игроков."
    mechanisms:
      custom_model_data: 4
	  
item_cup_with_holy_water_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_cup_with_holy_water:
		  - if <player.is_sneaking> = false:
		    - if <player.has_flag[cup_cd]> = false:
		      - define level <placeholder[mystery_legacylevel].player[<player>]>
			  - if <placeholder[mystery_mana].player[<player>]> > <[level].mul[2]>:
			    - flag <player> cup_cd expire:30s
		        - heal <player> <[level]>
			    - execute as_server silent "my rmmana <player.name> <[level].mul[2]>"
			    - playeffect effect:VILLAGER_HAPPY at:<player.location.add[0,1,0]> quantity:100 offset:0.5 velocity:10
			  - else:
			    - actionbar "<&6><&l>У вас не достаточно маны на использование данного предмета."
		  - else:
		    - if <placeholder[mystery_legacy].player[<player>]> = WATER:
			  - if <player.has_flag[cup_cd]> = false:
		        - define level <placeholder[mystery_legacylevel].player[<player>]>
			    - if <placeholder[mystery_mana].player[<player>].is_less_than[<[level].mul[2]>]> = false:
				  - flag <player> cup_cd expire:40s
		          - heal <player> <[level]>
			      - execute as_server silent "my rmmana <player> <[level].mul[2]>"
			      - playeffect effect:VILLAGER_HAPPY at:<player.location.add[0,1,0]> quantity:100 offset:0.5 velocity:10
			      - foreach <player.location.find_entities[player].within[10].exclude[<player>]>:
			        - wait 5t
			        - define target_lvl <placeholder[mystery_legacylevel].player[<[value]>]>
			   	    - if <placeholder[mystery_mana].player[<player>].is_less_than[<[target_lvl].mul[2]>]> = false:       
				      - heal <[value]> <[level].div[1.5]>
			          - execute as_server silent "my rmmana <[value].name> <[target_lvl].mul[2]>"
				      - playeffect effect:VILLAGER_HAPPY at:<[value].location.add[0,1,0]> quantity:100 offset:0.5 velocity:10
		on player damages entity with:item_cup_with_holy_water:
		  - if <util.random.int[0].to[100]> <= 15:
		    - foreach <player.location.find.living_entities.within[10].exclude[<player>]>:
			  - playeffect effect:SMOKE_LARGE at:<[value].location> quantity:100 offset:0.6
			  - explode <[value].location> power:4
			  - cast SLOW <[value]> a:2 d:10