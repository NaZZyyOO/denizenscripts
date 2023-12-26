item_nord_helm:
    type: item
    debug: false
    material: iron_helmet
    display name: "<&5><&l>Обруч северного принца"
    lore:
    - "<&6>Лёгкий, почти невесомый"
    - "<&6>серебряный обруч, принадлежавший"
    - "<&6>одному из королей севера. Впитал"
    - "<&6>частичку силы прошлого носителя."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a> - При нажатии Shift + ПКМ с льдом в"
    - "<&a> руке, создаст из него ледяное копьё,"
    - "<&a> потребив 4 ед. маны, и бросит его."
    - "<&a> Копьё наносит 10 ед. урона, и за один"
    - "<&a> раз можно бросить серию из четырёх копий."
    - "<&a> Бросок, или серия бросков может быть"
    - "<&a> выполнен раз в 3 секунды."
    mechanisms:
      custom_model_data: 3
      nbt_attributes:
      - generic.armor/head/0.0/2.0
      - generic.max_health/head/0.0/5.0
      - generic.movement_speed/head/1.0/+0.2
    enchantments:
    - PROTECTION_ENVIRONMENTAL:3
    - DURABILITY:3
item_nord_hood:
    type: item
    debug: false
    material: iron_helmet
    display name: "<&5><&l>Узорчатый меховой капюшон"
    lore:
    - "<&6>Капюшон из голубой ткани,"
    - "<&6>подбитый медвежьим мехом и"
    - "<&6>вышитый зимними узорами. Впитал"
    - "<&6>частичку силы прошлого носителя."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a> - При нажатии Shift + ПКМ с форелью"
    - "<&a> в руке, призовёт полярного медведя,"
    - "<&a> потребив 30 ед. маны. Медведь"
    - "<&a> наносит 14 ед. урона за атаку, и имеет"
    - "<&a> 100 ед. здоровья. Также, его можно"
    - "<&a> покормить форелью чтобы вылечить."
    - "<&a> Может быть призван раз в минуту."
    - "<&c> - Но этот медведь дикий, и не всегда"
    - "<&c> слушается ваших приказов, и потому"
    - "<&c> если вы его атакуете он на вас нападёт."
    mechanisms:
      custom_model_data: 4
      nbt_attributes:
      - generic.armor/head/0.0/2.0
      - generic.max_health/head/0.0/5.0
    enchantments:
    - PROTECTION_ENVIRONMENTAL:3
    - DURABILITY:3
item_nord_chest:
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
    - "<&a> Активируется раз в 3 секунды."
    mechanisms:
      custom_model_data: 3
      nbt_attributes:
      - generic.armor/chest/0.0/6.0
      - generic.max_health/chest/0.0/8.0
    enchantments:
    - PROTECTION_ENVIRONMENTAL:2
    - DURABILITY:3
item_nord_leggings:
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
    - "<&a> Активируется раз в 3 секунды."
    mechanisms:
      custom_model_data: 4
      nbt_attributes:
      - generic.armor/legs/0.0/5.0
      - generic.max_health/legs/0.0/7.0
    enchantments:
    - PROTECTION_ENVIRONMENTAL:2
    - DURABILITY:3
item_nord_boots:
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
    - "<&a> Активируется раз в 3 секунды."
    mechanisms:
      custom_model_data: 3
      nbt_attributes:
      - generic.armor/feet/0.0/2.0
      - generic.max_health/feet/0.0/6.0
    enchantments:
    - PROTECTION_ENVIRONMENTAL:2
    - DURABILITY:3
