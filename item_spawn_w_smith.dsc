item_sword_wood:
    type: item
    debug: false
    material: wooden_sword
    display name: "<&f><&l>Training Sword"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: false
	data:
	    stats:
		    display:  "<&f><&l>Training Sword"
			rarity: common
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Sword"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>Common wooden training sword, you have to try really hard to kill someone with it."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +1<n><&7>Attack speed bonus:<&e> +4"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +4.0
				  slot: hand
item_sword_stone:
    type: item
    debug: false
    material: stone_sword
    display name: "<&f><&l>Statue's Bulky Sword"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: false
	data:
	    stats:
		    display:  "<&f><&l>Statue's Bulky Sword"
			rarity: common
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Sword substitute"
			  rare: "<&7><&l>Type: <&f>Common"
			  text: "<n><&7><&o>Too heavy for a short man like you."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +9<n><&7>Attack speed bonus:<&e> -1.8<n><&7>Movement speed bonus:<&a> -15.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +8
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -1.8
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
				  operation: ADD_SCALAR
				  amount: -0.15
				  slot: hand
item_sword_adventurer_01:
    type: item
    debug: false
    material: iron_sword
    display name: "<&f><&l>Adventurer's Rusty Blade"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&f><&l>Adventurer's Rusty Blade"
			rarity: common
		    upgrades:
			   poison: true
			   gemstone: true
		    custom_model_data: 1
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Blade"
			  rare: "<&7><&l>Type: <&f>Common"
			  gemstone: <[gemstone]>
			  poison: <[poison]>
			  text: "<n><&7><&o>Despite the rust, it hasn't lost its sharpness.<n><&7><&o>The most common weapon among adventurers."
			  abilities: "<n><&7>Effect on hit:<n><&a> When the holder's HP is<n><&a> lower than 40%, his damage with<n><&a> this sword will increase by 10%."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +9<n><&7>Attack speed bonus:<&e> -1.8"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +9
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -1.8
				  slot: hand
item_sword_adventurer_01_use:
    type: world
    debug: false
    events:
        on entity damages entity with:item_sword_adventurer_01:
          - if <player.health_percentage> <= 40:
		    - determine passively <context.damage.mul[1.1]>
			- playeffect at:<context.entity.location> effect:REDSTONE quantity:30 special_data:0.8|red offset:0.8
item_sword_adventurer_02:
    type: item
    debug: false
    material: iron_sword
    display name: "<&9><&l>Adventurer's Blade"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&9><&l>Adventurer's Blade"
			rarity: rare
		    upgrades:
			   poison: true
			   gemstone: true
		    custom_model_data: 2
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Blade"
			  rare: "<&7><&l>Type: <&9>Rare"
			  gemstone: <[gemstone]>
			  poison: <[poison]>
			  text: "<n><&7><&o>Cleaned of rust, it became even sharper!<n><&7><&o>From such a sword you can get that you facing a sturdy adventurer."
			  abilities: "<n><&7>Effect on hit:<n><&a> When the holder's HP is<n><&a> lower than 40%, his damage with<n><&a> this sword will increase by 20%."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +11<n><&7>Attack speed bonus:<&e> -1.8"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +11
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -1.8
				  slot: hand
item_sword_adventurer_02_use:
    type: world
    debug: false
    events:
        on entity damages entity with:item_sword_adventurer_02:
          - if <player.health_percentage> <= 40:
		    - determine passively <context.damage.mul[1.2]>
			- playeffect at:<context.entity.location> effect:REDSTONE quantity:30 special_data:0.8|red offset:0.8
item_sword_adventurer_03:
    type: item
    debug: false
    material: iron_sword
    display name: "<&9><&l>Adventurer's Polished Blade"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&9><&l>Adventurer's Polished Blade"
			rarity: rare
		    upgrades:
			   poison: true
			   gemstone: true
		    custom_model_data: 3
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Blade"
			  rare: "<&7><&l>Type: <&9>Rare"
			  gemstone: <[gemstone]>
			  poison: <[poison]>
			  text: "<n><&7><&o>Clean and shiny, well sharpened blade.<n><&7><&o>Not every adventurer can afford such sword."
			  abilities: "<n><&7>Effect on hit:<n><&a> When the holder's HP is<n><&a> lower than 40%, his damage with<n><&a> this sword will increase by 25%."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +14<n><&7>Attack speed bonus:<&e> -1.9"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +14
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -1.9
				  slot: hand
