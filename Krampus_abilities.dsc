krampus_abilities:
    type: world
	debug: false
	events:
		on entity damages entity:
		  - if <context.entity.name> == "<&4>Крампус":
		    - if <context.entity.has_flag[snow_storm]> = false:
			  - if <util.random.int[0].to[100]> <= 10:
			    - flag <context.entity> snow_storm expire:20s
				- repeat 5:
				  - wait 10t
				  - playeffect effect:SNOWFLAKE at:<context.entity.location.add[0,6,0]> quantity:1000 offset:10 velocity:0,-1,0
				  - foreach <context.entity.location.find.living_entities.within[10].exclude[<context.entity>]> as:victim:
				    - cast SLOW a:5 d:4 <[victim]>
					- hurt 4 <[victim]> source:<context.entity>
			- if <context.entity.has_flag[teleport_storm]> = false:
			  - adjust <context.entity> gravity:false
			  - flag <context.entity> teleport_storm expire:40s
		      - repeat 10:
			    - wait 2s
			    - define loc <context.damager.location.add[0,5,0].random_offset[5,5,5]>
			    - teleport <context.entity> <[loc]>
			    - define ray <context.entity.location.add[0,1.3,0].points_between[<context.damager.location.add[0,1.3,0]>].distance[0.5]>
				- foreach <[ray]>:
				  - wait 1t
			      - playeffect at:<[value]> effect:REDSTONE special_data:1.2|black quantity:50 offset:0.1
				- foreach <[value].find.living_entities.within[2]> as:victim:
			      - if <[victim]> != <context.entity>:
				    - hurt 3 <[victim]> source:<context.entity> cause:magic
			  - adjust <context.entity> gravity:true
			- if <context.entity.has_flag[summoning_wave]> = false:
			  - if <context.entity.health_percentage> < 75:
			    - if <util.random.int[0].to[100]> <= 20: 
				  - flag <context.entity> summoning_wave expire:30s
			      - repeat 10:
				    - define loc <context.damager.location.add[0,5,0].random_offset[5,5,5]>
				    - mythicspawn <[loc]> disobedience
					- playeffect at:<[loc]> effect:CAMPFIRE_SIGNAL_SMOKE quantity:300 offset:2
					- narrate "<&7><&o>Злобный смех Крампуса вызывает страх..."