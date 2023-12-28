krampus_abilities:
    type: world
	debug: false
	events:
		on player damages entity:
		  - if <context.entity> != null:
		    - if <context.entity.name||null> == "<&4>Крампус":
		      - if <context.entity.has_flag[snow_storm]> = false:
			    - if <util.random.int[0].to[100]> <= 40:
			      - flag <context.entity> snow_storm expire:20s
				  - repeat 5:
				    - wait 10t
				    - playeffect effect:SNOWFLAKE at:<context.entity.location.add[0,6,0]> quantity:700 offset:10 velocity:0,-1,0
				    - foreach <context.entity.location.find.living_entities.within[8].exclude[<context.entity>]> as:victim:
				      - cast SLOW a:5 d:4 <[victim]>
					  - hurt 8 <[victim]> source:<context.entity>
				    - repeat 5:
				      - playsound <context.entity.location> sound:BLOCK_SNOW_FALL pitch:2 volume:1
		on player damages entity:
		  - if <context.entity> != null:
		    - if <context.entity.name||null> == "<&4>Крампус":
		  	  - if <util.random.int[0].to[100]> <= 60:
			    - repeat 10:
			      - if <context.entity> = null:
				    - stop
			      - define loc <context.damager.location.add[0,3,0].random_offset[5,2,5]>
				  - if <[loc].material> != air:
			        - teleport <context.entity> <[loc]>
			        - playsound <context.entity.location> sound:ENTITY_WITHER_HURT pitch:0.5 volume:1
				    - repeat stop
		on player damages entity:
		  - if <context.entity> != null:
		    - if <context.entity.name||null> == "<&4>Крампус":
			  - if <context.entity.has_flag[teleport_storm]> = false:
			    - if <util.random.int[0].to[100]> <= 30:
			      - if <context.entity> = null:
                    - stop
			      - define player <list[]>
			      - adjust <context.entity> gravity:false
			      - define players <context.entity.location.find_entities[player].within[10].exclude[<context.entity>]>
		          - define player <[player].include[<[players].first>]>
		          - repeat 3:
				    - if <context.entity> = null:
				      - stop
			        - wait 1s
			        - define loc <[player].get[1].location.add[0,3,0].random_offset[5,2,5]>
			        - teleport <context.entity> <[loc]>
				    - playsound <context.entity.location> sound:ENTITY_WITHER_HURT pitch:0.5 volume:1
			        - define ray <context.entity.location.add[0,1.3,0].points_between[<[player].get[1].location.add[0,1.3,0]>].distance[0.5]>
				    - foreach <[ray]>:
			          - playeffect at:<[value]> effect:REDSTONE special_data:1.2|black quantity:50 offset:0.1
				      - foreach <[value].find.living_entities.within[0.3]> as:victim:
				        - if <[victim]> != null:
			              - if <[victim]> != <context.entity>:
				            - hurt 6 <[victim]> source:<context.entity> cause:magic
					        - playsound <[victim].location> sound:ENTITY_ZOMBIE_INFECT pitch:1.5 volume:1
			      - flag <context.entity> teleport_storm expire:20s
			      - adjust <context.entity> gravity:true
		on player damages entity:
		  - if <context.entity> != null:
		    - if <context.entity.name||null> == "<&4>Крампус":
			  - if <context.entity.has_flag[summoning_wave]> = false:
			    - if <context.entity.health_percentage> < 75:
			      - if <util.random.int[0].to[100]> <= 20: 
				    - flag <context.entity> summoning_wave expire:25s
			        - repeat 5:
				      - if <context.entity> = null:
				        - stop
				      - wait 10t
				      - define loc <context.damager.location.add[0,3,0].random_offset[5,2,5]>
				      - mythicspawn <[loc]> disobedience
					  - playeffect at:<[loc]> effect:CAMPFIRE_SIGNAL_SMOKE quantity:100 offset:2
					  - playsound <[loc]> sound:PARTICLE_SOUL_ESCAPE pitch:0.6 volume:10
			        - narrate "<&7><&o>Злобный смех Крампуса вызывает страх..."
	    on player damages entity:
		  - if <context.damager> != null:
		    - if <context.damager.name||null> == "<&4>Крампус":
		      - if <util.random.int[0].to[100]> <= 50:
			    - adjust <context.damager> velocity:<context.damager.location.direction.vector.mul[1.2]>
			  - if <util.random.int[0].to[100]> <= 25:
			    - adjust <context.entity> velocity:<context.entity.location.direction.vector.mul[-1.2]>
		on entity damaged by SUFFOCATION:
		  - if <context.entity> != null:
		    - if <context.entity.name||null> == "<&4>Крампус":
		      - define loc <context.entity.location.add[0,1,0].random_offset[5,2,5]>
			  - teleport <[loc]> <context.entity>
		on mythicmob krampus spawns:
		  - flag <context.entity> raid_boss