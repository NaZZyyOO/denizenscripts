item_sword_wooden:
    type: item
    debug: false
    material: wooden_sword
    display name: "<&6><&l>Тренировочный меч"
    lore:
    - "<&6>Простой деревянный тренировочный меч,"
    - "<&6>чтобы им убить кого-нибудь, нужно хорошо"
    - "<&6>постараться."
    mechanisms:
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/1.0
      - generic.attack_speed/mainhand/0.0/2.0
    enchantments:
    - DURABILITY:1
item_sword_stone:
    type: item
    debug: false
    material: stone_sword
    display name: "<&6><&l>Громоздкий меч статуи"
    lore:
    - "<&6>Слишком тяжёлый для такого маленького"
    - "<&6>человека как Вы."
    mechanisms:
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/8.0
      - generic.movement_speed/mainhand/1.0/-0.15
	  - generic.attack_speed/mainhand/0.0/-1.8
    enchantments:
    - DURABILITY:2
    - KNOCKBACK:1
item_sword_adventurer_01:
    type: item
    debug: false
    material: iron_sword
    display name: "<&6><&l>Ржавый клинок авантюриста"
    lore:
    - "<&6>Несмотря на ржавчину, не потерял своей"
    - "<&6>остроты. Самое распространённое оружие"
    - "<&6>среди искателей приключений."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - Когда у носителя меньше"
    - "<&a> 40% уровня здоровья, его урон с "
    - "<&a> этим мечем возврастёт на 5%."
    mechanisms:
      custom_model_data: 1
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/9.0
	  - generic.attack_speed/mainhand/0.0/-1.8
    enchantments:
    - DURABILITY:3
item_sword_adventurer_01_use:
    type: world
    debug: false
    events:
        on entity damages entity with:item_sword_adventurer_01:
          - if <player.health_percentage> <= 40:
		    - determine passively <context.damage.mul[1.05]>
			- playeffect at:<player.location> effect:REDSTONE quantity:30 special_data:0.8|red offset:0.8
item_sword_adventurer_02:
    type: item
    debug: false
    material: iron_sword
    display name: "<&6><&l>Клинок авантюриста"
    lore:
    - "<&6>Отчищенный от ржавчины, он"
    - "<&6>стал ещё острее! По такому мечу"
    - "<&6>можно понять, что перед Вами опытный"
    - "<&6>искатель приключений."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - Когда у носителя меньше"
    - "<&a> 40% уровня здоровья, его урон с "
    - "<&a> этим мечем возврастёт на 7%."
    mechanisms:
      custom_model_data: 2
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/11.0
	  - generic.attack_speed/mainhand/0.0/-1.8
    enchantments:
    - DURABILITY:3
    - KNOCKBACK:1
item_sword_adventurer_02_use:
    type: world
    debug: false
    events:
        on entity damages entity with:item_sword_adventurer_02:
          - if <player.health_percentage> <= 40:
		    - determine passively <context.damage.mul[1.07]>
			- playeffect at:<player.location> effect:REDSTONE quantity:30 special_data:0.8|red offset:0.8
item_sword_adventurer_03:
    type: item
    debug: false
    material: iron_sword
    display name: "<&6><&l>Полированный клинок авантюриста"
    lore:
    - "<&6>Чистый и блестящий, хорошо заточенный"
    - "<&6>клинок. Далеко не каждый искатель"
    - "<&6>приключений может себе позволить такой меч."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - Когда у носителя меньше"
    - "<&a> 40% уровня здоровья, его урон с "
    - "<&a> этим мечем возврастёт на 10%."
    mechanisms:
      custom_model_data: 3
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/14.0
	  - generic.attack_speed/mainhand/0.0/-1.9
    enchantments:
    - DURABILITY:3
    - SWEEPING_EDGE:1
    - FIRE_ASPECT:1
item_sword_adventurer_03_use:
    type: world
    debug: false
    events:
        on entity damages entity with:item_sword_adventurer_03:
          - if <player.health_percentage> <= 40:
		    - determine passively <context.damage.mul[1.1]>
			- playeffect at:<player.location> effect:REDSTONE quantity:30 special_data:0.8|red offset:0.8