item_sword_adventurer_03_use:
    type: world
    debug: false
    events:
        on entity damages entity with:item_sword_adventurer_03:
          - if <player.health_percentage> <= 40:
		    - determine passively <context.damage.mul[1.25]>
			- playeffect at:<context.entity.location> effect:REDSTONE quantity:30 special_data:0.8|red offset:0.8
item_sword_adventurer_04:
    type: item
    debug: false
    material: iron_sword
    display name: "<&9><&l>Adventurer's Shining Blade"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&9><&l>Adventurer's Shining Blade"
			rarity: rare
		    upgrades:
			   poison: true
			   gemstone: true
		    custom_model_data: 4
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Blade"
			  rare: "<&7><&l>Type: <&9>Rare"
			  gemstone: <[gemstone]>
			  poison: <[poison]>
			  text: "<n><&7><&o>Clean and shiny blade, made according to the best design.<n><&7><&o>Only few adventurers can afford such sword."
			  abilities: "<n><&7>Effect on hit:<n><&a> When the holder's HP is<n><&a> lower than 40%, his damage with<n><&a> this sword will increase by 30%."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +15<n><&7>Attack speed bonus:<&e> -2.0<n><&7>Movement speed bonus:<&a> +5.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +15
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -2.0
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
			      operation: ADD_SCALAR
				  amount: +0.05
				  slot: hand
item_sword_adventurer_04_use:
    type: world
    debug: false
    events:
        on entity damages entity with:item_sword_adventurer_04:
          - if <player.health_percentage> <= 40:
		    - determine passively <context.damage.mul[1.3]>
			- playeffect at:<context.entity.location> effect:REDSTONE quantity:30 special_data:0.8|red offset:0.8
item_iron_hammer_01:
    type: item
    debug: false
    material: iron_axe
    display name: "<&f><&l>Rusty Iron Hammer"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&f><&l>Rusty Iron Hammer"
			rarity: common
		    upgrades:
			   gemstone: true
		    custom_model_data: 1
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Mace"
			  rare: "<&7><&l>Type: <&f>Common"
			  gemstone: <[gemstone]>
			  text: "<n><&7><&o>Despite the raw appearance, it is still usable.<n><&7><&o>Will do as a not very heavy and not very bad weapon."
			  abilities: "<n><&7>Effect on hit:<n><&a> - With 10% chance will break target's bones <n><&a> casts on it Slowness I(0.04) and Weakness I(0.04)<n><&a> and cause darkening in the eyes for a while."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +12<n><&7>Attack speed bonus:<&e> -2.0<n><&7>Movement speed bonus:<&a> -5.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +12
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -2.0
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
				  operation: ADD_SCALAR
				  amount: -0.05
				  slot: hand
item_iron_hammer_01_use:
    type: world
	debug: false
	events:
	    on entity damages entity with:item_iron_hammer_01:
		  - if <util.random.int[0].to[100]> <= 10:
		    - if <context.entity.is_player||null> = true:
		      - title title:<&font[fade:black]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:2s stay:0s fade_out:1s targets:<context.entity>
		    - cast SLOW a:0 d:2 <context.entity> hide_particles
			- cast WEAKNESS a:0 d:2 <context.entity> hide_particles
			- playsound <context.entity.location> sound:entity_player_attack_crit pitch:1.2 volume:0.7
			- playsound <context.entity.location> sound:entity_zombie_attack_iron_door pitch:0.7 volume:0.3
			- feed <context.damager> amount:-1
item_iron_hammer_02:
    type: item
    debug: false
    material: iron_axe
    display name: "<&9><&l>Rough Iron Hammer"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&9><&l>Rough Iron Hammer"
			rarity: rare
		    upgrades:
			   gemstone: true
		    custom_model_data: 2
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Mace"
			  rare: "<&7><&l>Type: <&9>Rare"
			  gemstone: <[gemstone]>
			  text: "<n><&7><&o>Rough iron hammer, better than his previous version, but heavier than it.<n><&7><&o>Because of his roughest, it can break target's bones on accurate hit."
			  abilities: "<n><&7>Effect on hit:<n><&a> - With 10% chance will break target's bones <n><&a> casts on it Slowness II(0.06) and Weakness I(0.06)<n><&a> and cause darkening in the eyes for a while."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +13<n><&7>Attack speed bonus:<&e> -2.4<n><&7>Movement speed bonus:<&a> -10.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +13
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -2.4
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
				  operation: ADD_SCALAR
				  amount: -0.1
				  slot: hand
