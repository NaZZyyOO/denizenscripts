item_rod_of_frost_nova:
    type: item
    debug: false
    material: stick
    display name: "<&5><&l>Ледяная длань"
    lore:
    - ""
    - "<&6>Жезл из вечного льда, выполненный"
    - "<&6>в виде когтистой лапы. Обжигающе"
    - "<&6>холодный, поэтому держать его можно"
    - "<&6>только за деревянную рукоятку."
    - ""
    - "<&7>Использование:"
    - "<&a> - Расходует 8 ед. маны, и вызывает"
    - "<&a> исходящее от персонажа кольцо холода,"
    - "<&a> наносящее 8 урона холодом всем в"
    - "<&a> в радиусе 5 метров вокруг персонажа."
    - "<&a> Может использоваться раз в 2 секунды."
    mechanisms:
      custom_model_data: 7
      nbt_attributes:
      - generic.movement_speed/mainhand/1.0/-0.07
    enchantments:
    - DURABILITY:4
item_rod_of_frost_nova_use:
    type: world
    debug: false
    events:
        on player right clicks block with:item_rod_of_frost_nova:
          - if <player.item_in_hand.script.name.is[==].to[item_rod_of_frost_nova]||false>:
            - if <player.has_flag[novas_cd]> = false:
              - if <placeholder[mystery_mana].player[<player>]> > 8:
                - flag <player> novas_cd expire:2s
                - animate <player> animation:ARM_SWING for:<server.online_players>
                - define loc <player.location>
                - playeffect at:<player.location.add[0,0.2,0]> effect:explosion_large quantity:1 offset:0 visibility:20
                - playeffect at:<player.location.add[0,0.2,0]> effect:snowflake quantity:20 offset:1 visibility:20
                - playsound <player.location> sound:entity_stray_death volume:0.6 pitch:1.4
                - playsound <player.location> sound:ENTITY_PLAYER_HURT_FREEZE volume:0.6 pitch:1.4
                - playsound <player.location> sound:BLOCK_ENCHANTMENT_TABLE_USE pitch:1.3 volume:0.6
                - playsound <player.location> sound:entity_generic_explode pitch:1.3 volume:0.1
                - wait 1t
                - playeffect at:<[loc].add[0,0.5,0].points_around_y[radius=0.8;points=20]> effect:REDSTONE special_data:1|<color[#47498c].hex> quantity:5 offset:0.1 visibility:20
                - wait 1t
                - playeffect at:<[loc].add[0,0.5,0].points_around_y[radius=1.4;points=25]> effect:REDSTONE special_data:1.2|<color[#5254a2].hex> quantity:5 offset:0.1 visibility:20
                - wait 1t
                - playeffect at:<[loc].add[0,0.5,0].points_around_y[radius=1.8;points=30]> effect:REDSTONE special_data:1.4|<color[#5e60ae].hex> quantity:5 offset:0.1 visibility:20
                - wait 1t
                - foreach <player.location.find.living_entities.within[4.8]>:
                  - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
                    - hurt <[value]> 8 source:<player> cause:FREEZE
                    - playsound <[value].location> sound:ENTITY_PLAYER_HURT_FREEZE volume:1 pitch:1
                - playeffect at:<[loc].add[0,0.5,0].points_around_y[radius=2.4;points=35]> effect:REDSTONE special_data:1.6|<color[#7577ba].hex> quantity:5 offset:0.1 visibility:20
                - wait 1t
                - playeffect at:<[loc].add[0,0.5,0].points_around_y[radius=3;points=35]> effect:REDSTONE special_data:1.8|<color[#8b8cc5].hex> quantity:5 offset:0.1 visibility:20
                - wait 1t
                - playeffect at:<[loc].add[0,0.5,0].points_around_y[radius=3.6;points=40]> effect:REDSTONE special_data:2|<color[#9b9ccd].hex> quantity:5 offset:0.1 visibility:20
                - wait 1t
                - playeffect at:<[loc].add[0,0.5,0].points_around_y[radius=4.2;points=40]> effect:REDSTONE special_data:2.2|<color[#ababd5].hex> quantity:5 offset:0.1 visibility:20
                - wait 1t
                - playeffect at:<[loc].add[0,0.5,0].points_around_y[radius=4.8;points=40]> effect:REDSTONE special_data:2.4|<color[#b9b9dc].hex> quantity:5 offset:0.1 visibility:20
              - else:
                - actionbar targets:<player> "<&c><&l>Недостаточно маны."
            - else:
              - actionbar targets:<player> "<&6><&l>Ледяная длань накапливает силу: <player.flag[novas_cd].expiration.formatted>"