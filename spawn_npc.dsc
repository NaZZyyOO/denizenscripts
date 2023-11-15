# Диалоги со NPC спавна.
spawn_npc_click:
    type: world
    debug: false
    events:
        on player right clicks entity:
          - ratelimit <player> 1t
          - if <player.is_online> = true:
            - if <context.entity.name> == "Стражник Виктор":
              - inventory open d:spawn_dialogue_guard_viktor
            - if <context.entity.name> == "Стражник Кристер":
              - inventory open d:spawn_dialogue_guard_krister
            - if <context.entity.name> == "Начертатель Йенс":
              - inventory open d:spawn_dialogue_scribe
            - if <context.entity.name> == "Травница Флавия":
              - inventory open d:spawn_dialogue_herbalist
            - if <context.entity.name> == "Скупщик Леон":
              - inventory open d:spawn_dialogue_buyer
            - if <context.entity.name> == "Меняла":
              - inventory open d:spawn_dialogue_moneychanger
			- if <context.entity.name> == "Скупщик-меняла":
			  - inventory open d:spawn_dialogue_moneychanger_buyer
            - if <context.entity.name> == "Алхимик Хорст":
              - inventory open d:spawn_dialogue_alchemist
            - if <context.entity.name> == "Каменщик Скорн":
              - inventory open d:spawn_dialogue_mason
            - if <context.entity.name> == "Зачарователь Беата":
              - inventory open d:spawn_dialogue_enchanter
            - if <context.entity.name> == "Трактирщик Берси":
              - inventory open d:spawn_dialogue_bersi
            - if <context.entity.name> == "Кузнец Илья":
              - inventory open d:spawn_dialogue_smith_ilya
            - if <context.entity.name> == "Бронник Олос":
              - inventory open d:spawn_dialogue_olos
            - if <context.entity.name> == "Оружейник Орсон":
              - inventory open d:spawn_dialogue_orson
            - if <context.entity.name> == "Фермер Густав":
              - inventory open d:spawn_dialogue_gustav
            - if <context.entity.name> == "Капитан Фалко":
              - inventory open d:spawn_dialogue_captain_falco
            - if <context.entity.name> == "Проповедник Гарет":
              - inventory open d:spawn_dialogue_garet
            - if <context.entity.name> == "Трактирщик Чарли":
              - inventory open d:spawn_dialogue_charli
            - if <context.entity.name> == "Травница Флавия":
              - inventory open d:spawn_dialogue_flavia
spawn_dialogue_guard_viktor:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Стражник Виктор"
  size: 9
  slots:
  - [d_spawn_guard_open_gate] [empty] [empty] [empty] [empty] [empty] [quest_goblins] [quest_bandit_ears] [quest_bandit_hands]
spawn_dialogue_guard_krister:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Стражник Кристер"
  size: 9
  slots:
  - [d_spawn_guard_open_gate] [empty] [empty] [empty] [empty] [empty] [quest_goblins] [quest_bandit_ears] [quest_bandit_hands]
# Попросить стражу открыть ворота.
d_spawn_guard_open_gate:
  type: item
  debug: false
  material: chain
  display name: "<&6><&l>Попросить открыть ворота"
  lore:
  - "<&6>Открой ворота пожалуйста."
  mechanisms:
    flag:
	   GUI:
d_spawn_guard_viktor_open_gate_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_guard_open_gate in spawn_dialogue_guard_viktor:
        - determine passively cancelled
        - if <server.has_flag[amber_gate_guard_open]> = true:
          - narrate "<&e>[Стражник Виктор] <&6>- Они только что открылись, проходи."
          - inventory close
        - else:
          - if <server.has_flag[amber_gate_open]> = true:
            - narrate "<&e>[Стражник Виктор] <&6>- Ты слепой?! Ворота и так открыты!"
            - inventory close
          - else:
            - narrate "<&e>[Стражник Виктор] <&6>- Хорошо, я открою их на десять секунд. Проходи быстрее."
            - inventory close
            - wait 1
            - run spawn_gate_open
            - flag server amber_gate_guard_open
            - flag server amber_gate_open
            - wait 10
            - flag server amber_gate_guard_open:!
            - if <world[amber].time> >= 12500 && <world[amber].time> <= 22500:
                - run spawn_gate_close
                - flag server amber_gate_open:!
