item_mandarin_sword:
    type: item
    debug: false
    material: golden_sword
    display name: "<&l><&6>Нож для чистки мандаринов"
    lore:
    - "<&6>Новогодний нож для чистки мандаринов,"
    - "<&6>давая мандаринам улучшенные свойства."
    - ""
	- "<&7>Использование: "
	- "<&a>При ударе когда игрок одет в мандариновый"
	- "<&a>сет и бьет цель этим мечем, с шансом 25%"
	- "<&a>забирёт мандарин из инвентаря и удвоит"
	- "<&a>исцеление от мандарина."
    mechanisms:
      custom_model_data: 1
	  unbreakable: true
      nbt_attributes:
      - generic.attack_damage/mainhand/0.0/12.0
      - generic.movement_speed/mainhand/1.0/+0.15
      - generic.attack_speed/mainhand/0.0/-1.0
item_mandarin_helm:
    type: item
    debug: false
    material: golden_helmet
    display name: "<&6><&l>Мандариновый шлем"
    lore:
    - "<&6>Один из редких новогодних предметов"
    - "<&6>мандаринового сета, дарующий"
	- "<&6>невероятную выжываемость носителю."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a>- 25% шанс восстановить при ударе 3 ед. здоровья "
    - "<&a>забрав 1 мандарин из инвентаря."
    - "<&a>Если удар совершен ножом для чистки мандаринов,"
	- "<&a>то исцеление будет удвоено."
    mechanisms:
	  unbreakable: true
      nbt_attributes:
      - generic.armor/head/0.0/3.0
      - generic.max_health/head/0.0/7.0
      - generic.movement_speed/head/1.0/+0.045
    enchantments:
	- FIRE_PROTECTION:1
	- PROTECTION_ENVIRONMENTAL:3
item_mandarin_chest:
    type: item
    debug: false
    material: golden_chestplate
    display name: "<&6><&l>Мандариновая кираса"
    lore:
    - "<&6>Один из редких новогодних предметов"
    - "<&6>мандаринового сета, дарующий"
	- "<&6>невероятную выжываемость носителю."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a>- 25% шанс восстановить при ударе 3 ед. здоровья "
    - "<&a>забрав 1 мандарин из инвентаря."
    - "<&a>Если удар совершен ножом для чистки мандаринов,"
	- "<&a>то исцеление будет удвоено."
    mechanisms:
	  unbreakable: true
      nbt_attributes:
      - generic.armor/chest/0.0/7.0
      - generic.max_health/chest/0.0/9.0
      - generic.movement_speed/chest/1.0/+0.045
    enchantments:
	- FIRE_PROTECTION:2
	- PROTECTION_ENVIRONMENTAL:3
item_mandarin_leggings:
    type: item
    debug: false
    material: golden_leggings
    display name: "<&6><&l>Мандириновые поножи"
    lore:
    - "<&6>Один из редких новогодних предметов"
    - "<&6>мандаринового сета, дарующий"
	- "<&6>невероятную выжываемость носителю."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a>- 25% шанс восстановить при ударе 3 ед. здоровья "
    - "<&a>забрав 1 мандарин из инвентаря."
    - "<&a>Если удар совершен ножом для чистки мандаринов,"
	- "<&a>то исцеление будет удвоено."
    mechanisms:
	  unbreakable: true
      nbt_attributes:
      - generic.armor/legs/0.0/4.0
      - generic.max_health/legs/0.0/7.0
      - generic.movement_speed/legs/1.0/+0.045
    enchantments:
	- FIRE_PROTECTION:2
	- PROTECTION_ENVIRONMENTAL:3
item_mandarin_boots:
    type: item
    debug: false
    material: golden_boots
    display name: "<&6><&l>Мандариновые ботинки"
    lore:
    - "<&6>Один из редких новогодних предметов"
    - "<&6>мандаринового сета, дарующий"
	- "<&6>невероятную выжываемость носителю."
    - ""
    - "<&7>Бонус комплекта:"
    - "<&a>- 25% шанс восстановить при ударе 3 ед. здоровья "
    - "<&a>забрав 1 мандарин из инвентаря."
    - "<&a>Если удар совершен ножом для чистки мандаринов,"
	- "<&a>то исцеление будет удвоено."
    mechanisms:
	  unbreakable: true
      nbt_attributes:
      - generic.armor/feet/0.0/3
      - generic.max_health/feet/0.0/6.0
      - generic.movement_speed/feet/1.0/+0.045
    enchantments:
	- FIRE_PROTECTION:1
	- PROTECTION_ENVIRONMENTAL:3
item_mandarin_set_use:
    type: world
	debug: false
	events:
	    on player damages entity:
		  - if <util.random.int[0].to[100]> <= 25:
            - if <context.damager.inventory.slot[HELMET].script.name.is[==].to[item_mandarin_helm]||false>:
              - if <context.damager.inventory.slot[CHESTPLATE].script.name.is[==].to[item_mandarin_chest]||false>:
                - if <context.damager.inventory.slot[LEGGINGS].script.name.is[==].to[item_mandarin_leggings]||false>:
                  - if <context.damager.inventory.slot[BOOTS].script.name.is[==].to[item_mandarin_boots]||false>:
                    - if <context.damager.inventory.contains[item_mandarin]> = true:
					  - if <context.damager.item_in_hand.script.name.is[==].to[item_mandarin_sword]||false> = true:
						- take from:<context.damager.inventory> item_mandarin quantity:1
						- heal <context.damager> 6
						- actionbar <&6><&l>Сет и Нож мандаринов восстановили 6 ед. здоровья!"
				      - else:
						- take from:<context.damager.inventory> quantity:1 item_mandarin
						- heal <context.damager> 3
						- actionbar <&6><&l>Сет мандаринов восстановил Вам 3 ед. здоровья!"