item_iron_hammer_02_use:
    type: world
	debug: false
	events:
	    on entity damages entity with:item_iron_hammer_02:
		  - if <util.random.int[0].to[100]> <= 10:
		    - cast SLOW a:1 d:6 <context.entity> hide_particles
			- cast WEAKNESS a:0 d:6 <context.entity> hide_particles
			- playsound <context.entity.location> sound:entity_player_attack_crit pitch:1.2 volume:0.7
			- playsound <context.entity.location> sound:entity_zombie_attack_iron_door pitch:0.7 volume:0.3
			- feed <context.damager> amount:-1
			- if <context.entity.is_player||null> = true:
		      - title title:<&font[fade:black]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:2s stay:0s fade_out:1s targets:<context.entity>
item_iron_hammer_03:
    type: item
    debug: false
    material: iron_axe
    display name: "<&9><&l>Iron Hammer"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&9><&l>Iron Hammer"
			rarity: rare
		    upgrades:
			   gemstone: true
		    custom_model_data: 3
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Mace"
			  rare: "<&7><&l>Type: <&9>Rare"
			  gemstone: <[gemstone]>
			  text: "<n><&7><&o>Well designed iron hammer, with which only the strong can fight.<n><&7><&o>Deal a good damage, if the hit is accurate."
			  abilities: "<n><&7>Effect on hit:<n><&a> - With 10% chance will break target's bones <n><&a> casts on it Slowness II(0.08) and Weakness II(0.06)<n><&a> and cause darkening in the eyes for a while."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +14.5<n><&7>Attack speed bonus:<&e> -2.4<n><&7>Movement speed bonus:<&a> -12.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +14.5
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -2.4
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
				  operation: ADD_SCALAR
				  amount: -0.12
				  slot: hand
item_iron_hammer_03_use:
    type: world
	debug: false
	events:
	    on entity damages entity with:item_iron_hammer_03:
		  - if <util.random.int[0].to[100]> <= 10:
		    - if <context.entity.is_player||null> = true:
		      - title title:<&font[fade:black]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:2s stay:0s fade_out:1s targets:<context.entity>
		    - cast SLOW a:1 d:8 <context.entity> hide_particles
			- cast WEAKNESS a:1 d:6 <context.entity> hide_particles
			- playsound <context.entity.location> sound:entity_player_attack_crit pitch:1.2 volume:0.7
			- playsound <context.entity.location> sound:entity_zombie_attack_iron_door pitch:0.7 volume:0.3
			- feed <context.damager> amount:-1
item_iron_hammer_04:
    type: item
    debug: false
    material: iron_axe
    display name: "<&9><&l>Polished Iron Hammer"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&9><&l>Polished Iron Hammer"
			rarity: rare
		    upgrades:
			   gemstone: true
		    custom_model_data: 3
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Mace"
			  rare: "<&7><&l>Type: <&9>Rare"
			  gemstone: <[gemstone]>
			  text: "<n><&7><&o>Clean and shiny hammer, with which only the strong can fight.<n><&7><&o>It is not very popular, because of his high weight."
			  abilities: "<n><&7>Effect on hit:<n><&a> - With 10% chance will break target's bones <n><&a> casts on it Slowness III(0.10) and Weakness II(0.08)<n><&a> and cause darkening in the eyes for a while."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +16.5<n><&7>Attack speed bonus:<&e> -2.5<n><&7>Movement speed bonus:<&a> -15.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +16.5
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -2.5
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
				  operation: ADD_SCALAR
				  amount: -0.15
				  slot: hand
item_iron_hammer_04_use:
    type: world
	debug: false
	events:
	    on entity damages entity with:item_iron_hammer_04:
		  - if <util.random.int[0].to[100]> <= 10:
		    - if <context.entity.is_player||null> = true:
		      - title title:<&font[fade:black]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:2s stay:0s fade_out:1s targets:<context.entity>
		    - cast SLOW a:2 d:10 <context.entity> hide_particles
			- cast WEAKNESS a:2 d:8 <context.entity> hide_particles
			- playsound <context.entity.location> sound:entity_player_attack_crit pitch:1.2 volume:0.7
			- playsound <context.entity.location> sound:entity_zombie_attack_iron_door pitch:0.7 volume:0.3
			- feed <context.damager> amount:-1
