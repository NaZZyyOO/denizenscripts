arena_region_add:
    debug: false
    type: task
    script:
	- note <location[8000,74,8002,ocean]> as:ArenaCenter
	- note <location[7995,74,7983,ocean]> as:ArenaEntry1
	- note <location[8005,74,7983,ocean]> as:ArenaEntry2
	- note <cuboid[cu@ocean,7972,91,8061,8030,68,7976]> as:ArenaBandit
	- note <cuboid[cu@ocean,8014,82,8016,7985,67,7987]> as:ArenaBandit01
	- note <cuboid[cu@ocean,8009,83,8039,7991,71,8053]> as:ArenaBanditBoss
arena_mob_gladiator_spawn:
    debug: false
    type: task
    definitions: coord
    script:
      - define mobtype <util.random.int[0].to[3]>
      - if <[mobtype]> = 0:
        - mythicspawn arena_gladiator_dematar <[coord]>
      - if <[mobtype]> = 1:
        - mythicspawn arena_gladiator_retriarchy <[coord]>
	  - if <[mobtype]> = 2:
        - mythicspawn arena_gladiator_murmilliot <[coord]>
      - if <[mobtype]> = 3:
        - mythicspawn arena_gladiator_bestyary <[coord]>
arena_mob_spawn_position:
    type: task
	debug: false
	script:
	  - define position <util.random.int[0].to[1]>
	  - if <[position]> = 0:
	    - mythicspawn arena_wizard <location[7985,69,8014,ocean]>
		- mythicspawn arena_wizard <location[7986,69,7991,ocean]>
		- mythicspawn arena_wizard <location[8015,69,7990,ocean]>
		- mythicspawn arena_wizard <location[8015,69,8014,ocean]>
		- mythicspawn arena_piglin_axes <location[8017,69,8006,ocean]>
		- mythicspawn arena_piglin_axes <location[8017,69,7998,ocean]>
		- mythicspawn arena_piglin_axes <location[7982,69,7998,ocean]>
		- mythicspawn arena_piglin_axes <location[7982,69,8006,ocean]>
		- mythicspawn arena_piglin_swordes <location[8002,75,8034,ocean]>
		- mythicspawn arena_piglin_swordes <location[7998,75,8034,ocean]>
		- run arena_mob_gladiator_spawn def:<element[7993,69,8005,ocean]>
		- run arena_mob_gladiator_spawn def:<element[8004,69,8003,ocean]>
		- run arena_mob_gladiator_spawn def:<element[7990,69,7997,ocean]>
		- run arena_mob_gladiator_spawn def:<element[8002,69,7993,ocean]>
		- run arena_mob_gladiator_spawn def:<element[8010,69,7996,ocean]>
	  - if <[position]> = 1:
	    - mythicspawn arena_piglin_bow <location[7985,69,8014,ocean]>
		- mythicspawn arena_piglin_bow <location[7985,69,7990,ocean]>
		- mythicspawn arena_piglin_bow <location[8015,69,7990,ocean]>
		- mythicspawn arena_piglin_bow <location[8015,69,8014,ocean]>
		- mythicspawn arena_piglin_crossbow <location[8018,69,8006,ocean]>
		- mythicspawn arena_piglin_crossbow <location[8018,69,7998,ocean]>
		- mythicspawn arena_piglin_crossbow <location[7982,69,7998,ocean]>
		- mythicspawn arena_piglin_crossbow <location[7982,69,8006,ocean]>
		- mythicspawn arena_wizard <location[7993,75,8031,ocean]>
		- mythicspawn arena_wizard <location[8009,75,8031,ocean]>
		- mythicspawn arena_piglin_axes <location[8002,75,8034,ocean]>
		- mythicspawn arena_piglin_axes <location[7998,75,8034,ocean]>
		- run arena_mob_gladiator_spawn def:<element[7993,69,8005,ocean]>
		- run arena_mob_gladiator_spawn def:<element[8004,69,8003,ocean]>
		- run arena_mob_gladiator_spawn def:<element[7990,69,7997,ocean]>
		- run arena_mob_gladiator_spawn def:<element[8010,69,7996,ocean]>
