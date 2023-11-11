projectile_particles:
    type: world
	debug: false
	events: 
	    on tick every:2:
		  #Паркур
		  - playeffect effect:FIREWORKS_SPARK at:ParkourPortal1 quantity:20 offset:0.3,1.3,0.4 
		  - playeffect effect:FIREWORKS_SPARK at:ParkourPortal2 quantity:20 offset:0.3,2.1,0.4
		  - playeffect effect:FIREWORKS_SPARK at:ParkourPortal3 quantity:20 offset:0.3,1.3,0.4
		  - playeffect effect:FIREWORKS_SPARK at:Parkour1 quantity:20 offset:0.55
		  - playeffect effect:FIREWORKS_SPARK at:Parkour2 quantity:20 offset:0.55
		  - playeffect effect:FIREWORKS_SPARK at:Parkour3 quantity:20 offset:0.55
		  - playeffect effect:FIREWORKS_SPARK at:Parkour4 quantity:20 offset:0.55
		  # Портал в башне магов.
          - playeffect effect:FALLING_NECTAR at:<location[RTPortal].center> quantity:3 offset:0.30,0.30,0.30 visibility:20
          - playeffect effect:ENCHANTMENT_TABLE at:<location[RTPortal].center> quantity:5 offset:0.30,0.30,0.30 visibility:20
          - playeffect effect:REDSTONE at:<location[RTPortal].center> quantity:7 offset:0.25,0.25,0.25 special_data:2.5|black visibility:20
		on tick every:3:
		  #Разломы
	      - if <server.has_flag[nether_rifts]> = true:
            - define color <element[red]>
            - foreach <server.flag[nether_rifts]>:
              - define loc <[value].as_location>
              - inject rift_portal
              - playeffect effect:FALLING_LAVA at:<[loc]> quantity:5 offset:0.35,0.35,0.35 visibility:20
              - playeffect effect:ENCHANTMENT_TABLE at:<[loc]> quantity:5 offset:0.35,0.35,0.35 visibility:20
              - playeffect effect:REDSTONE at:<[loc]> quantity:7 offset:0.25,0.25,0.25 special_data:2.5|black visibility:20
              - define teleported <[loc].find.players.within[1.0]>
              - foreach <[teleported]>:
                - teleport <[value].as_player> HellOut
                - playsound <[value].as_player.location> sound:BLOCK_RESPAWN_ANCHOR_SET_SPAWN volume:1.5
                - playsound <[value].as_player.location> sound:BLOCK_RESPAWN_ANCHOR_DEPLETE volume:1.5
                - playeffect effect:REDSTONE quantity:250 offset:0.55 at:<[value].as_player.location> special_data:2.0|red
          - if <server.has_flag[end_rifts]> = true:
            - define color <element[purple]>
            - foreach <server.flag[end_rifts]>:
              - define loc <[value].as_location>
              - inject rift_portal
              - playeffect effect:FALLING_OBSIDIAN_TEAR at:<[loc]> quantity:5 offset:0.35,0.35,0.35 visibility:20
              - playeffect effect:ENCHANTMENT_TABLE at:<[loc]> quantity:5 offset:0.35,0.35,0.35 visibility:20
              - playeffect effect:REDSTONE at:<[loc]> quantity:7 offset:0.25,0.25,0.25 special_data:2.5|black visibility:20
              - define teleported <[loc].find.players.within[1.0]>
              - foreach <[teleported]>:
                - teleport <[value].as_player> <location[-17,47.5,-76,-13,-127,wealth_the_end]>
                - playsound <[value].as_player.location> sound:BLOCK_RESPAWN_ANCHOR_SET_SPAWN volume:1.5
                - playsound <[value].as_player.location> sound:BLOCK_RESPAWN_ANCHOR_DEPLETE volume:1.5
                - playeffect effect:REDSTONE quantity:250 offset:0.55 at:<[value].as_player.location> special_data:2.0|purple
		on delta time secondly every:6:
		  #Кольца червоточины
		  - define range <element[1.0]>
          - define frequency <element[120]>
          - define circle <element[360]>
          - define step <[circle].div[<[frequency]>].round>
          - define angle <element[0]>
          - repeat <[frequency]>:
            - wait 1t
            - define cosx <[angle].cos>
            - define sinx <[angle].sin>
            - define x <[range].mul[<[cosx]>]>
            - define y <[range].mul[<[sinx]>]>
            - define angle <[angle].add[<[step]>]>
            - define worldportal <location[RTPortal].center.add[0.0,<[y]>,<[x]>]>
            - playeffect effect:REDSTONE quantity:2 offset:0.01 at:<[worldportal]> special_data:1.5|white visibility:20
		  # Визуальные эффекты Амбера
          # Эффекты порталов на спавне.
            - playeffect effect:REDSTONE at:SpawnPortal_01 quantity:60 offset:0.9,1.2,0.25 special_data:1.0|red
            - playeffect effect:REDSTONE at:SpawnPortal_02 quantity:45 offset:0.7,1.2,0.25 special_data:1.0|red
          # Эффекты в портале в ад.
            - playeffect effect:FALLING_LAVA at:HellPortalFx quantity:5 offset:0.35,0.35,0.35
            - playeffect effect:ENCHANTMENT_TABLE at:HellPortalFx quantity:5 offset:0.35,0.35,0.35
            - playeffect effect:REDSTONE at:HellPortalFx quantity:7 offset:0.25,0.25,0.25 special_data:2.5|black
          # Эффекты в портале в энд.
            - playeffect effect:FALLING_OBSIDIAN_TEAR at:EndPortalFx quantity:3 offset:0.35,0.35,0.35
            - playeffect effect:ENCHANTMENT_TABLE at:EndPortalFx quantity:5 offset:0.35,0.35,0.35
            - playeffect effect:REDSTONE at:EndPortalFx quantity:7 offset:0.25,0.25,0.25 special_data:2.5|black
          # Висельники.
            - playeffect effect:white_ash at:Executed01 quantity:5 offset:0.1,0.1,0.1
            - playeffect effect:white_ash at:Executed02 quantity:5 offset:0.1,0.1,0.1
            - playeffect effect:white_ash at:Executed03 quantity:5 offset:0.1,0.1,0.1
		#Круговые эффекты разломов.
		  - define range <element[1.2]>
          - define frequency <element[120]>
          - define circle <element[360]>
          - define step <[circle].div[<[frequency]>].round>
          - define angle <element[0]>
          - repeat <[frequency]>:
            - wait 1t
            - define cosx <[angle].cos>
            - define sinx <[angle].sin>
            - define x <[range].mul[<[cosx]>]>
            - define y <[range].mul[<[sinx]>]>
            - define angle <[angle].add[<[step]>]>
            - define centerhell <location[HellPortalFx].add[<[x]>,<[y]>,0.0]>
            - define centerend <location[EndPortalFx].add[<[x]>,<[y]>,0.0]>
            - playeffect effect:REDSTONE quantity:2 offset:0.01 at:<[centerhell]> special_data:2.0|red visibility:20
            - playeffect effect:REDSTONE quantity:2 offset:0.01 at:<[centerend]> special_data:2.0|purple visibility:20
