denizen_errors:
    type: world
	debug: false
	events:
	    on script generates error:
		  - if <server.has_flag[error_in_chat]> = true:
		    - if <player[NaZZyyOO].is_online> = true:
			  - if <placeholder[essentials_vanished].player[<player[NaZZyyOO]>]> = yes:
		        - narrate "<&7>Скрипт <context.script||null> генерує помилку..." targets:<player[NaZZyyOO]>
		        - narrate "<&7>Опис помилки: <context.message||null>" targets:<player[NaZZyyOO]>
		        - narrate "<&7>Рядок помилки: <context.line||null>" targets:<player[NaZZyyOO]>