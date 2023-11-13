denizen_errors:
    type: world
	debug: false
	events:
	    on script generates error:
		  - if <server.has_flag[error_in_chat]> = true:
		    - narrate "<&7>Скрипт <context.script> генерує помилку..."
		    - narrate "<&7>Опис помилки: <context.message>"
		    - narrate "<&7>Рядок помилки: <context.line>"