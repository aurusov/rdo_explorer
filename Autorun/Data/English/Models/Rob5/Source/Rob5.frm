$Frame  Frame_1
$Back_picture = rob5fr_e
Show
  text   [330,  5, 100, 18, transparent, <255 255 255>, = 'Model: ROB5']
  text   [350, 50,  90, 18, <170 170 170>, <  0   0 255>, TR.Location]
  text   [TR.Coordinate, 220, 90, 18, <100 100 255>, <255 255   0>, < TR.Place_to_go]
  text   [ 50, 310, 20, 18, <255 255 0>, <0 0 0>, C1.Quantity_of_parts]
  text   [ 90,  30, 20, 18, <255 255 0>, <0 0 0>, C2.Quantity_of_parts]
  text   [490,  30, 20, 18, <255 255 0>, <0 0 0>, C3.Quantity_of_parts]
  text   [240,  85, 20, 18, <255 255 0>, <0 0 0>, CP.Quantity_of_parts]
  rect   [350, 80, 80, 22, <127 127 127>, <255 255 0> ]
  text   [350, 80, 80, 22, transparent, <255   0   0>, < Time_now]

Show_if PoC1_1.State = is_filled
  bitmap [16, 180+Location_of_part(C1.Position, 1, 6)*20, rob5_v, rob5_vm]
Show_if PoC1_2.State = is_filled
  bitmap [16, 180+Location_of_part(C1.Position, 2, 6)*20, rob5_v, rob5_vm]
Show_if PoC1_3.State = is_filled
  bitmap [16, 180+Location_of_part(C1.Position, 3, 6)*20, rob5_v, rob5_vm]
Show_if PoC1_4.State = is_filled
  bitmap [16, 180+Location_of_part(C1.Position, 4, 6)*20, rob5_v, rob5_vm]
Show_if PoC1_5.State = is_filled
  bitmap [16, 180+Location_of_part(C1.Position, 5, 6)*20, rob5_v, rob5_vm]
Show_if PoC1_6.State = is_filled
  bitmap [16, 180+Location_of_part(C1.Position, 6, 6)*20, rob5_v, rob5_vm]

Show_if PoC2_1.State = is_filled
  bitmap [59, 175-Location_of_part(C2.Position, 1, 6)*20, rob5_k, rob5_km]
Show_if PoC2_2.State = is_filled
  bitmap [59, 175-Location_of_part(C2.Position, 2, 6)*20, rob5_k, rob5_km]
Show_if PoC2_3.State = is_filled
  bitmap [59, 175-Location_of_part(C2.Position, 3, 6)*20, rob5_k, rob5_km]
Show_if PoC2_4.State = is_filled
  bitmap [59, 175-Location_of_part(C2.Position, 4, 6)*20, rob5_k, rob5_km]
Show_if PoC2_5.State = is_filled
  bitmap [59, 175-Location_of_part(C2.Position, 5, 6)*20, rob5_k, rob5_km]
Show_if PoC2_6.State = is_filled
  bitmap [59, 175-Location_of_part(C2.Position, 6, 6)*20, rob5_k, rob5_km]

Show_if PoC3_1.State = is_filled
  bitmap [455, 35+Location_of_part(C3.Position, 1, 6)*24, rob5_r, rob5_rm]
Show_if PoC3_2.State = is_filled
  bitmap [455, 35+Location_of_part(C3.Position, 2, 6)*24, rob5_r, rob5_rm]
Show_if PoC3_3.State = is_filled
  bitmap [455, 35+Location_of_part(C3.Position, 3, 6)*24, rob5_r, rob5_rm]
Show_if PoC3_4.State = is_filled
  bitmap [455, 35+Location_of_part(C3.Position, 4, 6)*24, rob5_r, rob5_rm]
Show_if PoC3_5.State = is_filled
  bitmap [455, 35+Location_of_part(C3.Position, 5, 6)*24, rob5_r, rob5_rm]
Show_if PoC3_6.State = is_filled
  bitmap [455, 35+Location_of_part(C3.Position, 6, 6)*24, rob5_r, rob5_rm]

Show_if PoCP_1.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 1, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 1, 10)), rob5_r, rob5_rm]
Show_if PoCP_2.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 2, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 2, 10)), rob5_r, rob5_rm]
Show_if PoCP_3.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 3, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 3, 10)), rob5_r, rob5_rm]
Show_if PoCP_4.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 4, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 4, 10)), rob5_r, rob5_rm]
Show_if PoCP_5.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 5, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 5, 10)), rob5_r, rob5_rm]
Show_if PoCP_6.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 6, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 6, 10)), rob5_r, rob5_rm]
Show_if PoCP_7.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 7, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 7, 10)), rob5_r, rob5_rm]
Show_if PoCP_8.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 8, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 8, 10)), rob5_r, rob5_rm]
Show_if PoCP_9.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 9, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 9, 10)), rob5_r, rob5_rm]
Show_if PoCP_10.State = is_filled
  bitmap [PoCP_X(Location_of_part(CP.Position, 10, 10)),
	  PoCP_Y(Location_of_part(CP.Position, 10, 10)), rob5_r, rob5_rm]

Show_if  TR.Busyness <> Moving_loaded and TR.Busyness <> Unloading
  bitmap [TR.Coordinate, 167, rob5_r1, rob5_r1m]
Show_if  [TR.Busyness = Moving_loaded or TR.Busyness = Unloading] and
  [TR.Location = Conveyer_1 or TR.Location = AssPos] and
  TR.Place_to_go = AssPos and AP.What_is_loaded = Unloaded
  bitmap [TR.Coordinate, 167, rob5_r3, rob5_r1m]
Show_if  [TR.Busyness = Moving_loaded or TR.Busyness = Unloading] and
  [TR.Location = Conveyer_2 or TR.Location = AssPos] and
  TR.Place_to_go = AssPos and AP.What_is_loaded = Shaft_is_loaded
  bitmap [TR.Coordinate, 167, rob5_r4, rob5_r1m]
Show_if  [TR.Busyness = Moving_loaded or TR.Busyness = Unloading] and
  TR.Place_to_go <> AssPos
  bitmap [TR.Coordinate, 167, rob5_r2, rob5_r1m]

Show_if  AP.Busyness = Free
  text   [ 96, 138, 80, 18, <0 255 0>, <0 0 0>, = AP.Busyness]
Show_if  AP.Busyness = Busy
  text   [ 96, 138, 80, 18, <255 0 0>, <0 0 0>, = AP.Busyness]
Show_if  AP.What_is_loaded = Shaft_is_loaded or AP.What_is_loaded = Loaded
  bitmap [100, 205, rob5_v, rob5_vm]
Show_if  AP.What_is_loaded = Loaded
  bitmap [100, 160, rob5_k, rob5_km]
Show_if  AP.What_is_loaded = Processed
  bitmap [140, 202, rob5_r, rob5_rm]

Show_if  GM.Busyness = Free
  text   [350, 123, 80, 18, <0 255  0>, <0 0 0>, = GM.Busyness]
Show_if  GM.Busyness = Busy
  text   [350, 123, 80, 18, <255 0  0>, <0 0 0>, = GM.Busyness]
Show_if  GM.Busyness = Is_broken or GM.Busyness = Repairing
  text   [350, 123, 80, 18, <0 0  255>, <0 0 0>, = GM.Busyness]
Show_if  GM.What_is_loaded = Loaded or GM.What_is_loaded = Processed
  bitmap [370, 145, rob5_r, rob5_rm]

$End