server_npcs_animation:
    type: world
	debug: false
	events:
	    on delta time secondly every:3:
		  #Кузнец на спавне.
          - if <util.random.int[0].to[100]> <= 65:
            - define smith <npc[31]>
            - animate n@31 animation:ARM_SWING
            - playsound <[smith].location> sound:block_anvil_place volume:<util.random.decimal[0.2].to[0.3]> pitch:<util.random.decimal[0.1].to[0.6]>
            - playeffect effect:LAVA at:SmithSpaks quantity:60
		  #Лесорубы в порту диких земель.
		  - if <util.random.int[0].to[100]> <= 80:
            - define lumber <npc[45]>
            - animate n@45 animation:ARM_SWING
            - playsound <[lumber].location> sound:ITEM_AXE_STRIP volume:<util.random.decimal[1.0].to[2.5]> pitch:<util.random.decimal[0.1].to[0.6]>
          - if <util.random.int[0].to[100]> <= 80:
            - wait <util.random.decimal[0.1].to[0.5]>
            - define lumber <npc[49]>
            - animate n@49 animation:ARM_SWING
            - playsound <[lumber].location> sound:ITEM_AXE_STRIP volume:<util.random.decimal[1.0].to[2.5]> pitch:<util.random.decimal[0.1].to[0.6]>