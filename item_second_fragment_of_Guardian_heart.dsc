item_second_fragment_of_Guardian_heart:
    type: item
    debug: false
    material: flower_banner_pattern
    display name: "<&4><&l>Осколок сердца Хранителя"
    lore:
    - "<&6>Маленькая частица сердца хранителя, "
    - "<&6>которая приносит счастье и удачу своему"
	- "<&6>владельцу, защищает его от злых духов и "
    - "<&6>ускоряет духовный рост своего носителя."
    mechanisms:
      custom_model_data: 10
      nbt_attributes:
	  - generic.max_health/mainhand/0.0/3.0
      - generic.movement_speed/mainhand/1.0/+0.1
    enchantments:
    - DURABILITY:10
	- VANISHING_CURSE:1
item_second_fragment_of_Guardian_heart_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_second_fragment_of_Guardian_heart:
		  - if <player.has_flag[second_fragment_gift]> = true:
		    #кормит раз в 30 минут
		    - if <player.has_flag[second_fragment_feed]> = false:
			  - flag <player> second_fragment_feed expire:30m
			  - execute "feed <player.name>" as_server silent
			  - actionbar target:<player> "<&4><&l>Осколок сердца накормил Вас."
			- else:
			  - actionbar target:<player> "<&6><&l>Вы уже использовали осколок сердца Хранителя ранее: <player.flag[fragment_feed].expiration.formatted>"
		  - else:
		    - actionbar target:<player> "<&6><&l>Вы не можете пользоваться данным предметом"
	    on player dies:
           #Вечное сохранение предмета		
		  - if <player.has_flag[second_fragment_gift]> = true:
			- if <player.inventory.contains[item_second_fragment_of_Guardian_heart].quantity[1]> = true:
			  - if <util.random.int[0].to[100]> <= 95:
			    - flag <player> second_fragment_keep_inv
				- determine passively <context.drops.exclude[item_Guardian_heart]>
		      - else:
				- determine passively NO_DROPS
			    - determine passively KEEP_INV
				- determine passively NO_XP
				- determine passively KEEP_LEVEL
				- actionbar targets:<player> "<&4><&l>Осколок сердца Хранителя сохранил ваш инвентарь."
			- else:
			  - stop
		on player respawns:
		  - if <player.has_flag[second_fragment_keep_inv]> = true:
		    - give to:<player.inventory> item_second_fragment_of_Guardian_heart quantity:1
	        - flag <player> second_fragment_keep_inv:!