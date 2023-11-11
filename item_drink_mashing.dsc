item_spawn_mashing:
    type: item
    debug: false
    material: honey_bottle
    display name: "Brogue"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Brogue"
			rarity: common
		    custom_model_data: 31
			lore:
			  item: "<&8><&l>Item: <&a>Drink"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>Overfermented juice of local fruits and berries."
			  abilities: "<n><&7>Drinking:<n><&a> - Applies Health Boost I or Strength I for 30 seconds.<n><&c> - Has 30% chance to apply Intoxication (0.30)"
item_spawn_mashing_use:
    type: world
    debug: false
    events:
        on player consumes item_spawn_mashing:
          - if <context.item.script.name||null> = item_spawn_mashing:
            - determine passively cancelled
            - run take_item def:item_spawn_mashing|<player>
            - if <util.random.int[0].to[100]> <= 50:
              - cast HEALTH_BOOST amplifier:0 d:30 <player> hide_particles
            - else:
              - cast INCREASE_DAMAGE amplifier:0 d:30 <player> hide_particles
            - if <util.random.int[0].to[100]> <= 30:
              - cast CONFUSION amplifier:0 d:30 <player> hide_particles