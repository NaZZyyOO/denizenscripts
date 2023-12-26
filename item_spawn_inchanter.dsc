# В этом файле описаны предметы для второй руки, продающиеся на спавне у Зачарователя Беаты.
item_offhand_wand_simple:
    type: item
    debug: false
    material: stick
    display name: "<&6><&l>Простой осиновый жезл"
    lore:
    - "<&6>Самый простой из зачарованных жезлов."
    - "<&6>Именно на таких тренируются"
    - "<&6>ученики зачарователей."
    mechanisms:
      custom_model_data: 1
      unbreakable: true
      nbt_attributes:
      - generic.movement_speed/offhand/1.0/0.05
      - generic.max_health/offhand/0.0/2.0
    enchantments:
    - durability:1
item_offhand_enchanted_book:
    type: item
    debug: false
    material: book
    display name: "<&6><&l>Колдовской фолиант"
    lore:
    - "<&6>Простейший заговорённый фолиант,"
    - "<&6>часто использующийся начинающими"
    - "<&6>колдунами из-за своей дешевизны."
    - ""
    - "<&7>Когда во второстепенной руке:"
    - "<&a> - 25% шанс поджечь цель на 30 секунд"
    - "<&a> при ударе."
    mechanisms:
      custom_model_data: 2
      unbreakable: true
      nbt_attributes:
      - generic.max_health/offhand/0.0/2.0
    enchantments:
    - durability:1
item_offhand_enchanted_book_use:
    type: world
    debug: false
    events:
        on entity damages entity:
          - if <context.damager.is_player||null> = true:
            - if <context.damager.item_in_offhand.script.name||null> = item_offhand_enchanted_book:
              - if <context.cause> == ENTITY_ATTACK:
                - if <util.random.int[0].to[100]> <= 25:
                  - burn <context.entity> duration:30s
                  - actionbar targets:<context.damager> "<&e>Ваш колдовской фолиант поджёг <context.entity.name>"
item_offhand_oblerite_shards:
    type: item
    debug: false
    material: quartz
    display name: "<&6><&l>Осколки облерита"
    lore:
    - "<&6>Зачарованные осколки редкого"
    - "<&6>магического минерала."
    - "<&6>Остаются ценными даже несмотря"
    - "<&6>на сильные повреждения."
    - ""
    - "<&7>Когда во второстепенной руке:"
    - "<&a> - 25% шанс нанести цели 2 ед. урона"
    - "<&a> при ударе."
    - "<&c> - 5% шанс получить 2 ед. урона"
    - "<&c> при ударе."
    mechanisms:
      custom_model_data: 1
      unbreakable: true
      nbt_attributes:
      - generic.movement_speed/offhand/1.0/0.08
    enchantments:
    - durability:1
item_offhand_oblerite_shards_use:
    type: world
    debug: false
    events:
        on entity damages entity:
          - if <context.damager.is_player||null> = true:
            - if <context.damager.item_in_offhand.script.name||null> = item_offhand_oblerite_shards:
              - if <context.cause> == ENTITY_ATTACK:
			    - if <context.entity> != null:
				  - if <context.entity.health> > 5:
                    - if <util.random.int[0].to[100]> <= 25:
                      - hurt 2 <context.entity>
                      - playeffect effect:REDSTONE quantity:100 offset:0.35 at:<context.entity.location> special_data:1.3|red
                      - playsound <context.entity.location> sound:ENTITY_PLAYER_ATTACK_CRIT volume:1.0
                    - if <util.random.int[0].to[100]> <= 5:
                      - hurt 2 <context.damager>
                      - playeffect effect:REDSTONE quantity:100 offset:0.35 at:<context.damager.location> special_data:1.3|red
                      - playsound <context.damager.location> sound:ENTITY_PLAYER_ATTACK_CRIT volume:1.0
item_offhand_cursed_bone:
    type: item
    debug: false
    material: bone
    display name: "<&6><&l>Проклятая кость"
    lore:
    - "<&6>Резная кость, зачарованная"
    - "<&6>слабой некротической магией."
    - "<&6>Делает своего владельца сильнее"
    - "<&6>взамен его же собственной жизненной силы."
    - ""
    - "<&7>Когда во второстепенной руке:"
    - "<&a> - Наносит цели 1 ед. урона"
    - "<&a> при ударе."
    - "<&a> - 10% шанс применить на цель"
    - "<&a> Отравление I (0.10) при ударе."
    - "<&a> - Убийство противника восстанавливает"
    - "<&a> 5 ед. сытости."
    - "<&c> - Каждый удар применяет на"
    - "<&c> владельца Голод (1.00)."
    - "<&c> - С каждым отравлением сытость"
    - "<&c> снижается на 1 ед."
    mechanisms:
      custom_model_data: 3
      unbreakable: true
      nbt_attributes:
      - generic.movement_speed/offhand/1.0/-0.1
    enchantments:
    - durability:1