d_spawn_guard_krister_open_gate_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_guard_open_gate in spawn_dialogue_guard_krister:
        - determine passively cancelled
        - if <server.has_flag[amber_gate_guard_open]> = true:
          - narrate "<&e>[Стражник Кристер] <&6>- Чего? Вот же - ворота только что открылись!"
          - inventory close
        - else:
          - if <server.has_flag[amber_gate_open]> = true:
            - narrate "<&e>[Стражник Кристер] <&6>- Ха-хах, шутник. Иди давай!"
            - inventory close
          - else:
            - narrate "<&e>[Стражник Кристер] <&6>- Сейчас открою. Ворота будут открыты всего десять секунд, так что поспеши."
            - inventory close
            - wait 1
            - run spawn_gate_open
            - flag server amber_gate_guard_open
            - flag server amber_gate_open
            - wait 10
            - flag server amber_gate_guard_open:!
            - if <world[amber].time> >= 12500 && <world[amber].time> <= 22500:
                - run spawn_gate_close
                - flag server amber_gate_open:!
# Диалог Начертатель Йенс.
spawn_dialogue_scribe:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Начертатель Йенс"
  size: 9
  slots:
  - [trade] [d_spawn_scribe_books] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_scribe_trade_click:
  type: world
  debug: false
  events:
      on player clicks trade in spawn_dialogue_scribe:
        - determine passively cancelled
        - run trade_spawn_scribe
d_spawn_scribe_books:
  type: item
  debug: false
  material: written_book
  display name: "<&6><&l>Купить книги"
  lore:
  - "<&6>Я хочу посмотреть какие книги у тебя есть."
  mechanisms:
    flag:
	   GUI:
d_spawn_scribe_books_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_scribe_books in spawn_dialogue_scribe:
        - determine passively cancelled
        - run trade_scribe_books
# Диалог Травница Флавия.
spawn_dialogue_herbalist:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Травница Флавия"
  size: 9
  slots:
  - [trade] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_herbalist_trade_click:
  type: world
  debug: false
  events:
      on player clicks trade in spawn_dialogue_herbalist:
        - determine passively cancelled
# Диалог Скупщик Леон.
spawn_dialogue_buyer:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Скупщик Леон"
  size: 9
  slots:
  - [d_buyer_sell_low] [d_buyer_sell_high] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_buyer_sell_low:
  type: item
  debug: false
  material: iron_ingot
  display name: "<&6><&l>Продать дешёвые ресурсы"
  lore:
  - "<&6>Я хочу продать дешёвые ресурсы."
  mechanisms:
    flag:
	   GUI:
d_buyer_sell_high:
  type: item
  debug: false
  material: gold_ingot
  display name: "<&6><&l>Продать дорогие ресурсы"
  lore:
  - "<&6>Я хочу продать дорогие ресурсы."
  mechanisms:
    flag:
	   GUI:
d_spawn_buyer_sell_l_click:
  type: world
  debug: false
  events:
      on player clicks d_buyer_sell_low in spawn_dialogue_buyer:
        - determine passively cancelled
        - run trade_buyer_spawn_low
d_spawn_buyer_sell_h_click:
  type: world
  debug: false
  events:
      on player clicks d_buyer_sell_high in spawn_dialogue_buyer:
        - determine passively cancelled
        - run trade_buyer_spawn_high
# Диалог Меняла.
spawn_dialogue_moneychanger:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Меняла"
  size: 9
  slots:
  - [d_moneychanger_trade] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_moneychanger_trade:
  type: item
  debug: false
  material: gold_nugget
  display name: "<&6><&l>Обменять Талеры"
  lore:
  - "<&6>Я хочу обменять Талеры."
  mechanisms:
    flag:
	   GUI:
d_spawn_moneychanger_trade_click:
  type: world
  debug: false
  events:
      on player clicks d_moneychanger_trade in spawn_dialogue_moneychanger:
        - determine passively cancelled
        - run trade_gold_exchange
# Диалог Скупщика-менялы.
spawn_dialogue_moneychanger_buyer:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Меняла"
  size: 9
  slots:
  - [d_moneychanger_buyer_trade] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_moneychanger_buyer_trade:
  type: item
  debug: false
  material: gold_nugget
  display name: "<&6><&l>Обмен"
  lore:
  - "<&6>Я хочу обменять Талеры, Золото и Медь."
  mechanisms:
    flag:
	   GUI:
