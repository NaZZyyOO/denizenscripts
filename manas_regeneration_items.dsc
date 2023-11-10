item_amphora_mana:
    type: item
    debug: false
    material: honey_bottle
    display name: "Амфора маны"
    mechanisms:
      unbreakable: true
    data:
	    stats:
		    display: "Амфора маны"
			  rarity: rare
		    custom_model_data: 41
			  lore:
			    item: "<&8><&l>Предмет: <&5>Амфора"
			    rare: "<&7><&l>Тип: <&9>Редкий"
			    text: "<n><&7><&o>Не большая амфора маны, которой можно<n><&7><&o>восстановить не много маны."
			    abilities: "<n><&7>Употребление:<n><&a> - Восстанавливает 20 маны."
item_amphora_mana_use:
    type: world
	  debug: false
	  events:
	      on player right clicks block with:item_amphora_mana:
		      - if <player.has_flag[cd]> = false:
		        - if <placeholder[mystery_mana].player[<player>]> < <placeholder[mystery_maxmana].player[<player>]>:
		          - execute as_server silent "my addmana <player.name> 20"
			        - flag <player> cd expire:2s
			        - actionbar "<&6><&l>Вы восстановили 20 маны."
			        - take from:<player.inventory> item_amphora_mana quantity:1
	      on player consumes item_amphora_mana:
		      - determine passively cancelled
item_bug_with_mana:
    type: item
    debug: false
    material: leather
    display name: "Мешочек с концентрированной маной"
    mechanisms:
      unbreakable: true
    data:
	    stats:
		    display:  "Мешочек с концентрированной маной"
			  rarity: rare
		    custom_model_data: 3
			  lore:
			    item: "<&8><&l>Предмет: <&9>Заполенный мешок"
			    rare: "<&7><&l>Тип: <&9>Редкий"
			    text: "<n><&7><&o>Мешочек с концентрированной маной, которой можно<n><&7><&o>восстановить не малый запас маны."
			    abilities: "<n><&7>Использование:<n><&a> - Восстанавливает 80 маны."
item_bug_with_mana_use:
    type: world
	  debug: false
	  events:
	      on player right clicks block with:item_bug_with_mana:
		      - if <player.has_flag[cd]> = false:
		        - if <placeholder[mystery_mana].player[<player>]> < <placeholder[mystery_maxmana].player[<player>]>:
		          - execute as_server silent "my addmana <player.name> 80"
			        - flag <player> cd expire:2s
			        - actionbar "<&6>Вы восстановили 80 маны."
			        - take from:<player.inventory> item_bug_with_mana quantity:1