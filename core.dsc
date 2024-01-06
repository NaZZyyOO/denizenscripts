control_panel:
    type: command
    debug: false
    name: c
    usage: /c
    description: Calls server control panel.
    script:
      - if <player.has_permission[server.admin]> = true:
        - inventory open d:control_panel_menu
fly_kick_check:
  type: world
  debug: false
  events:
      on player kicked for flying:
         - if <player.has_flag[scroll_fly]> = true || <player.has_flag[forbidden_fruit_fly]> = true:
           - determine passively cancelled
admin_check:
    debug: false
    type: task
    script:
      - define admin_list <list[Korvinius|Madd|NaZZyyOO]>
      - define name <player.name>
      - if <[admin_list].contains[<[name]>]> = false:
        - stop
chest_check:
    debug: false
    type: task
    script:
      - if <player.item_in_hand.material.name> = chest || <player.item_in_hand.material.name> = trapped_chest:
        - stop
open_book_ui:
    debug: false
    type: task
    definitions: book
    script:
      - define original_item <player.inventory.slot[<player.held_item_slot>]>
      - inventory set origin:<[book]> slot:<player.held_item_slot>
      - adjust <player> open_book
      - inventory set origin:<[original_item]> slot:<player.held_item_slot>
take_item:
    debug: false
    type: task
    definitions: item|player
    script:
      - if <[player].gamemode> != creative && <[player].gamemode> != spectator:
        - take item:<[item]> quantity:1 from:<[player].inventory>
control_panel_reload_click:
  type: world
  debug: false
  events:
      on player clicks control_panel_reload in control_panel_menu:
        - determine passively cancelled
        - inventory close
        - wait 0.5
        - reload
        - narrate "<&8>[Denizen] <&7>- Denizen перезагружен."
control_panel_spawn_protect_click:
  type: world
  debug: false
  events:
      on player clicks control_panel_spawn_protect in control_panel_menu:
        - determine passively cancelled
        - inventory close
        - if <server.has_flag[spawn_protect]> = false:
          - flag server spawn_protect
          - narrate "<&8>[Wealth] <&7>- Защита спавна включена."
        - else:
          - flag server spawn_protect:!
          - narrate "<&8>[Wealth] <&7>- Защита спавна отключена."
control_panel_stop_click:
  type: world
  debug: false
  events:
      on player clicks control_panel_stop in control_panel_menu:
        - determine passively cancelled
        - inventory close
        - run stop_sequence
# Пустой слот для GUI
empty:
  type: item
  debug: false
  material: light_gray_stained_glass_pane
  display name: "<&7>Empty"
  mechanics:
    raw_nbt: <map[ItemLingo=string:empty]>
  flags:
    GUI: true
empty_black:
  type: item
  debug: false
  material: black_stained_glass_pane
  display name: "<&7>Empty"
  mechanics:
    raw_nbt: <map[ItemLingo=string:empty_black]>
  flags:
    GUI: true

empty_click:
  type: world
  debug: false
  events:
      on player clicks empty in inventory:
        - determine passively cancelled
	  on player clicks empty_black in inventory:
	    - determine passively cancelled
empty_fill:
    debug: false
    type: task
    script:
      - define empty_slots <player.open_inventory.empty_slots>
      - define first_empty_slot <player.open_inventory.size.add[1].sub[<[empty_slots]>]>
      - repeat <[empty_slots]>:
        - give empty quantity:1 to:<player.open_inventory> slot:<[first_empty_slot]>
        - define first_empty_slot <[first_empty_slot].add[1]>
empty_black_fill:
    debug: false
    type: task
    script:
      - define empty_slots <player.open_inventory.empty_slots>
      - define first_empty_slot <player.open_inventory.size.add[1].sub[<[empty_slots]>]>
      - repeat <[empty_slots]>:
        - give empty_black quantity:1 to:<player.open_inventory> slot:<[first_empty_slot]>
        - define first_empty_slot <[first_empty_slot].add[1]>
craft_cancel:
    type: world
    debug: false
    events:
        on player clicks in inventory:
          - if <context.item.material.name> = chest || <context.item.material.name> = trapped_chest:
            - stop
          - define item <context.item.script.name||null>
          - if <[item]> != null:
            - define type <player.open_inventory.inventory_type||null>
            - if <[type]> == GRINDSTONE:
              - inventory close
              - actionbar "<&6><&l>С этим предметом невозможно работать на точильном камне."
            - if <[type]> == SMITHING:
              - inventory close
              - actionbar "<&6><&l>С этим предметом невозможно работать на столе кузнеца."
            - if <[type]> == LOOM:
              - inventory close
              - actionbar "<&6><&l>С этим предметом невозможно работать на ткацком станке."
            - if <[type]> == ENCHANTING:
              - inventory close
              - actionbar "<&6><&l>С этим предметом невозможно работать на чародейском столе."
            - if <[type]> == SMOKER:
              - inventory close
              - actionbar "<&6><&l>Этот предмет не может быть помещён в коптильню."
            - if <[type]> == CARTOGRAPHY:
              - inventory close
              - actionbar "<&6><&l>С этим предметом невозможно работать на столе картографа."
