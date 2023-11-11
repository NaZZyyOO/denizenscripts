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
		on player damages entity with:item_cup_with_holy_water:
		  - if <util.random.int[0].to[100]> <= 15:
		    - foreach <player.location.find.living_entities.within[10].exclude[<player>]>:
			  - playeffect effect:SMOKE_LARGE at:<[value].location> quantity:100 offset:0.6
			  - explode <[value].location> power:4
			  - cast SLOW <[value]> a:2 d:10