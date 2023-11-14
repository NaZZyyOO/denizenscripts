gemstones_drop:
    type: world
	debug: false
	events:
	    on player breaks block:
		  - if <player.gamemode> != creative:
		    - if <player.item_in_hand.enchantment_map.contains[silk_touch]> = false:
			  - define ore <context.material.name>
			  - define drop_result <map[]>
			  - if <script[<[ore]>].list_keys.contains[gemstones]> = true:
			    - define gemstones <script[<[ore]>].data_key[gemstones]>
			    - foreach <[gemstones].keys>:
			      - define crystalization <script[<[ore]>].data_key[gemstones.<[value]>.crystalization]>
				  - if <script[<[ore]>].data_key[gemstones.<[value]>].keys.contains[main_gemstone]> = true:
				    - define drop_result <[drop_result].with[<[value]>].as[<[crystalization]>]>
				  - else:
				    - if <player.flag[custom_stats_map].contains[pristine]> = true:
					  - define pristine <script[<[ore]>].data_key[gemstones.<[value]>.pristine]>
				      - if <player.flag[custom_stats_map].get[pristine]> >= <[pristine]>:
				        - if <util.random.int[0].to[100]> <= <[pristine].mul[100]>:
				          - define drop_result <[drop_result].with[<[value]>].as[<[crystalization]>]>
			  - if <script[<[ore]>].list_keys.contains[metals]> = true:
			    - define metals <script[<[ore]>].data_key[metals]>
			    - foreach <[metals].list_keys>:
			      - define chance <script[<[ore]>].data_key[metals.<[value]>.chance]>
				  - if <player.flag[custom_stats_map].contains[metalurgist]> = true:
				    - define metalurgist <player.flag[custom_stats_map].get[metalurgist]>
					- define metalurgist_coef <[metalurgist].add[1]>
					- define chance <[chance].mul[<[metalurgist_coef]>]>
				  - define drop_result <[drop_result].with[<[value]>].as[<[chance]>]>
			  - if <[drop_result].size> > 0:
			    - foreach <[drop_result].keys>:
			      - define chance <[drop_result].get[<[value]>]>
				  - if <util.random.int[0].to[100]> <= <[chance]>:
				    - drop <context.location> <[value]> quantity:1
				    - actionbar "<&7>Вы нашли драгоценный камень - [<script[<[value]>].display><&7>]."
				    - stop
coal_ore:
    type: data
	debug: false
	metals:
	    item_titan_nugget:
	        chance: 0.3
deepslate_coal_ore:
    type: data
	debug: false
	metals:
	    item_titan_nugget:
	        chance: 0.6
iron_ore:
    type: data
	debug: false
	metals:
	    item_titan_nugget:
	        chance: 1.5
deepslate_iron_ore:
    type: data
	debug: false
	metals:
	    item_titan_nugget:
	        chance: 1.8
gold_ore:
    type: data
	debug: false
	metals:
	    item_titan_nugget:
		    chance: 2
	gemstones:
	    item_geliodor:
		    crystalization: 1
			pristine: 0.3
	    item_onyx:
		    main_gemstone: true
			crystalization: 5
	    item_avanturin:
		    crystalization: 2.5
			pristine: 0.05
deepslate_gold_ore:
    type: data
	debug: false
	metals:
	    item_titan_nugget:
		    chance: 2.3
	gemstones:
	    item_geliodor:
		    crystalization: 1.1
			pristine: 0.3
	    item_onyx:
		    main_gemstone: true
			crystalization: 7
	    item_avanturin:
		    crystalization: 2.8
			pristine: 0.05
lapis_ore:
    type: data
	debug: false
	gemstones:
	    item_thopaz:
		    main_gemstone: true
			crystalization: 4
	    item_sapphire:
		    crystalization: 0.5
			pristine: 0.5
deepslate_lapis_ore:
    type: data
	debug: false
	gemstones:
	    item_thopaz:
		    main_gemstone: true
			crystalization: 4.5
	    item_sapphire:
		    crystalization: 0.6
			pristine: 0.5
redstone_ore:
    type: data
	debug: false
	gemstones:
	    item_granat:
		    main_gemstone: true
			crystalization: 3
	    item_ruby:
		    crystalization: 0.9
			pristine: 0.4
deepslate_redstone_ore:
    type: data
	debug: false
	gemstones:
	    item_granat:
		    main_gemstone: true
			crystalization: 4
	    item_ruby:
		    crystalization: 1.1
			pristine: 0.4
diamond_ore:
    type: data
	debug: false
	metals:
	    item_titan_nugget:
		    chance: 5
	gemstones:
	    item_chaorit:
		    main_gemstone: true
			crystalization: 8
		item_rodolit:
		    crystalization: 5
			pristine: 0.01
deepslate_diamond_ore:
    type: data
	debug: false
	metals:
	    item_titan_nugget:
		    chance: 5.4
	gemstones:
	    item_chaorit:
		    main_gemstone: true
			crystalization: 9
		item_rodolit:
		    crystalization: 6
			pristine: 0.01
emerald_ore:
    type: data
	debug: false
	gemstones:
	    item_malachite:
		    main_gemstone: true
			crystalization: 9
		item_aquamarine:
		    crystalization: 6
			pristine: 0.01
deepslate_emerald_ore:
    type: data
	debug: false
	gemstones:
	    item_malachite:
		    main_gemstone: true
			crystalization: 5
		item_aquamarine:
		    crystalization: 1
			pristine: 0.3