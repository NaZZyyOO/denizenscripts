krampus_abilities:
    type: world
	debug: false
	events:
	    on player damages entity:
		  - if <context.entity.name> == "<&4>Крампус":
		    - if <context.entity.has_flag[teleport_storm]> = false:
		      - repeat 10:
			    - wait 2s
			    - define loc <player.location.random_offset[5,5,5]>
				- flag <context.entity> teleport_storm expire:40s
			    - if <[loc].material> = air:
			      - teleport <context.entity> <[loc]>
				  - define ray <player.location.points_between[<context.entity>].distance[0.5]>
				  - foreach <[ray]>:
				    - wait 1t
					- playeffect at:<[value]> effect:REDSTONE special_data:1.2|black quantity:50 offset:0.1
					- if <util.random.int[0].to[100]> <= 20:
					  - foreach <[value].find.living_entities.within[2]> as:victim:
					    - if <[victim]> != <context.entity>:
					      - hurt 3 <[victim]> source:<context.entity> cause:magic
				- adjust <context.entity> gravity:false
			  - adjust <context.entity> gravity:true
		on player damages entity:
		  - if <context.entity.name> == "<&4>Крампус":
			- if <context.entity.has_flag[summoning_wave]> = false:
			  - if <util.random.int[0].to[100]> <= 20:
			    - if <context.entity.health_percentage> <= 75 || <context.entity.health_percentage> <= 25:
				  - flag <context.entity> summoning_wave expire:30s
			      - repeat 10:
				    - define loc <player.location.random_offset[5,5,5]>
				    - if <[loc].material> = air:
				      - mythicspawn <[loc]> disobedience
					  - playeffect at:<[loc]> effect:CAMPFIRE_SIGNAL_SMOKE quantity:300 offset:2
					  - narrate "<&7><&o>Злобный смех Крампуса вызывает страх..."
		on player damages entity:
		  - if <context.entity.name> == "<&4>Крампус":
		    - if <context.entity.has_flag[snow_storm]> = false:
			  - if <util.random.int[0].to[100]> <= 10:
			    - flag <context.entity> snow_storm expire:20s
				- repeat 5:
				  - wait 10t
				  - playeffect effect:SNOWFLAKE at:<context.entity.location.add[0,6,0]> quantity:1000 offset:10 velocity:0,-1,0
				  - foreach <context.entity.location.find.living_entities.within[10].exclude[<context.entity>]> as:victim:
				    - cast SLOW a:5 d:4 <[victim]>
					- hurt 4 <[victim]> source:<context.entity> cause:FREZEE