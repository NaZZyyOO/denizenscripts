item_krampus_tooth:
    type: item
    debug: false
    material: stone_sword
    display name: "<&4><&l>Клык Крампуса"
    lore:
    - "<&6>Большой и острый клык, выбитый"
    - "<&6>прямо из пасти древнего демона."
    - "<&6>Крампус был полной противоположностью"
    - "<&6>Святого Миколая, в то время как Миколай"
    - "<&6>дарил подарки послушным детям, Крампус"
    - "<&6>ловил непослущных, уносил к себе в логово"
    - "<&6>и поедал. По крайней мере так гласят легенды."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - С 10% шансом при ударе на персонажа"
    - "<&a> наложится Метка Зла на 10 секунд."
    - ""
    - "<&7>Эффект при ударе с активной Меткой Зла:"
    - "<&a> - Восстанавливает персонажу 1 ед. здоровья."
    - "<&a> - Накладывает на цель Иссушение I (0.04)."
    - ""
    - "<&7>Эффект при убийстве с активной Меткой Зла:"
    - "<&a> - Восстанавливает персонажу 5 ед. маны."
    mechanisms:
      custom_model_data: 5
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/10.0
      - generic.movement_speed/mainhand/1.0/-0.05
      - generic.attack_speed/mainhand/0.0/-1.3
    enchantments:
    - DURABILITY:3
item_krampus_tooth_use:
    type: world
    debug: false
    events:
        on player damages entity:
          - if <context.damager.item_in_hand.script.name.is[==].to[item_krampus_tooth]||false>:
            - if <util.random.int[0].to[100]> <= 10:
              - if <player.has_flag[evil_sigh]> = false:
                - flag <player> evil_sigh expire:10s
                - playeffect at:<player.location.add[0,1,0]> effect:REDSTONE special_data:1|<color[#5e523e].hex> quantity:30 offset:0.3
                - playsound sound:ENTITY_HUSK_CONVERTED_TO_ZOMBIE volume:0.3 pitch:1 <player.location>
                - playsound sound:ENTITY_ZOMBIE_VILLAGER_CONVERTED volume:0.3 pitch:1 <player.location>
                - repeat 10:
                  - wait 16t
                  - playeffect at:<player.location.add[0,1,0]> effect:redstone special_data:1|<color[#3c3528].hex> quantity:30 offset:0.3
buff_evilsigh_use:
    type: world
    debug: false
    events:
        on player damages entity:
          - if <player.has_flag[evil_sigh]> = true:
            - heal <player> 1
            - cast wither a:0 d:4 <context.entity>
            - playeffect <context.entity.location.add[0,0.7,0]> effect:REDSTONE special_data:1|<color[#191611].hex> quantity:20 offset:0.2
            - playsound sound:entity_ender_dragon_hurt volume:0.3 pitch:1.5 <player.location>
        on player kills entity:
          - if <player.has_flag[evil_sigh]> = true:
            - if <placeholder[mystery_mana].player[<player>]> < <placeholder[mystery_maxmana].player[<player>]>:
		      - execute as_server silent "my addmana <player.name> 5"
              - playeffect effect:MAGIC_CRIT at:<context.entity.location.add[0,0.7,0]> quantity:10 offset:0.2
              - playeffect effect:REDSTONE quantity:30 offset:0.55 at:<player.location> special_data:1.0|<color[#2427b3].hex>
              - playsound <player.location> sound:block_enchantment_table_use pitch:1.5 volume:0.5
