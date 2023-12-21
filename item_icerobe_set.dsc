item_icerobe_helm:
    type: item
    debug: false
    material: iron_helmet
    display name: "<&5><&l>Узорчатый меховой капюшон"
    lore:
    - "<&6>Капюшон из голубой ткани,"
    - "<&6>подбитый мехом, и вышитый"
    - "<&6>зимними узорами. Впитал в себя"
    - "<&6>частичку силы прошлого носителя."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a> - При получении урона с 10% шансом"
    - "<&a> нанесёт цели 10 ед. урона и заморозит"
    - "<&a> её, наложив Замедление II (0.05)"
    - "<&a> и Утомление I (0.05), при этом"
    - "<&a> потребляя 6 ед. маны."
    - "<&a> Активируется раз в 5 секунд."
    - "<&a> - При нажатии Shift + ПКМ пустой"
    - "<&a> рукой, потребит 28 ед. маны, и бросит"
    - "<&a> вперёд ледяное копьё, наносящее"
    - "<&a> 20 ед. урона, и накладывающее"
    - "<&a> аналогичные эффекты."
    - "<&a> Можно использовать раз в 10 секунд."
    mechanisms:
      nbt_attributes:
      - generic.armor/head/0.0/2.0
      - generic.max_health/head/0.0/5.0
    enchantments:
    - PROTECTION_ENVIRONMENTAL:3
    - DURABILITY:3
item_icerobe_chest:
    type: item
    debug: false
    material: iron_chestplate
    display name: "<&5><&l>Узорчатая меховая роба"
    lore:
    - "<&6>Роба из голубой ткани,"
    - "<&6>подбитая мехом, и вышитая"
    - "<&6>зимними узорами. Впитала в себя"
    - "<&6>частичку силы прошлого носителя."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a> - При получении урона с 10% шансом"
    - "<&a> нанесёт цели 10 ед. урона и заморозит"
    - "<&a> её, наложив Замедление II (0.05)"
    - "<&a> и Утомление I (0.05), при этом"
    - "<&a> потребляя 6 ед. маны."
    - "<&a> Активируется раз в 5 секунд."
    - "<&a> - При нажатии Shift + ПКМ пустой"
    - "<&a> рукой, потребит 28 ед. маны, и бросит"
    - "<&a> вперёд ледяное копьё, наносящее"
    - "<&a> 20 ед. урона, и накладывающее"
    - "<&a> аналогичные эффекты."
    - "<&a> Можно использовать раз в 10 секунд."
    mechanisms:
      nbt_attributes:
      - generic.armor/chest/0.0/6.0
      - generic.max_health/chest/0.0/8.0
    enchantments:
    - PROTECTION_ENVIRONMENTAL:2
    - DURABILITY:3
item_icerobe_leggings:
    type: item
    debug: false
    material: iron_leggings
    display name: "<&5><&l>Узорчатые меховые штаны"
    lore:
    - "<&6>Шаровары из голубой ткани,"
    - "<&6>подбитые мехом, и вышитые"
    - "<&6>зимними узорами. Впитали в себя"
    - "<&6>частичку силы прошлого носителя."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a> - При получении урона с 10% шансом"
    - "<&a> нанесёт цели 10 ед. урона и заморозит"
    - "<&a> её, наложив Замедление II (0.05)"
    - "<&a> и Утомление I (0.05), при этом"
    - "<&a> потребляя 6 ед. маны."
    - "<&a> Активируется раз в 5 секунд."
    - "<&a> - При нажатии Shift + ПКМ пустой"
    - "<&a> рукой, потребит 28 ед. маны, и бросит"
    - "<&a> вперёд ледяное копьё, наносящее"
    - "<&a> 20 ед. урона, и накладывающее"
    - "<&a> аналогичные эффекты."
    - "<&a> Можно использовать раз в 10 секунд."
    mechanisms:
      nbt_attributes:
      - generic.armor/legs/0.0/5.0
      - generic.max_health/legs/0.0/7.0
    enchantments:
    - PROTECTION_ENVIRONMENTAL:2
    - DURABILITY:3
item_icerobe_boots:
    type: item
    debug: false
    material: iron_boots
    display name: "<&5><&l>Узорчатые меховые сапоги"
    lore:
    - "<&6>Сапоги из странной голубой кожи,"
    - "<&6>подбитые мехом, и вышитые"
    - "<&6>зимними узорами. Впитали в себя"
    - "<&6>частичку силы прошлого носителя."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a> - При получении урона с 10% шансом"
    - "<&a> нанесёт цели 10 ед. урона и заморозит"
    - "<&a> её, наложив Замедление II (0.05)"
    - "<&a> и Утомление I (0.05), при этом"
    - "<&a> потребляя 6 ед. маны."
    - "<&a> Активируется раз в 5 секунд."
    - "<&a> - При нажатии Shift + ПКМ пустой"
    - "<&a> рукой, потребит 28 ед. маны, и бросит"
    - "<&a> вперёд ледяное копьё, наносящее"
    - "<&a> 20 ед. урона, и накладывающее"
    - "<&a> аналогичные эффекты."
    - "<&a> Можно использовать раз в 10 секунд."
    mechanisms:
      nbt_attributes:
      - generic.armor/feet/0.0/2.0
      - generic.max_health/feet/0.0/6.0
    enchantments:
    - PROTECTION_ENVIRONMENTAL:2
    - DURABILITY:3