ArenaBandit_activate:
    type: world
    debug: false
    events:
        on player enters ArenaBandit01:
          - if <player.world> = w@ocean:
            - if <server.has_flag[arena_bandit01]> = false:
              - flag server arena_bandit01 duration:300s
			  - inject arena_mob_spawn_position
			  - mythicspawn arena_lanista_teobald <location[8000,69,7988,ocean]>
			  - mythicspawn arena_viewer <location[8011,75.5,8026,ocean]>
			  - mythicspawn arena_viewer <location[8014,75.5,8030,ocean]>
			  - mythicspawn arena_viewer <location[7996,75.5,8028,ocean]>
			  - mythicspawn arena_viewer <location[7990,75.5,8032,ocean]>
			  - repeat 3:
			    - playsound <player.location> sound:BLOCK_BELL_USE pitch:1.2 volume:1
				- wait 0.4
				- playsound <player.location> sound:BLOCK_BELL_USE pitch:1.2 volume:1
            - else:
              - actionbar "<&6><&l>Кто-то уже был здесь. <server.flag[arena_bandit01].expiration.formatted>"
ArenaBanditBoss_activate:
    type: world
    debug: false
    events:
        on player enters ArenaBanditBoss:
          - if <player.world> = w@ocean:
            - if <server.has_flag[arena_bandit_boss]> = false:
              - flag server arena_bandit_boss duration:300s
			  - mythicspawn arena_gubernator_septimiy <location[8000,75.5,8045,ocean]>
            - else:
              - actionbar "<&6><&l>Кто-то уже был здесь. <server.flag[arena_bandit_boss].expiration.formatted>"
arena_bandit_exit:
    type: world
    debug: false
    events:
        on player enters ArenaBandit:
          - if <player.world> = w@ocean:
            - teleport <player> BanditArena
		on player joins in:ArenaBandit01:
		  - teleport <player> BanditArena
arena_wizard_fireball:
    type: world
	debug: false
	events:
	    on player damages vindicator:
		  - if <context.entity.name||null> == "<&6>Чародей":
			- if <context.damager.gamemode> = survival:
			  - if <context.entity.has_flag[fireball_cd]> = false:
				- flag <context.entity> fireball_cd duration:20s
                - define start <context.damager.location.add[0.0,6.0,3.0]||null>
                - define end <context.damager.location||null>
                - if <[start]> != null && <[end]> != null:
                  - define ray <[start].points_between[<[end]>].distance[0.4]>
                  - foreach <[ray]>:
                    - wait 1t
                    - playeffect effect:REDSTONE quantity:20 offset:0.05 at:<[value]> special_data:1.3|orange visibility:50
                    - playeffect effect:FLAME quantity:20 offset:0.05 at:<[value]> visibility:50
                    - playeffect effect:CAMPFIRE_COSY_SMOKE at:<[value]> quantity:3 offset:0.5,0.5,0.5 visibility:50 velocity:0.0,-0.01,0.0
                  - playeffect effect:EXPLOSION_LARGE quantity:10 at:<[end]> visibility:50
                  - playeffect effect:LAVA quantity:100 at:<[end]> visibility:50
                  - playsound <[end]> sound:ENTITY_GENERIC_EXPLODE volume:1.5
                  - define steprange <element[0.7]>
				  - define radius <element[1.2]>
                  - define count <[radius].div[<[steprange]>].round>
                  - define range <element[2.4]>
                  - define damaged <[end].find.living_entities.within[3]>
                  - foreach <[damaged]> as:victim:
                    - if <[victim].is_player||null> = true:
				      - if <[victim].gamemode> = survival:
                        - hurt 10 <[victim]>
                        - burn <[victim]> duration:5s
                    - wait 1t
                    - define range <[range].add[<[steprange]>]>
                    - define frequency <element[80]>
                    - define circle <element[360]>
                    - define step <[circle].div[<[frequency]>].round>
                    - define angle <element[0]>
                    - repeat <[frequency]>:
                      - define cosx <[angle].cos>
                      - define sinx <[angle].sin>
                      - define x <[range].mul[<[cosx]>]>
                      - define y <[range].mul[<[sinx]>]>
                      - define angle <[angle].add[<[step]>]>
                      - define xy <[end].add[<[x]>,0.0,<[y]>]>
                      - playeffect effect:FLAME quantity:1 offset:0.1 at:<[xy]> visibility:20
                      - playeffect effect:CAMPFIRE_COSY_SMOKE at:<[xy]> quantity:1 offset:1.5,1.5,1.5 visibility:50 velocity:0.0,<util.random.decimal[0.0].to[0.025]>,0.0
