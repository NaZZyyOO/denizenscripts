custom_snowball:
    type: world
	debug: false
	events:
	    on player right clicks block with:snowball:
		  - determine passively cancelled
		  - if <player.has_flag[snowball_cd]> = false:
		    - flag <player> snowball_cd expire:2s
			- itemcooldown snowball d:2s
			- if <player.gamemode> != creative:
		      - take from:<player.inventory> snowball quantity:1
		    - if <player.is_sneaking> = true:
		      - shoot <entity[snowball].with[item=snow_block]> height:0.8 speed:0.6 save:snowball
		      - flag <entry[snowball].shot_entity> snow_block
		      - playsound <player.location> sound:ENTITY_PLAYER_ATTACK_SWEEP pitch:0.8 volume:1.2
			  - playeffect <player.location.add[0,0.5,0]> effect:sweep_attack quantity:3 offset:0.2
		    - if <player.is_sprinting> = true:
		      - shoot <entity[snowball].with[item=snow_block]> height:1.8 speed:1.6 save:snowball
		      - flag <entry[snowball].shot_entity> snow_block
			  - playsound <player.location> sound:ENTITY_PLAYER_ATTACK_SWEEP pitch:0.8 volume:1.2
			  - playeffect <player.location.add[0,0.5,0]> effect:sweep_attack quantity:3 offset:0.2
		    - if <player.is_sprinting> = false && <player.is_sneaking> = false:
		      - shoot <entity[snowball].with[item=snow_block]> height:1.2 speed:1.2 save:snowball
		      - flag <entry[snowball].shot_entity> snow_block
			  - playsound <player.location> sound:ENTITY_PLAYER_ATTACK_SWEEP pitch:0.8 volume:1.2
			  - playeffect <player.location.add[0,0.5,0]> effect:sweep_attack quantity:3 offset:0.2
		    - repeat 120:
		      - wait 2t
		      - foreach <player.location.find_entities[snowball].within[60]>:
			    - if <[value]> != null:
				  - if <[value].has_flag[snow_block]> = true:
                    - playeffect effect:FALLING_DUST special_data:snow_block <[value].location> quantity:5 offset:0.2 visibility:50
                    - rotate <[value]> yaw:20 duration:1t pitch:20				
		on player right clicks snow with:air:
		  - if <player.is_sneaking> = true:
		    - look <player> <player.precise_target_position> duration:2.4s
			- repeat 10:
			  - wait 5t
			  - playsound <player.location> sound:BLOCK_SNOW_PLACE pitch:0.1 volume:1
			  - playeffect effect:CLOUD at:<player.precise_target_position.add[0,1,0]> visibility:80 quantity:10 offset:2.0
			- wait 1.5s
		    - give snowball quantity:1 to:<player.inventory>
			- adjust <context.location> block_type:air
		on projectile hits !item_frame:
		  - if <context.projectile.has_flag[snow_block]> = true:
		    - if <context.shooter.is_player||null> = true:
			  - playeffect <context.projectile.location> effect:FALLING_DUST offset:0.8 quantity:20 visibility:80 special_data:snow_block
			  - playsound <context.projectile.location> sound:BLOCK_SNOW_PLACE pitch:0.6 volume:1
			  - foreach <context.projectile.location.find_entities[player].within[3]>:
			    - if <[value]> != null:
			      - cast SLOW a:0 d:3 <[value]>
		on projectile hits block:
		  - if <context.projectile.has_flag[snow_block]> = true:
		    - if <context.shooter.is_player> = true:
			  - if <util.random.int[0].to[100]> <= 80:
			    - if <player.location.direction> = northeast:
				  - define destination <context.projectile.location.direction.vector.add[0,0,1].mul[1.5]>
				- if <player.location.direction> = southeast:
				  - define destination <context.projectile.location.direction.vector.add[-1,0,0].mul[1.5]>
				- if <player.location.direction> = southwest:
				  - define destination <context.projectile.location.direction.vector.add[1,0,0].mul[1.5]>
				- if <player.location.direction> = northwest:
				  - define destination <context.projectile.location.direction.vector.add[0,0,1].mul[1.5]>
		          - shoot <entity[snowball].with[item=snow_block]> origin:<context.projectile> destination:<[destination]> height:0.5 speed:0.4 save:snowball
				- if <list[north|south|east|west].contains[<player.location.direction>]> = true:
				  - shoot <entity[snowball].with[item=snow_block]> origin:<context.projectile> destination:<context.shooter.location> height:0.5 speed:0.4 save:snowball
				- flag <entry[snowball].shot_entity> snow_block_2
				- repeat 70:
		          - wait 2t
		          - foreach <player.location.find_entities[snowball].within[60]>:
			        - if <[value]> != null:
				      - if <[value].has_flag[snow_block_2]> = true:
                        - playeffect effect:FALLING_DUST special_data:snow_block <[value].location> quantity:5 offset:0.2 visibility:50
                        - rotate <[value]> yaw:20 duration:1t pitch:20			
			  - else:
			    - playeffect <context.location> effect:FALLING_DUST offset:0.8 quantity:20 visibility:80 special_data:snow_block
			    - playsound <context.location> sound:BLOCK_SNOW_PLACE pitch:0.6 volume:1
			    - foreach <context.location.find_entities[player].within[3]>:
			      - if <[value]> != null:
			        - cast SLOW a:0 d:3 <[value]>