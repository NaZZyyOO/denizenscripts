# Paruing.
parrying:
    type: world
    debug: false
    events:
        on player left clicks entity:
          - if <player.item_in_hand.material.is[==].to[m@wooden_sword]>:
            - if <player.has_flag[parrying_cd]> = false:
              - if <context.entity.is_player||null> = true:
                - if <context.entity.has_flag[sword_attacking]> = true:
                  - determine passively cancelled
                  - flag <context.entity> sword_attacking:!
                  - flag <player> parrying_cd expire:0.3s
                  - if <player.is_sprinting> = true:
                    - cooldown <context.entity.item_in_hand> 0.2s
                  - else:
                    - cooldown <context.entity.item_in_hand> 0.1s
                  - inventory adjust slot:hand durability:<context.entity.inventory.slot[hand].durability.sub[2]>
                  - inventory adjust slot:hand durability:<player.inventory.slot[hand].durability.sub[4]>
                  - playsound <context.entity.location> sound:entity_zombie_attack_wooden_door volume:0.6 pitch:1.6
                  - playeffect at:<player.location.forward[0.7].add[0,1.6,0]> effect:crit quantity:5 offset:0.2
                - else:
                  - stop
          - if <player.item_in_hand.material.is[==].to[m@stone_sword]>:
            - if <player.has_flag[parrying_cd]> = false:
              - if <context.entity.is_player||null> = true:
                - if <context.entity.has_flag[sword_attacking]> = true:
                  - determine passively cancelled
                  - flag <context.entity> sword_attacking:!
                  - flag <player> parrying_cd expire:0.3s
                  - if <player.is_sprinting> = true:
                    - cooldown <context.entity.item_in_hand> 0.3s
                  - else:
                    - cooldown <context.entity.item_in_hand> 0.2s
                  - inventory adjust slot:hand durability:<context.entity.inventory.slot[hand].durability.sub[4]>
                  - inventory adjust slot:hand durability:<player.inventory.slot[hand].durability.sub[3]>
                  - if <context.entity.item_in_hand.material.is[==].to[m@iron_sword]>:
                    - playsound <context.entity.location> sound:iron_parrying volume:0.7 pitch:1
                    - playsound <context.entity.location> sound:block_basalt_break volume:0.5 pitch:1.6
                    - playeffect at:<player.location.forward[0.7].add[0,1.6,0]> effect:electric_spark quantity:5 offset:0.2
                  - else:
                    - playsound <context.entity.location> sound:block_basalt_break volume:0.7 pitch:1.6
                    - playeffect at:<player.location.forward[0.7].add[0,1.6,0]> effect:crit quantity:5 offset:0.2
                - else:
                  - stop
          - if <player.item_in_hand.material.is[==].to[m@golden_sword]>:
            - if <player.has_flag[parrying_cd]> = false:
              - if <context.entity.is_player||null> = true:
                - if <context.entity.has_flag[sword_attacking]> = true:
                  - determine passively cancelled
                  - flag <context.entity> sword_attacking:!
                  - flag <player> parrying_cd expire:0.3s
                  - if <player.is_sprinting> = true:
                    - cooldown <context.entity.item_in_hand> 0.2s
                  - else:
                    - cooldown <context.entity.item_in_hand> 0.1s
                  - inventory adjust slot:hand durability:<context.entity.inventory.slot[hand].durability.sub[2]>
                  - inventory adjust slot:hand durability:<player.inventory.slot[hand].durability.sub[4]>
                  - playsound <context.entity.location> sound:iron_parrying volume:0.7 pitch:1
                  - playeffect at:<player.location.forward[0.7].add[0,1.6,0]> effect:electric_spark quantity:5 offset:0.2
                - else:
                  - stop
          - if <player.item_in_hand.material.is[==].to[m@iron_sword]>:
            - if <player.has_flag[parrying_cd]> = false:
              - if <context.entity.is_player||null> = true:
                - if <context.entity.has_flag[sword_attacking]> = true:
                  - determine passively cancelled
                  - flag <context.entity> sword_attacking:!
                  - flag <player> parrying_cd expire:0.3s
                  - if <player.is_sprinting> = true:
                    - cooldown <context.entity.item_in_hand> 0.2s
                  - else:
                    - cooldown <context.entity.item_in_hand> 0.1s
                  - inventory adjust slot:hand durability:<context.entity.inventory.slot[hand].durability.sub[2]>
                  - inventory adjust slot:hand durability:<player.inventory.slot[hand].durability.sub[4]>
                  - playsound <context.entity.location> sound:iron_parrying volume:0.7 pitch:1
                  - playeffect at:<player.location.forward[0.7].add[0,1.6,0]> effect:electric_spark quantity:5 offset:0.2
                - else:
                  - stop
          - if <player.item_in_hand.material.is[==].to[m@diamond_sword]>:
            - if <player.has_flag[parrying_cd]> = false:
              - if <context.entity.is_player||null> = true:
                - if <context.entity.has_flag[sword_attacking]> = true:
                  - determine passively cancelled
                  - flag <context.entity> sword_attacking:!
                  - flag <player> parrying_cd expire:0.3s
                  - if <player.is_sprinting> = true:
                    - cooldown <context.entity.item_in_hand> 0.2s
                  - else:
                    - cooldown <context.entity.item_in_hand> 0.1s
                  - inventory adjust slot:hand durability:<context.entity.inventory.slot[hand].durability.sub[2]>
                  - inventory adjust slot:hand durability:<player.inventory.slot[hand].durability.sub[4]>
                  - playsound <context.entity.location> sound:iron_parrying volume:0.7 pitch:1
                  - playeffect at:<player.location.forward[0.7].add[0,1.6,0]> effect:electric_spark quantity:5 offset:0.2
                - else:
                  - stop
          - if <player.item_in_hand.material.is[==].to[m@netherite_sword]>:
            - if <player.has_flag[parrying_cd]> = false:
              - if <context.entity.is_player||null> = true:
                - if <context.entity.has_flag[sword_attacking]> = true:
                  - determine passively cancelled
                  - flag <context.entity> sword_attacking:!
                  - flag <player> parrying_cd expire:0.3s
                  - if <player.is_sprinting> = true:
                    - cooldown <context.entity.item_in_hand> 0.2s
                  - else:
                    - cooldown <context.entity.item_in_hand> 0.1s
                  - inventory adjust slot:hand durability:<context.entity.inventory.slot[hand].durability.sub[2]>
                  - inventory adjust slot:hand durability:<player.inventory.slot[hand].durability.sub[4]>
                  - playsound <context.entity.location> sound:iron_parrying volume:0.7 pitch:1
                  - playeffect at:<player.location.forward[0.7].add[0,1.6,0]> effect:electric_spark quantity:5 offset:0.2
                - else:
                  - stop

# Ataking.
sword_attacking:
    type: world
    debug: false
    events:
        on player left clicks entity:
          - if <player.item_in_hand.material.is[==].to[m@wooden_sword]>:
            - if <context.entity.is_player||null> = true:
              - flag <player> sword_attacking expire:0.1s
          - if <player.item_in_hand.material.is[==].to[m@stone_sword]>:
            - if <context.entity.is_player||null> = true:
              - flag <player> sword_attacking expire:0.1s
          - if <player.item_in_hand.material.is[==].to[m@golden_sword]>:
            - if <context.entity.is_player||null> = true:
              - flag <player> sword_attacking expire:0.1s
          - if <player.item_in_hand.material.is[==].to[m@iron_sword]>:
            - if <context.entity.is_player||null> = true:
              - flag <player> sword_attacking expire:0.1s
          - if <player.item_in_hand.material.is[==].to[m@diamond_sword]>:
            - if <context.entity.is_player||null> = true:
              - flag <player> sword_attacking expire:0.1s
          - if <player.item_in_hand.material.is[==].to[m@netherite_sword]>:
            - if <context.entity.is_player||null> = true:
              - flag <player> sword_attacking expire:0.1s