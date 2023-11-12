item_steel_ingot:
    type: item
    debug: false
    material: iron_ingot
    display name: "Steel Ingot"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Steel Ingot"
			rarity: rare
		    custom_model_data: 5
			lore:
			  item: "<&8><&l>Item: <&c>Material"
			  rare: "<&7><&l>Type: <&9>Rare"
			  text: "<n><&7><&o>Robust iron and carbon alloy.<n><&7><&o>This metal is more durable than iron,<n><&7><&o>and using in creation of the<n><&7><&o>most robust weapon and instruments..<n><n><&7>Used for crafting."
    recipes:
      1:
        type: shaped
        output_quantity: 1
        input:
        - air|iron_ingot|air
        - coal|iron_ingot|coal
        - coal|coal|coal
      2:
        type: shaped
        output_quantity: 1
        input:
        - air|iron_ingot|air
        - charcoal|iron_ingot|charcoal
        - charcoal|charcoal|charcoal

item_titan_ingot:
    type: item
    debug: false
    material: iron_ingot
    display name: "Titanium Ingot"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Titanium Ingot"
			rarity: epic
		    custom_model_data: 6
			lore:
			  item: "<&8><&l>Item: <&c>Material"
			  rare: "<&7><&l>Type: <&5>Epic"
			  text: "<n><&7><&o>A bar of superstrong metal,<n><&7><&o>that used in creation of<n><&7><&o>the best weapon and instruments.<n><n><&7>Used for crafting."
    recipes:
      1:
        type: shaped
        output_quantity: 1
        input:
        - blaze_powder|blaze_powder|blaze_powder
        - item_titan_nugget|blaze_powder|item_titan_nugget
        - item_titan_nugget|item_titan_nugget|item_titan_nugget

item_titan_nugget:
    type: item
    debug: false
    material: iron_nugget
    display name: "Titanium Nugget"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Titanium Nugget"
			rarity: epic
		    custom_model_data: 6
			lore:
			  item: "<&8><&l>Item: <&c>Material"
			  rare: "<&7><&l>Type: <&5>Epic"
			  text: "<n><&7><&o>A small piece of superstrong metal that,<n><&7><&o>given enough, can be alloyed into an ingot.<n><n><&7>Used for crafting."
    recipes:
      1:
        type: shaped
        output_quantity: 1
        input:
        - blaze_powder|blaze_powder|blaze_powder
        - item_titan_nugget|blaze_powder|item_titan_nugget
        - item_titan_nugget|item_titan_nugget|item_titan_nugget