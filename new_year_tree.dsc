item_new_year_tree_01:
    type: item
    debug: false
    material: spruce_sapling
    display name: "<&6><&l>Маленькая новогодняя ёлка"
    lore:
    - ""
    - "<&6>Маленькая ёлка из леса, которую можно"
    - "<&6>поставить на новый год у себя дома."
    - "<&6>Украшена, хоть и всё ещё пахнет лесом."
    - ""
    - "<&7>Использование:"
    - "<&a> Размещает ёлку не большого размера."
    - "<&a> На новый год проявляет необычные свойства."
item_new_year_tree_02:
    type: item
    debug: false
    material: spruce_sapling
    display name: "<&5><&l>Средняя новогодняя ёлка"
    lore:
    - ""
    - "<&6>Средняя ёлка из леса, которую можно"
    - "<&6>поставить на новый год у себя дома."
    - "<&6>Украшена, хоть и всё ещё пахнет лесом."
    - ""
    - "<&7>Использование:"
    - "<&a> Размещает ёлку среднего размера."
    - "<&a> На новый год проявляет необычные свойства."
item_new_year_tree_03:
    type: item
    debug: false
    material: spruce_sapling
    display name: "<&4><&l>Большая новогодняя ёлка"
    lore:
    - ""
    - "<&6>Большая ёлка из леса, которую можно"
    - "<&6>поставить на новый год у себя дома."
    - "<&6>Украшена, хоть и всё ещё пахнет лесом."
    - ""
    - "<&7>Использование:"
    - "<&a> Размещает ёлку большого размера."
    - "<&a> На новый год проявляет необычные свойства."
item_new_year_tree_use:
    type: world
	debug: false
	events:
	    on player right clicks block:
		  - if <player.item_in_hand.script.name.is[==].to[item_new_year_tree_01]||false>:
		    - determine passively cancelled
			- execute as_op "/schematic load new_year_tree_01"
			- take from:<player.inventory> item:new_year_tree_01 quantity:1
			- wait 1s
			- execute as_op "/paste"
			- note <ellipsoid[ellipsoid@<player.location.simple.add[-1,0,0]>,7,10,5]> as:Tree_for_<player.name>
			- flag <ellipsoid[Tree_for_<player.name>]> owner:<player.name>
			- if <server.has_flag[gifts_location]> = false:
			  - flag server gifts_location:<map[]>
			- flag server gifts_location:<server.flag[gifts_location].as_map.with[<player.name>].as[<player.location.add[5,0,5]>]>
			- flag <ellipsoid[Tree_for_<player.name>]> tier:item_new_year_tree_01
		  - if <player.item_in_hand.script.name.is[==].to[item_new_year_tree_02]||false>:
		    - determine passively cancelled
			- execute as_op "/schematic load new_year_tree_02"
			- take from:<player.inventory> item:new_year_tree_02 quantity:1
			- wait 1s
			- execute as_op "/paste"
			- note <ellipsoid[ellipsoid@<player.location.simple.add[-1,0,0]>,10,19,10]> as:Tree_for_<player.name>
			- flag <ellipsoid[Tree_for_<player.name>]> owner:<player.name>
			- if <server.has_flag[gifts_location]> = false:
			  - flag server gifts_location:<map[]>
			- flag server gifts_location:<server.flag[gifts_location].as_map.with[<player.name>].as[<player.location.add[5,0,5]>]>
			- flag <ellipsoid[Tree_for_<player.name>]> tier:item_new_year_tree_02
		  - if <player.item_in_hand.script.name.is[==].to[item_new_year_tree_03]||false>:
		    - determine passively cancelled
			- execute as_op "/schematic load new_year_tree_03"
			- take from:<player.inventory> item:new_year_tree_03 quantity:1
			- wait 1s
			- execute as_op "/paste"
			- note <ellipsoid[ellipsoid@<player.location.simple.add[-2,0,0]>,10,27,10]> as:Tree_for_<player.name>
			- flag <ellipsoid[Tree_for_<player.name>]> owner:<player.name>
			- if <server.has_flag[gifts_location]> = false:
			  - flag server gifts_location:<map[]>
			- flag server gifts_location:<server.flag[gifts_location].as_map.with[<player.name>].as[<player.location.add[5,0,5]>]>
			- flag <ellipsoid[Tree_for_<player.name>]> tier:item_new_year_tree_03
	    on player breaks block:
		  - foreach <context.location.cuboids>:
		    - if <[value].contains_text[Tree_for_]> = true:
		      - if <[value].flag[owner]> != <player.name>:
			    - determine passively cancelled
			    - actionbar "<&7><&o>Странная магия не разрешает вам ломать эту ёлку..."
			  - else:
			    - foreach <[value].blocks> as:location:
				  - adjust <[value]> block_type:air
				- drop <[value].flag[tier]> <player.location> quantity:1
				- note remove as:Tree_for_<player.name>
				- flag server gifts_location:<server.flag[gifts_location].as_map.exclude[<player.name>]>
		on system time 00:01:
		  - if <util.time_now.day_of_year> = 1:
		    - foreach <server.flag[gifts_location].keys>:
			  - define loc <server.flag[gifts_location].get[<[value]>]>
			  - adjust <[loc]> block_type:chest
			  - inventory d:<[loc].inventory> set origin:generic[contents=<[contents]>]