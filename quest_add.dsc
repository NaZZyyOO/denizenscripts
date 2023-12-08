quets_add:
    type: task
	definitions: quest|player
	debug: false
	script:
	    - flag <[player]> quests:<[player].flag[quests].as_list.include[<[quest]>]>