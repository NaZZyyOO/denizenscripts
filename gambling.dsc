item_gambling_dice:
    type: item
    debug: false
    material: shulker_shell
    display name: "<&5><&l>Кости"
    lore:
    - "<&6>Совершенные игральные кости. Их"
    - "<&6>идеальная кубическая форма вовсе не"
    - "<&6>влияет на характер игры!"
    - ""
    - "<&7>Использование:"
    - "<&a> - Бросить игральную кость на доску"
    - "<&a> чтобы попытаться выиграть ценный приз."
    - ""
    - "<&7>Бросить кости можно только со специального"
    - "<&7>медного постамента в Игорном Доме, рядом с"
    - "<&7>игральной доской."
    mechanisms:
        unbreakable: true
        custom_model_data: 1
    enchantments:
    - LOOT_BONUS_BLOCKS:10
item_gambling_ticket:
    type: item
    debug: false
    material: paper
    display name: "<&5><&l>Билет Супер Лото"
    lore:
    - "<&6>Позолоченный лотерейный билет"
    - "<&6>легендарной безпроигрышной рулетки."
    - ""
    - "<&7>Использование:"
    - "<&a> - Разыграть свой билет."
    - ""
    - "<&7>Чтобы разыграть билет нужно нажать"
    - "<&7>на чёрную кнопку в Игорном Доме,"
    - "<&7>держа этот билет в руке."
    mechanisms:
        unbreakable: true
        custom_model_data: 4
    enchantments:
    - LOOT_BONUS_BLOCKS:10
item_gambling_ring:
    type: item
    debug: false
    material: gold_nugget
    display name: "<&4><&l>Кольцо Удачи"
    lore:
    - "<&6>Прекрасное золотое кольцо"
    - "<&6>инкрустированное неизвестным камнем."
    mechanisms:
        unbreakable: true
        custom_model_data: 2
    enchantments:
    - LOOT_BONUS_BLOCKS:10
item_glamdring:
    type: item
    debug: false
    material: wooden_sword
    display name: "<&5><&l>Гламдринг"
    lore:
    - "<&6>Древняя реликвия, сотворённая"
    - "<&6>на заре этого мира."
    - ""
    - "<&7>Использование:"
    - "<&a> - Мгновенная телепортация в"
    - "<&a> направлении взгляда."
    mechanisms:
        unbreakable: true
        custom_model_data: 1
    enchantments:
    - durability:10
    - knockback:3
item_durandal:
    type: item
    debug: false
    material: iron_sword
    display name: "<&5><&l>Дюрандаль"
    lore:
    - "<&6>Древняя реликвия, которой владело"
    - "<&6>множество героев древности."
    - "<&6>Невозможно сосчитать количество жизней"
    - "<&6>отнятых этим оружием."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - С вероятностью 5% может"
    - "<&a> нанести критический удар, нанеся"
    - "<&a> дополнительно 250% урона."
    mechanisms:
        custom_model_data: 16
		nbt_attributes:
        - generic.attack_damage/mainhand/0.0/10.0
        - generic.movement_speed/mainhand/1.0/+0.15
        - generic.attack_speed/mainhand/0.0/-1.8
    enchantments:
    - durability:5
    - damage_all:5
