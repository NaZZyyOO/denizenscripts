item_chest_gift:
    type: item
    debug: false
    material: chest
    display name: "<&6><&l>Новогодний подарок"
    lore:
    - "<&6>Новогодний подарок, на дне которого"
    - "<&6>хранятся самые разные вещи, самой разной"
    - "<&6>стоимости."
item_chest_gift_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_chest_gift:
		  - determine passively cancelled
		  - if <player.has_flag[gifts_limit]> = false:
		    - flag <player> gifts_limit expire:1d
		  - if <player.has_flag[cd]> = false:
		    - if <player.flag[gifts_limit]> < 36:
		      - take from:<player.inventory> item_chest_gift quantity:1
		      - flag <player> cd expire:1s
			  - flag <player> gifts_limit:+:1
			  - inject chest_gift_loottable
			- else if <player.flag[gifts_limit]> > 35:
			  - actionbar "<&7><&8>Ваш лимит на день закончился!.."
		  - else:
		    - actionbar "<&6>Активные предметы можно использовать не чаще раза в секунду!"
chest_gift_loottable:
    debug: false
    type: task
    script:
      - define pos <player.location.add[0,1.0,0]>
      - drop item_taler_silver <[pos]> quantity:<util.random.int[15].to[40]>
	  - if <util.random.int[0].to[100]> <= 99:
	    - drop item_taler_gold <[pos]> quantity:<util.random.int[8].to[17]>
	  - if <util.random.int[0].to[100]> <= 70:
	    - drop diamond <[pos]> quantity:<util.random.int[3].to[8]>
	  - if <util.random.int[0].to[100]> <= 50:
	    - drop item_white_ticket <[pos]> quantity:<util.random.int[1].to[3]>
	  - if <util.random.int[0].to[100]> <= 25:
	    - drop item_green_ticket <[pos]> quantity:<util.random.int[1].to[3]>
	  - if <util.random.int[0].to[100]> <= 10:
	    - drop item_titan_nugget <[pos]> quantity:<util.random.int[1].to[4]>
      - if <util.random.int[0].to[100]> <= 4:
        - drop item_titan_ingot <[pos]> quantity:1
	  - if <util.random.int[0].to[100]> <= 4:
        - drop item_red_ticket <[pos]> quantity:1