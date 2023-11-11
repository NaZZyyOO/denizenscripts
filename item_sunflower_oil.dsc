item_sunflower_oil:
    type: item
    debug: false
    material: honey_bottle
    display name: "Подсолнечное масло"
    mechanisms:
      hides: ITEM_DATA
    recipes:
      1:
        type: shaped
        output_quantity: 1
        input:
        - air|sunflower|air
        - sunflower|glass_bottle|sunflower
        - air|sunflower|air
    data:
	    stats:
		    display:  "Подсолнечное масло"
			rarity: common
		    custom_model_data: 42
			lore:
			  item: "<&8><&l>Предмет: <&a>Заправка к еде"
			  rare: "<&7><&l>Тип: <&r>Обычный"
			  text_01: "<n><&7><&o>Растительное масло сделанное из"
              text_02: "<&7><&o>семян подсолнуха. Используется во многих блюдах."