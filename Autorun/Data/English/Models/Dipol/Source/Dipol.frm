$Frame  Shot_1
$Back_picture = <0 0 100> {780  505} dipfon1
Show
text [387, 361, 40, 20, <127 127 127>, <0 0 0>, The_assembling122.The_rest_of_parts ]
text [424, 361, 40, 20, <127 127 127>, <0 0 0>, The_assembling222.The_rest_of_parts ]
text [462, 361, 40, 20, <127 127 127>, <0 0 0>, The_assembling322.The_rest_of_parts ]
text [499, 361, 40, 20, <127 127 127>, <0 0 0>, The_assembling422.The_rest_of_parts ]
text [134, 168, 50, 20, <0 0 255>, <255 255 255>, Block3.Busy_cells ]
text [379, 168, 50, 20, <0 0 255>, <255 255 255>, Block3333.Busy_cells ]
text [241, 168, 50, 20, <0 0 255>, <255 255 255>, Block30.Busy_cells ]
text [410, 315, 50, 20, <0 0 255>, <255 255 255>, Block2323.Busy_cells ]
text [340, 379, 50, 20, <0 0 255>, <255 255 255>, Block23.Busy_cells ]
text [31, 189, 50, 20, <255 255 0>, <0 0 255>, Store_house_9.Number_of_sheets]
text [142, 95, 50, 20, <255 255 0>, <0 0 255>, Store_house_8.Number_of_sheets]
text [147, 46, 50, 20, <255 255 0>, <0 0 255>,Shelving10.Number_of_the_bands]
text [354, 46, 50, 20, <255 255 0>, <0 0 255>,Shelving11.Number_of_the_bands]
text [426, 57, 50, 20, <255 255 0>, <0 0 255>,Shelving12.Number_of_the_bands]
text [444, 71, 50, 20, <255 255 0>, <0 0 255>,Shelving13.Number_of_the_bands]
text [185, 51, 50, 20, <255 0 0>, <255 255 255>,The_band_forwarding_device29.Number_of_the_bands]
text [272, 51, 50, 20, <255 0 0>, <255 255 255>,The_band_forwarding_device30.Number_of_the_bands]
text [393, 51, 50, 20, <255 0 0>, <255 255 255>,The_band_forwarding_device31.Number_of_the_bands]
text [474, 51, 50, 20, <255 0 0>, <255 255 255>,The_band_forwarding_device32.Number_of_the_bands]
text [48, 51, 50, 20, <0 100 0>, <255 255 255>, Half_fin_prod_area.Number_of_the_bands]
text [541, 46, 50, 20, <0 255 0>,<255 255 255>, Input_tb_6.Number_of_the_bands]
text [617, 143, 50, 20, <255 0 0>,<255 255 0>, Conveyer7.Number_of_sheets]
text [176, 143, 50, 20, <255 0 0>, <0 0 0>,Caset15.Number_of_the_parts]
text [306, 143, 50, 20, <255 0 0>,<0 0 0>,Caset151.Number_of_the_parts]
text [386, 143, 50, 20, <255 0 0>, <0 0 0>,Caset17.Number_of_the_parts]
text [465, 143, 50, 20,<255 0 0>, <0 0 0>,Caset171.Number_of_the_parts]
text [692, 446, 50, 20, <127 127 127>, <255 0 0>, Smooth_out_machine.Functioning ]

Show_if  Press1.Busyness = Free
  text [187, 100, 60, 20, <0 255 0>, <255 255 0>, 'FREE']
Show_if  Press1111.Busyness = Free
  text [273, 100, 60, 20, <0 255 0>, <255 255 0>, 'FREE']
Show_if  Press2.Busyness = Free
  text [399, 100, 60, 20, <0 255 0>, <255 255 0>, 'FREE']
Show_if  Press2222.Busyness = Free
  text [480, 100, 60, 20, <0 255 0>, <255 255 0>, 'FREE']
Show_if  Press1.Busyness = Busy
  text [187, 100, 60, 20, <255 255 0>, <0 0 255>, 'BUSY']
