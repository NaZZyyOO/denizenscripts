wealth_menu_command:
    type: command
    debug: false
    name: menu
    usage: /menu
    description: Calls server menu.
    script:
      - inventory open d:wealth_menu
wealth_menu:
  type: inventory
  debug: false
  inventory: chest
  title: "<&l>Wealth - The Middle Ages"
  size: 9
  slots:
  - [wealth_menu_info] [wealth_menu_fishing_guide] [empty] [empty] [empty] [empty] [empty] [empty] [empty]
wealth_menu_info:
  type: item
  debug: false
  material: book
  display name: "<&4><&l>Полезная информация"
  lore:
  - "<&6>Прочесть небольшой документ о"
  - "<&6>полезных функциях и особенностях"
  - "<&6>сервера."
  flags:
    GUI:
wealth_menu_click:
  type: world
  debug: false
  events:
      on player clicks wealth_menu_info in wealth_menu:
        - determine passively cancelled
        - inventory close
        - run open_book_ui def:wealth_menu_info_text
wealth_menu_info_text:
  type: book
  title: <&6><&l>Полезная информация
  author: <&8>Нет
  signed: true
  text:
  - <&l>Ссылка на предмет<reset> - игрок может создать ссылку на нестандартный предмет прямо в игровом чате. Для этого нужно взять предмет в руку и написать в чат [i], тогда этот набор символов заменится на ссылку с описанием предмета.
  - <&l>Автозакрытие дверей<reset> - все открытые игроком двери сами закрываются через 2 секунды. Если открыть дверь с зажатым Shift, то дверь так и останется открытой. Это не относится к железным дверям.
  - <&l>Обнимашки<reset> - при нажатии шифт + пкм, когда вы смотрите на ноги второго игрока вы обнимете его. Включить/выключить обнимашки можно так: /hug enabled/disabled. Если игроки противоположных полов то пойдет эффект сердец.
# Гайд на рыбалку.
wealth_menu_fishing_guide:
  type: item
  debug: false
  material: book
  display name: "<&9><&l>Гайд о рыбалке"
  lore:
  - "<&6>Гайд о рыбалке: что, где и при"
  - "<&6>каких условиях можно выловить."
  - "<&6>Главное условие на вылов чего-либо -"
  - "<&6>рыбачить в открытом водоеме водного биома."
  flags:
    GUI:
fishing_guide_menu:
    debug: false
    type: task
    script:
        - define name "<&l>Биомы рыболовли"
		- define biome_list <list[River|Frozen_river|Ocean|Cold_ocean|Deep_frozen_ocean|Frozen_ocean|Deep_ocean|Deep_cold_ocean|Deep_lukewarm_ocean|deep_warm_ocean|Lukewarm_Ocean|Warm_ocean|Badlands|Swamp]>
        - inventory open d:generic[size=54;title=<[name]>]
        - define biomes_all <[biome_list]>
        - foreach <[biomes_all]>:
          - define b_name <[value].to_titlecase.replace_text[<element[_]>].with[<&sp>]>
          - define b_guide_01 "<&6>Список вылова предметов в биоме <&l><[b_name]><reset><&7>."
		  - define b_guide_02 "<&6>Список мобов в список вылова не включён."
          - define b_info <list[<[b_guide_01]>|<&sp>|<[b_guide_02]>]>
          # Кнопка меню.
          - give end_crystal[display=<reset><&6><&l><[b_name]>;lore=<[b_info]>;custom_model_data=1;flag=biome:<[value]>] quantity:1 to:<player.open_inventory>
		- inject empty_fill
fishing_guide_menu_click:
    type: task
	debug: false
	definitions: item
    script:
	- define b_name <[item].flag[biome]>
	- define keys <script[<[b_name]>].list_keys.alphabetical.exclude[type]>
	- inventory open d:generic[size=54;title=<&l><[b_name]>]
	- foreach <[keys]>:
	  - give <[value]> quantity:1 to:<player.open_inventory>
	- foreach <player.open_inventory.map_slots.keys>:
	  - inventory flag slot:<[value]> d:<player.open_inventory> fish_guide
	- inject empty
fishing_guide_menu_clicks:
    type: world
	debug: false
	events:
	    on player clicks wealth_menu_fishing_guide in wealth_menu:
		  - determine passively cancelled
		  - run fishing_guide_menu
		on player clicks in inventory:
		  - if <context.item.has_flag[biome]> = true:
			- determine passively cancelled
		    - run fishing_guide_menu_click def:<context.item>
		  - if <context.item.has_flag[fish_guide]> = true:
		    - determine passively cancelled