item_icerobe_set_use:
    type: world
    debug: false
    events:
        on player right clicks block with:air:
          - if <player.inventory.slot[HELMET].script.name.is[==].to[item_icerobe_helm]||false>:
            - if <player.entity.inventory.slot[CHESTPLATE].script.name.is[==].to[item_icerobe_chest]||false>:
              - if <player.inventory.slot[LEGGINGS].script.name.is[==].to[item_icerobe_leggings]||false>:
                - if <player.inventory.slot[BOOTS].script.name.is[==].to[item_icerobe_boots]||false>:
                  - if <placeholder[mystery_mana].player[<player>]> > 27:
                    - if <player.is_sneaking> = true:
                      - if <player.has_flag[icespear_cd]> = false:
                        - execute "my rmmana <player.name> 28" as_server silent
                        - animate <player> animation:ARM_SWING for:<server.online_players>
                        - playsound <player.location> sound:entity_stray_death pitch:1 volume:0.2
                        - playsound <player.location> sound:item_trident_throw pitch:1 volume:1
                        - flag <player> icespear_cd expire:1s
                        - shoot icespear origin:<player.location.add[0,1.3,0]> speed:2 script:icespear_hit shooter:<player> save:glacial_spear
                        - define spear_hit_entities <entry[glacial_spear].shot_entities.get[1]>
                        - define icespear_thrower <player>
                      - else:
                        - actionbar targets:<player> "<&6><&l>Ледяное копьё ещё не материализовалось: <player.flag[icespear_cd].expiration.formatted>."
                  - else:
                    - actionbar targets:<player> "<&c><&l>Недостаточно маны."
        on entity damages entity:
          - if <context.entity.is_player||null> = true:
            - if <context.entity.inventory.slot[HELMET].script.name.is[==].to[item_icerobe_helm]||false>:
              - if <context.entity.inventory.slot[CHESTPLATE].script.name.is[==].to[item_icerobe_chest]||false>:
                - if <context.entity.inventory.slot[LEGGINGS].script.name.is[==].to[item_icerobe_leggings]||false>:
                  - if <context.entity.inventory.slot[BOOTS].script.name.is[==].to[item_icerobe_boots]||false>:
                    - if <context.entity.has_flag[icerobe_set_buff]> = false:
                      - if <placeholder[mystery_mana].player[<player>]> > 27:
                        - flag <context.entity> icerobe_set_buff expire:5s
                        - execute "my rmmana <player.name> 10" as_server silent
                        - cast SLOW amplifier:1 duration:5s <context.damager> hide_particles
                        - cast SLOW_DIGGING amplifier:0 duration:5s <context.damager> hide_particles
                        - playeffect at:<context.damager.location> effect:redstone quantity:20 offset:0.3 special_data:1|<color[#6b7cbb].hex> visibility:20
                        - playsound <context.damager.location> sound:ENTITY_PLAYER_HURT_FREEZE volume:1 pitch:1


icespear:
  type: entity
  debug: false
  entity_type: trident

icespear_generic:
    type: world
    debug: false
    events:
        on entity damaged by icespear:
          - determine cancelled passively
          - playeffect at:<context.projectile.location> effect:redstone quantity:30 offset:0.35 special_data:1.5|<color[#6b7cbb].hex> visibility:100
          - playeffect at:<context.projectile.location> effect:block_crack quantity:20 offset:0.3 special_data:ICE visibility:100
          - playsound at:<context.projectile.location> sound:ENTITY_PLAYER_HURT_FREEZE volume:1 pitch:1
          - playsound at:<context.projectile.location> sound:entity_stray_death volume:0.4 pitch:1.3
          - playsound at:<context.projectile.location> sound:block_glass_break volume:0.8 pitch:0.9
          - wait 1t
         - remove <context.projectile>

icespear_hit:
  debug: false
  type: task
  script:
  - hurt <[hit_entities]> 20 cause:FREEZE

icespear_hit_block:
    type: world
    debug: false
    events:
        on icespear hits block:
          - playeffect at:<context.projectile.location> effect:redstone quantity:30 offset:0.35 special_data:1.5|<color[#6b7cbb].hex> visibility:100
          - playeffect at:<context.projectile.location> effect:block_crack quantity:30 offset:0.3 special_data:ICE visibility:100
          - playsound at:<context.projectile.location> sound:entity_stray_death volume:0.4 pitch:1.3
          - playsound at:<context.projectile.location> sound:block_glass_break volume:0.8 pitch:0.9
          - remove <context.projectile>