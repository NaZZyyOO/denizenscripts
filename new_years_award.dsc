new_years_award:
    debug: false
    type: task
    script:
      - define pos <player.location.add[0,1.0,0]>
      - drop item_taler_silver <[pos]> quantity:<util.random.int[15].to[40]>
	  - drop item_taler_gold <[pos]> quantity:<util.random.int[8].to[17]>
	  - drop diamond <[pos]> quantity:<util.random.int[10].to[19]>
	  - drop item_white_ticket <[pos]> quantity:<util.random.int[9].to[20]>
	  - drop item_green_ticket <[pos]> quantity:<util.random.int[4].to[7]>
	  - drop item_red_ticket <[pos]> quantity:3
	  - execute "my addpve <player.name> 20 Задание: Поиск новогодних подарков" as_server silent