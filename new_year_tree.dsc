item_spruce_tree:
    type: item
	debug: false
    material: spruce_sapling
    display name: "<&6><&l>Новогодняя ёлка"
    lore:
    - ""
    - "<&6>Ёлка, выращенная в лесу при помощи"
    - "<&6>особых новогодних предметов."
    - "<&6>Осталось лишь украсить её."
item_xms_meal:
    type: item
	debug: false
    material: bone_meal
    display name: "<&b><&l>Рождественская пыльца"
    lore:
    - ""
    - "<&6>Позволяет быстрее расти ёлке и "
    - "<&6>в это же время наделяет её необычными"
    - "<&6>свойствами, которые работают в новый год."
item_xms_meal_use:
    type: world
	debug: false
	events:
	    on player right clicks spruce_sapling with:item_xms_meal:
		  - adjust <context.location> block_type:air
		  - drop <context.location> item_spruce_tree quantity:1
		  - take iteminhand quantity:1 
item_new_year_tree_01:
    type: item
    debug: false
    material: spruce_sapling
    display name: "<&6><&l>Маленькая новогодняя ёлка"
    lore:
    - ""
    - "<&6>Маленькая ёлка из леса, которую можно"
    - "<&6>поставить на новый год у себя дома."
    - "<&6>Украшена и пахнет лесом."
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
    - "<&6>Украшена и пахнет лесом."
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
    - "<&6>Украшена и пахнет лесом."
    - ""
    - "<&7>Использование:"
    - "<&a> Размещает ёлку большого размера."
    - "<&a> На новый год проявляет необычные свойства."
