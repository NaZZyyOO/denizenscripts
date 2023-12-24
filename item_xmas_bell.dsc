item_xmas_bell:
    type: item
    debug: false
    material: gold_nugget
    display name: "<&6><&l>Колокольчик"
    lore:
    - ""
    - "<&6>Латунный колокольчик,"
    - "<&6>украшенный веточкой омелы."
    - ""
    - "<&7>Использование:"
    - "<&a> - Звенит в колокольчик."
    mechanisms:
      custom_model_data: 4
      nbt_attributes:
	  - generic.movement_speed/mainhand/1.0/+0.05

item_xmas_bell_use:
    type: world
    debug: false
    events:
        on player right clicks block with:item_xmas_bell:
          - if <player.item_in_hand.script.name.is[==].to[item_xmas_bell]||null>:
            - if <player.has_flag[bell_cd]> = false:
              - flag <player> bell_cd expire:2s
              - animate <player> animation:ARM_SWING for:<server.online_players>
              - wait 1t
              - playsound sound:bell pitch:1.5 volume:0.5 <player.location> custom

