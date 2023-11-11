# Зелье спешки
item_potion_haste_01:
    type: item
    debug: false
    material: honey_bottle
    display name: "Cheap Potion of Haste"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Cheap Potion of Haste"
			rarity: common
		    custom_model_data: 6
			lore:
			  item: "<&8><&l>Item: <&b>Potion"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>Low-quality potion of haste."
			  abilities: "<n><&7>Drinking:<n><&a> - Haste I (0.15)"
item_potion_haste_01_use:
    type: world
    debug: false
    events:
        on player consumes item_potion_haste_01:
          - if <context.item.script.name||null> = item_potion_haste_01:
            - determine passively cancelled
            - run take_item def:item_potion_haste_01|<player>
            - cast FAST_DIGGING amplifier:0 d:15 <player> hide_particles
item_potion_haste_02:
    type: item
    debug: false
    material: honey_bottle
    display name: "Well-brewed Potion of Haste"
    lore:
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Well-brewed Potion of Haste"
			rarity: common
		    custom_model_data: 7
			lore:
			  item: "<&8><&l>Item: <&b>Potion"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>Good-quality potion of haste."
			  abilities: "<n><&7>Drinking:<n><&a> - Haste I (1.00)"
item_potion_haste_02_use:
    type: world
    debug: false
    events:
        on player consumes item_potion_haste_02:
          - if <context.item.script.name||null> = item_potion_haste_02:
            - determine passively cancelled
            - run take_item def:item_potion_haste_02|<player>
            - cast FAST_DIGGING amplifier:0 d:60 <player> hide_particles
item_potion_haste_03:
    type: item
    debug: false
    material: honey_bottle
    display name: "High-quality Potion of Haste"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "High-quality Potion of Haste"
			rarity: rare
		    custom_model_data: 8
			lore:
			  item: "<&8><&l>Item: <&b>Potion"
			  rare: "<&7><&l>Type: <&9>Rare"
			  text: "<n><&7><&o>High-quality potion of haste."
			  abilities: "<n><&7>Drinking:<n><&a> - Haste II (2.00)"
item_potion_haste_03_use:
    type: world
    debug: false
    events:
        on player consumes item_potion_haste_03:
          - if <context.item.script.name||null> = item_potion_haste_03:
            - determine passively cancelled
            - run take_item def:item_potion_haste_03|<player>
            - cast FAST_DIGGING amplifier:1 d:120 <player> hide_particles
item_potion_haste_04:
    type: item
    debug: false
    material: honey_bottle
    display name: "Exclusive Potion of Haste"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Exclusive Potion of Haste"
			rarity: epic
		    custom_model_data: 9
			lore:
			  item: "<&8><&l>Item: <&b>Potion"
			  rare: "<&7><&l>Type: <&5>Epic"
			  text: "<n><&7><&o>Very high quality potion of haste."
			  abilities: "<n><&7>Drinking:<n><&a> - Haste III (3.00)"
item_potion_haste_04_use:
    type: world
    debug: false
    events:
        on player consumes item_potion_haste_04:
          - if <context.item.script.name||null> = item_potion_haste_04:
            - determine passively cancelled
            - run take_item def:item_potion_haste_04|<player>
            - cast FAST_DIGGING amplifier:2 d:180 <player> hide_particles
item_potion_haste_05:
    type: item
    debug: false
    material: honey_bottle
    display name: "Best Potion of Haste"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Best Potion of Haste"
			rarity: legendary
		    custom_model_data: 10
			lore:
			  item: "<&8><&l>Item: <&b>Potion"
			  rare: "<&7><&l>Type: <&4>Legendary"
			  text: "<n><&7><&o>Highest-quality potion of haste."
			  abilities: "<n><&7>Drinking:<n><&a> - Haste IV (4.00)"
item_potion_haste_05_use:
    type: world
    debug: false
    events:
        on player consumes item_potion_haste_05:
          - if <context.item.script.name||null> = item_potion_haste_05:
            - determine passively cancelled
            - run take_item def:item_potion_haste_05|<player>
            - cast FAST_DIGGING amplifier:3 d:240 <player> hide_particles