item_sword_adventurer_04:
    type: item
    debug: false
    material: iron_sword
    display name: "<&6><&l>Сияющий клинок авантюриста"
    lore:
    - "<&6>Чистый и блестящий, лучшей конструкции"
    - "<&6>клинок. Мало кто из искателей"
    - "<&6>приключений может себе позволить такой меч."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - Когда у носителя меньше"
    - "<&a> 40% уровня здоровья, его урон с "
    - "<&a> этим мечем возврастёт на 13%."
    mechanisms:
      custom_model_data: 4
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/15.0
	  - generic.attack_speed/mainhand/0.0/-2.0
    enchantments:
    - DURABILITY:4
    - SWEEPING_EDGE:1
    - FIRE_ASPECT:2
item_sword_adventurer_04_use:
    type: world
    debug: false
    events:
        on entity damages entity with:item_sword_adventurer_04:
          - if <player.health_percentage> <= 40:
		    - determine passively <context.damage.mul[1.13]>
			- playeffect at:<player.location> effect:REDSTONE quantity:30 special_data:0.8|red offset:0.8
item_iron_hammer_01:
    type: item
    debug: false
    material: iron_axe
    display name: "<&6><&l>Ржавый железный молот"
    lore:
    - "<&6>Несмотря на необработанный вид молота,"
    - "<&6>не потерял свой функционал. Сойдёт как  "
    - "<&6>не тяжёлое достаточно неплохое оружие."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - С 15% шанс сломать кости цели, наложив"
    - "<&a> на неё Замедление II(0.04) и Слабость I(0.04)"
    - "<&a> вызвав потемнение в глазах на некоторое время."
    mechanisms:
      custom_model_data: 1
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/12.0
	  - generic.attack_speed/mainhand/0.0/-2.0
	  - generic.movement_speed/mainhand/1.0/-0.05
    enchantments:
    - DURABILITY:3
item_iron_hammer_01_use:
    type: world
	debug: false
	events:
	    on entity damages entity with:item_iron_hammer_01:
		  - if <util.random.int[0].to[100]> <= 15:
		    - if <context.entity.is_player||null> = true:
		      - title title:<&font[fade:black]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:2s stay:0s fade_out:1s targets:<context.entity>
		    - cast SLOW a:1 d:2 <context.entity> hide_particles
			- cast WEAKNESS a:0 d:2 <context.entity> hide_particles
			- feed <context.damager> amount:-1
item_iron_hammer_02:
    type: item
    debug: false
    material: iron_axe
    display name: "<&6><&l>Грубый железный молот"
    lore:
    - "<&6>Грубый железный молот, лучше своей прошлой"
    - "<&6>версии, но тяжелее. Из-за своей грубости"
    - "<&6>при точном ударе может легко сломать кость противнику."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - С 15% шанс сломать кости цели, наложив"
    - "<&a> на неё Замедление II(0.06) и Слабость II(0.06)"
    - "<&a> вызвав потемнение в глазах на некоторое время."
    mechanisms:
      custom_model_data: 2
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/13.0
	  - generic.attack_speed/mainhand/0.0/-2.4
	  - generic.movement_speed/mainhand/1.0/-0.1
    enchantments:
    - DURABILITY:3
item_iron_hammer_02_use:
    type: world
	debug: false
	events:
	    on entity damages entity with:item_iron_hammer_02:
		  - if <util.random.int[0].to[100]> <= 15:
		    - cast SLOW a:1 d:6 <context.entity> hide_particles
			- cast WEAKNESS a:1 d:6 <context.entity> hide_particles
			- feed <context.damager> amount:-1
			- if <context.entity.is_player||null> = true:
		      - title title:<&font[fade:black]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:2s stay:0s fade_out:1s targets:<context.entity>
item_iron_hammer_03:
    type: item
    debug: false
    material: iron_axe
    display name: "<&6><&l>Железный молот"
    lore:
    - "<&6>Железный молот хорошей конструкции, который"
    - "<&6>под силу только сильным. Наносит хороший урон"
    - "<&6>при точном и сильном ударе."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - С 15% шанс сломать кости цели, наложив"
    - "<&a> на неё Замедление III(0.08) и Слабость III(0.08)"
    - "<&a> вызвав потемнение в глазах на некоторое время."
    mechanisms:
      custom_model_data: 3
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/14.5
	  - generic.attack_speed/mainhand/0.0/-2.4
	  - generic.movement_speed/mainhand/1.0/-0.12
    enchantments:
    - DURABILITY:4
