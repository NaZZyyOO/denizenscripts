item_spawn_rootbeer:
    type: item
    debug: false
    material: honey_bottle
    display name: "Rootbeer"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Rootbeer"
			rarity: common
		    custom_model_data: 26
			lore:
			  item: "<&8><&l>Item: <&a>Drink"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>A beer that made from roots and bark of special tree."
			  abilities: "<n><&7>Drinking:<n><&a> - Health Boost I (1.30)<n><&c> - Has 5% chance to apply Intoxication (0.30)"
item_spawn_rootbeer_use:
    type: world
    debug: false
    events:
        on player consumes item_spawn_rootbeer:
          - if <context.item.script.name||null> = item_spawn_rootbeer:
            - determine passively cancelled
            - run take_item def:item_spawn_rootbeer|<player>
            - cast HEALTH_BOOST amplifier:0 d:90 <player> hide_particles
            - if <util.random.int[0].to[100]> <= 5:
              - cast CONFUSION amplifier:0 d:30 <player> hide_particles