spawn_gambling_house:
  type: world
  debug: false
  events:
      on player right clicks block:
        - inject chest_check
        - if <player.item_in_hand.script.name||null> = item_gambling_dice:
            - determine passively cancelled
            - if <player.location.is_within[SpawnGamblingDice]> = true:
			  - if <player.has_flag[dice_item]> = false:
			    - flag <player> dice_item:0 expire:1h
			  - if <player.flag[dice_item]> <= 100:
                - if <player.has_flag[gambling_dice_cd]> = false:
                    - flag <player> gambling_dice_cd duration:3s
                    - if <player.gamemode> != creative:
                        - take iteminhand
                    - define blocks <cuboid[cu@amber,-217,93,-26,-219,93,-20].blocks>
                    - drop conduit <cuboid[cu@amber,-218,94,-25,-218,94,-21].random> quantity:1 speed:<util.random.decimal[0.5].to[0.9]> save:dice_item
                    - define dice_item <entry[dice_item].dropped_entity>
                    - define min <element[1]>
                    - define max <element[6]>
                    - define player <player>
                    - repeat 8:
                        - wait <util.random.int[2].to[8]>t
                        - playsound sound:BLOCK_WOOD_BREAK at:<[blocks].random> pitch:<util.random.decimal[0.5].to[2.0]>
                        - if <[value]> < 8:
                             - define dice_rand <util.random.int[1].to[6]>
                        - if <[value]> = 8:
                            - inject carma_random
                        - actionbar "<&6>На костях число - <&l><[dice_rand]>"
                        - foreach <[blocks]>:
                            - playeffect effect:REDSTONE quantity:<util.random.int[1].to[5]> offset:0.2 at:<[value].center> special_data:1.0|orange
                    - wait 10t
                    - if <[dice_item].is_spawned||null> = true:
                      - remove <[dice_item]>
                    - if <[dice_rand]> = 1:
                      - narrate "<&e>[Крупье Ларри] <&6>- ⚀ Я уверен, Вам повезёт в следующий раз!"
					  - define item <util.random.int[1].to[5]>
					  - if <server.has_flag[new_year_event]> = true:
						- if <[item]> = 1:
					      - give item_candy_red quantity:1 to:<player.inventory>
					    - if <[item]> = 2:
					      - give item_candy_yellow quantity:1 to:<player.inventory>
					    - if <[item]> = 3:
					      - give item_candy_purple quantity:1 to:<player.inventory>
					    - if <[item]> = 4:
					      - give item_candy_orange quantity:1 to:<player.inventory>
					    - if <[item]> = 5:
					      - give item_candy_blue quantity:1 to:<player.inventory>
                    - if <[dice_rand]> = 2:
                      - narrate "<&e>[Крупье Ларри] <&6>- ⚁ Это лучше чем ничего. Готов поспорить, в следующий раз Вам выпадет больше!"
                      - give item_taler_silver quantity:20 to:<player.inventory>
                      - narrate "<&7>Вы выиграли приз: 20 Серебряных Талеров."
                    - if <[dice_rand]> = 3:
                      - narrate "<&e>[Крупье Ларри] <&6>- ⚂ Хотите сыграть ещё?"
                      - give item_taler_gold quantity:1 to:<player.inventory>
                      - narrate "<&7>Вы выиграли приз: 1 Золотой Талеров."
                    - if <[dice_rand]> = 4:
                      - narrate "<&e>[Крупье Ларри] <&6>- ⚃ У Вас счастливая рука! Сыграете ещё?"
                      - give item_taler_gold quantity:1 to:<player.inventory>
                      - give item_taler_silver quantity:32 to:<player.inventory>
                      - narrate "<&7>Вы выиграли приз: 1 Золотой и 32 Серебряных Талера."
                    - if <[dice_rand]> = 5:
                      - narrate "<&e>[Крупье Ларри] <&6>- ⚄ Сегодня точно Ваш день! Предлагаю сыграть ещё разок."
                      - give item_taler_gold quantity:2 to:<player.inventory>
                      - narrate "<&7>Вы выиграли приз: 2 Золотых Талера."
                    - if <[dice_rand]> = 6:
                      - narrate "<&e>[Крупье Ларри] <&6>- ⚅ Поздравляю! Вот ваш приз!"
                      - give item_taler_gold quantity:3 to:<player.inventory>
                      - narrate "<&7>Вы выиграли приз: 3 Золотых Талера."
					- flag <player> dice_item:+:1 expire:<player.flag_expiration[dice_item].from_now.in_seconds>
			  - else:
			    - determine passively cancelled
				- narrate "<&7>Вы можете бросить не больше 100 костей в час."
            - else:
              - narrate "<&8>[Игорный Дом] <&7>- Чтобы бросить кость нужно встать на медный постамент перед игральной доской."
		      
        - if <player.item_in_hand.script.name||null> = item_glamdring:
            - if <player.has_flag[glamdring_cooldown]> = false:
                - define loc <player.precise_target_position[50].add[0.0,0.5,0.0]||null>
                - if <[loc]> != null:
                    - playeffect at:<player.location> effect:REDSTONE quantity:250 offset:0.55 special_data:1.0|orange
                    - playsound <player.location> sound:ENTITY_SHULKER_TELEPORT volume:1.0
                    - flag <player> glamdring_cooldown duration:15s
                    - teleport <player> <[loc]>
                    - wait 0.1s
                    - playeffect at:<player.location> effect:REDSTONE quantity:250 offset:0.55 special_data:1.0|orange
                    - playsound <player.location> sound:ENTITY_SHULKER_TELEPORT volume:1.0
            - else:
                - playsound <player> sound:BLOCK_STONE_BUTTON_CLICK_OFF volume:1.0 pitch:0.1
                - actionbar "<&6><&l>Гламдринг перезаряжается: <player.flag[glamdring_cooldown].expiration.formatted>"
      on entity damages entity with:item_durandal:
        - if <util.random.int[0].to[100]> <= 5:
		  - if <context.entity> != null:
            - actionbar "<&6><&l>Ваша атака была критической и нанесла противнику <context.damage.mul[3.5].round_up> ед. урона"
            - playsound <context.entity.location> sound:ENTITY_GENERIC_EXPLODE volume:0.5
            - determine passively <context.damage.mul[3.5]>
	  on player right clicks block with:item_gambling_ring:
	    - if <player.has_flag[gambling_ring_cd]> = false:
		  - flag <player> gambling_ring_cd expire:50m
		  - cast <player> LUCK a:0 d:<util.random.int[10].to[25]>
		  - playeffect effect:REDSTONE quantity:100 offset:0.6 special_data:1.6|green <player.location>
      on player enters SpawnGamblingBoard:
        - if <player.has_flag[gambling_lout]> = false:
		  - if <player.name.is[==].to[Korvinius]> = false:
            - teleport <player> <location[-218,95,-28,17,0,amber].center>
            - narrate "<&e>[Крупье Ларри] <&6>- Ещё раз вылезешь на доску, и тебя вышвырнут на улицу."
            - flag <player> gambling_lout duration:1d
        - else:
            - teleport <player> <location[-219.5,88,-38.5,14,180,amber]>
            - narrate "<&e>[Крупье Ларри] <&6>- Я предупержал тебя. Проваливай отсюда, бестолочь."
      on player picks up conduit:
        - if <context.location.is_within[SpawnGamblingHouse]> = true:
          - determine passively cancelled
          - remove <context.entity>
      on player right clicks polished_blackstone_button in:SpawnGamblingLotoButton:
        - if <player.item_in_hand.script.name||null> = item_gambling_ticket:
          - if <player.gamemode> = creative:
            - narrate "<&8>[Игорный Дом] <&7>- Не работает в креативе."
            - determine passively cancelled
            - stop
          - determine passively cancelled
          - take iteminhand
          - define min <element[1]>
          - define max <element[1000]>
          - define player <player>
          - inject carma_random
		  - if <[dice_rand]> >= 951:
		    - if <player.has_flag[big_drop_cd]> = true:
			  - define dice_rand <util.random.int[1].to[949]>
        # Призы низкого тира.
          - if <[dice_rand]> <= 600:
            - define type <util.random.int[0].to[8]>
			- if <server.has_flag[new_year_event]> = true:
			  - define type <util.random.int[0].to[10]>
			  - if <[type]> = 9:
                - narrate "<&7>Вы выиграли приз: 2 Белых билета."
                - give item_white_ticket quantity:2 to:<player.inventory>
			  - if <[type]> = 10:
                - narrate "<&7>Вы выиграли приз: 1 Зелёный билет."
                - give item_green_ticket quantity:1 to:<player.inventory>
            - if <[type]> = 0:
                - narrate "<&7>Вы выиграли приз: 3 Чаорита."
                - give item_chaorit quantity:3 to:<player.inventory>
            - if <[type]> = 1:
                - narrate "<&7>Вы выиграли приз: 128 Серебряных Талера."
                - give item_taler_silver quantity:128 to:<player.inventory>
            - if <[type]> = 2:
                - narrate "<&7>Вы выиграли приз: 16 Огненных Стерженей."
                - give blaze_rod quantity:16 to:<player.inventory>
            - if <[type]> = 3:
                - narrate "<&7>Вы выиграли приз: 2 Игральные Кости."
                - give item_gambling_dice quantity:2 to:<player.inventory>
            - if <[type]> = 4:
                - narrate "<&7>Вы выиграли приз: 64 Железных слитка."
                - give iron_ingot quantity:64 to:<player.inventory>
            - if <[type]> = 5:
                - narrate "<&7>Вы выиграли приз: 32 Незерского нароста."
                - give nether_wart quantity:32 to:<player.inventory>
            - if <[type]> = 6:
                - narrate "<&7>Вы выиграли приз: Малую Амфору Знаний."
                - give item_amphora quantity:1 to:<player.inventory>
            - if <[type]> = 7:
                - narrate "<&7>Вы выиграли приз: 32 Отравленных аборигенских стрелы."
                - give item_arrow_poison quantity:32 to:<player.inventory>
            - if <[type]> = 8:
                - narrate "<&7>Вы выиграли приз: 32 Медных слитка."
                - give copper_ingot quantity:32 to:<player.inventory>
        # Призы среднего тира.
          - if <[dice_rand]> > 600 && <[dice_rand]> < 950:
            - define type <util.random.int[0].to[11]>
			- if <server.has_flag[new_year_event]> = true:
			  - define type <util.random.int[0].to[13]>
			  - if <[type]> = 12:
                - narrate "<&7>Вы выиграли приз: 1 Красый билета."
                - give item_red_ticket quantity:1 to:<player.inventory>
			  - if <[type]> = 13:
                - narrate "<&7>Вы выиграли приз: 1 Новогодний подарок."
                - give item_chest_gift quantity:1 to:<player.inventory>
            - if <[type]> = 0:
                - narrate "<&7>Вы выиграли приз: 14 Золотых Талеров."
                - give item_taler_gold quantity:15 to:<player.inventory>
            - if <[type]> = 1:
                - narrate "<&7>Вы выиграли приз: 8 Алмаза."
                - give diamond quantity:8 to:<player.inventory>
            - if <[type]> = 2:
                - narrate "<&7>Вы выиграли приз: 5 Билетов Супер Лото."
                - give item_gambling_ticket quantity:5 to:<player.inventory>
            - if <[type]> = 3:
                - narrate "<&7>Вы выиграли приз: 5 Игральных Костей."
                - give item_gambling_dice quantity:5 to:<player.inventory>
            - if <[type]> = 4:
                - narrate "<&7>Вы выиграли приз: -1 к вашей карме."
                - execute as_server silent "carma add <player.name> -1"
            - if <[type]> = 5:
                - narrate "<&7>Вы выиграли приз: +1 к вашей карме."
                - execute as_server silent "carma add <player.name> 1"
            - if <[type]> = 6:
                - narrate "<&7>Вы выиграли приз: 10 Изумрудов."
                - give emerald quantity:10 to:<player.inventory>
            - if <[type]> = 7:
                - narrate "<&7>Вы выиграли приз: Большую Амфору Знаний."
                - give item_amphora_large quantity:1 to:<player.inventory>
            - if <[type]> = 8:
                - narrate "<&7>Вы выиграли приз: 2 Свитка Полёта."
                - give item_scroll_fly quantity:2 to:<player.inventory>
            - if <[type]> = 9:
                - narrate "<&7>Вы выиграли приз: Стальную кирку штейгера."
                - give item_steel_pickaxe_03 quantity:1 to:<player.inventory>
            - if <[type]> = 10:
                - narrate "<&7>Вы выиграли приз: 2 Осколка титана."
                - give item_titan_nugget quantity:2 to:<player.inventory>
            - if <[type]> = 11:
                - narrate "<&7>Вы выиграли приз: 32 Золотых слитков."
                - give gold_ingot quantity:32 to:<player.inventory>
        # Призы высокого тира.
          - if <[dice_rand]> >= 950:
            - define type <util.random.int[0].to[1]>
			- if <player.has_flag[big_drop_cd]> = false:
			  - flag <player> big_drop_cd expire:1h
              - if <[type]> = 0:
                - define item item_glamdring
                - inject spawn_gambling_loto_big_prize
              - if <[type]> = 1:
                - define item item_durandal
                - inject spawn_gambling_loto_big_prize
        - else:
          - if <player.gamemode> = creative:
            - narrate "<&8>[Игорный Дом] <&7>- Не работает в креативе."
            - determine passively cancelled
            - stop
          - determine passively cancelled
          - narrate "<&8>[Игорный Дом] <&7>- Для того чтобы участвовать в лотерее, Вам нужен билет Билет Супер Лото. Купить такой билет можно у Крупье Ларри."
      on player right clicks entity:
        - ratelimit <player> 1t
        - if <context.entity.entity_type.is[==].to[player]||false>:
          - if <context.entity.name> == "<&6>Крупье Ларри":
            - inventory open d:dialogue_gambling_larry
          - if <context.entity.name> == "<&4>Послушник Иероним":
            - define type <util.random.int[0].to[2]>
            - if <[type]> = 0:
              - narrate "<&e>[Послушник Иероним] <&6>- Я здесь по распоряжению Верховного Инквизитора Лорда Фридхолда, и слежу за тем, чтобы указы Церкви от его имени были соблюдены. Вы можете идти, но помните, я за Вами слежу."
            - if <[type]> = 1:
              - narrate "<&e>[Послушник Иероним] <&6>- Ведите себя пристойно, и помните, что где бы вы ни находились, Боги и их Инквизиция всегда видят ваши помыслы и деяния."
            - if <[type]> = 2:
              - narrate "<&e>[Послушник Иероним] <&6>- Вы знаете, что недавно это место было закрыто, а его предыдущие хозяева повешены? Всё по воле нашей Инквизиции. Сейчас у Игорного Дома новые хозяева, хватит ли у них благочестия чтобы сохранить свои головы на плечах?"
        - if <context.entity.entity_type.is[==].to[vindicator]||false>:
		  - if <context.entity.name||null> == "<&6>Содержатель Феофан":
            - inventory open d:dialogue_gambling_traktir
      on player clicks dialogue_gambling_larry_play in dialogue_gambling_larry:
        - determine passively cancelled
        - run trade_gambling_larry
      on player clicks dialogue_gambling_larry_ticket in dialogue_gambling_larry:
        - determine passively cancelled
        - inventory close
        - if <player.gamemode> != creative:
            - if <player.has_flag[gambling_ticket_cd]> = true:
                - narrate "<&e>[Крупье Ларри] <&6>- Вы уже покупали у нас билет сегодня, извините, но дремучими законами нашего королевства запрещено продавать беспроигрышные лотерейные билеты чаще раза в сутки. <player.flag[gambling_ticket_cd].expiration.formatted>"
            - else:
                - if <player.inventory.contains_any[item_taler_gold].quantity[1]> = true:
                    - flag <player> gambling_ticket_cd duration:1d
                    - take scriptname:item_taler_gold quantity:1 from:<player.inventory>
                    - give item_gambling_ticket quantity:1 to:<player.inventory>
                    - narrate "<&e>[Крупье Ларри] <&6>- Благодарю, вот Ваш билет. Чтобы разыграть его, Вам нужно подойти с этим билетом и нажать на чёрную кнопку на золотом механизме у стены."
                - else:
                    - narrate "<&e>[Крупье Ларри] <&6>- Стоимость билета - 1 Золотой Талер."
        - else:
            - narrate "<&8>[Игорный Дом] <&7>- Не работает в креативе."
      on player clicks trade in dialogue_gambling_traktir:
        - determine passively cancelled
        - run trade_gambling_traktir
