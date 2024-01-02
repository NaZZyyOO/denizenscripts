item_Guardian_heart:
    type: item
    debug: false
    material: flower_banner_pattern
    display name: "<element[Сердце Хранителя].color[#f91905].bold>"
    lore:
    - "<&6>Могущественный амулет, сделанный"
    - "<&6>из двух соединённых осколков сердца"
	- "<&6>Хранителя. Приносит счастье и удачу, и"
    - "<&6>ускоряет духовный рост своего носителя."
    mechanisms:
      custom_model_data: 11
      nbt_attributes:
	  - generic.max_health/mainhand/0.0/5.0
      - generic.movement_speed/mainhand/1.0/+0.15
    enchantments:
    - DURABILITY:10
    - VANISHING_CURSE:1
item_Guardian_heart_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_Guardian_heart:
		  - if <player.has_flag[fragment_gift]> = true:
		    - if <player.has_flag[second_fragment_gift]> = true:
		    # Кормит раз в 15 минут
		      - if <player.has_flag[heart_feed]> = false:
			    - flag <player> heart_feed expire:15m
			    - execute "feed <player.name>" as_server silent
				- playsound <player.location> sound:PARTICLE_SOUL_ESCAPE volume:0.5 pitch:1
				- playsound <player.location> sound:block_enchantment_table_use volume:0.5 pitch:1.2
				- animate <player> animation:EAT_FOOD for:<player>
			    - actionbar target:<player> "<element[Сердце Хранителя накормило вас.].color[#f91905].bold>"
		      - else:
			    - actionbar target:<player> "<element[Не так часто: <player.flag[heart_feed].expiration.formatted>].color[#f91905].bold>"
			- else:
		      - actionbar target:<player> "<element[Вы не можете пользоваться Сердцем.].color[#f91905].bold>"
	    on player dies:
		  - if <player.has_flag[fragment_gift]> = true:
		    - if <player.has_flag[second_fragment_gift]> = true:
			  - if <player.inventory.contains[item_Guardian_heart].quantity[1]> = true:
		        - if <util.random.int[0].to[100]> <= 90:
			      - flag <player> heart_keep
				  - determine passively <context.drops.exclude[item_Guardian_heart]>
                - else:
                  - determine passively NO_DROPS
                  - determine passively KEEP_INV
				  - determine passively NO_XP
				  - determine passively KEELP_LEVEL
				  - playsound <player.location> sound:ENTITY_ILLUSIONER_PREPARE_MIRROR volume:1 pitch:1
				  - playeffect at:<player.location.add[0,1,0]> effect:REDSTONE special_data:1.5|<color[#f91905].hex> quantity:30 offset:0.3
			      - actionbar targets:<player> "<element[Сердце Хранителя сохранило ваш инвентарь.].color[#f91905].bold>"
		on player respawns:
		  - if <player.has_flag[heart_keep]> = true:
		    - give to:<player.inventory> item_Guardian_heart quantity:1
	        - flag <player> heart_keep:!