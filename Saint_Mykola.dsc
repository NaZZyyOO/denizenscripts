Saint_Mykola:
    type: world
	debug: false
	events:
	    on player right clicks entity:
          - ratelimit <player> 1t
          - if <context.entity.entity_type.is[==].to[player]||false>:
            - if <context.entity.name> == "<&6>Святий Миколай":
              - inventory open d:dialogue_s_Mykolas
		on player clicks s_Mykola_trade_low in dialogue_s_Mykolas:
		  - determine passively cancelled
          - run trade_s_Mykola_low
		on player clicks s_Mykola_trade_higt_armor in dialogue_s_Mykolas:
		  - determine passively cancelled
		  - run trade_s_Mykola_high_armor
		on player clicks s_Mykola_trade_higt_weapon in dialogue_s_Mykolas:
		  - determine passively cancelled
		  - run trade_s_Mykola_high_weapon
		on player clicks s_Mykola_trade_ticket in dialogue_s_Mykolas:
		  - determine passively cancelled
		  - run trade_s_Mykola_ticket
dialogue_s_Mykolas:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Святий Миколай"
  size: 9
  slots:
  - [s_Mykola_trade_low] [s_Mykola_trade_higt_weapon] [s_Mykola_trade_higt_armor] [s_Mykola_trade_ticket] [empty] [empty] [empty] [empty] [empty]
s_Mykola_trade_low:
  type: item
  debug: false
  material: chest
  display name: "<&6><&l>Покупка предметов за талеры"
  lore:
  - "<&6>Я хочу купить у тебя что-то за талеры."
s_Mykola_trade_higt_armor:
  type: item
  debug: false
  material: chest
  display name: "<&6><&l>Покупка брони за билеты"
  lore:
  - "<&6>Я хочу купить у тебя броню за билеты."
s_Mykola_trade_higt_weapon:
  type: item
  debug: false
  material: chest
  display name: "<&6><&l>Покупка оружия за билеты"
  lore:
  - "<&6>Я хочу купить у тебя оружие или магические предметы за билеты."
s_Mykola_trade_ticket:
  type: item
  debug: false
  material: chest
  display name: "<&6><&l>Обменник билетов"
  lore:
  - "<&6>Я хочу обменять у тебя билеты."
trade_s_Mykola_low:
    debug: false
    type: task
    script:
      - define mandarin trade[inputs=item_taler_silver[quantity=32];result=item_mandarin[quantity=32];max_uses=99999;has_xp=false]
      - define glintvein trade[inputs=item_taler_silver[quantity=32];result=item_glintvein[quantity=1];max_uses=99999;has_xp=false]
	  - define klopushka trade[inputs=item_taler_gold[quantity=10];result=item_klopushka[quantity=1];max_uses=99999;has_xp=false]
      - define star trade[inputs=item_taler_gold[quantity=10];result=item_ny_star[quantity=1];max_uses=99999;has_xp=false]
	  - define bell trade[inputs=item_taler_gold[quantity=10];result=item_xmas_bell[quantity=1];max_uses=99999;has_xp=false]
	  - define gift trade[inputs=item_taler_gold[quantity=30];result=item_chest_gift[quantity=1];max_uses=99999;has_xp=false]
	  - opentrades <[mandarin]>|<[glintvein]>|<[klopushka]>|<[star]>|<[bell]>|<[gift]> "title:Святий Миколай"