d_spawn_moneychanger_buyer_trade_click:
  type: world
  debug: false
  events:
      on player clicks d_moneychanger_buyer_trade in spawn_dialogue_moneychanger_buyer:
        - determine passively cancelled
        - run trade_buyer_gold_expange
# Диалог Алхимик Хорст.
spawn_dialogue_alchemist:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Алхимик Хорст"
  size: 9
  slots:
  - [d_spawn_alchemist_buy_low] [d_spawn_alchemist_buy_high] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_alchemist_buy_low:
  type: item
  debug: false
  material: honey_bottle
  display name: "<&6><&l>Купить дешёвые зелья"
  lore:
  - "<&6>Я хочу купить дешёвые зелья."
  mechanisms:
    custom_model_data: 6
	flag:
	  GUI:
d_spawn_alchemist_buy_high:
  type: item
  debug: false
  material: honey_bottle
  display name: "<&6><&l>Купить хорошие зелья"
  lore:
  - "<&6>Я хочу купить хорошие зелья."
  mechanisms:
    custom_model_data: 7
	flag:
	  GUI:
d_spawn_alchemist_buy_l_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_alchemist_buy_low in spawn_dialogue_alchemist:
        - determine passively cancelled
        - run trade_spawn_alchemist_low
d_spawn_alchemist_buy_h_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_alchemist_buy_high in spawn_dialogue_alchemist:
        - determine passively cancelled
        - run trade_spawn_alchemist_high
# Диалог Каменщик Скорн.
spawn_dialogue_mason:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Каменщик Скорн"
  size: 9
  slots:
  - [d_spawn_mason_buy_low] [d_spawn_mason_buy_high] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_mason_buy_low:
  type: item
  debug: false
  material: smooth_stone
  display name: "<&6><&l>Купить простые блоки"
  lore:
  - "<&6>Я хочу купить простые блоки."
  mechanisms:
    flag:
	   GUI:
d_spawn_mason_buy_high:
  type: item
  debug: false
  material: gold_block
  display name: "<&6><&l>Купить редкие блоки"
  lore:
  - "<&6>Я хочу купить редкие блоки."
  mechanisms:
    flag:
	   GUI:
d_spawn_mason_buy_l_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_mason_buy_low in spawn_dialogue_mason:
        - determine passively cancelled
        - run trade_spawn_mason_low
d_spawn_mason_buy_h_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_mason_buy_high in spawn_dialogue_mason:
        - determine passively cancelled
        - run trade_spawn_mason_high
# Диалог Зачарователь Беата.
spawn_dialogue_enchanter:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Зачарователь Беата"
  size: 9
  slots:
  - [trade] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_enchanter_trade_click:
  type: world
  debug: false
  events:
      on player clicks trade in spawn_dialogue_enchanter:
        - determine passively cancelled
        - run trade_spawn_inchanter
# Диалог Трактирщик Берси.
spawn_dialogue_bersi:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Трактирщик Берси"
  size: 9
  slots:
  - [d_spawn_dialogue_bersi_drink] [d_spawn_dialogue_bersi_food] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_dialogue_bersi_food:
  type: item
  debug: false
  material: cooked_mutton
  display name: "<&6><&l>Купить еду"
  lore:
  - "<&6>Я хочу перекусить."
  mechanisms:
    flag:
	   GUI:
d_spawn_dialogue_bersi_drink:
  type: item
  debug: false
  material: potion
  display name: "<&6><&l>Купить выпивку"
  lore:
  - "<&6>Налей чего-нибудь."
  mechanisms:
    color: 140,12,0
    potion_effects: WATER,false,false
    hides: ITEM_DATA
	flag:
	  GUI:
d_spawn_dialogue_bersi_food_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_dialogue_bersi_food in spawn_dialogue_bersi:
        - determine passively cancelled
        - run trade_spawn_tavern_food
d_spawn_dialogue_bersi_drink_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_dialogue_bersi_drink in spawn_dialogue_bersi:
        - determine passively cancelled
        - run trade_spawn_tavern_drink
# Диалог Кузнец Илья.
spawn_dialogue_smith_ilya:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Кузнец Илья"
  size: 9
  slots:
  - [trade] [repair] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_dialogue_ilya_trade_click:
  type: world
  debug: false
  events:
      on player clicks trade in spawn_dialogue_smith_ilya:
        - determine passively cancelled
        - inventory close