item_iron_hammer_03_use:
    type: world
	debug: false
	events:
	    on entity damages entity with:item_iron_hammer_03:
		  - if <util.random.int[0].to[100]> <= 15:
		    - if <context.entity.is_player||null> = true:
		      - title title:<&font[fade:black]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:2s stay:0s fade_out:1s targets:<context.entity>
		    - cast SLOW a:2 d:8 <context.entity> hide_particles
			- cast WEAKNESS a:2 d:8 <context.entity> hide_particles
			- feed <context.damager> amount:-1
item_iron_hammer_04:
    type: item
    debug: false
    material: iron_axe
    display name: "<&6><&l>Полированный железный молот"
    lore:
    - "<&6>Чистый и блестящий молот, который"
    - "<&6>под силу только сильным. Наносит большой урон"
    - "<&6>при сильном ударе. Такой молот не подсилу каждому,"
	- "<&6>поэтому не так популярен среди воинов."
    - ""
    - "<&7>Эффект при ударе:"
    - "<&a> - С 20% шанс сломать кости цели, наложив"
    - "<&a> на неё Замедление IV(0.12) и Слабость III(0.12)"
    - "<&a> вызвав потемнение в глазах на некоторое время."
    mechanisms:
      custom_model_data: 4
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/16.5
	  - generic.attack_speed/mainhand/0.0/-2.5
	  - generic.movement_speed/mainhand/1.0/-0.15
    enchantments:
    - DURABILITY:5
item_iron_hammer_04_use:
    type: world
	debug: false
	events:
	    on entity damages entity with:item_iron_hammer_04:
		  - if <util.random.int[0].to[100]> <= 20:
		    - if <context.entity.is_player||null> = true:
		      - title title:<&font[fade:black]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:2s stay:0s fade_out:1s targets:<context.entity>
		    - cast SLOW a:3 d:12 <context.entity> hide_particles
			- cast WEAKNESS a:2 d:12 <context.entity> hide_particles
			- feed <context.damager> amount:-1
item_iron_axe_01:
    type: item
    debug: false
    material: iron_axe
    display name: "<&6><&l>Ржавый железный топор"
    lore:
    - "<&6>Несмотря на ржавчину на топоре он"
    - "<&6>не потерял свой функционал. Сойдёт как "
    - "<&6>достаточно неплохое оружие, способно наносить"
	- "<&6>весомый вред цели."
    - ""
    - "<&7>Использование:"
    - "<&a> - Делает рывок впёред нанеся 5 урона всем"
    - "<&a> целям находящимся вокруг игрока."
    - "<&a> Работает не чаще 1 раза в 30 секунд."
    mechanisms:
      custom_model_data: 7
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/11.0
	  - generic.attack_speed/mainhand/0.0/-2.2
	  - generic.movement_speed/mainhand/1.0/-0.1
    enchantments:
    - DURABILITY:2
item_iron_axe_01_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_iron_axe_01:
		  - if <player.has_flag[iron_axe_01_cd]> = false:
			- adjust <player> velocity:<player.location.direction.vector.mul[1.2]>
			- playsound ENTITY_PLAYER_ATTACK_SWEEP <player> volume:1 pitch:0.1
			- playeffect SWEEP_ATTACK <player.location> offset:0.7 quantity:4
			- flag <player> iron_axe_01_cd duration:30s
			- feed <player> amount:-1
			- wait 0.3
			- foreach <player.location.find.living_entities.within[4].exclude[<player]> as:victim:
			  - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
			    - hurt <[victim]> 5 source:<player> cause:entity_attack
		  - else:
            - actionbar "<&6><&l>Оружие не готово к использованию. <player.flag[iron_axe_01_cd].expiration.formatted>"
item_iron_axe_02:
    type: item
    debug: false
    material: iron_axe
    display name: "<&6><&l>Железный топор"
    lore:
    - "<&6>Железный топор, острее и чище своей"
    - "<&6>прошлой версии. Наносит неплохой урон"
    - "<&6>при сильном и точном ударе по врагу."
    - ""
    - "<&7>Использование:"
    - "<&a> - Делает рывок впёред нанеся 7 урона всем"
    - "<&a> целям находящимся вокруг игрока."
    - "<&a> Работает не чаще 1 раза в 30 секунд."
    mechanisms:
      custom_model_data: 8
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/13.0
	  - generic.attack_speed/mainhand/0.0/-2.4
	  - generic.movement_speed/mainhand/1.0/-0.15
    enchantments:
    - DURABILITY:3
	- KNOCKBACK:1
