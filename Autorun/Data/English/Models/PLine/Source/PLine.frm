$Frame  Frame_1
$Back_picture = <0 0 100> {780  505} plinefon

Show
 text [679, 294, 90, 20, <255 0 0>, <255 255 0>, > Machine_A.bot_count]
 text [475, 294, 90, 20, <255 0 0>, <255 255 0>, = Machine_A.bot_count - Machine_B.bot_count]
 text [343, 294, 90, 20, <255 0 0>, <255 255 0>, > Machine_B.bot_count]
 text [190, 294, 90, 20, <255 0 0>, <255 255 0>, = Machine_B.bot_count - Machine_C.bot_count]
 text [26, 294, 90, 20, <255 0 0>, <255 255 0>, > Machine_C.bot_count]

 text  [555, 183, 60, 20, <255 0 0>, <255 255 0>, = Conveyer_1.cur_quant]
 text  [471, 153, 60, 20, <255 0 0>, <255 255 0>, = Conveyer_2.cur_quant]
 text  [409, 183, 60, 20, <255 0 0>, <255 255 0>, = Conveyer_3.cur_quant]
 text  [271, 183, 60, 20, <255 0 0>, <255 255 0>, = Conveyer_4.cur_quant]
 text  [186, 153, 60, 20, <255 0 0>, <255 255 0>, = Conveyer_5.cur_quant]
 text  [117, 183, 60, 20, <255 0 0>, <255 255 0>, = Conveyer_6.cur_quant]

 text  [471, 133, 80, 20, <0 0 255>, <255 255 255>, = Conveyer_2.cur_rate]
 text  [411, 113, 60, 20, <255 255 255>, <0 0 255>, = Conveyer_2.cur_batch_quant]
 text  [186, 133, 80, 20, <0 0 255>, <255 255 255>, = Conveyer_5.cur_rate]
 text  [186, 123, 60, 20, <255 255 255>, <0 0 255>, = Conveyer_5.cur_batch_quant]

 text  [680, 146, 120, 20, <0 0 255>, <255 255 255>, =  Machine_A.cur_rate]
 text  [680, 126, 120, 20, <0 0 255>, <255 255 255>, =  Conveyer_A.cur_speed]
 text  [346, 126, 120, 20, <0 0 255>, <255 255 255>, =  Machine_B.cur_rate]
 text  [17, 172, 120, 20, <0 0 255>, <255 255 255>, =  Machine_C.cur_rate]

Show_if  Machine_A.status = in_run
 text  [672, 280, 70, 20, <255 255 255>, <0 0 0>, =  Machine_A.status]
Show_if  Machine_A.status = stop
 text  [672, 280, 70, 20, <0 0 255>, <255 255 255>, =  Machine_A.status]
Show_if  Machine_A.status = broken
 text  [672, 280, 70, 20, <255 0 0>, <0 0 0>, =  Machine_A.status]
 text  [471, 93, 70, 20, <255 255 255>, <255 0 0>, =  Machine_A.problem_type_A]
Show_if  Machine_B.status = in_run
 text  [342, 274, 70, 20, <255 255 255>, <0 0 0>, =  Machine_B.status]
Show_if  Machine_B.status = stop
 text  [342, 274, 70, 20, <0 0 255>, <255 255 255>, =  Machine_B.status]
Show_if  Machine_B.status = broken
 text  [342, 274, 70, 20, <255 0 0>, <0 0 0>, =  Machine_B.status]
 text  [346, 106, 70, 20, <255 255 255>, <255 0 0>, =  Machine_B.problem_type_B]
Show_if  Machine_C.status = in_run
 text  [26, 240, 70, 20, <255 255 255>, <0 0 0>, =  Machine_C.status]
Show_if  Machine_C.status = stop
 text  [26, 240, 70, 20, <0 0 255>, <255 255 255>, =  Machine_C.status]
Show_if  Machine_C.status = broken
 text  [26, 240, 70, 20, <255 0 0>, <0 0 0>, =  Machine_C.status]

Show_if  Detector_1_1.state = nothing
  bitmap [550, 223, a1, a1m]
Show_if  Detector_1_1.state = batch
  bitmap [550, 223, a2, a1m]
Show_if  Detector_1_1.state = accum
  bitmap [550, 223, a3, a1m]
Show_if  Detector_2_1.state = nothing
  bitmap [630, 223, a1, a1m]
