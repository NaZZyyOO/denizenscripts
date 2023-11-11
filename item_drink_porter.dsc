item_spawn_porter:
    type: item
    debug: false
    material: honey_bottle
    display name: "Porter"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Porter"
			rarity: common
		    custom_model_data: 26
			lore:
			  item: "<&8><&l>Item: <&a>Drink"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>Dark, rich beer, that sailors love so much."
			  abilities: "<n><&7>Drinking:<n><&a> - Haste I (0.30)<n><&c> - Weakness I (0.30)<n><&c> - Has 30% chance to apply Intoxication (0.30)"
item_spawn_porter_use:
    type: world
    debug: false
    events:
        on player consumes item_spawn_porter:
          - if <context.item.script.name||null> = item_spawn_porter:
            - determine passively cancelled
            - run take_item def:item_spawn_porter|<player>
            - cast FAST_DIGGING amplifier:0 d:30 <player> hide_particles
            - cast WEAKNESS amplifier:0 d:30 <player> hide_particles
            - if <util.random.int[0].to[100]> <= 30:
              - cast CONFUSION amplifier:0 d:30 <player> hide_particles