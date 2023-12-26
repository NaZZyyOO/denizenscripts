item_evilvand:
    type: item
    debug: false
    material: stick
    display name: "<&5><&l>Посох зла"
    lore:
    - "<&6>Старинный жезл, чья рукоять"
    - "<&6>украшена зловещими узорами."
    - "<&6>Сфера на его наконечнике"
    - "<&6>напоминает чей-то злобный глаз."
    - ""
    - "<&7>Использование:"
    - "<&a> - Призывает челюсти под целью,"
    - "<&a> наносящие 6 ед. урона, потребив"
    - "<&a> 5 ед. маны Можно использовать"
    - "<&a> раз в одну секунду."
    mechanisms:
      custom_model_data: 8
      nbt_attributes:
      - generic.movement_speed/mainhand/1.0/-0.05
    enchantments:
    - DURABILITY:3
item_evilvand_use:
    type: world
    debug: false
    events:
        on player right clicks block with:item_evilvand:
          - define target <player.precise_target[25]||null>
          - if <[target]> != null:
            - if <[target].is_living||null> = false:
              - stop
            - else:
              - if <player.has_flag[item_evilvand_cooldown]> = false:
                - if <placeholder[mystery_mana].player[<player>]> > 4:
                  - execute "my rmmana <player.name> 5" as_server silent
                  - flag <player> item_evilvand_cooldown duration:1s
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - playsound sound:entity_evoker_fangs_attack pitch:1 volume:0.8 <player.location>
                  - playeffect at:<player.location.add[0,1,0]> effect:SPELL quantity:20 offset:0.3
                  - spawn evoker_fangs <[target].location>