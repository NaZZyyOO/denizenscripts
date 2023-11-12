# В этом файле описаны предметы для второй руки, продающиеся на спавне у Зачарователя Беаты.
item_offhand_wand_simple:
    type: item
    debug: false
    material: stick
    display name: "<&f><&l>Basic Aspen Wand"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "<&f><&l>Basic Aspen Wand"
			rarity: common
			custom_model_data: 1
			lore:
			  item: "<&8><&l>Item: <&c>Artifact"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>The simplest of the enchanted wands.<n><&7><&o>Usually, the students of enchanters train with such wands."
			  attributes: "<n><&7>Wnen in Second Hand:<n><&7>Movement speed bonus:<&a> +5.0%<n><&7>Max health bonus:<&c> +2"
			attribute_modifiers:
	          generic_movement_speed:
			      type: vanilla
			      operation: ADD_SCALAR
				  amount: +0.05
				  slot: offhand
		      generic_max_health:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +2.0
				  slot: offhand
item_offhand_enchanted_book:
    type: item
    debug: false
    material: book
    display name: "<&f><&l>Magician's tome"
    mechanisms:
      unbreakable: true
    data:
	    stats:
		    display:  "<&f><&l>Magician's tome"
			rarity: common
		    custom_model_data: 2
			lore:
			  item: "<&8><&l>Item: <&c>Tome"
			  type: "<&7><&l>Kind: <&4>Magical"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>Simplest enchanted tome,<n><&7><&o>often using by novice sorcerers<n><&7><&o>because of it's low price."
			  abilities: "<n><&7>Wnen in Second Hand:<n><&a> - Has 25% chance to ignite target for 30 seconds on hit."
			  attributes: "<n><&7>Wnen in Second Hand:<n><&7>Max health bonus:<&a> +2"
			attribute_modifiers:
	          generic_max_health:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +2
				  slot: offhand
item_offhand_enchanted_book_use:
    type: world
    debug: false
    events:
        on entity damages entity:
          - if <context.damager.is_player||null> = true:
            - if <context.damager.item_in_offhand.script.name||null> = item_offhand_enchanted_book:
              - if <context.cause> == ENTITY_ATTACK:
                - if <util.random.int[0].to[100]> <= 25:
                  - burn <context.entity> duration:30s
                  - playeffect <context.entity.location> effect:flame quantity:10 offset:0.2
                  - actionbar targets:<context.damager> "<&e>Ваш колдовской фолиант поджёг <context.entity.name>"
item_offhand_oblerite_shards:
    type: item
    debug: false
    material: quartz
    display name: "<&f><&l>Shards of Oblerite"
    mechanisms:
      unbreakable: true
    data:
	    stats:
		    display:  "<&f><&l>Shards of Oblerite"
			rarity: common
		    custom_model_data: 1
			lore:
			  item: "<&8><&l>Item: <&c>Artifact"
			  type: "<&7><&l>Kind: <&4>Earthen"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>Enchanted shards of rare magic mineral.<n><&7><&o>It remains valuable, even despite severe damage."
			  abilities: "<n><&7>Wnen in Second Hand:<n><&a> - Has 25% chance to deal 2 damage to target on hit.<n><&c> - 5% chance to get 2 damage on hit."
			  attributes: "<n><&7>Wnen in Second Hand:<n><&7>Movement speed bonus:<&a> +8.0%"
			attribute_modifiers:
	          generic_movement_speed:
			      type: vanilla
			      operation: ADD_SCALAR
				  amount: +0.08
				  slot: offhand
item_offhand_oblerite_shards_use:
    type: world
    debug: false
    events:
        on entity damages entity:
          - if <context.damager.is_player||null> = true:
            - if <context.damager.item_in_offhand.script.name||null> = item_offhand_oblerite_shards:
              - if <context.cause> == ENTITY_ATTACK:
			    - if <context.entity> != null:
				  - if <context.entity.health> > 1:
                    - if <util.random.int[0].to[100]> <= 25:
                      - hurt 2 <context.entity>
                      - playeffect effect:REDSTONE quantity:100 offset:0.35 at:<context.entity.location> special_data:1.3|red
                      - playsound <context.entity.location> sound:ENTITY_PLAYER_ATTACK_CRIT volume:1.0
                    - if <util.random.int[0].to[100]> <= 5:
                      - hurt 2 <context.damager>
                      - playeffect effect:REDSTONE quantity:100 offset:0.35 at:<context.damager.location> special_data:1.3|red
                      - playsound <context.damager.location> sound:ENTITY_PLAYER_ATTACK_CRIT volume:1.0
