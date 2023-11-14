# Shild attak.
shield_attack:
    type: world
    debug: false
    events:
        on player right clicks block:
          - if <script[<player.item_in_offhand.script.name>].data_key[data.stats.can_push]> = true:
            - if <player.is_sneaking||false>:
              - define shield_damage <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.shield_attack_damage]>
              - define shield_weight <script[<player.item_in_offhand.script.name>].data_key[data.stats.attribute_modifiers.shield_weight]>
              - define shield_target <player.precise_target[0.8]>
              - animate <player> animation:START_USE_OFFHAND_ITEM for:<server.online_players>
              - playsound <[shield_target].location> sound:entity_player_attack_knockback pitch:1 volume:0.6
              - playsound <[shield_target].location> sound:entity_zombie_attack_wooden_door pitch:1.3 volume:0.4
              - playeffect at:<[shield_target].location> effect:crit_magic quantity:7 offset:0.4
              - hurt <[shield_target]> source:<player> cause:ENTITY_ATTACK <[shield_damage]>
              - push <[shield_target]> no_rotate speed:<element[shield_weight].div[10]> destination:<player.location.forward[7].add[0,2,0]>
              - cast <[shield_target]> SLOW a:1 d:<[shield_weight].sub[1]> no_icon hide_particles
              - flag <player> smite_cd expire:<[shield_weight]>s
              - cast <[shield_target]> slow_digging a:1 d:<[shield_weight].sub[0.5]> no_icon hide_particles
          - else:
            - stop

# Образец щита.
item_amber_shield:
    type: item
    debug: false
    material: shield
    display name: "<&9><&l>Amber guard shield"
    mechanisms:
      patterns: RED/BASE|YELLOW/RHOMBUS_MIDDLE|RED/CIRCLE_MIDDLE|YELLOW/TRIANGLE_BOTTOM|RED/STRIPE_BOTTOM|RED/HALF_HORIZONTAL|BLACK/GRADIENT
      hides: ITEM_DATA
      nbt_attributes:
      - generic.knockback_resistance/offhand/1.0/0.5
      - generic.max_health/offhand/0.0/2.0
	data:
	    stats:
		    display:  "<&9><&l>Щит стражи Амбера"
			can_push: true
			lore:
			  item: "<&8><&l>Item: <&4>Shield"
			  rare: "<&7><&l>Type: <&9>Rare"
			  text: "<n><&7><&o>Massive shield of guard of the kingdom of Amber.<n><&7><&o>Grants more protection than common wooden shield."
			attribute_modifiers:
	          shield_attack_damage:
			      type: custom
			      operation: ADD_NUMBER
				  amount: 5
				  slot: offhand
              shield_weight:
			      type: custom
			      operation: ADD_NUMBER
				  amount: 2.5
				  slot: offhand