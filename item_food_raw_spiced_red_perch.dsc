item_food_raw_spiced_red_perch:
    type: item
    debug: false
    material: beetroot_soup
    display name: "Приправленный красный окунь"
    mechanisms:
      hides: ITEM_DATA
    recipes:
      1:
        type: shaped
        output_quantity: 1
        input:
        - item_salt|item_petrushka|item_pepper
        - item_garlic|item_red_perch|item_lemon
        - air|item_clay_bowl|air
    data:
	    stats:
		    display:  "Приправленный красный окунь"
			rarity: common
			custom_model_data: 3
			lore:
			  item: "<&8><&l>Предмет: <&a>Еда"
			  rare: "<&7><&l>Тип: <&r>Обычный"
			  text_01: "<n><&7><&o>Красный окунь, приправленный солью,"
			  text_02: "<&7><&o>перцем, и лимонным соком. Теперь надо"
			  text_03: "<&7><&o>запечь его в печи."