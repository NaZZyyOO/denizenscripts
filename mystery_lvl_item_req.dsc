mystery_lvl_item_req_mechanics_check:
    type: world
	debug: false
	events:
	    on player right clicks block:
		  - if <script[<player.item_in_hand.script.name>].data_key[data.stats].keys.contains[lvl_req]> = true:
		    - define lvl_req <script[<player.item_in_hand.script.name>].data_key[data.stats.lvl_req]>
		    - if <placeholder[mystery_legacylevel].player[<player>]> < <[lvl_req]>:
			  - determine passively cancelled
	          - actionbar "<&6>Чтоб использовать данный предмет нужен уровень не ниже <[lvl_req]>"
		on player left clicks block:
		  - if <script[<player.item_in_hand.script.name>].data_key[data.stats].keys.contains[lvl_req]> = true:
		    - define lvl_req <script[<player.item_in_hand.script.name>].data_key[data.stats.lvl_req]>
		    - if <placeholder[mystery_legacylevel].player[<player>]> < <[lvl_req]>:
			  - determine passively cancelled
	          - actionbar "<&6>Чтоб использовать данный предмет нужен уровень не ниже <[lvl_req]>"
		on player !CONTROL_DROP clicks item in inventory:
		  - if <script[<context.cursor_item.script.name>].data_key[data.stats].keys.contains[lvl_req]> = true:
		    - define lvl_req <script[<player.item_in_hand.script.name>].data_key[data.stats.lvl_req]>
		    - if <context.slot> = 41:
			  - if <context.action> = PLACE_ALL:
		        - if <placeholder[mystery_legacylevel].player[<player>]> < <[lvl_req]>:
			      - actionbar "<&6>Чтоб использовать данный предмет нужен уровень не ниже <[lvl_req]>"
				  - drop <context.cursor_item> <player.location>
			      - determine passively cancelled
				  - inventory close
		on player SWAP_OFFHAND clicks item in inventory:
		  - if <script[<context.item.script.name>].data_key[data.stats].keys.contains[lvl_req]> = true:
		    - define lvl_req <script[<context.item.script.name>].data_key[data.stats.lvl_req]>
		    - if <context.slot> = 41:
			  - if <context.action> = PLACE_ALL:
		        - if <placeholder[mystery_legacylevel].player[<player>]> < <[lvl_req]>:
			      - actionbar "<&6>Чтоб использовать данный предмет нужен уровень не ниже <[lvl_req]>"
				  - drop <context.item> <player.location>
			      - determine passively cancelled
				  - inventory close
	    on player swaps items:
		  - if <script[<context.offhand.script.name>].data_key[data.stats].keys.contains[lvl_req]> = true:
		    - define lvl_req <script[<context.offhand.script.name>].data_key[data.stats.lvl_req]>
		    - if <placeholder[mystery_legacylevel].player[<player>]> < <[lvl_req]>:
			  - actionbar "<&6>Чтоб использовать данный предмет нужен уровень не ниже <[lvl_req]>"
			  - determine passively cancelled
	    on player equips item:
		  - if <script[<context.old_item.script.name>].data_key[data.stats].keys.contains[lvl_req]> = true:
		    - define lvl_req <script[<context.old_item.script.name>].data_key[data.stats.lvl_req]>
		    - if <placeholder[mystery_legacylevel].player[<player>]> < <[lvl_req]>:
			  - actionbar "<&6>Чтоб использовать данный предмет нужен уровень не ниже <[lvl_req]>"
			  - determine passively cancelled