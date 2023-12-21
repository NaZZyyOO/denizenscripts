krampus_abilities:
    type: world
	debug: false
	events:
		on entity damages entity:
		  - if <context.entity.name> == "<&4>Крампус":
		    - if <context.entity.has_flag[snow_storm]> = false:
			  - if <util.random.int[0].to[100]> <= 40:
			    - flag <context.entity> snow_storm expire:20s
				- repeat 5:
				  - wait 10t
				  - playeffect effect:SNOWFLAKE at:<context.entity.location.add[0,6,0]> quantity:700 offset:10 velocity:0,-1,0
				  - foreach <context.entity.location.find.living_entities.within[10].exclude[<context.entity>]> as:victim:
				    - cast SLOW a:5 d:4 <[victim]>
					- hurt 4 <[victim]> source:<context.entity>
				  - repeat 5:
				    - playsound <context.entity.location> sound:BLOCK_SNOW_FALL pitch:2 volume:1
			- if <context.entity.has_flag[teleport_storm]> = false:
			  - adjust <context.entity> gravity:false
			  - flag <context.entity> teleport_storm expire:40s
		      - repeat 10:
			    - wait 10t
			    - define loc <context.damager.location.add[0,3,0].random_offset[5,2,5]>
			    - teleport <context.entity> <[loc]>
			    - define ray <context.entity.location.add[0,1.3,0].points_between[<context.damager.location.add[0,1.3,0]>].distance[0.5]>
				- foreach <[ray]>:
				  - wait 1t
			      - playeffect at:<[value]> effect:REDSTONE special_data:1.2|black quantity:50 offset:0.1
				  - foreach <[value].location.find.living_entities.within[0.3]> as:victim:
				    - if <[victim]> != null:
			          - if <[victim]> != <context.entity>:
				        - hurt 3 <[victim]> source:<context.entity> cause:magic
			  - playsound <player.location> sound:ENTITY_ZOMBIE_INFECT pitch:1.5 volume:1
			  - adjust <context.entity> gravity:true
			- if <context.entity.has_flag[summoning_wave]> = false:
			  - if <context.entity.health_percentage> < 75:
			    - if <util.random.int[0].to[100]> <= 20: 
				  - flag <context.entity> summoning_wave expire:30s
			      - repeat 10:
				    - wait 10t
				    - define loc <context.damager.location.add[0,3,0].random_offset[5,2,5]>
				    - mythicspawn <[loc]> disobedience
					- playeffect at:<[loc]> effect:CAMPFIRE_SIGNAL_SMOKE quantity:100 offset:2
					- playsound <[loc]> sound:PARTICLE_SOUL_ESCAPE pitch:0.6 volume:10
			      - narrate "<&7><&o>Злобный смех Крампуса вызывает страх..."