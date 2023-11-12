item_sphere_of_the_sea:
    type: item
    debug: false
    material: HEART_OF_THE_SEA
    display name: "Сфера моря"
	data:
	    stats:
		    display:  "Сфера моря"
			rarity: epic
		    custom_model_data: 4
			lore:
			  item: "<&8><&l>Предмет: <&9>Сфера"
			  rare: "<&7><&l>Вид: <&5>Эпический"
			  text: "<n><&7><&o>Редчайший морской артефакт, обладающий<n><&7><&o>большой силой магии исцеления. Может<n><&7><&o>вылечить лёгкие раны."
			  abilities_01: "<n><&7>Использование:<n><&a> - Восстановит несколько сердец, взависимости<n><&a> от уровня игрока поделенный на 2, поглотит<n><&a> 4 маны за каждое сердце."
			  abilities_02: "<&7>Использовани с зажатым shift:<n><&a> - Создаст круг исцеления, который восстановит<n><&a> несколько сердец,аналогично обычному использованию."
item_sphere_of_the_sea_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_sphere_of_the_sea:
		  - if <player.is_sneaking> = false:
		    - if <player.has_flag[sphere_cd]> = false:
		      - define level <placeholder[mystery_legacylevel].player[<player>]>
			  - if <placeholder[mystery_mana].player[<player>]> > <[level].mul[2]>:
		        - heal <player> <[level].div[2]>
				- flag <player> sphere_cd expire:20s
			    - execute as_server silent "my rmmana <player.name> <[level].mul[2]>"
			    - playeffect effect:VILLAGER_HAPPY at:<player.location.add[0,1,0]> quantity:100 offset:0.5 velocity:10
			  - else:
			    - actionbar "<&6><&l>У вас не достаточно маны на использование данного предмета."
		on player right clicks block with:item_sphere_of_the_sea:
		  - if <player.is_sneaking> = true:
		    - if <placeholder[mystery_legacy].player[<player>]> = WATER:
			  - if <player.has_flag[sphere_cd]> = false:
		        - define level <placeholder[mystery_legacylevel].player[<player>]>
			    - if <placeholder[mystery_mana].player[<player>].is_less_than[<[level].mul[2]>]> = false:
				  - flag <player> sphere_cd expire:30s
		          - heal <player> <[level].div[2]>
			      - execute as_server silent "my rmmana <player> <[level].mul[2]>"
			      - playeffect effect:VILLAGER_HAPPY at:<player.location.add[0,1,0]> quantity:100 offset:0.5 velocity:10
				  - define players <list[]>
			      - foreach <player.location.find.living_entities.within[5].exclude[<player>]>:
				    - if <[value].is_player> = true:
			          - define players <[players].as_list.include[<[value].name>]>
				  - foreach <[players].list_keys> as:healed:
				    - wait 5t
			        - define target_lvl <placeholder[mystery_legacylevel].player[<[healed]>]>
			   	    - if <placeholder[mystery_mana].player[<player>].is_less_than[<[target_lvl].mul[2]>]> = false:       
				      - heal <[healed]> <[level].div[2.5]>
			          - execute as_server silent "my rmmana <[healed]> <[target_lvl].mul[2]>"
				      - playeffect effect:VILLAGER_HAPPY at:<player[<[healed]>].location.add[0,1,0]> quantity:100 offset:0.5 velocity:10