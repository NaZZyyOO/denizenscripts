item_krampus_horn:
    type: item
    debug: false
    material: bone
    display name: "<&4><&l>Рог Крампуса"
    lore:
    - "<&6>Острый изогнутый рог, отрубленный"
    - "<&6>у Крампуса. Мощный оберег, хранящий"
	- "<&6>в себе частичку демонической"
    - "<&6>магии, и отпугивающий злых"
    - "<&6>духов и непослушных детей."
    mechanisms:
      custom_model_data: 7
      nbt_attributes:
      - generic.movement_speed/mainhand/1.0/-0.1
    enchantments:
    - DURABILITY:10
	- VANISHING_CURSE:1
item_krampus_horn_use:
    type: world
	debug: false
	events:
	    on player dies:
		  - if <player.inventory.contains[item_krampus_horn].quantity[1]> = true:
			- take from:<player.inventory> item_krampus_horn quantity:1
		on entity targets player:
		  - if <player.inventory.contains[item_krampus_horn].quantity[1]> = true:
		    - if <util.random.int[100].to[0]> <= 5:
			  - determine passively cancelled
              - playeffect <context.entity.location.add[0,0.7,0]> effect:REDSTONE special_data:1|<color[#191611].hex> quantity:20 offset:0.3
              - playsound <context.entity.location> sound:entity_illusioner_prepare_mirror volume:0.5 pitch:1
		on player kills entity:
		  - if <player.inventory.contains[item_krampus_horn].quantity[1]> = true:
		    - if <util.random.int[100].to[0]> <= 2:
			  - playsound <player.location> sound:ENTITY_ILLUSIONER_CAST_SPELL volume:0.5 pitch:1.5
			  - playsound <player.location> sound:block_enchantment_table_use pitch:1.5 volume:0.5
			  - heal <player> 5
			  - execute as_server silent "my addmana <player.name> 5"
		on player damages entity:
		  - if <player.inventory.contains[item_krampus_horn].quantity[1]> = true:
		    - if <util.random.int[100].to[0]> <= 3:
			  - hurt <context.entity> 3 source:<player> cause:MAGIC
			  - playeffect at:<context.entity.location.add[0,1.2,0]> effect:SPELL_WITCH quantity:10 offset:0.3
			  - playsound sound:ENTITY_ILLUSIONER_PREPARE_BLINDNESS <context.entity.location> pitch:1.2