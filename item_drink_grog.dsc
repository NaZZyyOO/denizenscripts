item_spawn_grog:
    type: item
    debug: false
    material: honey_bottle
    display name: "Grog"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Grog"
			rarity: common
		    custom_model_data: 33
			lore:
			  item: "<&8><&l>Item: <&a>Drink"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>Hot rum, highly diluted with water and sugar."
			  abilities: "<n><&7>Drinking:<n><&a> - Water Breathing (1.00)<n><&c> - Has 30% chance to apply Intoxication (0.30)"
item_spawn_grog_use:
    type: world
    debug: false
    events:
        on player consumes item_spawn_grog:
          - if <context.item.script.name||null> = item_spawn_grog:
            - determine passively cancelled
            - run take_item def:item_spawn_grog|<player>
            - cast WATER_BREATHING amplifier:0 d:60 <player> hide_particles
            - if <util.random.int[0].to[100]> <= 30:
              - cast CONFUSION amplifier:0 d:30 <player> hide_particles