Show_if  Press1111.Busyness = Busy
  text [273, 100, 60, 20, <255 255 0>, <0 0 255>, 'BUSY']
Show_if  Press2.Busyness = Busy
  text [399, 100, 60, 20, <255 255 0>, <0 0 255>, 'BUSY']
Show_if  Press2222.Busyness = Busy
  text [480, 100, 60, 20, <255 255 0>, <0 0 255>, 'BUSY']
Show_if  The_man3.Busyness = Busy
  bitmap [244, 453, rab2s, rab1m]
Show_if  The_man3.Busyness = Wait
  bitmap [244, 453, rab1s, rab1m]
Show_if  The_man3.Busyness = Load_in_machine
  bitmap [244, 453, rab3s, rab1m]

Show_if  The_man3.Busyness = Unload_from_washing_machine_first_time
  bitmap [244, 453, rab4s, rab1m]

Show_if  The_man3.Busyness = Man3_wait_for_the_second_time
  bitmap [244, 453, rab5s, rab1m]

Show_if  The_man3.Busyness = Man3_busy_with_washing_machine_for_the_second_time
  bitmap [244, 453, rab6s, rab1m]

Show_if  The_man3.Busyness = Load_in_washing_machine_for_the_second_time
  bitmap [244, 453, rab7s, rab1m]
Show_if  The_man3.Busyness = Unload_from_washing_machine_second_time
  bitmap [244, 453, rab8s, rab1m]
Show_if  The_man4.Busyness = Busy
  bitmap [309, 453, rab2s, rab1m]
Show_if  The_man4.Busyness = Wait
  bitmap [309, 453, rab1s, rab1m]
Show_if  The_man4.Busyness = Work_of_man4
  bitmap [309, 453, rab9s, rab1m]
Show_if  The_man5.Busyness = Busy
  bitmap [339, 470, rab2s, rab1m]
Show_if  The_man5.Busyness = Wait
  bitmap [339, 470, rab1s, rab1m]
Show_if  The_man5.Busyness = Work_of_man5
 bitmap [339, 470, rab10s, rab1m]
Show_if  The_man1.Busyness = Busy
  bitmap [661, 432, rab2s, rab1m]
Show_if  The_man1.Busyness = Wait
  bitmap [661, 432, rab1s, rab1m]
Show_if  The_man1.Busyness = Load_in_machine
  bitmap [661, 432, rab3s, rab1m]
Show_if  The_man1.Busyness = Unload_from_smooth_out_machine
  bitmap [661, 432, rab11s, rab1m]
Show_if  The_man2.Busyness = Busy
  bitmap [590, 432, rab2s, rab1m]
Show_if  The_man2.Busyness = Wait
  bitmap [590, 432, rab1s, rab1m]
Show_if  The_man2.Busyness = Load_in_machine
  bitmap [590, 432, rab3s, rab1m]
Show_if  The_man2.Busyness = Unload_from_washing_machine_first_time
  bitmap [590, 432, rab4s, rab1m]
Show_if  Half_fin_prod_area.Busyness = Free
  text[173, 18, 70, 20, <0 255 0>, <255 255 0>, 'FREE']
Show_if  Half_fin_prod_area.Busyness = Busy
  text[173, 18, 70, 20, <255 0 0>, <255 255 255>, ' BUSY  ']
Show_if  Scissors5.Busyness = Busy
  text[608, 115, 70, 20, <255 0 0>, <255 255 255>, ' BUSY  ']
Show_if  Scissors5.Busyness = Free
  text[608, 115, 70, 20, <0 255 0>, <255 255 0>, 'FREE']
Show_if  Conveyer7.Position = Scissors_
  bitmap [612, 144, det1, detm]

Show_if  Smooth14.Busyness = Busy
  bitmap [207, 124, det2, detm]
Show_if  Smooth1414.Busyness = Busy
  bitmap [297, 124, det2, detm]
Show_if  Smooth16.Busyness = Busy
  bitmap [415, 144, det2, detm]
Show_if  Smooth1616.Busyness = Busy
  bitmap [496, 144, det2, detm]
