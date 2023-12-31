item_blizzard_sphere:
    type: item
    debug: false
    material: heart_of_the_sea
    display name: "<&4><&l>Запечатанная снежная буря"
    lore:
    - ""
    - "<&6>Кусочек свирепой снежной бури, каким-то"
    - "<&6>чудом заключённый в хрустальный шар."
    - "<&6>Умение запечатывать погоду, чувства,"
    - "<&6>природные явления кануло в лету много"
    - "<&6>веков назад. Эта холодная хрустальная"
    - "<&6>сфера - одно из немногих чудес, оставшихся"
    - "<&6>с тех благословенных веков."
    - ""
    - "<&7>Использование:"
    - "<&a> - Расходует 20 ед. маны, и призывает"
    - "<&a> вокруг персонажа кружащуюся снежную бурю,"
    - "<&a> наносящую 2 ед. урона холодом в секунду всем"
    - "<&a> в радиусе 5 метров вокруг. Снежная буря"
    - "<&a> длится 10 секунд, и может быть вызвана"
    - "<&a> лишь раз в одну минуту."
    mechanisms:
      custom_model_data: 1
      nbt_attributes:
      - generic.movement_speed/mainhand/1.0/-0.1
    enchantments:
    - DURABILITY:10
item_blizzard_sphere_use:
    type: world
    debug: false
    events:
        on player right clicks block with:item_blizzard_sphere:
          - if <player.item_in_hand.script.name.is[==].to[item_blizzard_sphere]||false>:
            - if <player.has_flag[blizzard_cd]> = false:
              - if <placeholder[mystery_mana].player[<player>]> > 19:
			    - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
                  - flag <player> blizzard_cd expire:60s
                  - execute "my rmmana <player.name> 40" as_server silent
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - playsound <player.location> sound:item_trident_riptide_3 volume:0.7 pitch:1
                  - playsound <player.location> sound:entity_illusioner_prepare_blindness volume:0.7 pitch:1
                  - playsound <player.location> sound:block_enchantment_table_use volume:0.7 pitch:1
                  - playsound <player.location> sound:blizzard volume:0.8 pitch:1 custom
                  - playeffect at:<player.location.add[-3,8,0].random_offset[5,0,5]> effect:snowflake quantity:5 offset:5 visibility:100 velocity:0.5,-1,0
                  - wait 10t
                  - playeffect at:<player.location.add[-3,8,0].random_offset[5,0,5]> effect:snowflake quantity:5 offset:5 visibility:100 velocity:0.5,-1,0
                  - wait 5t
                  - playeffect at:<player.location.add[-3,8,0].random_offset[5,0,5]> effect:snowflake quantity:10 offset:5 visibility:100 velocity:0.5,-1,0
                  - wait 3t
                  - repeat 50:
                    - wait 5t
				    - hurt 3 <player.location.find.living_entities.within[5].exclude[<player>]> source:<player>
                    - repeat 5:
                      - playeffect at:<player.location.add[-3,8,0].random_offset[5,0,5]> effect:snowflake quantity:10 offset:5 visibility:100 velocity:0.5,-1,0