trade_s_Mykola_high_armor:
    debug: false
    type: task
    script:
      - define mandarin_helm trade[inputs=item_white_ticket[quantity=10];result=item_mandarin_helm[quantity=1];max_uses=99999;has_xp=false]
      - define mandarin_chest trade[inputs=item_green_ticket[quantity=15];result=item_mandarin_chest[quantity=1];max_uses=99999;has_xp=false]
	  - define mandarin_leggs trade[inputs=item_green_ticket[quantity=8];result=item_mandarin_leggings[quantity=1];max_uses=99999;has_xp=false]
      - define mandarin_boots trade[inputs=item_white_ticket[quantity=5];result=item_mandarin_boots[quantity=1];max_uses=99999;has_xp=false]
	  - define s_mykola_helm trade[inputs=item_green_ticket[quantity=15];result=item_s_mykola_helm[quantity=1];max_uses=99999;has_xp=false]
	  - define s_mykola_chest trade[inputs=item_green_ticket[quantity=20];result=item_s_mykola_chest[quantity=1];max_uses=99999;has_xp=false]
	  - define s_mykola_leggs trade[inputs=item_green_ticket[quantity=20];result=item_s_mykola_leggings[quantity=1];max_uses=99999;has_xp=false]
	  - define s_mykola_boots trade[inputs=item_green_ticket[quantity=15];result=item_s_mykola_boots[quantity=1];max_uses=99999;has_xp=false]
	  - define nord_helm trade[inputs=item_red_ticket[quantity=4];result=item_nord_helm[quantity=1];max_uses=99999;has_xp=false]
	  - define nord_hood trade[inputs=item_red_ticket[quantity=4];result=item_nord_hood[quantity=1];max_uses=99999;has_xp=false]
	  - define nord_chest trade[inputs=item_red_ticket[quantity=6];result=item_nord_chest[quantity=1];max_uses=99999;has_xp=false]
	  - define nord_leggs trade[inputs=item_red_ticket[quantity=5];result=item_nord_leggings[quantity=1];max_uses=99999;has_xp=false]
	  - define nord_boots trade[inputs=item_red_ticket[quantity=3];result=item_nord_boots[quantity=1];max_uses=99999;has_xp=false]
	  - opentrades <[mandarin_helm]>|<[mandarin_chest]>|<[mandarin_leggs]>|<[mandarin_boots]>|<[s_mykola_helm]>|<[s_mykola_chest]>|<[s_mykola_leggs]>|<[s_mykola_boots]>|<[nord_helm]>|<[nord_hood]>|<[chest]>|<[nord_leggs]>|<[nord_boots]> "title:Святий Миколай"
trade_s_Mykola_high_weapon:
    debug: false
    type: task
    script:
	    - define mandarin_dagger trade[inputs=item_green_ticket[quantity=10];result=item_mandarin_sword[quantity=1];max_uses=99999;has_xp=false]
	    - define frostmourne_sword trade[inputs=item_white_ticket[quantity=20];result=item_frostmourne_sword[quantity=1];max_uses=99999;has_xp=false]
	    - define candy_sword_1 trade[inputs=item_white_ticket[quantity=10];result=item_xmas_candy_sword[quantity=1];max_uses=99999;has_xp=false]
		- define candy_sword_2 trade[inputs=item_white_ticket[quantity=10];result=item_xmas_candy_sword_2[quantity=1];max_uses=99999;has_xp=false]
		- define krampus_sword trade[inputs=item_red_ticket[quantity=15];result=item_krampus_sword[quantity=1];max_uses=99999;has_xp=false]
	    - define christmas_sword trade[inputs=item_red_ticket[quantity=10];result=item_christmas_sword[quantity=1];max_uses=99999;has_xp=false]
		- define blizzard_sphere trade[inputs=item_red_ticket[quantity=20];result=item_blizzard_sphere[quantity=1];max_uses=99999;has_xp=false]
		- opentrades <[candy_sword_1]>|<[candy_sword_2]>|<[mandarin_dagger]>|<[frostmourne_sword]>|<[krampus_sword]>|<[christmas_sword]>| "title:Святий Миколай"
trade_s_Mykola_ticket:
    type: task
	debug: false
	script:
	  - define white_green trade[inputs=item_white_ticket[quantity=5];result=item_green_ticket[quantity=1];max_uses=99999;has_xp=false]
	  - define green_red trade[inputs=item_green_ticket[quantity=3];result=item_red_ticket[quantity=1];max_uses=99999;has_xp=false]
	  - define red_green trade[inputs=item_red_ticket[quantity=1];result=item_green_ticket[quantity=3];max_uses=99999;has_xp=false]
	  - define green_white trade[inputs=item_green_ticket[quantity=1];result=item_white_ticket[quantity=5];max_uses=99999;has_xp=false]
	  - opentrades <[white_green]>|<[green_red]>|<[red_green]>|<[green_white]> "title:Святий Миколай"