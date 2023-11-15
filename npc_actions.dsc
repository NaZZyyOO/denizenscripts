lumberjack_action:
    type: assignment
	debug: false
    actions:
        on assignment:
          - trigger name:proximity state:true radius:15 cooldown:4s
		on player move proximity:
		  - animate <npc> animation:ARM_SWING
		  - playsound <npc.location> sound:ITEM_AXE_STRIP volume:<util.random.decimal[1.0].to[2.5]> pitch:<util.random.decimal[0.1].to[0.6]>
smith_action:
    type: assignment
	debug: false
    actions:
        on assignment:
          - trigger name:proximity state:true radius:15 cooldown:4s
		on player move proximity:
		  - animate <npc> animation:ARM_SWING
		  - playsound <npc.location> sound:block_anvil_place volume:<util.random.decimal[0.2].to[0.3]> pitch:<util.random.decimal[0.1].to[0.6]>
          - playeffect effect:LAVA at:SmithSpaks quantity:60