Show_if  Caset15.Busyness = Busy
  bitmap [206, 150, det1, detm]
Show_if  Caset151.Busyness = Busy
  bitmap [291, 150, det1, detm]
Show_if  Caset17.Busyness = Busy
  bitmap [410, 150, det1, detm]
Show_if  Caset171.Busyness = Busy
  bitmap [492, 150, det1, detm]
Show_if  Reception2526.Busyness = Busy
  bitmap [648, 354, det3, detm]
Show_if  Reception2728.Busyness = Busy
  bitmap [291, 341, det3, detm]

Show_if  Reception2827.Busyness = Busy
  bitmap [291, 339, det3, detm]
Show_if  Reception2526.Busyness = Wait
  bitmap [648, 354, det2, detm]
Show_if  Reception2728.Busyness = Wait
  bitmap [291, 341, det2, detm]

Show_if  Reception2827.Busyness = Wait
  bitmap [291, 399, det2, detm]

Show_if  Smooth_out_machine.Busyness <> Free
  text[685, 479, 60, 20, <255 0 0>, <255 255 255>, 'BUSY']
Show_if  The_washing19.Functioning = Loaded
  text[625, 449, 60, 20, <0 100 0>, <255 255 255>, 'LOAD']

Show_if  The_washing19.Functioning = The_end_of_washing
  text[625, 449, 60, 20, <0 0 255>, <255 255 255>, 'END']
Show_if  The_washing19.Functioning = Wait_loading
text[625, 449, 60, 20, <0 255 0>, <255 255 255>, 'WAIT']

Show_if  The_washing.Functioning = Loaded
  text[241, 392, 60, 20, <0 100 0>, <255 255 255>, 'LOAD']

Show_if  The_washing.Functioning = The_end_of_washing
  text[241, 392, 60, 20, <0 0 255>, <255 255 255>, 'END']

Show_if  The_washing.Functioning = Wait_loading
  text[241, 392, 60, 20, <0 255 0>, <255 255 255>, 'WAIT']

Show_if  The_washing.Functioning = Wait_second_loading
  text[241, 392, 60, 20, <0 255 255>, <255 255 255>, 'WT2L']

Show_if  The_washing.Functioning = Loaded_for_the_second_time
  text[241, 392, 60, 20, <255 0 0>, <255 255 255>, 'BUS2']

Show_if  The_washing.Functioning = The_end_of_second_washing
  text[241, 392, 60, 20, <0 0 255>, <255 255 255>, 'END2']

Show_if  The_assembling122.Busyness = Wait
  text[380, 410, 60, 20, <0 255 0>, <255 255 255>, 'WAIT']

Show_if  The_assembling122.Busyness = Busy
  text[380, 410, 60, 20, <255 0 0>, <255 255 255>, 'BUSY']

Show_if  The_assembling222.Busyness = Wait
  text[420, 410, 60, 20, <0 255 0>, <255 255 255>, 'WAIT']

Show_if  The_assembling222.Busyness = Busy
  text[420, 410, 60, 20, <255 0 0>, <255 255 255>, 'BUSY']

Show_if  The_assembling322.Busyness = Wait
  text[460, 410, 60, 20, <0 255 0>, <255 255 255>, 'WAIT']

Show_if  The_assembling322.Busyness = Busy
  text[460, 410, 60, 20, <255 0 0>, <255 255 255>, 'BUSY']

Show_if  The_assembling422.Busyness = Wait
  text[500, 410, 60, 20, <0 255 0>, <255 255 255>, 'WAIT']

Show_if  The_assembling422.Busyness = Busy
  text[500, 410, 60, 20, <255 0 0>, <255 255 255>, 'BUSY']

Show_if  The_crane.Position = _Sheets_store9 and The_crane.Busyness = Busy
  bitmap [166, 141, detal1, detalm]

Show_if  The_crane.Position = _Sheets_store9 and The_crane.Busyness = Free
  bitmap [166, 141, detal2, detalm]