arena_wizard_attack:
    type: world
	debug: false
	events:
	    on player damages vindicator:
          - if <context.entity.name||null> == "<&6>Чародей":
			- if <context.damager.gamemode> = survival:
			  - define target <context.entity.precise_target[8]||null>
			  - if <[target]> != null:
                - if <context.entity.has_flag[wizard_fire_charge_cd]> = false && <context.entity.health> > 1:
				  - flag <context.entity> wizard_fire_charge_cd expire:12s
				  - define start <context.entity.location.add[0,1.5,0]>
				  - define end <context.damager.location>
				  - define ray <[start].points_between[<[end]>].distance[0.8]>
				  - foreach <[ray]>:
				    - wait 1t
					- playeffect effect:FLAME quantity:20 offset:0.05 at:<[value]> visibility:50
				  - define damaged <[end].find.living_entities.within[3]>
                  - foreach <[damaged]> as:victim:
                    - if <[victim].is_player||null> = true:
				      - if <[victim].gamemode> = survival:
                        - hurt 10 <[victim]>
                        - burn <[victim]> duration:5s
arena_dematar_attack:
    type: world
	debug: false
	events:
	    on player damages piglin_brute:
          - if <context.entity.name||null> == "<&5>Дематар":
			- if <context.damager.gamemode> = survival:
			  - define target <context.entity.precise_target[5]||null>
			  - if <[target]> != null:
				- if <context.entity.has_flag[sand_shot_cd]> = false:
                  - define start <context.entity.location.add[0,1.3,0]||null>
				  - flag <context.entity> sand_shot_cd expire:13s
                  - playsound <[start]> sound:BLOCK_SAND_HIT pitch:1.3 volume:1
				  - shoot <entity[snowball].with[item=sand]> origin:<context.entity> speed:0.7 height:3 save:sand
			      - flag <entry[sand].shot_entity> sand_particle
				  - repeat 30:
		            - wait 2t
		            - foreach <player.location.find_entities[snowball].within[60]>:
			          - if <[value]> != null:
				        - if <[value].has_flag[sand_particle]> = true:
                          - playeffect effect:BLOCK_CRACK quantity:20 offset:0.36 at:<[value].location> special_data:sand visibility:50			  
				  - if <[hit_entities]||null> != null:
				    - hurt <[hit_entities]> 6
                    - cast BLINDNESS a:0 d:3s <[hit_entities]>
arena_murmilliot_push:
    type: world
	debug: false
	events:
		on player damages piglin_brute:
		  - if <context.entity.name||null> == "<&5>Мурмиллиот":
			- if <context.damager.is_player||null> = true:
			  - if <context.damager.gamemode> = survival:
			    - if <context.entity.has_flag[murmuliot_cd]> = false:
				  - flag <context.entity> murmuliot_cd expire:10s
				  - push <context.damager> origin:<context.entity> destination:<context.damager.location.add[0,3,0]> no_rotate
				  - repeat 3:
				    - playsound sound:ENTITY_PIGLIN_BRUTE_DEATH pitch:0.3 volume:10 <context.entity.location>
arena_retiarchy_attack:
    type: world
    debug: false
    events:
        on player damages husk:
          - if <context.entity.name||null> == "<&5>Ретиархий":
            - if <context.damager.gamemode> = survival:
              - if <context.entity.has_flag[trident_cd]> = false:
                - flag <context.entity> trident_cd duration:5s
                - shoot TRIDENT origin:<context.entity> speed:2 height:3