item_iron_axe_01:
    type: item
    debug: false
    material: iron_axe
    display name: "<&f><&l>Rusty Iron Axe"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&f><&l>Rusty Iron Axe"
			rarity: common
		    upgrades:
			   gemstone: true
		    custom_model_data: 7
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Axe"
			  rare: "<&7><&l>Type: <&f>Common"
			  gemstone: <[gemstone]>
			  text: "<n><&7><&o>Despite the raw appearance, it is still usable."
			  abilities: "<n><&7>Using:<n><&a> - Makes a leap forward, dealing 5 damage <n><&a> to all targets around the player.<n><&a> Can be used once in 3 seconds."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +11<n><&7>Attack speed bonus:<&e> -2.2<n><&7>Movement speed bonus:<&a> -10.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +11
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -2.2
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
				  operation: ADD_SCALAR
				  amount: -0.1
				  slot: hand
item_iron_axe_01_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_iron_axe_01:
		  - if <player.has_flag[iron_axe_01_cd]> = false:
			- adjust <player> velocity:<player.location.direction.vector.mul[1.2]>
			- animate <player> animation:ARM_SWING for:<server.online_players>
			- playsound ENTITY_PLAYER_ATTACK_SWEEP <player> volume:1 pitch:0.1
			- playeffect SWEEP_ATTACK <player.location> offset:0.7 quantity:4
			- flag <player> iron_axe_01_cd expire:3s
			- feed <player> amount:-1
			- wait 0.2
			- foreach <player.location.find.living_entities.within[4].exclude[<player>]> as:victim:
			  - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
			    - if <[victim]||null> != null && <[victim].location> != null:
			      - hurt 5 <[victim]> source:<player> cause:entity_attack
			  	  - playeffect at:<[victim].location> effect:sweep_attack offset:0 quantity:1
				  - push <[victim]> origin:<[victim].location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.2
		  - else:
            - actionbar "<&6><&l>Weapon is not ready for use. <player.flag_expiration[iron_axe_01_cd].from_now.formatted>"
item_iron_axe_02:
    type: item
    debug: false
    material: iron_axe
    display name: "Iron Axe"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "Iron Axe"
			rarity: common
		    upgrades:
			   gemstone: true
		    custom_model_data: 8
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Axe"
			  rare: "<&7><&l>Type: <&9>Rare"
			  gemstone: <[gemstone]>
			  text: "<n><&7><&o>Iron axe, sharper and cleaner than its previous version."
			  abilities: "<n><&7>Using:<n><&a> - Makes a leap forward, dealing 7 damage <n><&a> to all targets around the player.<n><&a> Can be used once in 4 seconds."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +13<n><&7>Attack speed bonus:<&e> -2.4<n><&7>Movement speed bonus:<&a> -15.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +13
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -2.4
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
				  operation: ADD_SCALAR
				  amount: -0.15
				  slot: hand
item_iron_axe_02_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_iron_axe_02:
		  - if <player.has_flag[iron_axe_02_cd]> = false:
			- adjust <player> velocity:<player.location.direction.vector.mul[1.3]>
			- animate <player> animation:ARM_SWING for:<server.online_players>
			- playsound ENTITY_PLAYER_ATTACK_SWEEP <player> volume:1 pitch:0.1
			- playeffect SWEEP_ATTACK <player.location> offset:0.7 quantity:6
			- feed <player> amount:-1
			- flag <player> iron_axe_02_cd expire:4s
			- wait 0.2
			- foreach <player.location.find.living_entities.within[2].exclude[<context.player>]> as:victim:
			  - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
			    - if <[victim]||null> != null && <[victim].location> != null:
			      - hurt 7 <[victim]> source:<player> cause:entity_attack
				  - playeffect at:<[victim].location> effect:sweep_attack offset:0 quantity:1
				  - push <[victim]> origin:<[victim].location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.3
		  - else:
            - actionbar "<&6><&l>Weapon is not ready for use. <player.flag_expiration[iron_axe_02_cd].from_now.formatted>"
item_iron_axe_03:
    type: item
    debug: false
    material: iron_axe
    display name: "<&9><&l>Double-headed Iron Axe"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&9><&l>Double-headed Iron Axe"
			rarity: rare
		    upgrades:
			   gemstone: true
		    custom_model_data: 9
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Axe"
			  rare: "<&7><&l>Type: <&9>Rare"
			  gemstone: <[gemstone]>
			  text: "<n><&7><&o>Well-designed double-headed iron Axe,<n><&7><&o>capable of inflicting deep wounds to the enemy."
			  abilities: "<n><&7>Using:<n><&a> - Makes a leap forward, dealing 10 damage <n><&a> to all targets around the player.<n><&a> Can be used once in 5 seconds."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +14.5<n><&7>Attack speed bonus:<&e> -2.4<n><&7>Movement speed bonus:<&a> -17.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +14.5
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -2.4
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
				  operation: ADD_SCALAR
				  amount: -0.17
				  slot: hand