Show_if  Detector_2_1.state = batch
  bitmap [634, 223, a2, a1m]
Show_if  Detector_2_1.state = accum
  bitmap [634, 223, a3, a1m]
Show_if  Detector_1_2.state = nothing
  bitmap [474, 253, a1, a1m]
Show_if  Detector_1_2.state = batch
  bitmap [474, 253, a2, a1m]
Show_if  Detector_1_2.state = accum
  bitmap [474, 253, a3, a1m]
Show_if  Detector_2_2.state = nothing
  bitmap [500, 253, a1, a1m]
Show_if  Detector_2_2.state = batch
  bitmap [500, 253, a2, a1m]
Show_if  Detector_2_2.state = accum
  bitmap [500, 253, a3, a1m]
Show_if  Detector_3_2.state = nothing
  bitmap [530, 253, a1, a1m]
Show_if  Detector_3_2.state = batch
  bitmap [530, 253, a2, a1m]
Show_if  Detector_3_2.state = accum
  bitmap [530, 253, a3, a1m]
Show_if  Detector_1_3.state = nothing
  bitmap [382, 223, a1, a1m]
Show_if  Detector_1_3.state = batch
  bitmap [382, 223, a2, a1m]
Show_if  Detector_1_3.state = accum
  bitmap [382, 223, a3, a1m]
Show_if  Detector_2_3.state = nothing
  bitmap [450, 253, a1, a1m]
Show_if  Detector_2_3.state = batch
  bitmap [450, 253, a2, a1m]
Show_if  Detector_2_3.state = accum
  bitmap [450, 253, a3, a1m]
Show_if  Detector_1_4.state = nothing
  bitmap [268, 223, a1, a1m]
Show_if  Detector_1_4.state = batch
  bitmap [268, 223, a2, a1m]
Show_if  Detector_1_4.state = accum
  bitmap [268, 223, a3, a1m]
Show_if  Detector_2_4.state = nothing
  bitmap [320, 223, a1, a1m]
Show_if  Detector_2_4.state = batch
  bitmap [320, 223, a2, a1m]
Show_if  Detector_2_4.state = accum
  bitmap [320, 223, a3, a1m]
Show_if  Detector_1_5.state = nothing
  bitmap [193, 253, a1, a1m]
Show_if  Detector_1_5.state = batch
  bitmap [193, 253, a2, a1m]
Show_if  Detector_1_5.state = accum
  bitmap [193, 253, a3, a1m]
Show_if  Detector_2_5.state = nothing
  bitmap [228, 253, a1, a1m]
Show_if  Detector_2_5.state = batch
  bitmap [228, 253, a2, a1m]
Show_if  Detector_2_5.state = accum
  bitmap [228, 253, a3, a1m]
Show_if  Detector_3_5.state = nothing
  bitmap [248, 253, a1, a1m]
Show_if  Detector_3_5.state = batch
  bitmap [248, 253, a2, a1m]
Show_if  Detector_3_5.state = accum
  bitmap [248, 253, a3, a1m]
Show_if  Detector_1_6.state = nothing
  bitmap [115, 223, a1, a1m]
Show_if  Detector_1_6.state = batch
  bitmap [115, 223, a2, a1m]
Show_if  Detector_1_6.state = accum
  bitmap [115, 223, a3, a1m]
Show_if  Detector_2_6.state = nothing
  bitmap [160, 223, a1, a1m]
Show_if  Detector_2_6.state = batch
  bitmap [160, 223, a2, a1m]
Show_if  Detector_2_6.state = accum
  bitmap [160, 223, a3, a1m]

Show_if  Conveyer_1.cur_quant > 0
  rect [549, 202, Conveyer_1.cur_quant * Bottle_size / Conveyer_1.number_of_bands * 90.0 / Conveyer_1.length, 17, <255 0 0>, <0 0 0>]
Show_if  Conveyer_2.cur_quant > 0
  rect [470, 172, Conveyer_2.cur_quant * Bottle_size / Conveyer_2.number_of_bands * 79.0 / Conveyer_2.length, 77, <255 0 0>, <0 0 0>]
Show_if  Conveyer_3.cur_quant > 0
  rect [393, 202, Conveyer_3.cur_quant * Bottle_size / Conveyer_3.number_of_bands * 76.0 / Conveyer_3.length, 17, <255 0 0>, <0 0 0>]

