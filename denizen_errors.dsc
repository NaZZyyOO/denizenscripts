denizen_errors:
    type: world
	debug: false
	events:
	    on script generates error:
		  - if <server.has_flag[error_in_chat]> = true:
		    - if <player[NaZZyyOO].is_online> = true:
			  - if <context.script> != null:
		        - narrate "<&7>Скрипт <context.script> генерує помилку..." targets:<player[NaZZyyOO]>
			  - if <context.message> != null:
		        - narrate "<&7>Опис помилки: <context.message>" targets:<player[NaZZyyOO]>
			  - if <context.line> != null:
		        - narrate "<&7>Рядок помилки: <context.line>" targets:<player[NaZZyyOO]>