npc_hunter_kain:
    type: world
    debug: false
    events:
        on player right clicks entity:
          - ratelimit <player> 1t
          - if <context.entity.entity_type.is[==].to[player]||false>:
            - if <context.entity.name> == "Охотник Каин":
              - inventory open d:npc_hunter_kain_d
          - if <context.entity.entity_type.is[==].to[wolf]||false>:
            - determine passively cancelled
            - if <context.entity.name> == "Амая":
              - if <player.has_flag[hunter_kain_feed_cd]> = true:
                - if <player.item_in_hand.display||null> = null && <player.item_in_hand.material.name> = porkchop && <player.item_in_hand.quantity> >= 32:
                  - narrate "<&7><&o>Довольная собака бросается за ещё одной порцией мяса, но за какое-то мгновение Каин успевает её остановить..."
                  - narrate "<&e>[Охотник Каин] <&6>- Нет! Хватит жрать! Нам пора на охоту!"
                  - stop
                - else:
                  - narrate "<&7><&o>Сытая собака смотрит на Вас довольным и ленивым взглядом, кажется что охотиться она всё равно не собирается."
                  - stop
              - else:
                - if <player.flag[quests].contains[hunter_kain_feed]> = true:
                  - if <player.item_in_hand.display||null> = null && <player.item_in_hand.material.name> = porkchop && <player.item_in_hand.quantity> >= 32:
                    - narrate "<&7><&o>Увидев у Вас в руках кусочки мяса, собака тут же выхватывает их и за какие-то секунды проглатывает. Убедившись что мяса больше нет, собака начинает рыть в земле лапами..."
                    - playeffect effect:HEART quantity:5 offset:0.4 at:<context.entity.location.add[0,1,0]>
                    - take material:porkchop quantity:32 from:<player.inventory>
                    - execute "my addpve <player.name> 5 Задание: Покормить Амаю" as_server silent
                    - flag <player> quests:<player.flag[quests].as_list.exclude[hunter_kain_feed]>
                    - flag <player> hunter_kain_feed_cd duration:16h
                    - define loc <location[-205.9,87.3,208,amber]>
                    - wait 1s
                    - repeat 10:
                      - wait 5t
                      - playsound <[loc]> sound:BLOCK_GRAVEL_BREAK volume:<util.random.decimal[0.1].to[0.5]> pitch:<util.random.decimal[0.1].to[0.5]>
                      - playeffect at:<[loc]> effect:FALLING_DUST quantity:20 offset:0.15,0.15,0.15 special_data:dirt visibility:50
                    - wait 10t
                    - define type <util.random.int[0].to[8]>
                    - if <[type]> = 0:
                      - define reward diamond
                    - if <[type]> = 1:
                      - define reward emerald
                    - if <[type]> = 2:
                      - define reward amethyst_shard
                    - if <[type]> = 3:
                      - define reward quartz
                    - if <[type]> = 4:
                      - define reward item_taler_gold
                    - if <[type]> = 5:
                      - define reward ender_pearl
                    - if <[type]> = 6:
                      - define reward item_spawn_moonshine
                    - if <[type]> = 7:
                      - define reward item_amphora
                    - if <[type]> = 8:
                      - define reward skeleton_skull
                    - drop <[reward]> <[loc]> quantity:1
                    - narrate "<&e>[Охотник Каин] <&6>- Откуда это у неё?! Чтож, кажется Амая решила сама вознаградить Вас."
                  - else:
                    - narrate "<&7><&o>Голодная собака выжидательно смотрит на Вас."
                    - stop
                - else:
                  - narrate "<&7><&o>Собака еле заметно качает головой в сторону охотника, кажется, говорить Вам надо с ним."
                  - stop
              - define type <util.random.int[0].to[2]>
              - if <[type]> = 0:
                - playsound <context.entity.location> sound:ENTITY_WOLF_WHINE volume:0.3
              - if <[type]> = 1:
                - playsound <context.entity.location> sound:ENTITY_WOLF_AMBIENT volume:0.3
              - if <[type]> = 2:
                - playsound <context.entity.location> sound:ENTITY_WOLF_GROWL volume:0.2
        on player clicks npc_hunter_kain_q_feed in npc_hunter_kain_d:
          - determine passively cancelled
          - inventory close
          - if <player.has_flag[quests]> = false:
            - define quests <list[]>
            - flag <player> quests:<[quests]>
          - if <player.has_flag[hunter_kain_feed_cd]> = true:
            - narrate "<&e>[Охотник Каин] <&6>- Хватит ей еды, а то разжиреет и вовсе охотиться перестанет. Приходи завтра, мы тут разбиваем лагерь каждый день. <player.flag_expiration[hunter_kain_feed_cd].from_now.formatted>"
            - stop
          - if <player.flag[quests].contains[hunter_kain_feed]> = true:
            - narrate "<&e>[Охотник Каин] <&6>- Просто отдай мясо собаке. Не бойся она тебя не укусит, если у тебя еда в руках."
          - else:
            - narrate "<&e>[Охотник Каин] <&6>- Я не могу представить себе более ленивое и прожорливое животное чем Амая. Она наотрез отказывается охотиться пока её не покормить как следует."
			- wait 5s
			- narrate "<&e>[Охотник Каин] <&6>- Не мог бы ли ты принести 32 куска сырой свинины? Она её больше всего любит."
			- wait 10t
			- clickable until:120s usages:1 save:quest:
			  - flag <player> quests:<player.flag[quests].include[hunter_kain_feed]>
			  - wait 5t
			  - narrate "<&e>[Охотник Каин] <&6>- Между портом и лагерем беззаконников в лесу есть логово диких вепрей, можешь поохотиться на них. Ты его ни с чем не спутаешь, это такое большое плодовое дерево на островке слева от разрушенного маяка. <n> Хотя можешь, конечно, пойти и просто купить его на рынке или у фермера. <n> Как принесёшь, просто отдай всё мясо собаке."
			- narrate "<&a><&l><element[Да].on_click[<entry[quest].command>].on_hover[<&7>Нажмите,чтоб принять квест!]><reset>  / <&c><&l>Нет"
		on player clicks npc_hunter_kain_q_fox in npc_hunter_kain_d:
          - determine passively cancelled
          - inventory close
          - if <player.has_flag[quests]> = false:
            - define quests <list[]>
            - flag <player> quests:<[quests]>
          - if <player.has_flag[hunter_kain_fox_cd]> = true:
            - narrate "<&e>[Охотник Каин] <&6>- Ты славно поработал! Теперь лисы здесь появлятся ещё не скоро <player.flag_expiration[hunter_kain_fox_cd].from_now.formatted>"
            - stop
          - if <player.flag[quests].contains[hunter_kain_fox]> = true:
            - if <player.has_flag[hunter_kain_fox_kill_10]> = true:
              - flag <player> quests:<player.flag[quests].as_list.exclude[hunter_kain_fox]>
              - flag <player> hunter_kain_fox_cd duration:8h
              - flag <player> hunter_kain_fox_kill_10:!
              - give to:<player.inventory> item_taler_gold quantity:5
              - narrate "<&e>[Охотник Каин] <&6>- Ты правда одолел их всех? А ты оказался хорошим охотником! Держи свою награду. Но не забыйвай, что лисы приходят в то гнездо снова достаточно быстро, так что это не последняя твоя вылазка."
              - narrate "<&7>Вы получили награду за задание: 5 Золотых Талеров."
              - execute "my addpve <player.name> 5 Задание: Охота на лис" as_server silent
            - else:
              - narrate "<&e>[Охотник Каин] <&6>- Чего застыл? Страшно стало? Не бойся, лисы не такие опасные, если у тебя имеется хорошее оружие и ловкость."
          - else:
            - narrate "<&e>[Охотник Каин] <&6>- Не мог бы ты помочь мне? Каждый день я прихожу сюда отловить несколько лис, чтобы они не нападали на прохожих, но сегодня я забыл своё ружьё. "
			- clickable until:120s usages:1 save:quest:
			  - flag <player> quests:<player.flag[quests].include[hunter_kain_feed]>
			  - flag <player> quests:<player.flag[quests].as_list.include[hunter_kain_fox]>
			  - flag <player> hunter_kain_fox_kill:0
			  - wait 10t
			  - narrate "<&e>[Охотник Каин] <&6>- Предлагаю тебе, за не просто так, убить 10 лис вот у того большого дерева слева от меня."
			- narrate "<&a><&l><element[Да].on_click[<entry[quest].command>].on_hover[<&7>Нажмите,чтоб принять квест!]><reset>  / <&c><&l>Нет"
		on entity killed by entity:
		  - if <context.damager.has_flag[hunter_kain_fox_kill]> = true:
            - if <context.entity.name> == "Hungry fox":
		      - flag <player> hunter_kain_fox_kill:+:1
			  - wait 0.1
              - actionbar "<&7>Вы убили голодную лису! Вы убили уже <player.flag[hunter_kain_fox_kill]>."
			  - if <player.flag[hunter_kain_fox_kill]> = 10:
			    - flag <player> hunter_kain_fox_kill:!
			    - flag <player> hunter_kain_fox_kill_10
npc_hunter_kain_d:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Охотник Каин"
  size: 9
  slots:
  - [empty] [empty] [empty] [empty] [empty] [empty] [empty] [npc_hunter_kain_q_fox] [npc_hunter_kain_q_feed]
npc_hunter_kain_q_feed:
  type: item
  debug: false
  material: writable_book
  display name: "<&6><&l>Задание: Покормить Амаю"
  lore:
  - "<&6>У тебя есть какие-нибудь задания"
  - "<&6>для меня?"
  - ""
  - "<&7>Взять у персонажа задание."
  mechanisms:
    flag:
	   GUI:
npc_hunter_kain_q_fox:
  type: item
  debug: false
  material: writable_book
  display name: "<&6><&l>Задание: Охота на лис"
  lore:
  - "<&6>У тебя есть какие-нибудь задания"
  - "<&6>для меня?"
  - ""
  - "<&7>Взять у персонажа задание."
  - "<&7>Это задание легкого уровня,"
  - "<&7>поэтому и награда не большая."
  mechanisms:
    flag:
	   GUI: