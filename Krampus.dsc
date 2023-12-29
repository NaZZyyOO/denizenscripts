krampus_abilities:
    type: world
	debug: false
	events:
		on entity damages entity:
		  - if <context.final_damage> < <context.entity.health.round> && <context.entity.name||null> == "<&4>Крампус":
		    # Снігопад
		    - if <context.entity.has_flag[snow_storm]> = false:
			  - if <util.random.int[0].to[100]> <= 40:
				- repeat 5:
				  - if <context.entity.location||null> != null:
				    - wait 10t
				    - playeffect effect:SNOWFLAKE at:<context.entity.location.add[0,6,0]> quantity:700 offset:10 velocity:0,-1,0
				    - foreach <context.entity.location.find_entities[player].within[8]> as:victim:
				      - cast SLOW a:5 d:4 <[victim]>
					  - hurt 8 <[victim]> source:<context.entity>
				    - repeat 5:
				      - playsound <context.entity.location> sound:BLOCK_SNOW_FALL pitch:2 volume:1
				    - flag <context.entity> snow_storm expire:20s
			# Телепортація навколо гравця
			- if <util.random.int[0].to[100]> <= 60:
			  - repeat 10:
			    - if <context.entity.location||null> != null:
			      - define loc <context.damager.location.add[0,3,0].random_offset[5,2,5]>
				  - if <[loc].material> != air:
			        - teleport <context.entity> <[loc]>
			        - playsound <context.entity.location> sound:ENTITY_WITHER_HURT pitch:0.5 volume:1
				    - repeat stop
			# Телепортаційний шторм 
			- if <context.entity.has_flag[teleport_storm]> = false:
			  - if <util.random.int[0].to[100]> <= 30:
			    - if <context.entity.location||null> != null:
			      - define player <list[]>
			      - adjust <context.entity> gravity:false
			      - define players <context.entity.location.find_entities[player].within[10]>
				  - if <[players].size> > 0:
		            - define player <[player].include[<[players].first.name>]>
		            - repeat 3:
				      - if <context.entity||null> = null:
				        - stop
			          - wait 1s
			          - define loc <player[<[player].get[1]>].location.add[0,3,0].random_offset[5,2,5]>
			          - teleport <context.entity> <[loc]>
				      - playsound <context.entity.location> sound:ENTITY_WITHER_HURT pitch:0.5 volume:1
			          - define ray <context.entity.location.add[0,1.3,0].points_between[<player[<[player].get[1]>].location>].distance[0.5]>
				      - foreach <[ray]>:
			            - playeffect at:<[value]> effect:REDSTONE special_data:1.2|black quantity:50 offset:0.1
				      - playsound <context.damager.location> sound:ENTITY_WITHER_SHOOT volume:0.5 pitch:0.6
					  - foreach <player[<[player].get[1]>].location.find_entities[player].within[0.8]> as:victim:
				        - if <[victim]||null> != null:
				          - hurt 6 <[victim]> source:<context.entity> cause:magic
			        - flag <context.entity> teleport_storm expire:20s
			        - adjust <context.entity> gravity:true
			# Виклик непослухів
			- if <context.entity.has_flag[summoning_wave]> = false:
			  - if <context.entity.health_percentage> < 75:
			    - if <util.random.int[0].to[100]> <= 20: 
				  - flag <context.entity> summoning_wave expire:25s
			      - repeat 5:
				    - wait 10t
				    - define loc <context.damager.location.add[0,3,0].random_offset[5,0,5]>
				    - mythicspawn <[loc]> disobedience
					- playeffect at:<[loc]> effect:CAMPFIRE_SIGNAL_SMOKE quantity:100 offset:2
					- playsound <[loc]> sound:PARTICLE_SOUL_ESCAPE pitch:0.6 volume:10
			      - narrate "<&7><&o>Злобный смех Крампуса вызывает страх..."
		  # Відкидання Крампуса або гравця
		  - if <context.damager.name||null> == "<&4>Крампус":
		    - if <util.random.int[0].to[100]> <= 50:
			  - adjust <context.damager> velocity:<context.damager.location.direction.vector.mul[1.2]>
			- if <util.random.int[0].to[100]> <= 25:
		      - playsound <context.entity.location> sound:ENTITY_WITHER_BREAK_BLOCK volume:0.5 pitch:0.6
			  - adjust <context.entity> velocity:<context.entity.location.direction.vector.mul[-1.2]>
		on entity damaged by SUFFOCATION:
		  - if <context.entity.name||null> == "<&4>Крампус":
		    - define loc <context.entity.location.add[0,1,0].random_offset[5,2,5]>
			- teleport <[loc]> <context.entity>
		on mythicmob krampus spawns:
		  - flag <context.entity> raid_boss
		  - adjust <context.entity> item_in_hand:item_krampus_sword
		on player move:
		  - ratelimit <player> 1t
		  - if <player.is_within[krampus_cave]> = true:
		    - if <util.random.int[0].to[100]> <= 15:
              - playsound <context.old_location> sound:ENTITY_TURTLE_EGG_BREAK volume:1 pitch:0.6			
item_scroll_teleport_Krampus:
    type: item
    debug: false
    material: flower_banner_pattern
    display name: "<&5><&l>Свиток телепортации к Крампусу"
    lore:
    - "<&6>Свиток, который может телепортировать к"
    - "<&6>демону Крампусу. Не всегда выпадает "
	- "<&6>возможность увидеть одного из демонов."
	- ""
	- "<&7>Использование:"
	- "<&a> Мгновенно телепотирует в логово Крампуса."
	- "<&a> Можно использовать раз в 1 час."
    mechanisms:
      custom_model_data: 6
item_scroll_teleport_Krampus_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_scroll_teleport_Krampus:
		  - determine passively cancelled
		  - if <player.item_in_hand.has_flag[owner]> = false:
		    - inventory flag slot:hand owner:<player.name>
		  - if <player.item_in_hand.flag[owner]> = <player.name>:
		    - if <player.has_flag[teleport_cd]> = false:
		      - teleport <player> <location[1555,87,1616,ocean]>
			  - flag <player> teleport_cd expire:1h
		  - else:
		    - actionbar "<&7>Вы не владелец свитка..."
