$Frame  Shot_1   
$Back_picture=<100 250 0> Stor_e
Show
text [50,   25, 250, 15, transparent, <0 0 0>, 'ÐÄÎ-simulator']
text [400,  25, 200, 15, transparent, <0 0 0>, ='Model: STORAGE']
text [50,   50, 200, 15, transparent, <0 0 0>, 'Time now']
text [180,  50, 100, 15, transparent, <0 0 0>, <1.0+(Time_now/24.0)] 
text [10,   90, 250, 15, transparent, <0 0 0>, <'Stock on the day beginning']
text [300,  90, 100, 15, transparent, <0 0 0>, >Warehouse_1.Presence]
text [10,  105, 250, 15, transparent, <0 0 0>, <'Selling for last day']
text [300, 105, 100, 15, transparent, <0 0 0>, >Warehouse_1.Order_for_day]
text [10,  120, 250, 15, transparent, <0 0 0>, <'State of the warehouse']
text [300, 120, 300, 15, transparent, <0 0 0>, Warehouse_1.State]
text [10,  135, 250, 15, transparent, <0 0 0>, <'Storage fee']
text [300, 135, 100, 15, transparent, <0 0 0>, >Warehouse_1.Storage_fee]
text [10,  150, 250, 15, transparent, <0 0 0>, <'Nonsales fee']
text [300, 150, 100, 15, transparent, <0 0 0>, >Warehouse_1.Nonsales_fee]
text [10,  165, 250, 15, transparent, <0 0 0>, <'Deliveries_fee']
text [300, 165, 100, 15, transparent, <0 0 0>, >Warehouse_1.Deliveries_fee]
text [10,  180, 250, 15, transparent, <255 0 0>, <'Summary fee']
text [300, 180, 100, 15, transparent, <255 0 0>, >Warehouse_1.Storage_fee +
      Warehouse_1.Nonsales_fee + Warehouse_1.Deliveries_fee]

text  [20, 220+(235-X_2), 30, 15, transparent, <255 0 0>, X_2]
s_bmp [50, 240+(220-X_2), 250, 15, ur, urm] 
s_bmp [183, 240+(220-Warehouse_1.Presence), 62, Warehouse_1.Presence, skl, sklm] 
s_bmp [88, 240+(220-Warehouse_1.Order_for_day), 60, Warehouse_1.Order_for_day, pok, pokm] 

Show_if Warehouse_1.State = Wait_delivery
text  [570, 380, 50, 15, transparent, <0 0 0>, X_1]
bitmap [308, 368, zai_e, zaim]
bitmap [308, 294, post_e, postm]
s_bmp [501, 240+(220-X_1), 58, X_1, skl, sklm] 

$End
