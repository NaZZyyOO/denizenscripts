item_spawn_lager:
    type: item
    debug: false
    material: honey_bottle
    display name: "Lager"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Lager"
			rarity: common
		    custom_model_data: 32
			lore:
			  item: "<&8><&l>Item: <&a>Drink"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>A light lager, that can be found in every tavern."
			  abilities: "<n><&7>Drinking:<n><&a> - Rersistance I (0.30)<n><&c> - Has 30% chance to apply Intoxication (0.30)"
item_spawn_lager_use:
    type: world
    debug: false
    events:
        on player consumes item_spawn_lager:
          - if <context.item.script.name||null> = item_spawn_lager:
            - determine passively cancelled
            - run take_item def:item_spawn_lager|<player>
            - cast DAMAGE_RESISTANCE amplifier:0 d:30 <player> hide_particles
            - if <util.random.int[0].to[100]> <= 15:
              - cast CONFUSION amplifier:0 d:30 <player> hide_particles