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
			- take from:<player.inventory> iteminhand quantity:1
			- wait 1s
			- execute as_op "/paste"
			- note <ellipsoid[ellipsoid@<player.location.add[-1,0,0].simple>,7,12,7]> as:Tree_for_<player.name>
			- flag <ellipsoid[Tree_for_<player.name>]> owner:<player.name>
			- if <server.has_flag[gifts_location]> = false:
			  - flag server gifts_location:<map[]>
			- flag server gifts_location:<server.flag[gifts_location].as_map.with[<player.name>].as[<player.location.add[5,0,5]>]>
			- flag <ellipsoid[Tree_for_<player.name>]> tier:item_new_year_tree_01
		  - if <player.item_in_hand.script.name.is[==].to[item_new_year_tree_02]||false>:
		    - determine passively cancelled
			- execute as_op "/schematic load new_year_tree_02"
			- take from:<player.inventory> iteminhand quantity:1
			- wait 1s
			- execute as_op "/paste"
			- note <ellipsoid[ellipsoid@<player.location.add[-1,0,0].simple>,11,21,10]> as:Tree_for_<player.name>
			- flag <ellipsoid[Tree_for_<player.name>]> owner:<player.name>
			- if <server.has_flag[gifts_location]> = false:
			  - flag server gifts_location:<map[]>
			- flag server gifts_location:<server.flag[gifts_location].as_map.with[<player.name>].as[<player.location.add[5,0,5]>]>
			- flag <ellipsoid[Tree_for_<player.name>]> tier:item_new_year_tree_02
		  - if <player.item_in_hand.script.name.is[==].to[item_new_year_tree_03]||false>:
		    - determine passively cancelled
			- execute as_op "/schematic load new_year_tree_03"
			- take from:<player.inventory> iteminhand quantity:1
			- wait 1s
			- execute as_op "/paste"
			- note <ellipsoid[ellipsoid@<player.location.add[-2,0,0].simple>,10,29,12]> as:Tree_for_<player.name>
			- flag <ellipsoid[Tree_for_<player.name>]> owner:<player.name>
			- if <server.has_flag[gifts_location]> = false:
			  - flag server gifts_location:<map[]>
			- flag server gifts_location:<server.flag[gifts_location].as_map.with[<player.name>].as[<player.location.add[5,0,5]>]>
			- flag <ellipsoid[Tree_for_<player.name>]> tier:item_new_year_tree_03
	    on player breaks block:
		  - foreach <player.location.ellipsoids>:
		    - if <[value].contains_text[Tree_for_]> = true:
			  - if <player.is_op> = false:
			    - determine passively cancelled
		      - if <ellipsoid[<[value]>].flag[owner]> != <player.name>:
			    - actionbar "<&7><&o>Странная магия не разрешает вам ломать эту ёлку..."
			  - else:
			    - foreach <ellipsoid[<[value]>].blocks> as:location:
				  - if <server.flag[gifts_location].get[<player.name>].as_location.y> <= <[location].y>:
				    - adjust <[location]> block_type:air
				- drop <ellipsoid[<[value]>].flag[tier]> <player.location> quantity:1
				- note remove as:Tree_for_<player.name>
				- flag server gifts_location:<server.flag[gifts_location].as_map.exclude[<player.name>]>
		on system time 00:01:
		  - if <util.time_now.day_of_year> = 1:
		    - foreach <server.flag[gifts_location].keys>:
			  - define loc <server.flag[gifts_location].get[<[value]>]>
			  - adjust <[loc]> block_type:chest
			  - inventory d:<[loc].inventory> set origin:generic[contents=<[contents]>]