Show_if  Batch_to_show_1_1.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_1.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_1.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_1.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if Batch_to_show_1_2.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_2.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_2.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_2.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_1_3.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_3.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_3.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_3.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_1_4.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_4.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_4.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_4.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_1_5.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_5.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_5.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_5.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_1_6.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_6.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_6.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_6.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_1_7.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_7.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_7.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_7.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_1_8.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_8.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_8.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_8.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_1_9.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_9.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_9.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_9.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_1_10.state = busy
  rect [(Conveyer_1.position - Batch_to_show_1_10.beg_pos -
         (Conveyer_1.lap_count - Batch_to_show_1_10.lap_number) *
         Conveyer_1.length) * 90.0 / Conveyer_1.length + 549.0, 202,
         Batch_to_show_1_10.length * 90.0 / Conveyer_1.length, 17, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_1.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_1.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_1.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_1.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if Batch_to_show_2_2.state = busy 
  rect [(Conveyer_2.position - Batch_to_show_2_2.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_2.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_2.length * 79.0 / Conveyer_2.length, 77, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_3.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_3.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_3.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_3.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_4.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_4.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_4.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_4.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_5.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_5.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_5.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_5.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_6.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_6.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_6.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_6.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_7.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_7.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_7.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_7.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_8.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_8.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_8.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_8.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_9.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_9.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_9.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_9.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_10.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_10.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_10.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_10.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_11.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_11.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_11.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_11.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if Batch_to_show_2_12.state = busy 
  rect [(Conveyer_2.position - Batch_to_show_2_12.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_12.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_12.length * 79.0 / Conveyer_2.length, 77, <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_13.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_13.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_13.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_13.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_14.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_14.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_14.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_14.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_15.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_15.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_15.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_15.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_16.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_16.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_16.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_16.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_17.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_17.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_17.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_17.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_18.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_18.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_18.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_18.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_19.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_19.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_19.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_19.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_2_20.state = busy
  rect [(Conveyer_2.position - Batch_to_show_2_20.beg_pos -
         (Conveyer_2.lap_count - Batch_to_show_2_20.lap_number) *
         Conveyer_2.length) * 79.0 / Conveyer_2.length + 470.0, 172,
         Batch_to_show_2_20.length * 79.0 / Conveyer_2.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_3_1.state = busy 
       rect [(Conveyer_3.position - Batch_to_show_3_1.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_1.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_1.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_3_2.state = busy 
          rect [(Conveyer_3.position - Batch_to_show_3_2.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_2.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_2.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_3_3.state = busy 
       rect [(Conveyer_3.position - Batch_to_show_3_3.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_3.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_3.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_3_4.state = busy 
       rect [(Conveyer_3.position - Batch_to_show_3_4.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_4.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_4.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_3_5.state = busy 
       rect [(Conveyer_3.position - Batch_to_show_3_5.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_5.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_5.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_3_6.state = busy 
       rect [(Conveyer_3.position - Batch_to_show_3_6.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_6.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_6.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_3_7.state = busy 
       rect [(Conveyer_3.position - Batch_to_show_3_7.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_7.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_7.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_3_8.state = busy 
       rect [(Conveyer_3.position - Batch_to_show_3_8.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_8.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_8.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_3_9.state = busy 
       rect [(Conveyer_3.position - Batch_to_show_3_9.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_9.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_9.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_3_10.state = busy 
       rect [(Conveyer_3.position - Batch_to_show_3_10.beg_pos -
         (Conveyer_3.lap_count - Batch_to_show_3_10.lap_number) *
         Conveyer_3.length) * 76.0 / Conveyer_3.length + 394.0, 202,
         Batch_to_show_3_10.length * 76.0 / Conveyer_3.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Conveyer_4.cur_quant > 0
  rect [266, 202, Conveyer_1.cur_quant * Bottle_size / Conveyer_1.number_of_bands * 77.0 / Conveyer_1.length, 17, <255 0 0>, <0 0 0>]
Show_if  Conveyer_5.cur_quant > 0
  rect [185, 172, Conveyer_1.cur_quant * Bottle_size / Conveyer_1.number_of_bands * 81.0 / Conveyer_1.length, 77, <255 0 0>, <0 0 0>]
Show_if  Conveyer_4.cur_quant > 0
  rect [114, 202, Conveyer_1.cur_quant * Bottle_size / Conveyer_1.number_of_bands * 71.0 / Conveyer_1.length, 17, <255 0 0>, <0 0 0>]

Show_if  Batch_to_show_4_1.state = busy 
          rect [(Conveyer_4.position - Batch_to_show_4_1.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_1.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_1.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_4_2.state = busy 
        rect [(Conveyer_4.position - Batch_to_show_4_2.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_2.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_2.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_4_3.state = busy 
          rect [(Conveyer_4.position - Batch_to_show_4_3.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_3.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_3.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_4_4.state = busy 
          rect [(Conveyer_4.position - Batch_to_show_4_4.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_4.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_4.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_4_5.state = busy 
          rect [(Conveyer_4.position - Batch_to_show_4_5.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_5.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_5.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_4_6.state = busy 
          rect [(Conveyer_4.position - Batch_to_show_4_6.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_6.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_6.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_4_7.state = busy 
          rect [(Conveyer_4.position - Batch_to_show_4_7.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_7.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_7.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_4_8.state = busy 
          rect [(Conveyer_4.position - Batch_to_show_4_8.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_8.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_8.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_4_9.state = busy 
          rect [(Conveyer_4.position - Batch_to_show_4_9.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_9.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_9.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_4_10.state = busy 
          rect [(Conveyer_4.position - Batch_to_show_4_10.beg_pos -
         (Conveyer_4.lap_count - Batch_to_show_4_10.lap_number) *
         Conveyer_4.length) * 77.0 / Conveyer_4.length + 266.0, 202,
         Batch_to_show_4_10.length * 77.0 / Conveyer_4.length, 17,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_1.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_1.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_1.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_1.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_2.state = busy 
         rect [(Conveyer_5.position - Batch_to_show_5_2.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_2.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_2.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_3.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_3.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_3.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_3.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_4.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_4.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_4.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_4.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_5.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_5.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_5.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_5.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_6.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_6.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_6.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_6.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_7.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_7.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_7.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_7.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_8.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_8.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_8.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_8.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_9.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_9.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_9.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_9.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_10.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_10.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_10.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_10.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_11.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_11.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_11.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_11.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_12.state = busy 
         rect [(Conveyer_5.position - Batch_to_show_5_12.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_12.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_12.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_13.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_13.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_13.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_13.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_14.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_14.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_14.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_14.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_15.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_15.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_15.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_15.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_16.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_16.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_16.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_16.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_17.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_17.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_17.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_17.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_18.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_18.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_18.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_18.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_19.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_19.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_19.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_19.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_5_20.state = busy 
          rect [(Conveyer_5.position - Batch_to_show_5_20.beg_pos -
         (Conveyer_5.lap_count - Batch_to_show_5_20.lap_number) *
         Conveyer_5.length) * 81.0 / Conveyer_5.length + 185.0, 172,
         Batch_to_show_5_20.length * 81.0 / Conveyer_5.length, 77,  <0 255 255>, <0 255 255>]

Show_if  Batch_to_show_6_1.state = busy 
          rect [(Conveyer_6.position - Batch_to_show_6_1.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_1.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_1.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_6_2.state = busy 
         rect [(Conveyer_6.position - Batch_to_show_6_1.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_1.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_1.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_6_3.state = busy 
          rect [(Conveyer_6.position - Batch_to_show_6_3.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_3.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_3.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_6_4.state = busy 
          rect [(Conveyer_6.position - Batch_to_show_6_4.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_4.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_4.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_6_5.state = busy 
          rect [(Conveyer_6.position - Batch_to_show_6_5.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_5.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_5.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_6_6.state = busy 
          rect [(Conveyer_6.position - Batch_to_show_6_6.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_6.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_6.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_6_7.state = busy 
          rect [(Conveyer_6.position - Batch_to_show_6_7.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_7.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_7.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_6_8.state = busy 
          rect [(Conveyer_6.position - Batch_to_show_6_8.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_8.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_8.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_6_9.state = busy 
          rect [(Conveyer_6.position - Batch_to_show_6_9.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_9.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_9.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
Show_if  Batch_to_show_6_10.state = busy 
          rect [(Conveyer_6.position - Batch_to_show_6_10.beg_pos -
         (Conveyer_6.lap_count - Batch_to_show_6_10.lap_number) *
         Conveyer_6.length) * 71.0 / Conveyer_6.length + 114.0, 202,
         Batch_to_show_6_10.length * 71.0 / Conveyer_6.length, 17,  <0 255 255>, <0 255 255>]
 
$End
