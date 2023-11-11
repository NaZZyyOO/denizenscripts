item_sphere_of_the_sea:
    type: item
    debug: false
    material: heart_of_the_sea
    display name: "<&5><&l>Сфера моря"
    lore:
    - "<&6>Редчайший морской артефакт, обладающий"
    - "<&6>большой силой магии исцеления. Если такая вещь"
	- "<&6>попадёт в правильные руки, можно стать неуязвимим."
    - ""
    - "<&7>Использование:"
    - "<&a>- Восстановит несколько сердец, взависимости"
	- "<&a>от уровня игрока поделенный на 2, поглотит"
	- "<&a>4 маны за каждое сердце."
	- "<&7>Использовани с зажатым shift:"
	- "<&a>- Создаст круг исцеления, который восстановит"
	- "<&a>несколько сердец,аналогично обычному использованию."
    mechanisms:
      custom_model_data: 1
item_sphere_of_the_sea_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_sphere_of_the_sea:
		  - if <player.is_sneaking> = false:
		    - if <player.has_flag[cup_cd]> = false:
		      - define level <placeholder[mystery_legacylevel].player[<player>]>
			  - if <placeholder[mystery_mana].player[<player>]> > <[level].mul[2]>:
		        - heal <player> <[level].div[2]>
				- flag <player> cup_cd expire:20s
			    - execute as_server silent "my rmmana <player.name> <[level].mul[2]>"
			    - playeffect effect:VILLAGER_HAPPY at:<player.location.add[0,1,0]> quantity:100 offset:0.5 velocity:10
			  - else:
			    - actionbar "<&6><&l>У вас не достаточно маны на использование данного предмета."