item_nord_set_use:
    type: world
    debug: false
    events:
        after player right clicks block:
          - if <player.item_in_hand.material.name> = ice:
            - if <player.inventory.slot[HELMET].script.name.is[==].to[item_nord_helm]||false>:
              - if <player.entity.inventory.slot[CHESTPLATE].script.name.is[==].to[item_nord_chest]||false>:
                - if <player.inventory.slot[LEGGINGS].script.name.is[==].to[item_nord_leggings]||false>:
                  - if <player.inventory.slot[BOOTS].script.name.is[==].to[item_nord_boots]||false>:
                    - if <player.is_sneaking> = true:
                      - if <player.has_flag[icespear_cd]> = false:
                        - if <placeholder[mystery_mana].player[<player>]> > 3:
                          - determine passively cancelled
                          - execute "my rmmana <player.name> 4" as_server silent
                          - take iteminhand
                          - wait 4t
                          - playeffect at:<player.location.add[0,0.8,0]> effect:soul_fire_flame quantity:20 offset:0.3 visibility:100
                          - playsound <player.location> sound:entity_stray_death pitch:1 volume:0.2
                          - playsound <player.location> sound:block_enchantment_table_use pitch:1 volume:0.4
                          - wait 10t
                          - playsound <player.location> sound:item_trident_throw pitch:1 volume:1
                          - flag <player> icespear_cd expire:3s
                          - animate <player> animation:ARM_SWING for:<server.online_players>
                          - shoot icespear origin:<player.location.add[0,1.3,0]> speed:2 script:icespear_hit shooter:<player> save:glacial_spear
                          - define spear_hit_entities <entry[glacial_spear].shot_entities.get[1]>
                        - else:
                          - actionbar targets:<player> "<&c><&l>Недостаточно маны."
                      - else:
                        - actionbar targets:<player> "<&6><&l>Вы не можете бросать копья так часто: <player.flag[icespear_cd].expiration.formatted>"
        on entity damages entity:
          - if <context.entity.is_player||null> = true:
            - if <context.entity.inventory.slot[CHESTPLATE].script.name.is[==].to[item_nord_chest]||false>:
              - if <context.entity.inventory.slot[LEGGINGS].script.name.is[==].to[item_nord_leggings]||false>:
                - if <context.entity.inventory.slot[BOOTS].script.name.is[==].to[item_nord_boots]||false>:
                  - if <context.entity.has_flag[icerobe_set_buff]> = false:
                    - if <placeholder[mystery_mana].player[<player>]> > 5:
                      - execute "my rmmana <player.name> 6" as_server silent
                      - flag <context.entity> icerobe_set_buff expire:3s
                      - cast SLOW amplifier:1 duration:5s <context.damager> hide_particles
                      - cast SLOW_DIGGING amplifier:0 duration:5s <context.damager> hide_particles
                      - hurt <context.damager> 10 source:<player> cause:FREEZE
                      - playeffect at:<context.damager.location> effect:redstone quantity:20 offset:0.3 special_data:1|<color[#6b7cbb].hex> visibility:20
                      - playsound <context.damager.location> sound:ENTITY_PLAYER_HURT_FREEZE volume:0.5 pitch:1
                      - playsound <context.damager.location> sound:enchant_thorns_hit volume:0.5 pitch:1

item_nord_set_use_2:
    type: world
    debug: false
    events:
        after player right clicks block with:item_forel:
          - if <player.vehicle||0> = 0:
            - if <player.inventory.slot[HELMET].script.name.is[==].to[item_nord_hood]||false>:
              - if <player.entity.inventory.slot[CHESTPLATE].script.name.is[==].to[item_nord_chest]||false>:
                - if <player.inventory.slot[LEGGINGS].script.name.is[==].to[item_nord_leggings]||false>:
                  - if <player.inventory.slot[BOOTS].script.name.is[==].to[item_nord_boots]||false>:
                    - if <player.is_sneaking> = true:
                      - if <player.has_flag[nord_bear_cd]> = false:
                        - if <placeholder[mystery_mana].player[<player>]> > 29:
                          - determine passively cancelled
                          - animate <player> animation:ARM_SWING for:<server.online_players>
                          - execute "my rmmana <player.name> 30" as_server silent
                          - playsound <player.location> sound:ENTITY_EVOKER_PREPARE_SUMMON pitch:1 volume:1
                          - playeffect at:<player.location.add[0,0.8,0]> effect:soul_fire_flame quantity:20 offset:0.3 visibility:100
                          - playeffect at:<player.location.add[0,0.8,0]> effect:campfire_cosy_smoke quantity:20 offset:0.5 visibility:100
                          - playsound <player.location> sound:entity_polar_bear_ambient pitch:1 volume:1
                          - flag <player> nord_bear_cd expire:60s
                          - wait 10t
                          - spawn nord_bear <player.location.add[0,0.1,0]> save:MyBear
                          - health <entry[MyBear].spawned_entity> 100 heal
                          - disguise <entry[MyBear].spawned_entity> as:polar_bear players:<server.online_players>
                          - adjust <entry[MyBear].spawned_entity> silent:true
                          - flag <entry[MyBear].spawned_entity> host:<player.name>
                          - rename <entry[MyBear].spawned_entity> "<&6>Медведь <player.name>"
                          - mount <player>|<entry[MyBear].spawned_entity>
                        - else:
                          - actionbar targets:<player> "<&c><&l>Недостаточно маны."
                      - else:
                        - actionbar targets:<player> "<&6><&l>Вы не можете совершать призыв так часто: <player.flag[nord_bear_cd].expiration.formatted>"

nord_bear_abilities:
    type: world
    debug: false
    events:
        on nord_bear damages entity:
          - playsound <context.entity.location> sound:entity_polar_bear_warning pitch:1 volume:1
          - determine passively <context.damage.mul[2]>
        on nord_bear dies:
          - determine passively NO_DROPS
          - playsound <context.entity.location> sound:entity_polar_bear_death pitch:1 volume:1
        on nord_bear damaged:
          - playsound <context.entity.location> sound:entity_polar_bear_hurt pitch:1 volume:1
        on nord_bear targets entity:
          - if <context.entity.has_flag[host]>:
            - if <context.entity.flag[host]> = <context.target.name>:
              - determine cancelled passively
        on player right clicks nord_bear with:item_forel:
          - animate <player> animation:ARM_SWING for:<server.online_players>
          - heal <context.entity> 10
          - playsound at:<context.entity.location> sound:entity_fox_eat volume:1 pitch:0.1
          - take iteminhand
        on player right clicks nord_bear:
          - if <player.item_in_hand.script.name.is[==].to[item_forel]> = false:
            - if <context.entity.has_flag[host]>:
              - if <context.entity.flag[host]> = <player.name>:
                - mount <player>|<context.entity>

nord_bear:
    type: entity
    debug: false
    entity_type: zoglin

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
          - playeffect at:<context.entity.location> effect:redstone quantity:30 offset:0.35 special_data:1.5|<color[#6b7cbb].hex> visibility:100
          - playeffect at:<context.entity.location> effect:block_crack quantity:20 offset:0.3 special_data:ICE visibility:100
          - playsound at:<context.entity.location> sound:ENTITY_PLAYER_HURT_FREEZE volume:1 pitch:1
          - playsound at:<context.entity.location> sound:entity_stray_death volume:0.4 pitch:1.3
          - playsound at:<context.entity.location> sound:block_glass_break volume:0.8 pitch:0.9
          - wait 1t
          - remove <context.projectile>

icespear_hit:
    debug: false
    type: task
    script:
        - hurt <[hit_entities]> 7 cause:FREEZE

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