arena_retiarchy_jail:
    type: world
	debug: false
	events:
	    on player damages husk:
		  - if <context.entity.name||null> == "<&5>Ретиархий":
		    - if <context.damager.gamemode> = survival:
			  - define loc <context.entity.precise_target_position[8].add[0.0,0.5,0.0]||null>
			  - if <[loc]> != null:
				- if <context.entity.has_flag[jail_cd]> = false:
				  - flag <context.entity> jail_cd duration:20s
                  - define start <[loc].add[0.0,6.0,3.0]||null>
                  - define end <[loc]||null>
                  - if <[start]> != null && <[end]> != null:
                    - define ray <[start].points_between[<[end]>].distance[0.4]>
                    - foreach <[ray]>:
                      - wait 1t
                      - playeffect effect:REDSTONE quantity:20 offset:0.05 at:<[value]> special_data:1.3|gray visibility:50
                      - playeffect effect:REDSTONE special_data:1.5|gray quantity:20 offset:0.05 at:<[value]> visibility:50
                      - playeffect effect:REDSTONE special_data:1.5|gray at:<[value]> quantity:3 offset:0.5,0.5,0.5 visibility:50 velocity:0.0,-0.01,0.0
                    - playeffect at:<[end]> effect:REDSTONE special_data:1.5|gray  quantity:10
                    - playeffect at:<[end]> effect:REDSTONE special_data:1.5|gray offset:0.05 quantity:100
                    - define steprange <element[0.7]>
				    - define radius <element[1.2]>
                    - define count <[radius].div[<[steprange]>].round>
                    - define range <element[0.0]>
                    - define damaged <[loc].find.living_entities.within[5]>
                    - foreach <[damaged]> as:victim:
                      - if <[victim]> != <context.entity>:
                        - cast SLOW <[victim]> d:6 a:3 hide_particles
                        - cast WEAKNESS <[victim]> d:6 a:0 hide_particles
                      - repeat <[count]>:
                        - wait 1t
                        - define range <[range].add[<[steprange]>]>
                        - define frequency <element[80]>
                        - define circle <element[360]>
                        - define step <[circle].div[<[frequency]>].round>
                        - define angle <element[0]>
                        - repeat <[frequency]>:
                          - define cosx <[angle].cos>
                          - define sinx <[angle].sin>
                          - define x <[range].mul[<[cosx]>]>
                          - define y <[range].mul[<[sinx]>]>
                          - define angle <[angle].add[<[step]>]>
                          - define xy <[loc].add[<[x]>,0.0,<[y]>]>
                          - playeffect effect:REDSTONE special_data:1.5|gray quantity:1 offset:0.1 at:<[xy]> visibility:20
                          - playeffect effect:REDSTONE at:<[xy]> special_data:1.5|gray quantity:1 offset:1.5,1.5,1.5 visibility:50 velocity:0.0,<util.random.decimal[0.0].to[0.025]>,0.0
arena_bestiary_mob_spawn:
    type: world
	debug: false
	events: 
	    on player damages skeleton:
		  - if <context.entity.world||null> = w@ocean:
		    - if <context.entity.name||null> == "<&5>Бестиарий":
              - if <context.entity.has_flag[arena_bestiary_mob_spawn_cooldown]> = false:
                - flag <context.entity> arena_bestiary_mob_spawn_cooldown duration:10s
		        - wait 1.5
	            - execute as_server "mm m spawn amber_wolf 1 ocean,8004,69,8004" silent
			    - execute as_server "mm m spawn amber_boar 1 ocean,7996,69,8004" silent
arena_lanista_teobald_attack:
    type: world
	debug: false
	events:
	    on player damages skeleton:
		  - if <context.entity.name||null> == "<&5>Ланиста Теобальд":
			- if <context.damager.is_player||null> = true:
			  - if <context.damager.gamemode> = survival:
			    - if <context.entity.has_flag[fire_attack_cd]> = false:
				  - flag <context.entity> fire_attack_cd expire:13s
				  - flag <context.damager> fire_attack expire:6s
			      - hurt <context.damager> 5
				  - burn <context.damager> duration:5s
				  - repeat 20:
		            - wait 2t
			        - if <context.damager> != null:
				      - if <context.damager.has_flag[fire_attack]> = true:
                        - playeffect effect:FLAME quantity:4 offset:0.09 at:<context.damager.location.add[0,2,0]> visibility:50 
arena_gubernator_semtimiy_teleport:
    type: world
	debug: false
	events:
	    on player damages piglin:
		  - if <context.entity.name||null> == "<&5>Губернатор Септимий":
			- if <context.damager.gamemode> = survival:
			  - if <context.entity.has_flag[tp_cd]> = false:
				- flag <context.entity> tp_cd duration:8s
				- teleport <context.entity> <context.damager.location>
			    - cast <context.damager> BLINDNESS a:0 d:6
				- cast <context.damager> CONFUSION a:0 d:6
arena_check_mob:
    type: world
	debug: false
	events:
	    on delta time secondly every:20:
		  - if <server.has_flag[arena_bandit01]> = true:
		    - define entities <location[8000,74,7984,ocean].find.living_entities.within[10]>
		    - if <[entities].size||null> = 1:
		      - if <[entities]> != player:
		        - foreach <[entities]>:
		          - modifyblock AIR <location[ArenaEntry1]>
				  - modifyblock AIR <location[ArenaEntry2]>
	              - wait 15
	              - modifyblock BARRIER <location[ArenaEntry1]>
				  - modifyblock BARRIER <location[ArenaEntry2]>