# Меняла.
trade_gold_exchange:
    debug: false
    type: task
    script:
      - define silver_to_gold trade[inputs=item_taler_silver[quantity=64]|item_taler_silver[quantity=13];result=item_taler_gold[quantity=1];max_uses=99999;has_xp=false]
      - define gold_to_talant trade[inputs=item_taler_gold[quantity=64]|item_taler_silver[quantity=39];result=item_taler_talant[quantity=1];max_uses=99999;has_xp=false]
      - define talant_to_idol trade[inputs=item_taler_talant[quantity=64]|item_taler_gold[quantity=2];result=item_taler_idol[quantity=1];max_uses=99999;has_xp=false]
      - define gold_to_silver trade[inputs=item_taler_gold[quantity=1];result=item_taler_silver[quantity=64];max_uses=99999;has_xp=false]
      - define talant_to_gold trade[inputs=item_taler_talant[quantity=1];result=item_taler_gold[quantity=64];max_uses=99999;has_xp=false]
      - define idol_to_talant trade[inputs=item_taler_idol[quantity=1];result=item_taler_talant[quantity=64];max_uses=99999;has_xp=false]
      - opentrades <[silver_to_gold]>|<[gold_to_talant]>|<[talant_to_idol]>|<[gold_to_silver]>|<[talant_to_gold]>|<[idol_to_talant]> "title:Обмен талеров"