item_iron_axe_02_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_iron_axe_02:
		  - if <player.has_flag[iron_axe_02_cd]> = false:
			- adjust <player> velocity:<player.location.direction.vector.mul[1.3]>
			- playsound ENTITY_PLAYER_ATTACK_SWEEP <player> volume:1 pitch:0.1
			- playeffect SWEEP_ATTACK <player.location> offset:0.7 quantity:6
			- feed <player> amount:-1
			- flag <player> iron_axe_02_cd duration:30s
			- wait 0.5
			- foreach <player.location.find.living_entities.within[2].exclude[<player>]> as:victim:
			  - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
			    - hurt <[victim]> 7 source:<player> cause:entity_attack
		  - else:
            - actionbar "<&6><&l>Оружие не готово к использованию. <player.flag[iron_axe_02_cd].expiration.formatted>"
item_iron_axe_03:
    type: item
    debug: false
    material: iron_axe
    display name: "<&6><&l>Железный двухглавый топор"
    lore:
    - "<&6>Железный двухглавый топор лучшей конструкции,"
    - "<&6>способен наносить глубокие раны врагу."
    - "<&6>О таком топоре мечтают все, но не все"
	- "<&6>способны поднять такое громадное оружие."
    - ""
    - "<&7>Использование:"
    - "<&a> - Делает рывок впёред нанеся 9 урона всем"
    - "<&a> целям находящимся перед игроком."
    - "<&a> Работает не чаще 1 раза в 25 секунд."
    mechanisms:
      custom_model_data: 9
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/14.5
	  - generic.attack_speed/mainhand/0.0/-2.4
	  - generic.movement_speed/mainhand/1.0/-0.17
    enchantments:
    - DURABILITY:3
	- KNOCKBACK:1
item_iron_axe_03_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_iron_axe_03:
		  - if <player.has_flag[iron_axe_03_cd]> = false:
			- adjust <player> velocity:<player.location.direction.vector.mul[1.4]>
			- playsound ENTITY_PLAYER_ATTACK_SWEEP <player> volume:1 pitch:0.1
			- playeffect SWEEP_ATTACK <player.location> offset:0.7 quantity:8
			- feed <player> amount:-1
			- flag <player> iron_axe_03_cd duration:25s
			- wait 0.5
			- foreach <player.location.find.living_entities.within[2].exclude[<player>]> as:victim:
			  - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
			    - hurt <[victim]> 9 source:<player> cause:entity_attack
		  - else:
            - actionbar "<&6><&l>Оружие не готово к использованию. <player.flag[iron_axe_03_cd].expiration.formatted>"
item_iron_axe_04:
    type: item
    debug: false
    material: iron_axe
    display name: "<&6><&l>Полированный двухглавый железный топор"
    lore:
    - "<&6>Чистый и блестящий двухглавый железный топор,"
    - "<&6>способен рубить врагов на куски без особых усилий."
    - "<&6>Такой топор станет сильным оружием в руках сильного человека."
    - ""
    - "<&7>Использование:"
    - "<&a> - Делает рывок впёред нанеся 12 урона всем"
    - "<&a> целям находящимся вокруг игрока."
    - "<&a> Работает не чаще 1 раза в 25 секунд."
    mechanisms:
      custom_model_data: 10
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/17.0
	  - generic.attack_speed/mainhand/0.0/-2.8
	  - generic.movement_speed/mainhand/1.0/-0.25
    enchantments:
    - DURABILITY:4
	- KNOCKBACK:2
item_iron_axe_04_use:
    type: world
	debug: false
	events:
	    on player right clicks block with:item_iron_axe_04:
		  - if <player.has_flag[iron_axe_04_cd]> = false:
			- adjust <player> velocity:<player.location.direction.vector.mul[1.5]>
			- playsound ENTITY_PLAYER_ATTACK_SWEEP <player> volume:1 pitch:0.1
			- playeffect SWEEP_ATTACK <player.location> offset:0.7 quantity:10
			- feed <player> amount:-1
			- flag <player> iron_axe_04_cd duration:25s
			- wait 0.5
			- foreach <player.location.find.living_entities.within[3].exclude[<player>]> as:victim:
			  - if <player.worldguard.test_flag[pvp]> = true || <player.location.in_region> = false:
			    - hurt <[victim]> 12 source:<player> cause:entity_attack
		  - else:
            - actionbar "<&6><&l>Оружие не готово к использованию. <player.flag[iron_axe_04_cd].expiration.formatted>"