item_offhand_cursed_bone_use:
    type: world
    debug: false
    events:
        on entity damages entity:
          - if <context.damager.is_player||null> = true:
            - if <context.damager.item_in_offhand.script.name||null> = item_offhand_cursed_bone:
              - if <context.cause> == ENTITY_ATTACK:
                - hurt 1 <context.entity>
                - cast HUNGER amplifier:0 duration:60s <context.damager> hide_particles
                - if <util.random.int[0].to[100]> <= 10:
                  - cast POISON amplifier:0 duration:10s <context.entity>
                  - feed <context.damager> amount:-1
                  - playeffect effect:REDSTONE quantity:100 offset:0.35 at:<context.entity.location> special_data:1.3|green
                  - playsound <context.damager.location> sound:ENTITY_PLAYER_HURT_DROWN volume:1.0 pitch:0.1
                  - actionbar targets:<context.damager> "<&e>Вы отравили <context.entity.name>"
item_offhand_cursed_bone_kill:
    type: world
    debug: false
    events:
        on entity killed by entity:
          - if <context.damager.is_player||null> = true:
            - if <context.damager.item_in_offhand.script.name||null> = item_offhand_cursed_bone:
              - feed <context.damager> amount:5
              - actionbar targets:<context.damager> "<&e>Вы поглотили часть жизненной силы противника, восстановив 5 ед. сытости"
item_offhand_ammonite_shell:
    type: item
    debug: false
    material: nautilus_shell
    display name: "<&6><&l>Панцирь Аммониты"
    lore:
    - "<&6>Зачарованный панцирь древнего моллюска."
    - "<&6>Приложив его к уху, можно"
    - "<&6>услышать шум моря."
    - ""
    - "<&7>Когда во второстепенной руке:"
    - "<&a> - При получении урона применяет"
    - "<&a> Сопротивление I (0.10), эффект"
    - "<&a> срабатывает не чаще раза в 20 сек."
    - "<&a> - При получении урона от нехватки"
    - "<&a> кислорода, даёт возможность дышать"
    - "<&a> под водой на одну минуту. Эффект"
    - "<&a> срабатывает не чаще раза в две минуты."
    mechanisms:
      custom_model_data: 1
      unbreakable: true
      nbt_attributes:
      - generic.armor/offhand/0.0/4.0
      - generic.armor_toughness/offhand/0.0/1.0
    enchantments:
    - durability:5
item_offhand_ammonite_shell_use:
    type: world
    debug: false
    events:
        on entity damages entity:
          - if <context.entity.is_player||null> = true:
            - if <context.entity.item_in_offhand.script.name||null> = item_offhand_ammonite_shell:
              - if <context.cause> == ENTITY_ATTACK:
                  - if <context.entity.has_flag[ammonite_shell_buff]> = false:
                    - flag <context.entity> ammonite_shell_buff duration:20s
                    - cast DAMAGE_RESISTANCE amplifier:0 duration:10s <context.entity> hide_particles
                    - playeffect effect:REDSTONE quantity:100 offset:0.35 at:<context.entity.location> special_data:1.3|gray
                    - playsound <context.entity.location> sound:ENTITY_PLAYER_HURT_DROWN volume:1.0 pitch:0.1
                    - actionbar targets:<context.entity> "<&e>Панцирь Аммониты защищает Вас от урона."
item_offhand_ammonite_shell_oxygen:
    type: world
    debug: false
    events:
        on entity damaged:
         - if <context.entity.is_player||null> = true:
            - if <context.entity.item_in_offhand.script.name||null> = item_offhand_ammonite_shell:
              - if <context.cause> == DROWNING:
                - if <context.entity.has_flag[ammonite_shell_oxygen]> = false:
                    - flag <context.entity> ammonite_shell_oxygen duration:120s
                    - cast WATER_BREATHING amplifier:0 duration:60s <context.entity> hide_particles
                    - actionbar targets:<context.entity> "<&e>Панцирь Аммониты дал Вам возможность дышать под водой на одну минуту."
