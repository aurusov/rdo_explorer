$Frame Shop
$Back_picture = <255 255 255> 640 380
Show
  bitmap [350, 5,   net]
  text   [60, 265, 230, 20, <255 255 255>, <0 0 0>, < '- Credit card machine']
  text   [60, 305, 230, 20, <255 255 255>, <0 0 0>, < '- Cash machine']
Show_if Network_wan.Busyness = 2
  bitmap [358, 30, wans]
Show_if Network_wan.Busyness < 2
  bitmap [358, 30, wanw]
Show_if Network_lan.Busyness = 3
  bitmap [175, 138, lans1]
  bitmap [342, 202, lans2]
  bitmap [338, 80, lans3]
Show_if Network_lan.Busyness < 3
  bitmap [175, 138, lanw1]
  bitmap [342, 202, lanw2]
  bitmap [338, 80, lanw3]
Show_if Cash_equipment_r1.Busyness = Free
  bitmap [199, 110, kas]
  bitmap [20,  299, kas]
Show_if Cash_equipment_r1.Busyness = Busy
  bitmap [199, 110, kaw]
  bitmap [20,  299, kaw]
Show_if Cash_equipment_r2.Busyness = Free
  bitmap [393, 174, kas]
Show_if Cash_equipment_r2.Busyness = Busy
  bitmap [393, 174, kaw]
Show_if Credit_card_machine_r1.Busyness = Free
  bitmap [151, 126, ak1s]
  bitmap [23,  265, ak1s]
Show_if Credit_card_machine_r1.Busyness = Busy
  bitmap [151, 126, ak1w]
  bitmap [23,  265, ak1w]
Show_if Credit_card_machine_r2.Busyness = Free
  bitmap [455, 190, ak2s]
Show_if Credit_card_machine_r2.Busyness = Busy
  bitmap [455, 190, ak2w]
Show_if PC_r.Busyness = Free
  bitmap [319, 56, comps]
Show_if PC_r.Busyness = Busy
  bitmap [319, 56, compw]
Show
  text   [280, 38,  70,  20, <255 255 255>, <0 0 0>,     = PC_r.Busyness]
  text   [125, 110, 70,  20, <255 255 255>, <0 0 0>,     = Credit_card_machine_r1.Busyness]
  text   [183, 95,  70,  20, <255 255 255>, <0 0 0>,     = Cash_equipment_r1.Busyness]
  text   [430, 172, 70,  20, <255 255 255>, <0 0 0>,     = Credit_card_machine_r2.Busyness]
  text   [372, 158, 70,  20, <255 255 255>, <0 0 0>,     = Cash_equipment_r2.Busyness]
  bitmap [80,  65, enter]
  text   [5,   40,  170, 20, <255 255 255>, <0 0 0>,     < 'Customers in:']
  text   [106, 40,  40,  20, <255 255 255>, <0 0 255>,   < Number_r.Number]
  bitmap [500, 230, exit]
  text   [430, 260, 170, 20, <255 255 255>, <0 0 0>,     < 'Customers out:']
  text   [540, 260, 40,  20, <255 255 255>, <0 0 255>,   < Number_r.Come_out]
  text   [120, 195, 170, 20, <255 255 255>, <0 0 0>,     < 'Customers in the shop:']
  text   [282, 195, 40,  20, <255 255 255>, <0 0 255>,   < Number_r.In_system]
  text   [140, 160, 70,  20, <255 255 255>, <0 0 0>,     < 'Queue: ']
  text   [197, 160, 40,  20, <255 255 255>, <255 0 255>, < Number_r.Lenghth_of_queue_1]
  text   [390, 220, 70,  20, <255 255 255>, <0 0 0>,     < 'Queue: ']
  text   [447, 220, 40,  20, <255 255 255>, <255 0 255>, < Number_r.Lenghth_of_queue_2]
  text   [430, 80,  160, 20, <255 255 255>, <0 0 0>,     < 'Stoc of global network:']
  text   [590, 80,  40,  20, <255 255 255>, <0 170 0>,   < Network_wan.Busyness]
  text   [430, 100, 160, 20, <255 255 255>, <0 0 0>,     < 'Stoc of local network:']
  text   [590, 100, 40,  20, <255 255 255>, <0 170 0>,   < Network_lan.Busyness]
$End