item_new_year_tree_use:
    type: world
	debug: false
	events:
	    on player right clicks !air:
		  - if <player.item_in_hand.script.name.is[==].to[item_new_year_tree_01]||false>:
		    - determine passively cancelled
			- define region <player.location.regions>
			- if <[region].size> = 0:
			  - stop
			- if <[region].size> > 0:
			  - if <region[<[region].first>].owners.contains[<player>]> = false:
			    - stop
			- if <player.has_flag[have_tree]> = true:
			  - stop
			- foreach <context.location.add[0,1,0].to_cuboid[<context.location.add[30,30,30]>].blocks>:
			  - if <[value].material.name> != air:
			    - narrate "<&7><&o>Размещению ёлки мешает какой-то блок..."
			    - stop
			- if <schematic[new_year_tree_01].exist> = false:
			  - ~schematic load name:new_year_tree_01
			- take from:<player.inventory> iteminhand quantity:1
			- wait 1s
			- schematic paste name:new_year_tree_01 <context.location.add[0,1,0]> noair
			- playeffect at:<player.location.add[0,6,0]> effect:WAX_OFF quantity:300 offset:9 velocity:0,-10,0
			- note <cuboid[<schematic[new_year_tree_01].cuboid[<context.location.add[0,1,0]>]>]> as:Tree_for_<player.name>
			- flag <cuboid[Tree_for_<player.name>]> owner:<player.name>
			- if <server.has_flag[gifts_location]> = false:
			  - flag server gifts_location:<map[]>
			- flag server gifts_location:<server.flag[gifts_location].as_map.with[<player.name>].as[<player.location.add[5,1,5]>]>
			- flag <cuboid[Tree_for_<player.name>]> tier:item_new_year_tree_01
			- flag <player> have_tree
		  - if <player.item_in_hand.script.name.is[==].to[item_new_year_tree_02]||false>:
		    - determine passively cancelled
			- define region <player.location.regions>
			- if <[region].size> = 0:
			  - stop
			- if <[region].size> > 0:
			  - if <region[<[region].first>].owners.contains[<player>]> = false:
			    - stop
		    - if <player.has_flag[have_tree]> = true:
			  - stop
			- foreach <context.location.add[0,1,0].to_cuboid[<context.location.add[30,30,30]>].blocks>:
			  - if <[value].material.name> != air:
			    - narrate "<&7><&o>Размещению ёлки мешает какой-то блок..."
			    - stop
		    - if <schematic[new_year_tree_02].exist> = false:
			  - ~schematic load name:new_year_tree_02
			- take from:<player.inventory> iteminhand quantity:1
			- wait 1s
			- schematic paste name:new_year_tree_02 <context.location.add[0,1,0]> noair
			- playeffect at:<player.location.add[0,6,0]> effect:WAX_OFF quantity:300 offset:9 velocity:0,-10,0
			- note <cuboid[<schematic[new_year_tree_02].cuboid[<context.location.add[0,1,0]>]>]> as:Tree_for_<player.name>
			- flag <cuboid[Tree_for_<player.name>]> owner:<player.name>
			- if <server.has_flag[gifts_location]> = false:
			  - flag server gifts_location:<map[]>
			- flag server gifts_location:<server.flag[gifts_location].as_map.with[<player.name>].as[<player.location.add[5,1,5]>]>
			- flag <cuboid[Tree_for_<player.name>]> tier:item_new_year_tree_02
			- flag <player> have_tree
		  - if <player.item_in_hand.script.name.is[==].to[item_new_year_tree_03]||false>:
		    - determine passively cancelled
			- define region <player.location.regions>
			- if <[region].size> = 0:
			  - stop
			- if <[region].size> > 0:
			  - if <region[<[region].first>].owners.contains[<player>]> = false:
			    - stop
			- if <player.has_flag[have_tree]> = true:
			  - stop
			- foreach <context.location.add[0,1,0].to_cuboid[<context.location.add[30,30,30]>].blocks>:
			  - if <[value].material.name> != air:
			    - narrate "<&7><&o>Размещению ёлки мешает какой-то блок..."
			    - stop
			 - if <schematic[new_year_tree_03].exist> = false:
		      - ~schematic load name:new_year_tree_03
			- take from:<player.inventory> iteminhand quantity:1
			- wait 1s
			- schematic paste name:new_year_tree_03 <context.location.add[0,1,0]> noair
			- playeffect at:<player.location.add[0,6,0]> effect:WAX_OFF quantity:300 offset:9 velocity:0,-10,0
			- note <cuboid[<schematic[new_year_tree_03].cuboid[<context.location.add[0,1,0]>]>]> as:Tree_for_<player.name>
			- flag <cuboid[Tree_for_<player.name>]> owner:<player.name>
			- if <server.has_flag[gifts_location]> = false:
			  - flag server gifts_location:<map[]>
			- flag server gifts_location:<server.flag[gifts_location].as_map.with[<player.name>].as[<player.location.add[5,1,5]>]>
			- flag <cuboid[Tree_for_<player.name>]> tier:item_new_year_tree_03
			- flag <player> have_tree
	    on player breaks block:
		  - foreach <player.location.cuboids>:
		    - if <[value].contains_text[Tree_for_]> = true:
			  - if <player.is_op> = false:
			    - determine passively cancelled
		      - if <cuboid[<[value]>].flag[owner]> != <player.name>:
			    - actionbar "<&7><&o>Странная магия не разрешает вам ломать эту ёлку..."
			  - else:
			    - foreach <cuboid[<[value]>].blocks> as:location:
				  - adjust <[location]> block_type:air
				- drop <cuboid[<[value]>].flag[tier]> <context.location> quantity:1
				- note remove as:Tree_for_<player.name>
				- flag server gifts_location:<server.flag[gifts_location].as_map.exclude[<player.name>]>
				- flag <player> have_tree:!
		on system time 00:01:
		  - if <util.time_now.day_of_year> = 1:
		    - foreach <server.flag[gifts_location].keys>:
			  - define loc <server.flag[gifts_location].get[<[value]>]>
			  - adjust <[loc]> block_type:chest
			  - inventory d:<[loc].inventory> set origin:generic[contents=<[contents]>]
item_shard_white:
    type: item
	debug: false
    material: white_dye
    display name: "<&r><&l>Белые осколки"
    lore:
    - ""
    - "<&6>Белые осколи, похожи на частички"
    - "<&6>раздробленных костей. Такими можно "
    - "<&6>украсить ёлку на новогодние праздники."
item_shard_green:
    type: item
	debug: false
    material: green_dye
    display name: "<&2><&l>Зелёные осколки"
    lore:
    - ""
    - "<&6>Зелёные осколи, похожи твёрдые"
    - "<&6>листья деревьев. Такими можно "
    - "<&6>украсить ёлку на новогодние праздники."
item_shard_red:
    type: item
	debug: false
    material: red_dye
    display name: "<&4><&l>Красные осколки"
    lore:
    - ""
    - "<&6>Красные осколи, похожи раздробленную,"
    - "<&6>перекрашенную породу. Такими можно "
    - "<&6>украсить ёлку на новогодние праздники."
shard_drops:
    type: world
	debug: false
	events:
	    on entity killed by entity:
		  - if <util.random.int[0].to[100]> <= 10:
		    - drop <context.entity.location> item_shard_white quantity:1
		  - if <util.random.int[0].to[100]> <= 5:
		    - drop <context.entity.location> item_shard_green quantity:1
		  - if <util.random.int[0].to[100]> <= 1:
		    - drop <context.entity.location> item_shard_red quantity:1