spawn_gambling_loto_big_prize:
    debug: false
    type: task
    script:
      - give <[item]> quantity:1 to:<player.inventory>
      - define pref <placeholder[mystery_prefix].player[<player>]>
      - define original_item <player.inventory.slot[<player.held_item_slot>]>
      - inventory set origin:<[item]> slot:<player.held_item_slot>
      - narrate "<&e>[Крупье Ларри] <&6>- <&l><[pref].strip_color.color[6]> <&6><player.name.on_hover[<player>].type[SHOW_ENTITY]> <&6>только что выиграл в лотерее <&l>[<player.item_in_hand.display.on_hover[<player.item_in_hand>].type[SHOW_ITEM]>]<reset><&6>, с чем мы его и поздравляем!" targets:<server.online_players>
      - narrate "<&7>Вы выиграли приз: <player.item_in_hand.display>"
      - inventory set origin:<[original_item]> slot:<player.held_item_slot>
spawn_gambling_house_loc:
    debug: false
    type: task
    script:
        - note <cuboid[cu@amber,-217.2,94,-27.2,-217.8,96,-27.8]> as:SpawnGamblingDice
        - note <cuboid[cu@amber,-220,93,-19,-216,95,-27]> as:SpawnGamblingBoard
        - note <cuboid[cu@amber,-215,91,-33,-225,100,-8]> as:SpawnGamblingHouse
        - note <cuboid[cu@amber,-224,94,-19,-224,94,-19]> as:SpawnGamblingLotoButton