item_offhand_cursed_bone:
    type: item
    debug: false
    material: bone
    display name: "<&f><&l>Cursed Bone"
    mechanisms:
      unbreakable: true
	data:
	    stats:
		    display:  "<&f><&l>Cursed Bone"
			rarity: common
		    custom_model_data: 3
			lore:
			  item: "<&8><&l>Item: <&c>Artifact"
			  type: "<&7><&l>Kind: <&4>Necrotic"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>Carved human bone, enchanted with weak necrotic magic.<n><&7><&o>Makes its owner stronger, at cost of his own lifeforce."
			  abilities: "<n><&7>Wnen in Second Hand:<n><&a> - Deals 1 damage to target on hit.<n><&a> - 10% chance to cast Poison I (0.10) to target on hit.<n><&a> - Killing an enemy restores 5 satiety.<n><&c> - Each hit applies Hunger I (1.00) to the wearer. <n><&c> - Every poison casting takes 1 satiety."
			  attributes: "<n><&7>Wnen in Second Hand:<n><&7>Movement speed bonus:<&a> -10.0%"
			attribute_modifiers:
	          generic_movement_speed:
			      type: vanilla
			      operation: ADD_SCALAR
				  amount: -0.1
				  slot: offhand
item_offhand_cursed_bone_use:
    type: world
    debug: false
    events:
        on entity damages entity:
          - if <context.damager.is_player||null> = true:
            - if <context.damager.item_in_offhand.script.name||null> = item_offhand_cursed_bone:
              - if <context.cause> == ENTITY_ATTACK:
                - hurt 1 <context.entity>
                - cast HUNGER amplifier:0 duration:60s <context.damager> hide_particles
                - if <util.random.int[0].to[100]> <= 10:
                  - cast POISON amplifier:0 duration:10s <context.entity>
                  - feed <context.damager> amount:-1
                  - playeffect effect:REDSTONE quantity:100 offset:0.35 at:<context.entity.location> special_data:1.3|green
                  - playsound <context.damager.location> sound:ENTITY_PLAYER_HURT_DROWN volume:1.0 pitch:0.1
                  - actionbar targets:<context.damager> "<&e>Вы отравили <context.entity.name>"
item_offhand_cursed_bone_kill:
    type: world
    debug: false
    events:
        on entity killed by entity:
          - if <context.damager.is_player||null> = true:
            - if <context.damager.item_in_offhand.script.name||null> = item_offhand_cursed_bone:
              - feed <context.damager> amount:5
              - actionbar targets:<context.damager> "<&e>Вы поглотили часть жизненной силы противника, восстановив 5 ед. сытости"
item_offhand_ammonite_shell:
    type: item
    debug: false
    material: nautilus_shell
    display name: "<&9><&l>Ammonite Shell"
    mechanisms:
      custom_model_data: 1
      unbreakable: true
    data:
	    stats:
		    display:  "<&9><&l>Ammonite Shell"
			rarity: rare
		    custom_model_data: 1
			lore:
			  item: "<&8><&l>Item: <&c>Artifact"
			  rare: "<&7><&l>Type: <&9>Rare"
			  text: "<n><&7><&o>Enchanted shell of an ancient mollusk.<n><&7><&o>When you put it to your ear, you can hear the sound of the sea."
			  abilities: "<n><&7>Wnen in Second Hand:<n><&a> - When the wearer takes damage, casts Resistance I (0.10).<n><&a> Triggers once in 20 seconds. <n><&a> - When the wearer take damage from lack of oxygen,<n><&a> casts Water breathing (0.10). Triggers once in 2 minutes."
			  attributes: "<n><&7>Wnen in Second Hand:<n><&7>Defense:<&8> +4.0 <n><&7>Armor toughness: <&r>+1.0"
			attribute_modifiers:
	          generic_armor:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +4.0
				  slot: offhand
		      generic_armor_toughness:
			      type: vanilla
				  operation: ADD_NUMBER
				  amount: +1.0
				  slot: offhand
item_offhand_ammonite_shell_use:
    type: world
    debug: false
    events:
        on entity damages entity:
          - if <context.entity.is_player||null> = true:
            - if <context.entity.item_in_offhand.script.name||null> = item_offhand_ammonite_shell:
              - if <context.cause> == ENTITY_ATTACK:
                  - if <context.entity.has_flag[ammonite_shell_buff]> = false:
                    - flag <context.entity> ammonite_shell_buff duration:20s
                    - cast DAMAGE_RESISTANCE amplifier:0 duration:10s <context.entity> hide_particles
                    - playeffect effect:REDSTONE quantity:100 offset:0.35 at:<context.entity.location> special_data:1.3|gray
                    - playsound <context.entity.location> sound:ENTITY_PLAYER_HURT_DROWN volume:1.0 pitch:0.1
                    - actionbar targets:<context.entity> "<&e>Панцирь Аммониты защищает Вас от урона."
item_offhand_ammonite_shell_oxygen:
    type: world
    debug: false
    events:
        on entity damaged:
         - if <context.entity.is_player||null> = true:
            - if <context.entity.item_in_offhand.script.name||null> = item_offhand_ammonite_shell:
              - if <context.cause> == DROWNING:
                - if <context.entity.has_flag[ammonite_shell_oxygen]> = false:
                    - flag <context.entity> ammonite_shell_oxygen duration:120s
                    - cast WATER_BREATHING amplifier:0 duration:60s <context.entity> hide_particles
                    - actionbar targets:<context.entity> "<&e>Панцирь Аммониты дал Вам возможность дышать под водой на одну минуту."