# Зачарователь.
trade_spawn_inchanter:
    debug: false
    type: task
    script:
      - define wand trade[inputs=item_taler_gold[quantity=1];result=item_offhand_wand_simple[quantity=1];max_uses=99999;has_xp=false]
      - define book trade[inputs=item_taler_gold[quantity=3];result=item_offhand_enchanted_book[quantity=1];max_uses=99999;has_xp=false]
      - define shards trade[inputs=item_taler_gold[quantity=10];result=item_offhand_oblerite_shards[quantity=1];max_uses=99999;has_xp=false]
      - define bone trade[inputs=item_taler_gold[quantity=10];result=item_offhand_cursed_bone[quantity=1];max_uses=99999;has_xp=false]
      - define shell trade[inputs=item_taler_talant[quantity=1];result=item_offhand_ammonite_shell[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[wand]>|<[book]>|<[shards]>|<[bone]>|<[shell]> "title:Зачарователь Беата"
# Скупщик.
trade_buyer_spawn_high:
    debug: false
    type: task
    script:
      - define quartz trade[inputs=quartz[quantity=64];result=item_taler_silver[quantity=60];max_uses=99999;has_xp=false]
      - define diamond trade[inputs=diamond[quantity=1];result=item_taler_gold[quantity=1]|item_taler_silver[quantity=30];max_uses=99999;has_xp=false]
      - define iron_ingot trade[inputs=iron_ingot[quantity=32];result=item_taler_gold[quantity=1];max_uses=99999;has_xp=false]
      - define lazuli trade[inputs=lapis_lazuli[quantity=32];result=item_taler_gold[quantity=1];max_uses=99999;has_xp=false]
      - define redstone trade[inputs=redstone[quantity=64];result=item_taler_silver[quantity=30];max_uses=99999;has_xp=false]
      - define coal trade[inputs=coal[quantity=64];result=item_taler_silver[quantity=21];max_uses=99999;has_xp=false]
      - define charcoal trade[inputs=charcoal[quantity=64];result=item_taler_silver[quantity=23];max_uses=99999;has_xp=false]
      - opentrades <[quartz]>|<[diamond]>|<[iron_ingot]>|<[lazuli]>|<[redstone]>|<[coal]>|<[charcoal]> "title:Покупка дорогих ресурсов"
trade_buyer_spawn_low:
    debug: false
    type: task
    script:
      - define cobble trade[inputs=cobblestone[quantity=64];result=item_taler_silver[quantity=10];max_uses=99999;has_xp=false]
      - define dirt trade[inputs=dirt[quantity=64];result=item_taler_silver[quantity=5];max_uses=99999;has_xp=false]
      - define andesite trade[inputs=andesite[quantity=64];result=item_taler_silver[quantity=20];max_uses=99999;has_xp=false]
      - define diorite trade[inputs=diorite[quantity=64];result=item_taler_silver[quantity=20];max_uses=99999;has_xp=false]
      - define granite trade[inputs=granite[quantity=64];result=item_taler_silver[quantity=20];max_uses=99999;has_xp=false]
      - define obsidian trade[inputs=obsidian[quantity=1];result=item_taler_silver[quantity=5];max_uses=99999;has_xp=false]
      - opentrades <[cobble]>|<[dirt]>|<[andesite]>|<[diorite]>|<[granite]>|<[obsidian]> "title:Покупка дешёвых ресурсов"
# Скупщик-меняла
trade_buyer_gold_expange:
    debug: false
    type: task
    script:
      - define silver_to_gold trade[inputs=item_taler_silver[quantity=64]|item_taler_silver[quantity=13];result=item_taler_gold[quantity=1];max_uses=99999;has_xp=false]
      - define gold_to_silver trade[inputs=item_taler_gold[quantity=1];result=item_taler_silver[quantity=64];max_uses=99999;has_xp=false]
      - define gold trade[inputs=gold_ingot[quantity=1];result=item_taler_silver[quantity=6];max_uses=99999;has_xp=false]
	  - define copper trade[inputs=copper_ingot[quantity=1];result=item_taler_silver[quantity=2];max_uses=99999;has_xp=false]
      - opentrades <[silver_to_gold]>|<[gold_to_silver]>|<[gold]>|<[copper]> "title:Обмен талеров и скупщик"
# Каменщик.
trade_spawn_mason_high:
    debug: false
    type: task
    script:
      - define quartz trade[inputs=item_taler_gold[quantity=2];result=quartz_block[quantity=64];max_uses=99999;has_xp=false]
      - define nether_red trade[inputs=item_taler_gold[quantity=1];result=red_nether_bricks[quantity=64];max_uses=99999;has_xp=false]
      - define nether trade[inputs=item_taler_gold[quantity=1];result=nether_bricks[quantity=64];max_uses=99999;has_xp=false]
      - define end trade[inputs=item_taler_gold[quantity=2];result=end_stone_bricks[quantity=64];max_uses=99999;has_xp=false]
      - define basalt trade[inputs=item_taler_gold[quantity=1];result=basalt[quantity=64];max_uses=99999;has_xp=false]
      - define black trade[inputs=item_taler_gold[quantity=1];result=blackstone[quantity=64];max_uses=99999;has_xp=false]
      - define black_gold trade[inputs=item_taler_gold[quantity=10];result=gilded_blackstone[quantity=10];max_uses=99999;has_xp=false]
      - define purpur trade[inputs=item_taler_gold[quantity=4];result=purpur_block[quantity=64];max_uses=99999;has_xp=false]
      - define pris_dark trade[inputs=item_taler_gold[quantity=4];result=dark_prismarine[quantity=64];max_uses=99999;has_xp=false]
      - define pris_bricks trade[inputs=item_taler_gold[quantity=4];result=prismarine_bricks[quantity=64];max_uses=99999;has_xp=false]
      - define pris trade[inputs=item_taler_gold[quantity=4];result=prismarine[quantity=64];max_uses=99999;has_xp=false]
      - opentrades <[quartz]>|<[nether]>|<[nether_red]>|<[end]>|<[basalt]>|<[black]>|<[black_gold]>|<[purpur]>|<[pris_dark]>|<[pris_bricks]>|<[pris]> "title:Дорогие строительные блоки"
trade_spawn_mason_low:
    debug: false
    type: task
    script:
      - define cobble trade[inputs=item_taler_silver[quantity=20];result=cobblestone[quantity=64];max_uses=99999;has_xp=false]
      - define stone trade[inputs=item_taler_silver[quantity=26];result=stone[quantity=64];max_uses=99999;has_xp=false]
      - define cobble_deepslate trade[inputs=item_taler_silver[quantity=32];result=cobbled_deepslate[quantity=64];max_uses=99999;has_xp=false]
      - define deepslate trade[inputs=item_taler_silver[quantity=40];result=deepslate[quantity=64];max_uses=99999;has_xp=false]
      - define andesite trade[inputs=item_taler_silver[quantity=32];result=andesite[quantity=64];max_uses=99999;has_xp=false]
      - define diorite trade[inputs=item_taler_silver[quantity=32];result=diorite[quantity=64];max_uses=99999;has_xp=false]
      - define granite trade[inputs=item_taler_silver[quantity=32];result=granite[quantity=64];max_uses=99999;has_xp=false]
      - define bricks trade[inputs=item_taler_silver[quantity=28];result=bricks[quantity=64];max_uses=99999;has_xp=false]
      - define sandst trade[inputs=item_taler_silver[quantity=30];result=sandstone[quantity=64];max_uses=99999;has_xp=false]
      - define sandst_red trade[inputs=item_taler_silver[quantity=32];result=red_sandstone[quantity=64];max_uses=99999;has_xp=false]
      - opentrades <[cobble]>|<[stone]>|<[cobble_deepslate]>|<[deepslate]>|<[andesite]>|<[diorite]>|<[granite]>|<[bricks]>|<[sandst]>|<[sandst_red]> "title:Дешёвые строительные блоки"
# Начертатель.
trade_spawn_scribe:
    debug: false
    type: task
    script:
      - define fly trade[inputs=item_taler_gold[quantity=10];result=item_scroll_fly[quantity=1];max_uses=99999;has_xp=false]
      - define back trade[inputs=item_taler_gold[quantity=4];result=item_scroll_back[quantity=1];max_uses=99999;has_xp=false]
      - define market trade[inputs=item_taler_gold[quantity=2];result=item_scroll_market[quantity=1];max_uses=99999;has_xp=false]
      - define heal_01 trade[inputs=item_taler_silver[quantity=32];result=item_scroll_heal_01[quantity=1];max_uses=99999;has_xp=false]
      - define heal_02 trade[inputs=item_taler_gold[quantity=1];result=item_scroll_heal_02[quantity=1];max_uses=99999;has_xp=false]
      - define shield_01 trade[inputs=item_taler_silver[quantity=32];result=item_scroll_shield_01[quantity=1];max_uses=99999;has_xp=false]
      - define shield_02 trade[inputs=item_taler_gold[quantity=1];result=item_scroll_shield_02[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[fly]>|<[back]>|<[market]>|<[heal_01]>|<[heal_02]>|<[shield_01]>|<[shield_02]> "title:Начертатель"
# Алхимик.
trade_spawn_alchemist_low:
    debug: false
    type: task
    script:
      - define damage trade[inputs=item_taler_silver[quantity=4];result=item_potion_damage_01[quantity=1];max_uses=99999;has_xp=false]
      - define haste trade[inputs=item_taler_silver[quantity=4];result=item_potion_haste_01[quantity=1];max_uses=99999;has_xp=false]
      - define res trade[inputs=item_taler_silver[quantity=4];result=item_potion_res_01[quantity=1];max_uses=99999;has_xp=false]
      - define health trade[inputs=item_taler_silver[quantity=4];result=item_potion_health_01[quantity=1];max_uses=99999;has_xp=false]
      - define shield trade[inputs=item_taler_silver[quantity=4];result=item_potion_shield_01[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[damage]>|<[haste]>|<[res]>|<[health]>|<[shield]> "title:Дешёвые зелья"
trade_spawn_alchemist_high:
    debug: false
    type: task
    script:
      - define damage trade[inputs=item_taler_silver[quantity=16];result=item_potion_damage_02[quantity=1];max_uses=99999;has_xp=false]
      - define haste trade[inputs=item_taler_silver[quantity=16];result=item_potion_haste_02[quantity=1];max_uses=99999;has_xp=false]
      - define res trade[inputs=item_taler_silver[quantity=16];result=item_potion_res_02[quantity=1];max_uses=99999;has_xp=false]
      - define health trade[inputs=item_taler_silver[quantity=16];result=item_potion_health_02[quantity=1];max_uses=99999;has_xp=false]
      - define shield trade[inputs=item_taler_silver[quantity=16];result=item_potion_shield_02[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[damage]>|<[haste]>|<[res]>|<[health]>|<[shield]> "title:Хорошие зелья"
# Бронник.
trade_armor_t1:
    debug: false
    type: task
    script:
      - define helm trade[inputs=leather[quantity=5]|item_taler_gold[quantity=2];result=item_leather_helm[quantity=1];max_uses=99999;has_xp=false]
      - define chest trade[inputs=leather[quantity=8]|item_taler_gold[quantity=4];result=item_leather_chest[quantity=1];max_uses=99999;has_xp=false]
      - define legs trade[inputs=leather[quantity=7]|item_taler_gold[quantity=3];result=item_leather_leggings[quantity=1];max_uses=99999;has_xp=false]
      - define boots trade[inputs=leather[quantity=4]|item_taler_gold[quantity=1];result=item_leather_boots[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[helm]>|<[chest]>|<[legs]>|<[boots]> "title:Кожаная броня"
trade_armor_t2:
    debug: false
    type: task
    script:
      - define helm trade[inputs=item_leather_helm[quantity=1]|item_taler_gold[quantity=15];result=item_chainmail_helm[quantity=1];max_uses=99999;has_xp=false]
      - define chest trade[inputs=item_leather_chest[quantity=1]|item_taler_gold[quantity=35];result=item_chainmail_chest[quantity=1];max_uses=99999;has_xp=false]
      - define legs trade[inputs=item_leather_leggings[quantity=1]|item_taler_gold[quantity=25];result=item_chainmail_leggings[quantity=1];max_uses=99999;has_xp=false]
      - define boots trade[inputs=item_leather_boots[quantity=1]|item_taler_gold[quantity=10];result=item_chainmail_boots[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[helm]>|<[chest]>|<[legs]>|<[boots]> "title:Кольчужная броня"
trade_armor_t3:
    debug: false
    type: task
    script:
      - define helm trade[inputs=item_chainmail_helm[quantity=1]|item_taler_gold[quantity=30];result=item_rusty_helm[quantity=1];max_uses=99999;has_xp=false]
      - define chest trade[inputs=item_chainmail_chest[quantity=1]|item_taler_gold[quantity=45];result=item_rusty_chest[quantity=1];max_uses=99999;has_xp=false]
      - define legs trade[inputs=item_chainmail_leggings[quantity=1]|item_taler_gold[quantity=35];result=item_rusty_leggings[quantity=1];max_uses=99999;has_xp=false]
      - define boots trade[inputs=item_chainmail_boots[quantity=1]|item_taler_gold[quantity=25];result=item_rusty_boots[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[helm]>|<[chest]>|<[legs]>|<[boots]> "title:Ржавая железная броня"
# Трактир Гремящие Врата.
trade_spawn_tavern_drink:
    debug: false
    type: task
    script:
      - define mashing trade[inputs=item_taler_silver[quantity=2];result=item_spawn_mashing[quantity=1];max_uses=99999;has_xp=false]
      - define beer trade[inputs=item_taler_silver[quantity=4];result=item_spawn_rootbeer[quantity=1];max_uses=99999;has_xp=false]
      - define moonshine trade[inputs=item_taler_silver[quantity=4];result=item_spawn_moonshine[quantity=1];max_uses=99999;has_xp=false]
      - define rum trade[inputs=item_taler_silver[quantity=32];result=item_spawn_rum[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[mashing]>|<[beer]>|<[moonshine]>|<[rum]> "title:Гремящие Врата - выпивка"
trade_spawn_tavern_food:
    debug: false
    type: task
    script:
      - define bun trade[inputs=item_taler_silver[quantity=1];result=item_bun[quantity=1];max_uses=99999;has_xp=false]
      - define ribs trade[inputs=item_taler_silver[quantity=2];result=item_ribs_with_pepper[quantity=1];max_uses=99999;has_xp=false]
      - define borscht trade[inputs=item_taler_silver[quantity=6];result=item_borscht[quantity=1];max_uses=99999;has_xp=false]
      - define rabbit trade[inputs=item_taler_silver[quantity=32];result=item_stew_rabbit[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[bun]>|<[ribs]>|<[borscht]>|<[rabbit]> "title:Гремящие Врата - закуски"
# Трактир Попутный Ветер.
trade_spawn_port_tavern_drink:
    debug: false
    type: task
    script:
      - define grog trade[inputs=item_taler_silver[quantity=2];result=item_spawn_grog[quantity=1];max_uses=99999;has_xp=false]
      - define porter trade[inputs=item_taler_silver[quantity=4];result=item_spawn_porter[quantity=1];max_uses=99999;has_xp=false]
      - define wine trade[inputs=item_taler_silver[quantity=6];result=item_spawn_wine[quantity=1];max_uses=99999;has_xp=false]
      - define rum trade[inputs=item_taler_silver[quantity=32];result=item_spawn_rum[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[grog]>|<[porter]>|<[wine]>|<[rum]> "title:Попутный Ветер - выпивка"
trade_spawn_port_tavern_food:
    debug: false
    type: task
    script:
      - define bun trade[inputs=item_taler_silver[quantity=1];result=item_bun[quantity=1];max_uses=99999;has_xp=false]
      - define oyster trade[inputs=item_taler_silver[quantity=4];result=item_oysters[quantity=1];max_uses=99999;has_xp=false]
      - define kebab trade[inputs=item_taler_silver[quantity=2];result=item_shark_kebab[quantity=1];max_uses=99999;has_xp=false]
      - define pottage trade[inputs=item_taler_silver[quantity=32];result=item_fish_pottage[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[bun]>|<[kebab]>|<[oyster]>|<[pottage]> "title:Попутный Ветер - закуски"
# Интендант.
trade_mage_tools:
    debug: false
    type: task
    script:
      - define scroll trade[inputs=item_taler_silver[quantity=8];result=item_scroll_empty[quantity=1];max_uses=99999;has_xp=false]
      - define t1 trade[inputs=item_taler_gold[quantity=1];result=item_bottle_t1[quantity=1];max_uses=99999;has_xp=false]
      - define t2 trade[inputs=item_taler_gold[quantity=2];result=item_bottle_t2[quantity=1];max_uses=99999;has_xp=false]
      - define t3 trade[inputs=item_taler_gold[quantity=4];result=item_bottle_t3[quantity=1];max_uses=99999;has_xp=false]
      - define t4 trade[inputs=item_taler_gold[quantity=12];result=item_bottle_t4[quantity=1];max_uses=99999;has_xp=false]
      - define t5 trade[inputs=item_taler_gold[quantity=24];result=item_bottle_t5[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[scroll]>|<[t1]>|<[t2]>|<[t3]>|<[t4]>|<[t5]> "title:Магические принадлежности"
# Оружие.
trade_spawn_blade:
    debug: false
    type: task
    script:
      - define wood trade[inputs=item_taler_silver[quantity=30];result=item_sword_wood[quantity=1];max_uses=99999;has_xp=false]
      - define stone trade[inputs=item_taler_silver[quantity=50];result=item_sword_stone[quantity=1];max_uses=99999;has_xp=false]
      - define t1_blade trade[inputs=item_taler_gold[quantity=7];result=item_sword_adventurer_01[quantity=1];max_uses=99999;has_xp=false]
      - define t2_blade trade[inputs=item_taler_gold[quantity=25]|item_sword_adventurer_01[quantity=1];result=item_sword_adventurer_02[quantity=1];max_uses=99999;has_xp=false]
      - define t3_blade trade[inputs=item_taler_gold[quantity=50]|item_sword_adventurer_02[quantity=1];result=item_sword_adventurer_03[quantity=1];max_uses=99999;has_xp=false]
	  - define t4_blade trade[inputs=item_taler_gold[quantity=62]|item_sword_adventurer_03[quantity=1];result=item_sword_adventurer_04[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[wood]>|<[stone]>|<[t1_blade]>|<[t2_blade]>|<[t3_blade]>|<[t4_blade]> "title:Клинки"
trade_spawn_hammer:
    debug: false
    type: task
    script:
      - define t1_hammer trade[inputs=item_taler_gold[quantity=14];result=item_iron_hammer_01[quantity=1];max_uses=99999;has_xp=false]
      - define t2_hammer trade[inputs=item_taler_gold[quantity=30]|item_iron_hammer_01[quantity=1];result=item_iron_hammer_02[quantity=1];max_uses=99999;has_xp=false]
      - define t3_hammer trade[inputs=item_taler_gold[quantity=48]|item_iron_hammer_02[quantity=1];result=item_iron_hammer_03[quantity=1];max_uses=99999;has_xp=false]
	  - define t4_hammer trade[inputs=item_taler_gold[quantity=64]|item_iron_hammer_03[quantity=1];result=item_iron_hammer_04[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[t1_hammer]>|<[t2_hammer]>|<[t3_hammer]>|<[t4_hammer]> "title:Молоты"
trade_spawn_axe:
    debug: false
    type: task
    script:
      - define t1_axe trade[inputs=item_taler_gold[quantity=14];result=item_iron_axe_01[quantity=1];max_uses=99999;has_xp=false]
      - define t2_axe trade[inputs=item_taler_gold[quantity=30]|item_iron_axe_01[quantity=1];result=item_iron_axe_02[quantity=1];max_uses=99999;has_xp=false]
      - define t3_axe trade[inputs=item_taler_gold[quantity=48]|item_iron_axe_02[quantity=1];result=item_iron_axe_03[quantity=1];max_uses=99999;has_xp=false]
	  - define t4_axe trade[inputs=item_taler_gold[quantity=64]|item_iron_axe_03[quantity=1];result=item_iron_axe_04[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[t1_axe]>|<[t2_axe]>|<[t3_axe]>|<[t4_axe]> "title:Топоры"
# Фермер Густав.
trade_farmer_gustav:
    debug: false
    type: task
    script:
      - define apple trade[inputs=item_taler_silver[quantity=32];result=item_apple_white[quantity=16];max_uses=99999;has_xp=false]
      - define cabbage trade[inputs=item_taler_silver[quantity=16];result=item_cabbage[quantity=16];max_uses=99999;has_xp=false]
      - define garlic trade[inputs=item_taler_silver[quantity=16];result=item_garlic[quantity=16];max_uses=99999;has_xp=false]
      - define currant trade[inputs=item_taler_silver[quantity=8];result=item_currant[quantity=16];max_uses=99999;has_xp=false]
	  - define petrushka trade[inputs=item_taler_silver[quantity=20];result=item_petrushka[quantity=8];max_uses=99999;has_xp=false]
      - opentrades <[apple]>|<[currant]>|<[cabbage]>|<[garlic]>|<[petrushka]> "title:Фермер Густав"
# Книги начертателя.
trade_scribe_books:
    debug: false
    type: task
    script:
      - define novice trade[inputs=item_taler_silver[quantity=4];result=item_book_novice[quantity=1];max_uses=99999;has_xp=false]
      - define help trade[inputs=item_taler_silver[quantity=4];result=item_book_help[quantity=1];max_uses=99999;has_xp=false]
      - define undead trade[inputs=item_taler_silver[quantity=8];result=item_book_undead[quantity=1];max_uses=99999;has_xp=false]
      - define beasts trade[inputs=item_taler_silver[quantity=8];result=item_book_beasts[quantity=1];max_uses=99999;has_xp=false]
      - define goblins trade[inputs=item_taler_silver[quantity=8];result=item_book_goblins[quantity=1];max_uses=99999;has_xp=false]
      - opentrades <[novice]>|<[help]>|<[beasts]>|<[undead]>|<[goblins]> "title:Книги"
# Травница.
trade_spawn_flavia:
    debug: false
    type: task
    script:
      - define grass trade[inputs=dirt[quantity=8]|wheat_seeds[quantity=8];result=grass_block[quantity=8];max_uses=99999;has_xp=false]
      - define mic_b trade[inputs=dirt[quantity=8]|brown_mushroom[quantity=8];result=mycelium[quantity=8];max_uses=99999;has_xp=false]
      - define mic_r trade[inputs=dirt[quantity=8]|red_mushroom[quantity=8];result=mycelium[quantity=8];max_uses=99999;has_xp=false]
      - define podzol trade[inputs=dirt[quantity=8]|bone_meal[quantity=8];result=podzol[quantity=8];max_uses=99999;has_xp=false]
      - define root trade[inputs=dirt[quantity=8]|dead_bush[quantity=8];result=rooted_dirt[quantity=8];max_uses=99999;has_xp=false]
      - define azal trade[inputs=item_taler_gold[quantity=4];result=azalea[quantity=32];max_uses=99999;has_xp=false]
      - define azal_f trade[inputs=item_taler_gold[quantity=5];result=flowering_azalea[quantity=32];max_uses=99999;has_xp=false]
      - define azal_ll trade[inputs=item_taler_gold[quantity=2];result=azalea_leaves[quantity=32];max_uses=99999;has_xp=false]
      - define azal_l trade[inputs=item_taler_gold[quantity=3];result=flowering_azalea_leaves[quantity=32];max_uses=99999;has_xp=false]
      - define moss_c trade[inputs=item_taler_gold[quantity=4];result=moss_carpet[quantity=32];max_uses=99999;has_xp=false]
      - define moss trade[inputs=item_taler_gold[quantity=4];result=moss_block[quantity=32];max_uses=99999;has_xp=false]
      - define dr_b trade[inputs=item_taler_gold[quantity=10];result=big_dripleaf[quantity=32];max_uses=99999;has_xp=false]
      - define dr_s trade[inputs=item_taler_gold[quantity=10];result=small_dripleaf[quantity=32];max_uses=99999;has_xp=false]
      - define spo trade[inputs=item_taler_gold[quantity=1];result=spore_blossom[quantity=1];max_uses=99999;has_xp=false]
      - define root_s trade[inputs=item_taler_gold[quantity=5];result=hanging_roots[quantity=32];max_uses=99999;has_xp=false]
      - opentrades <[grass]>|<[podzol]>|<[root]>|<[mic_b]>|<[mic_r]>|<[azal]>|<[azal_f]>|<[azal_ll]>|<[azal_l]>|<[moss_c]>|<[moss]>|<[dr_b]>|<[dr_s]>|<[spo]>|<[root_s]> "title:Травница Флавия"