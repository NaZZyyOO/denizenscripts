# Sekand hend ataking.
secondhand_attack:
    type: world
    debug: false
    events:
        on player right clicks entity:
          - if <player.item_in_offhand.material.is[==].to[m@wooden_sword]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@stone_sword]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@golden_sword]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@iron_sword]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@diamond_sword]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@netherite_sword]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop


          - if <player.item_in_offhand.material.is[==].to[m@wooden_axe]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@stone_axe]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@golden_axe]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@iron_axe]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@diamond_axe]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop

          - if <player.item_in_offhand.material.is[==].to[m@netherite_axe]>:
            - if <player.item_in_offhand.has_lore>:
              - if <player.has_flag[sechand_atk_cd]> = false:
                - determine cancelled
                - flag <player> sechand_atk_cd expire:<script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_speed].mul[-1].div[2]>s
                - if <player.is_sprinting> = true:
                  - animate <player> animation:ARM_SWING for:<server.online_players>
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
                  - push <context.entity> origin:<context.entity.location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
                  - playsound <context.entity.location> sound:entity_player_attack_knockback pitch:1 volume:1
                - if <player.is_on_ground> = false:
                  - define loc1 <player.location>
                  - wait 1t
                  - define loc2 <player.location>
                  - if <[loc2]> < <[loc1]>:
                    - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage]> source:<player> cause:ENTITY_ATTACK
                    - playsound <context.entity.location> sound:entity_player_attack_crit pitch:1 volume:1
                    - playeffect <context.entity.location> effect:crit quantity:14 offset:0.6
                - else:
                  - hurt <context.entity> <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.generic_attack_damage].div[1.5]> source:<player> cause:ENTITY_ATTACK
              - else:
                - stop