# Запрет золотых яблок.
gold_apple_use:
    type: world
    debug: false
    events:
        on player consumes item:
          - if <context.item.material.name> = golden_apple && <context.item.script.name||null> = null:
            - determine passively cancelled
            - feed <player> amount:20
            - if <player.gamemode.is[!=].to[creative]||false>:
              - take iteminhand
gold_apple_chanted_use:
    type: world
    debug: false
    events:
        on player consumes item:
          - if <context.item.material.name> = enchanted_golden_apple && <context.item.script.name||null> = null:
            - determine passively cancelled
            - feed <player> amount:20
            - heal <player> 10
            - if <player.gamemode.is[!=].to[creative]||false>:
              - take iteminhand
# Лук и арбалет в левой руке.
bow_offhand_cancel:
    type: world
    debug: false
    events:
        on entity shoots bow:
          - if <context.entity.item_in_offhand.material.name> = bow:
            - determine passively cancelled
            - actionbar "<&6><&l>Нельзя стрелять из лука из второстепенной руки"
          - if <context.entity.item_in_offhand.material.name> = crossbow:
            - determine passively cancelled
            - actionbar "<&6><&l>Нельзя стрелять из арбалета из второстепенной руки"
            - drop arrow <context.entity.location> quantity:1
# Запрет дропа изумрудов с мобов.
emerald_drop:
    type: world
    debug: false
    events:
        on entity dies:
          - define mobtype <context.entity.entity_type>
          - if <[mobtype]> = vindicator || <[mobtype]> = pillager || <[mobtype]> = evoker:
            - determine NO_DROPS
# Опасные команды.
blocked_commands:
    type: world
    debug: false
    events:
        on command:
          - define cmd <context.command>
          - if <[cmd]> = pex:
            - if <context.source_type> != SERVER:
              - determine passively cancelled
          - if <[cmd]> = permissionsex || <[cmd]> = minecraft || <[cmd]> = worldedit || <[cmd]> = /calc || <[cmd]> = /calculator || <[cmd]> = worldedit:/calc || <[cmd]> = worldedit:/calculate || <[cmd]> = worldedit:/solve || <[cmd]> = evaluatefor || <[cmd]> = eval || <[cmd]> = worldedit:/eval || <[cmd]> = restart || <[cmd]> = reload || <[cmd]> = /pos1 || <[cmd]> = /pos2 || <[cmd]> = /calculate || <[cmd]> = permissionsex:demote || <[cmd]> = permissionsex:pex || <[cmd]> = permissionsex:promote:
            - determine passively cancelled
# Сброс компаса при переходе в новый мир.
compass_world_reset:
    type: world
    debug: false
    events:
        after player changes world:
          - compass reset
# Запрет портала.
portal_form_cancel:
    type: world
    debug: false
    events:
        on portal created because FIRE:
          - determine passively cancelled
		on portal created because NETHER_PAIR:
          - determine passively cancelled
		on portal created because END_PLATFORM:
          - determine passively cancelled
# Линк айтема в чат.
link_item:
  type: world
  debug: false
  events:
    on player chats:
      - define link_key <element[[i]]>
      - if <context.message.contains_any_text[<[link_key]>]> = true:
        - determine passively cancelled
        - define char <element[:]>
        - narrate <context.full_text.replace_text[<[link_key]>].with[<&l>[<player.item_in_hand.display.on_hover[<player.item_in_hand>].type[SHOW_ITEM]><&l>]<reset><&6>]> targets:<server.online_players>
        - announce "<&7><player.name> линканул предмет [<player.item_in_hand.display><reset><&7>]." to_console
        - announce <context.full_text.replace_text[<[link_key]>].with[[<player.item_in_hand.display><reset><&6>]]> to_console
# Универсальные диалоги.
trade:
  type: item
  debug: false
  material: gold_ingot
  display name: "<&6><&l>Trade"
  lore:
  - "<&6>Show what you have for sale."
  - ""
  - "<&7>Open the trading window with this character."
  mechanics:
    raw_nbt: <map[ItemLingo=string:trade]>
  flags:
    GUI: true
info:
  type: item
  debug: false
  material: book
  display name: "<&7><&l>Latest Gossip"
  lore:
  - "<&6>What interesting news can you share?"
  - ""
  - "<&7>Inquire with this character about"
  - "<&7>the latest rumors and news."
  mechanics:
    raw_nbt: <map[ItemLingo=string:info]>
  flags:
    GUI: true
advise:
  type: item
  debug: false
  material: book
  display name: "<&7><&l>Little Advice"
  lore:
  - "<&6>Share something that will help me"
  - "<&6>in life here."
  - ""
  - "<&7>Ask the character for advice on"
  - "<&7>surviving in this world."
  mechanics:
    raw_nbt: <map[ItemLingo=string:advise]>
  flags:
    GUI: true
GUI_items_remove:
    type: world
	debug: false
	events:
	    on player picks up item:
		  - if <context.entity.has_flag[GUI]> = true:
		    - define quantity <context.item.quantity>
			- take <context.item> from:<player.inventory> quantity:<[quantity]>