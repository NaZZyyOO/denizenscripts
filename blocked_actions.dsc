actions_blocked:
    type: world
	debug: false
	events:
	    on player changes gamemode:
		  - if <player.has_permission[server.admin]> = false:
		    - if <player.world.name> = WEALTH_THE_END || <player.world.name> = WEALTH_NETHER || <player.world.name> = OCEAN:
			  - if <player.gamemode> = survival:
		        - determine passively cancelled
		on god command:
		  - if <context.source_type> = PLAYER: 
		    - if <player.has_permission[server.admin]> = false: 
		      - if <player.world.name> = WEALTH_THE_END || <player.world.name> = WEALTH_NETHER || <player.world.name> = OCEAN:
			    - if <player.god_mode> = false:
		          - determine passively cancelled
		on fly command:
		  - if <context.source_type> = PLAYER: 
		    - if <player.has_permission[server.admin]> = false:
		      - if <player.world.name> = WEALTH_THE_END || <player.world.name> = WEALTH_NETHER || <player.world.name> = OCEAN:
			    - if <player.can_fly> = false:
		          - determine passively cancelled
		on pa command:
		  - if <context.source_type> = PLAYER: 
		    - if <context.args.contains[spectate]> = true:
		      - determine passively cancelled
	    on player fishes item bukkit_priority:highest:
		  - if <player.worldguard.test_flag[mob-spawning]> = false:
		    - determine passively cancelled
			- remove <context.hook>
			- actionbar "<&6><&l>Вы не можете рыбачить в данном привате."
		on player damages player:
		  - if <context.damager.name> = lerod_2 || <context.damager.name> = leord_2:
		    - if <context.damager.world.name> = ocean || <context.damager.world.name> = amber:
		      - execute as_server silent "kill <context.damager.name>"
changes_world:
    type: world
	debug: false
	events:
	    on player changes world:
		  - if <player.has_permission[server.admin]> = false:
		    - adjust <player> god_mode:false
			- adjust <player> can_fly:false
		on player changes world:
		  - if <player.has_permission[server.admin]> = false:
		    - if <player.gamemode> = creative:
		      - adjust <player> gamemode:survival
blocked_item_in_server_region:
    type: world
	debug: false
	events:
	    on player right clicks block:
		  - if <player.location.in_region> = true:
		    - if <player.worldguard.test_flag[pvp]> = false:
			  - if <player.item_in_hand.script.name.is[==].to[item_christmas_sword]||false> = true:
			    - determine passively cancelled
			  - else if <player.item_in_hand.script.name.is[==].to[item_arena_gladiator_axe]||false> = true:
			    - determine passively cancelled
		      - else if <player.item_in_hand.script.name.is[==].to[item_iron_axe_01]||false> = true:
			    - determine passively cancelled
		      - else if <player.item_in_hand.script.name.is[==].to[item_iron_axe_02]||false> = true:
			    - determine passively cancelled
		      - else if <player.item_in_hand.script.name.is[==].to[item_iron_axe_03]||false> = true:
			    - determine passively cancelled
		      - else if <player.item_in_hand.script.name.is[==].to[item_iron_axe_04]||false> = true:
			    - determine passively cancelled