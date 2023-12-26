gifts:
    type: world
    debug: false
    events:
      on player right clicks player_head:
	    - if <player.has_flag[gifts]> = false:
		  - flag <player> gifts
		- if <player.has_flag[gifts]> = true:
		  - if <player.precise_target_position.has_flag[gifts_name]> = true:
		    - if <player.precise_target_position.flag[gifts_name].as_list.contains[<player.name>]> = false:
		      - flag <player> gifts:+:1
			  - playeffect effect:REDSTONE quantity:150 offset:0.45 at:<player.precise_target_position> special_data:1.0|white
			  - flag <player.precise_target_position> gifts_name:<player.precise_target_position.flag[gifts_name].as_list.include[<player.name>]>
		      - narrate "<&e>[Святий Миколай] <&6>- Вы нашли <player.flag[gifts]>/20 подарков!"
			- else:
		      - narrate "<&e>[Святий Миколай] <&6>- Вы уже нашли этот подарок!"
			  - stop
		- if <player.flag[gifts]> = 20:
		  - inject new_years_award
		  - flag <player> gifts:!
gifts_mark:
    type: world
	debug: false
	events:
	    on player right clicks player_head with:stick:
		  - inject admin_check
		  - if <player.precise_target_position.has_flag[gifts_name]> = false:
		    - flag <player.precise_target_position> gifts_name:<list[]>
			- playeffect effect:REDSTONE quantity:150 offset:0.45 at:<player.precise_target_position> special_data:1.0|green
			- narrate "<&e>[Система] <&6>- Вы добавили данный подарок в список!"
	      - else:
		    - flag <player.precise_target_position> gifts_name:!
		    - playeffect effect:REDSTONE quantity:150 offset:0.45 at:<player.precise_target_position> special_data:1.0|red
			- narrate "<&e>[Система] <&6>- Вы исключили данный подарок из списка!"