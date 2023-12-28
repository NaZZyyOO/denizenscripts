item_xmas_candy_sword:
    type: item
    debug: false
    material: wooden_sword
    display name: "<&6><&l>Карамельный меч"
    lore:
    - ""
    - "<&6>Полосатая карамелька в виде"
    - "<&6>меча. А она довольно острая..."
    - ""
    - "<&7>Использование:"
    - "<&a> - Персонаж откусывает кусочек"
    - "<&a> от меча, тратя 5 ед. прочности,"
    - "<&a> и восстанавливая 3 ед. здоровья."
    mechanisms:
      custom_model_data: 2
      nbt_attributes:
      - generic.movement_speed/mainhand/1.0/+0.05
      - generic.attack_damage/mainhand/0.0/7.0
      - generic.attack_speed/mainhand/0.0/-1.5
item_xmas_candy_sword_use:
    type: world
    debug: false
    events:
        on player right clicks block with:item_xmas_candy_sword:
          - if <player.item_in_hand.script.name.is[==].to[item_xmas_candy_sword]||null>:
            - if <player.has_flag[candyblade_cd]> = false:
              - flag <player> candyblade_cd expire:2s
              - wait 1t
              - playsound sound:block_calcite_break volume:1 pitch:2 <player.location>
              - wait 0.2s
              - heal <player> 3
              - feed <player> amount:2
              - repeat 3:
                - wait 0.2s
                - playsound sound:entity_generic_eat volume:0.4 pitch:2 <player.location>
                - playeffect at:<player.location.add[0,1.65,0]> effect:item_crack special_data:item_xmas_candy_sword quantity:3 offset:0.2 velocity:<player.location.direction.vector.div[10]>
              - if <player.item_in_hand.durability> < 54:
                - inventory adjust slot:<player.held_item_slot> durability:<player.item_in_hand.durability.add[5]>
              - else if <player.item_in_hand.durability> < 1:
                - take <player.item_in_hand>


