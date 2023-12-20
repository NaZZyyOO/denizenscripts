item_amber_light_wand:
    type: item
    debug: false
    material: stick
    display name: "<&5><&l>Посох света"
    lore:
    - "<&6>Посох света принадлежащий "
    - "<&6>смотрителю маяка. На одной "
	- "<&6>из сторон фонаря можно рассмотреть"
	- "<&6>карту, указывающая на точку возле"
	- "<&6>кладбища у берега моря."
    - ""
    - "<&7>Использование:"
    - "<&a> - Поражает цель световым лучём, "
    - "<&a> нанося 7 ед. урона и 15 урона по нежити."
    - "<&a> Можно использовать не чаще раза в 2 секунды."
    mechanisms:
      custom_model_data: 4
      nbt_attributes:
      - generic.movement_speed/mainhand/1.0/+0.15
    enchantments:
    - DURABILITY:10
item_amber_light_wand_use:
    type: world
    debug: false
    events:
        on player right clicks block with:item_amber_light_wand:
          - if <player.item_in_hand.script.name.is[==].to[item_amber_light_wand]||false>:
            - determine passively cancelled
            - define target <player.precise_target[25]||null>
            - if <[target]> != null:
              - if <[target].is_living||null> = false:
                - stop
              - else:
                - if <placeholder[mystery_mana].player[<player>]> > 4:
				  - if <player.has_flag[gcd]> = false:
                    - define start <player.location.add[0,1.3,0]||null>
                    - define end <[target].location.add[0,1.3,0]||null>
                    - hurt <[target]> 5 source:<player> cause:magic
				    - cast effect:GLOWING d:15 a:0 <[target]>
					- if <[target].entity_type> = zombie_villager:
					  - hurt <[target]> 10 source:<player> cause:magic
					- if <[target].entity_type> = drowned:
					  - hurt <[target]> 10 source:<player> cause:magic
				    - if <[target].entity_type> = husk:
					  - hurt <[target]> 10 source:<player> cause:magic
					- if <[target].entity_type> = skeleton:
					  - hurt <[target]> 10 source:<player> cause:magic
					- if <[target].entity_type> = stray:
					  - hurt <[target]> 10 source:<player> cause:magic
					- if <[target].entity_type> = wither_skeleton:
					  - hurt <[target]> 10 source:<player> cause:magic
					- if <[target].has_flag[undead_group]> = true:
					  - hurt <[target]> 10 source:<player> cause:magic
					- if <[target].is_player||null> = true:
					  - if <placeholder[mystery_legacy].player[<[target]>]> = DEATH:
					    - hurt <[target]> 7 source:<player>
					- if <placeholder[mystery_legacy].player[<player>]> = DEATH:
					  - hurt <player> 5 source:<player> cause:magic
				    - execute "my rmmana <player.name> 5" as_server silent
					- flag <player> gcd expire:2s
                    - if <[target].is_player||null> = true:
                      - animate <[target]> HURT
					  - animate <[target]> EAT_FOOD
				    - playsound <[start]> sound:BLOCK_RESPAWN_ANCHOR_DEPLETE volume:2.0
                    - if <[start]> != null && <[end]> != null:
                      - define ray <[start].points_between[<[end]>].distance[0.25]>
                      - foreach <[ray]>:
                        - playeffect effect:REDSTONE quantity:20 offset:0.01 at:<[value]> special_data:1.3|yellow visibility:50
                      - playeffect effect:REDSTONE quantity:300 offset:0.45 at:<[end]> special_data:1.5|yellow visibility:50
				  - else:
				    - actionbar "<&6><&l>Посох света перезаряжается."
                - else:
		          - actionbar "<&6><&l>У вас не достаточно маны на использование данного предмета."