krampus_abilities:
    type: world
	debug: false
	events:
		on player damages entity:
		  - if <context.entity||null> = null:
		    - stop
		  - if <context.entity.name||null> == "<&4>Крампус":
		    - if <context.entity.has_flag[snow_storm]> = false:
			  - if <util.random.int[0].to[100]> <= 40:
			    - flag <context.entity> snow_storm expire:20s
				- repeat 5:
				  - if <context.entity||null> = null:
				    - stop
				  - wait 10t
				  - playeffect effect:SNOWFLAKE at:<context.entity.location.add[0,6,0]> quantity:700 offset:10 velocity:0,-1,0
				  - foreach <context.entity.location.find_entities[player].within[8].exclude[<context.entity>]> as:victim:
				    - cast SLOW a:5 d:4 <[victim]>
					- hurt 8 <[victim]> source:<context.entity>
				  - repeat 5:
				    - playsound <context.entity.location> sound:BLOCK_SNOW_FALL pitch:2 volume:1
			- if <util.random.int[0].to[100]> <= 60:
			  - repeat 10:
			    - if <context.entity||null> = null:
				  - stop
			    - define loc <context.damager.location.add[0,3,0].random_offset[5,2,5]>
				- if <[loc].material> != air:
			      - teleport <context.entity> <[loc]>
			      - playsound <context.entity.location> sound:ENTITY_WITHER_HURT pitch:0.5 volume:1
				  - repeat stop
			- if <context.entity.has_flag[summoning_wave]> = false:
			  - if <context.entity.health_percentage> < 75:
			    - if <util.random.int[0].to[100]> <= 20: 
				  - flag <context.entity> summoning_wave expire:25s
			      - repeat 5:
				    - if <context.entity||null> = null:
				      - stop
				    - wait 10t
				    - define loc <context.damager.location.add[0,3,0].random_offset[5,2,5]>
				    - mythicspawn <[loc]> disobedience
					- playeffect at:<[loc]> effect:CAMPFIRE_SIGNAL_SMOKE quantity:100 offset:2
					- playsound <[loc]> sound:PARTICLE_SOUL_ESCAPE pitch:0.6 volume:10
			      - narrate "<&7><&o>Злобный смех Крампуса вызывает страх..."
		  - if <context.damager||null> = null:
			- stop
		  - if <context.damager.name||null> == "<&4>Крампус":
		    - if <util.random.int[0].to[100]> <= 50:
			  - adjust <context.damager> velocity:<context.damager.location.direction.vector.mul[1.2]>
			- if <util.random.int[0].to[100]> <= 25:
			  - adjust <context.entity> velocity:<context.entity.location.direction.vector.mul[-1.2]>
		on entity damaged by SUFFOCATION:
		  - if <context.entity.name||null> == "<&4>Крампус":
		    - define loc <context.entity.location.add[0,1,0].random_offset[5,2,5]>
			- teleport <[loc]> <context.entity>
		on mythicmob krampus spawns:
		  - flag <context.entity> raid_boss