dialogue_gambling_larry:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Крупье Ларри"
  size: 9
  slots:
  - [dialogue_gambling_larry_play] [dialogue_gambling_larry_ticket] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
dialogue_gambling_larry_play:
  type: item
  debug: false
  material: shulker_shell
  display name: "<&6><&l>Купить игральные кости"
  lore:
  - "<&6>Я хочу сыграть."
  - ""
  - "<&7>Купить у крупье набор игральных костей."
  mechanisms:
    custom_model_data: 1
	flag:
	  GUI:
dialogue_gambling_larry_ticket:
  type: item
  debug: false
  material: paper
  display name: "<&6><&l>Приобрести лотерейный билет"
  lore:
  - "<&6>Я хочу купить лотерейный билет."
  - ""
  - "<&7>Купить у крупье билет Супер Лото."
  - "<&7>Стоимость билета - 1 Золотой Талер."
  - "<&7>Покупать билет нельзя чаще одного раза"
  - "<&7>в сутки."
  mechanisms:
    custom_model_data: 4
	flag:
	  GUI:
trade_gambling_larry:
    debug: false
    type: task
    script:
      - define dice trade[inputs=item_taler_gold[quantity=1];result=item_gambling_dice[quantity=1];max_uses=99999;has_xp=false]
      - define ring trade[inputs=item_taler_talant[quantity=32];result=item_gambling_ring[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[dice]>|<[ring]> "title:Крупье Ларри"
dialogue_gambling_traktir:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Содержатель Феофан"
  size: 9
  slots:
  - [trade] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
trade_gambling_traktir:
    debug: false
    type: task
    script:
      - define bun trade[inputs=item_taler_silver[quantity=1];result=item_bun[quantity=1];max_uses=99999;has_xp=false]
      - define garlic trade[inputs=item_taler_silver[quantity=16];result=item_garlic[quantity=16];max_uses=99999;has_xp=false]
      - define ribs trade[inputs=item_taler_silver[quantity=2];result=item_ribs_with_pepper[quantity=1];max_uses=99999;has_xp=false]
      - define grog trade[inputs=item_taler_silver[quantity=2];result=item_spawn_grog[quantity=1];max_uses=99999;has_xp=false]
      - define rum trade[inputs=item_taler_silver[quantity=32];result=item_spawn_rum[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[bun]>|<[garlic]>|<[ribs]>|<[grog]>|<[rum]> "title:Содержатель Феофан"