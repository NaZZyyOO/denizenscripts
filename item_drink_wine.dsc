item_spawn_wine:
    type: item
    debug: false
    material: honey_bottle
    display name: "Amber Wine"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Amber Wine"
			rarity: common
		    custom_model_data: 28
			lore:
			  item: "<&8><&l>Item: <&a>Drink"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>A nice wine, that made from Amber grapes."
			  abilities: "<n><&7>Drinking:<n><&a> - Regeneration I (1.00)<n><&a> - Removes the Slowing effect.<n><&c> - Has 50% chance to apply Intoxication (0.30)"
item_spawn_wine_use:
    type: world
    debug: false
    events:
        on player consumes item_spawn_wine:
          - if <context.item.script.name||null> = item_spawn_wine:
            - determine passively cancelled
            - run take_item def:item_spawn_wine|<player>
            - cast REGENERATION amplifier:0 d:60 <player> hide_particles
            - if <util.random.int[0].to[100]> <= 50:
              - cast CONFUSION amplifier:0 d:30 <player> hide_particles
            - cast SLOW remove amplifier:0 d:60 <player> hide_particles