Show_if  The_crane.Position = _Sheets_store8 and The_crane.Busyness = Busy
  bitmap [180, 141, detal1, detalm]

Show_if  The_crane.Position = _Sheets_store8 and The_crane.Busyness = Free
  bitmap [180, 141, detal2, detalm]
Show_if  The_crane.Position = _Half_finished_product_area and The_crane.Busyness = Busy
  bitmap [78, 106, detal1, detalm]

Show_if  The_crane.Position = _Half_finished_product_area and The_crane.Busyness = Free
  bitmap [78, 106, detal2, detalm]
Show_if  The_crane.Position = _Shelving10 and The_crane.Busyness = Busy
  bitmap [148, 47, detal1, detalm]

Show_if  The_crane.Position = _Shelving10 and The_crane.Busyness = Free
  bitmap [148, 47, detal2, detalm]
Show_if  The_crane.Position = _Shelving11 and The_crane.Busyness = Busy
  bitmap [355, 47, detal1, detalm]
Show_if  The_crane.Position = _Shelving11 and The_crane.Busyness = Free
	bitmap [355, 47, detal2, detalm]

Show_if  The_crane.Position = _Shelving12 and The_crane.Busyness = Busy
	bitmap [429, 90, detal1, detalm]

Show_if  The_crane.Position = _Shelving12 and The_crane.Busyness = Free
	bitmap [429, 90, detal1, detalm]
Show_if  The_crane.Position = _Shelving13 and The_crane.Busyness = Busy
	bitmap [429, 90, detal1, detalm]
Show_if  The_crane.Position = _Shelving13 and The_crane.Busyness = Free
  bitmap [429, 90, detal2, detalm]
Show_if  The_crane.Position = _Band_forwarding_device29 and The_crane.Busyness = Busy
  bitmap [230, 54, detal1, detalm]

Show_if  The_crane.Position = _Band_forwarding_device29 and The_crane.Busyness = Free
 bitmap [230, 54, detal2, detalm]

Show_if  The_crane.Position = _Band_forwarding_device30 and The_crane.Busyness = Busy
  bitmap [244, 82, detal1, detalm]

Show_if  The_crane.Position = _Band_forwarding_device30 and The_crane.Busyness = Free
  bitmap [244, 82, detal2, detalm]
Show_if  The_crane.Position = _Band_forwarding_device31 and The_crane.Busyness = Busy
  bitmap [328, 82, detal1, detalm]

Show_if  The_crane.Position = _Band_forwarding_device31 and The_crane.Busyness = Free
  bitmap [328, 82, detal2, detalm]
Show_if  The_crane.Position = _Band_forwarding_device32 and The_crane.Busyness = Busy
  bitmap [555, 84, detal1, detalm]

Show_if  The_crane.Position = _Band_forwarding_device32 and The_crane.Busyness = Free
 bitmap [555, 84, detal2, detalm]

Show_if  The_crane.Position = _Roller_conveyer and The_crane.Busyness = Busy
  bitmap [665, 168, detal1, detalm]

Show_if  The_crane.Position = _Roller_conveyer and The_crane.Busyness = Free
  bitmap [665, 168, detal2, detalm]
Show_if  The_crane.Position = _Input_table and The_crane.Busyness = Busy
  bitmap [570, 99, detal1, detalm]

Show_if  The_crane.Position = _Input_table and The_crane.Busyness = Free
  bitmap [570, 99, detal2, detalm]

Show_if  Tr_robot125.Position = Reception_device2526
  bitmap [690, 336, deta2, detam]

Show_if  Tr_robot225.Position = Reception_device2526
  bitmap [700, 350, deta1, detam]
Show_if  Tr_robot125.Position = Store_block3333
  bitmap [502, 166, deta2, detam]
Show_if  Tr_robot225.Position = Store_block3333
  bitmap [457, 166, deta1, detam]
Show_if  Tr_robot125.Position = Case171
  bitmap [515, 166, deta2, detam]
Show_if  Tr_robot225.Position = Case171
  bitmap [473, 166, deta1, detam]

