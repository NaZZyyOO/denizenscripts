item_spawn_ale:
    type: item
    debug: false
    material: honey_bottle
    display name: "Tempshir Ale"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Tempshir Ale"
			rarity: common
		    custom_model_data: 27
			lore:
			  item: "<&8><&l>Item: <&a>Drink"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>Traditional beer, that brewed in Tempshir."
			  abilities: "<n><&7>Drinking:<n><&a> - Strength I (0.30) <n><&c> - Has 30% chance to apply Intoxication (0.30)"
item_spawn_ale_use:
    type: world
    debug: false
    events:
        on player consumes item_spawn_ale:
          - if <context.item.script.name||null> = item_spawn_ale:
            - determine passively cancelled
            - run take_item def:item_spawn_ale|<player>
            - cast INCREASE_DAMAGE amplifier:0 d:30 <player> hide_particles
            - if <util.random.int[0].to[100]> <= 30:
              - cast CONFUSION amplifier:0 d:30 <player> hide_particles