# Диалог Бронник Олос.
spawn_dialogue_olos:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Бронник Олос"
  size: 9
  slots:
  - [d_spawn_dialogue_olos_leather] [d_spawn_dialogue_olos_chain] [d_spawn_dialogue_olos_rusty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_dialogue_olos_leather:
  type: item
  debug: false
  material: leather_chestplate
  display name: "<&6><&l>Купить кожаную броню"
  lore:
  - "<&6>Я хочу купить у тебя кожаную броню."
  mechanisms:
    hides: ATTRIBUTES
	flag: 
	  GUI:
d_spawn_dialogue_olos_chain:
  type: item
  debug: false
  material: chainmail_chestplate
  display name: "<&6><&l>Улучшить броню до кольчужной"
  lore:
  - "<&6>Я хочу заменить кожаную броню"
  - "<&6>на кольчугу."
  mechanisms:
    hides: ATTRIBUTES
	flag:
	  GUI:
d_spawn_dialogue_olos_rusty:
  type: item
  debug: false
  material: iron_chestplate
  display name: "<&6><&l>Улучшить броню до ржавой"
  lore:
  - "<&6>Я хочу заменить кольчугу"
  - "<&6>на ржавую железную броню."
  mechanisms:
    hides: ATTRIBUTES
	flag:
	  GUI:
d_spawn_dialogue_olos_leather_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_dialogue_olos_leather in spawn_dialogue_olos:
        - determine passively cancelled
        - run trade_armor_t1
d_spawn_dialogue_olos_chain_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_dialogue_olos_chain in spawn_dialogue_olos:
        - determine passively cancelled
        - run trade_armor_t2
d_spawn_dialogue_olos_rusty_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_dialogue_olos_rusty in spawn_dialogue_olos:
        - determine passively cancelled
        - run trade_armor_t3
# Диалог Оружейник Орсон.
spawn_dialogue_orson:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Оружейник Орсон"
  size: 9
  slots:
  - [d_spawn_dialogue_orson_blades] [d_spawn_dialogue_orson_axes] [d_spawn_dialogue_orson_hammers] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_dialogue_orson_blades:
  type: item
  debug: false
  material: iron_sword
  display name: "<&6><&l>Клинки"
  lore:
  - "<&6>Покажи, какие клинки ты умеешь"
  - "<&6>делать."
  mechanisms:
    hides: ATTRIBUTES
    custom_model_data: 2
	flag:
	  GUI:
d_spawn_dialogue_orson_hammers:
  type: item
  debug: false
  material: iron_axe
  display name: "<&6><&l>Молоты"
  lore:
  - "<&6>Покажи, какие молоты ты умеешь"
  - "<&6>делать."
  mechanisms:
    hides: ATTRIBUTES
    custom_model_data: 3
	flag:
	  GUI:
d_spawn_dialogue_orson_axes:
  type: item
  debug: false
  material: iron_axe
  display name: "<&6><&l>Топоры"
  lore:
  - "<&6>Покажи, какие топоры ты умеешь"
  - "<&6>делать."
  mechanisms:
    hides: ATTRIBUTES
    custom_model_data: 9
	flag:
	  GUI:
d_spawn_dialogue_orson_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_dialogue_orson_blades in spawn_dialogue_orson:
        - determine passively cancelled
        - run trade_spawn_blade
	  on player clicks d_spawn_dialogue_orson_axes in spawn_dialogue_orson:
	    - determine passively cancelled
		- run trade_spawn_axe
	  on player clicks d_spawn_dialogue_orson_hammers in spawn_dialogue_orson:
	    - determine passively cancelled
		- run trade_spawn_hammer
# Диалог Фермер Густав.
spawn_dialogue_gustav:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Оружейник Орсон"
  size: 9
  slots:
  - [trade] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_dialogue_gustav_trade_click:
  type: world
  debug: false
  events:
      on player clicks trade in spawn_dialogue_gustav:
        - determine passively cancelled
        - run trade_farmer_gustav
# Диалог Интендант Андерс.
spawn_dialogue_mage_intendant:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Интендант Андерс"
  size: 9
  slots:
  - [trade] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_dialogue_mage_intendant_trade_click:
  type: world
  debug: false
  events:
      on player clicks trade in spawn_dialogue_mage_intendant:
        - determine passively cancelled
        - run trade_mage_tools
# Диалог Капитан Фалко.
spawn_dialogue_captain_falco:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Капитан Фалко"
  size: 9
  slots:
  - [ship_world] [ship_noob] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
# Диалог Проповедник Гарет.
spawn_dialogue_garet:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Проповедник Гарет"
  size: 9
  slots:
  - [d_spawn_dialogue_garet_alms] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_dialogue_garet_alms:
  type: item
  debug: false
  material: gold_nugget
  display name: "<&6><&l>Попросить подаяние"
  lore:
  - "<&6>Я нуждаюсь в деньгах и еде."
  - ""
  - "<&7>Попросить подаяния у церкви, проповедник"
  - "<&7>даст немного золота, еды и питья."
  - "<&7>Просить милостыню можно не чаще одно раза в день."
  mechanisms:
      unbreakable: true
      custom_model_data: 1
	  flag:
	    GUI:
d_spawn_dialogue_garet_alms_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_dialogue_garet_alms in spawn_dialogue_garet:
        - determine passively cancelled
        - inventory close
        - if <player.has_flag[alms_cooldown]> = false:
          - flag <player> alms_cooldown duration:1d
          - give item_taler_gold quantity:1 to:<player.inventory>
          - give item_taler_silver quantity:32 to:<player.inventory>
          - give item_apple_white quantity:2 to:<player.inventory>
          - give item_bun quantity:2 to:<player.inventory>
          - give item_salt_meat quantity:6 to:<player.inventory>
          - give item_spawn_lager quantity:2 to:<player.inventory>
          - define topic <util.random.int[0].to[3]>
          - if <[topic]> = 0:
            - narrate targets:<player> "<&e>[Проповедник Гарет] <&6>- Дающий нищему не обеднеет, как церковь помогает тебе, так и ты помогай тем кто будет просить у тебя. Вот, возьми скромное подаяние."
          - if <[topic]> = 1:
            - narrate targets:<player> "<&e>[Проповедник Гарет] <&6>- Всякому, просящему у тебя, давай, и от взявшего твое не требуй назад. Возьми скромное подаяние, и используй его разумно."
          - if <[topic]> = 2:
            - narrate targets:<player> "<&e>[Проповедник Гарет] <&6>- Милостевый - помилован будет! Возьми немного золота и еды, и не оскудеет твоя рука, когда придёт время подаяния её."
          - if <[topic]> = 3:
            - narrate targets:<player> "<&e>[Проповедник Гарет] <&6>- Кто затыкает ухо свое от вопля бедного, тот и сам будет вопить, - и не будет услышан. Возьми это скромное подаяние, но будь готов разделить его с тем, кто беднее тебя."
        - else:
          - actionbar targets:<player> "<&e>Вы уже просили подаяние сегодня. <player.flag[alms_cooldown].expiration.formatted>"
          - narrate targets:<player> "<&e>[Проповедник Гарет] <&6>- Ты уже просил подаяние у церкви сегодня. Прости, но у нас много нуждающихся, чтобы денег и еды хватило на всех, мы не подаём одному и тому же человеку чаще раза в день."
# Диалог Трактирщик Чарли.
spawn_dialogue_charli:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Трактирщик Чарли"
  size: 9
  slots:
  - [d_spawn_dialogue_charli_drink] [d_spawn_dialogue_charli_food] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_dialogue_charli_food:
  type: item
  debug: false
  material: cooked_mutton
  display name: "<&6><&l>Купить еду"
  lore:
  - "<&6>Я хочу перекусить."
  mechanisms:
    flag:
	   GUI:
d_spawn_dialogue_charli_drink:
  type: item
  debug: false
  material: potion
  display name: "<&6><&l>Купить выпивку"
  lore:
  - "<&6>Налей чего-нибудь."
  mechanisms:
    color: 140,12,0
    potion_effects: WATER,false,false
    hides: ITEM_DATA
	flag:
	  GUI:
d_spawn_dialogue_charli_food_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_dialogue_charli_food in spawn_dialogue_charli:
        - determine passively cancelled
        - run trade_spawn_port_tavern_food
d_spawn_dialogue_charli_drink_click:
  type: world
  debug: false
  events:
      on player clicks d_spawn_dialogue_charli_drink in spawn_dialogue_charli:
        - determine passively cancelled
        - run trade_spawn_port_tavern_drink
# Диалог Травница Флавия.
spawn_dialogue_flavia:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Травница Флавия"
  size: 9
  slots:
  - [trade] [empty] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
d_spawn_dialogue_flavia_trade_click:
  type: world
  debug: false
  events:
      on player clicks trade in spawn_dialogue_flavia:
        - determine passively cancelled
        - run trade_spawn_flavia
