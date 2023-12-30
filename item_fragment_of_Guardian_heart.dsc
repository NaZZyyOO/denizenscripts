item_fragment_of_Guardians_heart:
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
      custom_model_data: 9
      nbt_attributes:
	  - generic.max_health/mainhand/0.0/3.0
      - generic.movement_speed/mainhand/1.0/+0.1
    enchantments:
    - DURABILITY:10
	- VANISHING_CURSE:1
item_fragment_of_Guardians_heart_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_fragment_of_Guardians_heart:
		  - if <player.has_flag[fragment_gift]> = true:
		    #кормит раз в 30 минут
		    - if <player.has_flag[fragment_feed]> = false:
			  - flag <player> fragment_feed expire:30m
			  - execute "feed <player.name>" as_server silent
			  - actionbar target:<player> "<&4><&l>Осколок сердца накормил Вас."
			- else:
			  - actionbar target:<player> "<&6><&l>Вы уже использовали осколок сердца Хранителя ранее: <player.flag[fragment_feed].expiration.formatted>"
		  - else:
		    - actionbar target:<player> "<&6><&l>Вы не можете пользоваться данным предметом"
	    on player dies:
           #Вечное сохранение предмета		
		  - if <player.has_flag[fragment_gift]> = true:
			- if <player.inventory.contains[item_fragment_of_Guardians_heart].quantity[1]> = true:
			  - if <util.random.int[0].to[100]> <= 95:
			    - flag <player> fragment_keep_inv
		      - else:
				- determine passively NO_DROPS
			    - determine passively KEEP_INV
				- actionbar targets:<player> "<&4><&l>Осколок сердца Хранителя сохранил ваш инвентарь."
			- else:
			  - stop
		on player respawns:
		  - if <player.has_flag[fragment_keep_inv]> = true:
		    - give to:<player.inventory> item_fragment_of_Guardians_heart quantity:1
	        - flag <player> fragment_keep_inv:!