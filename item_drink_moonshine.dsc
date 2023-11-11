item_spawn_moonshine:
    type: item
    debug: false
    material: honey_bottle
    display name: "Moonshine"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Moonshine"
			rarity: common
		    custom_model_data: 29
			lore:
			  item: "<&8><&l>Item: <&a>Drink"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>Very strong alcohol, distilled from the distillation of brogue."
			  abilities: "<n><&7>Drinking:<n><&a> - Fire Protection (1.00)<n><&c> - Intoxication (0.30)<n><&c> - Ignites for 30 seconds."
item_spawn_moonshine_use:
    type: world
    debug: false
    events:
        on player consumes item_spawn_moonshine:
          - if <context.item.script.name||null> = item_spawn_moonshine:
            - determine passively cancelled
            - run take_item def:item_spawn_moonshine|<player>
            - cast FIRE_RESISTANCE amplifier:0 d:60 <player> hide_particles
            - cast CONFUSION amplifier:0 d:30 <player> hide_particles
            - burn <player> duration:30s