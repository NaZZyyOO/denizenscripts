bleeding_event:
    type: world
	debug: false
	events:
	    on player damages entity:
		  - if <context.entity.has_flag[bleeding]> = false:
		    - if <context.damage> > 4:
			  - define blood <element[1].add[<player.flag[custom_stats_map].get[GENERIC_DEEPTH_OF_WOUND]>]>
			  - flag <context.entity> bleeding:<[blood]> expire:5m
		  - else:
		    - if <util.random.int[0].to[100]> <= <context.entity.flag[bleeding]>:
			  - if <context.entity.health> > 5:
			    - if <context.entity.flag[bleeding]> <= 25:
			      - hurt 4 <context.entity> source:<context.damager>
				  - flag <context.damager> bleeding:!
			    - if <context.entity.flag[bleeding]> > 25 && <context.entity.flag[bleeding]> <= 50:
			      - hurt 8 <context.entity> source:<context.damager>
				  - flag <context.damager> bleeding:!
			    - if <context.entity.flag[bleeding]> > 50 && <context.entity.flag[bleeding]> <= 75:
			      - hurt 12 <context.entity> source:<context.damager>
				  - flag <context.damager> bleeding:!
			    - if <context.entity.flag[bleeding]> > 75 && <context.entity.flag[bleeding]> <= 100:
			      - hurt 16 <context.entity> source:<context.damager>
				  - flag <context.damager> bleeding:!
			    - playsound sound:ENTITY_TURTLE_EGG_BREAK volume:1 pitch:0.6 <player.location>
				- if <context.entity.location> != null:
			      - playeffect effect:REDSTONE quantity:30 offset:0.7 special_data:1.2|red at:<context.entity.location>
			- else:
			  - if <context.entity.flag[bleeding]> < 100:
			    - if <util.random.int[0].to[100]> <= 50:
			      - flag <context.entity> bleeding:+:<element[1].add[<player.flag[custom_stats_map].get[GENERIC_DEEPTH_OF_WOUND]>]><element[1].add[<player.flag[custom_stats_map].get[GENERIC_DEEPTH_OF_WOUND]>]> expire:3m
			  - else if <context.entity.flag[bleeding]> = 100:
			    - hurt 16 <context.entity> source:<context.damager>
				- flag <context.entity> bleeding:!
				- playsound sound:ENTITY_TURTLE_EGG_BREAK volume:1 pitch:0.6 <player.location>
			    - playeffect effect:REDSTONE quantity:20 special_data:1.2|red at:<context.entity.location>