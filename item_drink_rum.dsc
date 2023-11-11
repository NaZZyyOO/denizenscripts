item_spawn_rum:
    type: item
    debug: false
    material: honey_bottle
    display name: "Rough Rum"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "Rough Rum"
			rarity: common
		    custom_model_data: 31
			lore:
			  item: "<&8><&l>Item: <&a>Drink"
			  rare: "<&7><&l>Type: <&r>Common"
			  text: "<n><&7><&o>A drink that known throughout all the Medieval Realm.<n><&7><&o>According to the old tradition, it's infused with eyes of Enderman."
			  abilities: "<n><&7>Drinking:<n><&a> - ???<n><&c> - ???"
item_spawn_rum_use:
    type: world
    debug: false
    events:
        on player consumes item_spawn_rum:
          - if <context.item.script.name||null> = item_spawn_rum:
            - determine passively cancelled
            - run take_item def:item_spawn_rum|<player>
            - cast CONFUSION amplifier:0 d:40 <player> hide_particles
            - cast BLINDNESS amplifier:0 d:40 <player> hide_particles
            - cast HUNGER amplifier:0 d:40 <player> hide_particles
            - if <util.random.int[0].to[100]> <= 70:
              - cast SPEED amplifier:1 d:40 <player> hide_particles
            - else:
              - if <util.random.int[0].to[100]> <= 70:
                - cast REGENERATION amplifier:1 d:40 <player> hide_particles
              - else:
                - if <util.random.int[0].to[100]> <= 70:
                  - cast SPEED amplifier:1 d:40 <player> hide_particles
                  - cast REGENERATION amplifier:1 d:40 <player> hide_particles
                - else:
                  - if <util.random.int[0].to[100]> <= 70:
                    - cast LEVITATION amplifier:0 d:40 <player> hide_particles
                    - cast DAMAGE_RESISTANCE amplifier:2 d:40 <player> hide_particles
                  - else:
                    - if <util.random.int[0].to[100]> <= 70:
                      - cast HEALTH_BOOST amplifier:3 d:40 <player> hide_particles
                      - cast SPEED amplifier:1 d:40 <player> hide_particles
                    - else:
                      - cast INCREASE_DAMAGE amplifier:3 d:40 <player> hide_particles