item_iron_axe_03_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_iron_axe_03:
		  - if <player.has_flag[iron_axe_03_cd]> = false:
			- adjust <player> velocity:<player.location.direction.vector.mul[1.4]>
			- animate <player> animation:ARM_SWING for:<server.online_players>
			- playsound ENTITY_PLAYER_ATTACK_SWEEP <player> volume:1 pitch:0.1
			- playeffect SWEEP_ATTACK <player.location> offset:0.7 quantity:8
			- feed <player> amount:-1
			- flag <player> iron_axe_03_cd expire:5s
			- wait 0.2
			- foreach <player.location.find.living_entities.within[2].exclude[<context.player>]> as:victim:
			  - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
			    - if <[victim]||null> != null && <[victim].location> != null:
			      - hurt 10 <[victim]> source:<player> cause:entity_attack
				  - playeffect at:<[victim].location> effect:sweep_attack offset:0 quantity:1
				  - push <[victim]> origin:<[victim].location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.6
		  - else:
            - actionbar "<&6><&l>Weapon is not ready for use. <player.flag_expiration[iron_axe_03_cd].from_now.formatted>"
item_iron_axe_04:
    type: item
    debug: false
    material: iron_axe
    display name: "<&9><&l>Double-headed Polished Iron Axe"
    mechanisms:
	  hides: ATTRIBUTES
      attribute_modifiers:
	       generic_attack_damage:
		      1:
			      operation: ADD_NUMBER
				  amount: +1
				  slot: hand
	flags:
	  modifiers: true
	data:
	    stats:
		    display:  "<&9><&l>Double-headed Polished Iron Axe"
			rarity: rare
		    upgrades:
			   gemstone: true
		    custom_model_data: 10
			lore:
			  item: "<&8><&l>Item: <&c>Weapon"
			  type: "<&7><&l>Kind: <&4>Axe"
			  rare: "<&7><&l>Type: <&9>Rare"
			  gemstone: <[gemstone]>
			  text: "<n><&7><&o>Clean and shiny, double-headed iron axe,<n><&7><&o>capable to chop enemies to pieces effortlessly."
			  abilities: "<n><&7>Using:<n><&a> - Makes a leap forward, dealing 15 damage <n><&a> to all targets around the player.<n><&a> Can be used once in 6 seconds."
			  attributes: "<n><&7>When in mainhand:<n><&7>Damage:<&c> +17<n><&7>Attack speed bonus:<&e> -2.8<n><&7>Movement speed bonus:<&a> -25.0%"
			attribute_modifiers:
	          generic_attack_damage:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: +17
				  slot: hand
		      generic_attack_speed:
			      type: vanilla
			      operation: ADD_NUMBER
				  amount: -2.8
				  slot: hand
			  generic_movement_speed:
			      type: vanilla
				  operation: ADD_SCALAR
				  amount: -0.25
				  slot: hand
item_iron_axe_04_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_iron_axe_04:
		  - if <player.has_flag[iron_axe_04_cd]> = false:
			- adjust <player> velocity:<player.location.direction.vector.mul[1.5]>
			- animate <player> animation:ARM_SWING for:<server.online_players>
			- playsound ENTITY_PLAYER_ATTACK_SWEEP <player> volume:1 pitch:0.1
			- playeffect SWEEP_ATTACK <player.location> offset:0.7 quantity:10
			- feed <player> amount:-1
			- flag <player> iron_axe_04_cd expire:6s
			- wait 0.2
			- foreach <player.location.find.living_entities.within[3].exclude[<player>]> as:victim:
			  - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
			    - if <[victim]||null> != null && <[victim].location> != null:
			      - hurt 15 <[victim]> source:<player> cause:entity_attack
				  - playeffect at:<[victim].location> effect:sweep_attack offset:0 quantity:1
				  - push <[victim]> origin:<[victim].location> destination:<player.location.forward[7].add[0,2,0]> no_rotate speed:0.8
		  - else:
            - actionbar "<&6><&l>Weapon is not ready for use. <player.flag_expiration[iron_axe_04_cd].from_now.formatted>"