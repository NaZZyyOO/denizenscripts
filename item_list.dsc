# Флаг и щит амберской стражи.
item_amber_flag:
    type: item
    debug: false
    material: red_banner
    display name: "Amber Kingdom banner"
    mechanisms:
      patterns: YELLOW/RHOMBUS_MIDDLE|RED/CIRCLE_MIDDLE|YELLOW/TRIANGLE_BOTTOM|RED/STRIPE_BOTTOM|RED/HALF_HORIZONTAL|BLACK/GRADIENT
      hides: ITEM_DATA
      unbreakable: true
	data:
	    stats:
		    display:  "Amber Kingdom banner"
			rarity: rare
			lore:
			  item: "<&8><&l>Item: <&c>Banner"
			  rare: "<&7><&l>Type: <&9>Rare"
			  text: "<n><&7><&o>Red banner of the Amber Kingdom."

item_amber_guard_shield:
    type: item
    debug: false
    material: shield
    display name: "Amber guard shield"
    mechanisms:
      patterns: RED/BASE|YELLOW/RHOMBUS_MIDDLE|RED/CIRCLE_MIDDLE|YELLOW/TRIANGLE_BOTTOM|RED/STRIPE_BOTTOM|RED/HALF_HORIZONTAL|BLACK/GRADIENT
      hides: ITEM_DATA
      nbt_attributes:
      - generic.knockback_resistance/offhand/1.0/0.5
      - generic.max_health/offhand/0.0/2.0
	data:
	    stats:
		    display:  "Amber guard shield"
			rarity: rare
			lore:
			  item: "<&8><&l>Item: <&4>Shield"
			  rare: "<&7><&l>Type: <&9>Rare"
			  text: "<n><&7><&o>Massive shield of guard of the kingdom of Amber.<n><&7><&o>Grants more protection than common wooden shield."
			  abilities: "<n><&7>"

# Стрелы.
item_golden_arrow:
    type: item
    debug: false
    material: spectral_arrow
    display name: "Golden arrow"
	data:
	    stats:
		    display:  "olden arrow"
			rarity: rare
		    custom_model_data: 1
			lore:
			  item: "<&8><&l>Item: <&c>Ammo"
			  rare: "<&7><&l>Type: <&9>Rare"
			  text: "<n><&7><&o>Enchanted golden arrow.<n><&7><&o>Unaffordable luxury."

item_skeleton_arrow:
    type: item
    debug: false
    material: arrow
    display name: "Undead arrow"
	data:
	    stats:
		    display:  "Undead arrow"
			rarity: common
		    custom_model_data: 2
			lore:
			  item: "<&8><&l>Item: <&c>Ammo"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>Very old and fragile, but still sharp.<n><&7><&o>Such arrows can usually be found on various undead."

item_iron_arrow:
    type: item
    debug: false
    material: arrow
    display name: "Iron arrow"
	data:
	    stats:
		    display:  "<&f><&l>Iron arrow"
			rarity: common
		    custom_model_data: 1
			lore:
			  item: "<&8><&l>Item: <&c>Ammo"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>Common arrow with iron tip.<n><&7><&o>Such arrows can be found on any archer."

item_bolt:
    type: item
    debug: false
    material: arrow
    display name: "Steel bolt"
	data:
	    stats:
		    display:  "Steel bolt"
			rarity: common
		    custom_model_data: 4
			lore:
			  item: "<&8><&l>Item: <&c>Ammo"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>Special arrow, intended for crossbows."

# Флаг и щит некромантов амбера.
item_amber_necromancers_flag:
    type: item
    debug: false
    material: red_banner
    display name: "Amber Necrocult banner"
    mechanisms:
      patterns: GRAY/FLOWER|GRAY/RHOMBUS_MIDDLE|BLACK/TRIANGLE_TOP|BLACK/SKULL|GRAY/TRIANGLES_BOTTOM|GRAY/CIRCLE_MIDDLE|BLACK/GRADIENT
      hides: ITEM_DATA
      unbreakable: true
	data:
	    stats:
		    display:  "Amber Necrocult banner"
			rarity: rare
			lore:
			  item: "<&8><&l>Item: <&c>Banner"
			  rare: "<&7><&l>Type: <&9>Rare"
			  text: "<n><&7><&o>Ragged, filthy banner, with cursed emblem of Amber necromancers."

item_amber_skeleton_shield:
    type: item
    debug: false
    material: shield
    display name: "Undead shield"
    mechanisms:
      patterns: BLACK/BASE|GRAY/FLOWER|GRAY/RHOMBUS_MIDDLE|BLACK/TRIANGLE_TOP|BLACK/SKULL|GRAY/TRIANGLES_BOTTOM|GRAY/CIRCLE_MIDDLE|BLACK/GRADIENT
      hides: ITEM_DATA
      nbt_attributes:
      - generic.knockback_resistance/offhand/1.0/0.2
      - generic.max_health/offhand/0.0/2.0
	data:
	    stats:
		    display:  "Undead shield"
			rarity: rare
			lore:
			  item: "<&8><&l>Item: <&4>Shield"
			  rare: "<&7><&l>Type: <&9>Rare"
			  text: "<n><&7><&o>Sturdy wooden shield with Amber necromancers' emblem.<n><&7><&o>Such shield regularly can be found on undead inhabiting near the Amber castle."

item_scroll_empty:
    type: item
    debug: false
    material: paper
    display name: "Empty scroll"
    mechanisms:
      unbreakable: true
      custom_model_data: 1
	data:
	    stats:
		    display:  "Empty scroll"
			rarity: common
			lore:
			  item: "<&8><&l>Item: <&c>Material"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>Empty scroll, prepared for drawing magical symbols on it."