Show_if  Tr_robot125.Position = Case17
  bitmap [390, 166, deta2, detam]

Show_if  Tr_robot225.Position = Case17
  bitmap [420, 166, deta1, detam]

Show_if  Tr_robot126.Position = Assembling_place122
bitmap [372, 379, d2, dm]

Show_if  Tr_robot226.Position = Assembling_place122
  bitmap [392, 379, d1, dm]
Show_if  Tr_robot126.Position = Assembling_place222
  bitmap [409, 379, d2, dm]
Show_if  Tr_robot226.Position = Assembling_place222
  bitmap [430, 379, d1, dm]
Show_if  Tr_robot126.Position = Assembling_place322
  bitmap [446, 379, d2, dm]
Show_if  Tr_robot226.Position = Assembling_place322
  bitmap [467, 379, d1, dm]
Show_if  Tr_robot126.Position = Assembling_place422
  bitmap [482, 379, d2, dm]
Show_if  Tr_robot226.Position = Assembling_place422
  bitmap [502, 379, d1, dm]
Show_if  Tr_robot126.Position = Store_block2323
  bitmap [435, 353, d2, dm]
Show_if  Tr_robot226.Position = Store_block2323
 bitmap [440, 353, d1, dm]
Show_if  Tr_robot126.Position = Reception_device2526
  bitmap [634, 365, d2, dm]
Show_if  Tr_robot226.Position = Reception_device2526

  bitmap [699, 388, d1, dm]
Show_if  Tr_robot126.Position = Man1
  bitmap [661, 428, d2, dm]
Show_if  Tr_robot226.Position = Man1
	bitmap [693, 428, d1, dm]
Show_if  Tr_robot126.Position = Man2
	bitmap [526, 424, d2, dm]
Show_if  Tr_robot226.Position = Man2
	bitmap [613, 428, d1, dm]
Show_if  Tr_robot127.Position = Case15
 bitmap [180, 166, deta2, detam]
Show_if  Tr_robot227.Position = Case15
  bitmap [220, 166, deta1, detam]
Show_if  Tr_robot127.Position = Case151
	bitmap [272, 166, deta2, detam]
Show_if  Tr_robot227.Position = Case151
	bitmap [310, 166, deta1, detam]
Show_if  Tr_robot127.Position = Store_block3
	bitmap [242, 166, deta2, detam]
Show_if  Tr_robot227.Position = Store_block3
  bitmap [260, 166, deta1, detam]
Show_if  Tr_robot127.Position = Reception_device2728
	bitmap [270, 305, deta2, detam]
Show_if  Tr_robot227.Position = Reception_device2728
  bitmap [270, 285, deta1, detam]
Show_if  Tr_robot127.Position = Reception_device2827
  bitmap [284, 417, deta2, detam]
Show_if  Tr_robot227.Position = Reception_device2827
 bitmap [284, 447, deta1, detam]
Show_if  Tr_robot127.Position = Man3
 bitmap [261, 425, deta2, detam]
Show_if  Tr_robot227.Position = Man3
 bitmap [261, 440, deta1, detam]
Show_if  Tr_robot128.Position = Man4
  bitmap [300, 458, d2, dm]

Show_if  Tr_robot228.Position = Man4
bitmap [300, 478, d1, dm]

Show_if  Tr_robot128.Position = Man5
 bitmap [329, 458, d2, dm]

Show_if  Tr_robot228.Position = Man5
  bitmap [329, 478, d1, dm]

Show_if  Tr_robot128.Position = Store_block23
  bitmap [329, 408, d2, dm]

Show_if  Tr_robot228.Position = Store_block23
  bitmap [329, 428, d1, dm]

Show_if  Tr_robot128.Position = Reception_device2827
  bitmap [300, 445, d2, dm]

Show_if  Tr_robot228.Position = Reception_device2827
 bitmap [300, 465, d1, dm]

Show_if  Tr_robot128.Position = Reception_device2728
  bitmap [300, 412, d2, dm]

Show_if  Tr_robot228.Position = Reception_device2728
 bitmap [320, 400, d1, dm]

$End 

