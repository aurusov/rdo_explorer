$Pattern  Conveyer_moving_pat  : operation

$Relevant_resources
  This_conveyer : a_Conveyer      Keep   Keep

$Time = Bottle_size / This_conveyer.cur_speed
$Body
  This_conveyer
    Choice from  This_conveyer.enter_state = enter_free and
                 This_conveyer.state = free and
                 This_conveyer.cur_batch_quant > 0 and
                 This_conveyer.cur_speed > 0.0
    first
    Convert_begin
      state         set moving
    Convert_end
      state         set free
      lap_count     set This_conveyer.lap_count +
                        If_LT(This_conveyer.position - Bottle_size)
      position      set New_position(This_conveyer.position - Bottle_size,
                          This_conveyer.length)
$End

$Pattern  Batch_creating_pat  : rule

$Parameters
  Conveyer_number  : such_as a_Conveyer.number

$Relevant_resources
  This_conveyer : a_Conveyer      Keep
  Prev_conveyer : a_Conveyer      Keep
  New_batch     : a_Batch         Create
  Batch_to_show : a_Batch_to_show Keep

$Body
  This_conveyer
    Choice from  This_conveyer.number = Conveyer_number and
                 This_conveyer.enter_state = enter_free and
                 This_conveyer.state = free and
                 This_conveyer.cur_speed > 0.0
    first
    Convert_rule
      change_speed    set no
      cur_batch_quant set This_conveyer.cur_batch_quant + 1
      batch_quant     set This_conveyer.batch_quant + 1
      enter_state     set enter_in_process
  Prev_conveyer
    Choice from  Prev_conveyer.number = This_conveyer.prev_conv_number and
                 Prev_conveyer.cur_quant > 0 and
                 Prev_conveyer.cur_speed > 0.0
    first
    Convert_rule
      change_speed    set no
  New_batch
    Convert_rule  {trace}
      number          set This_conveyer.batch_quant
      conv_number     set This_conveyer.number
      inter_dist      set F_inter_distance(This_conveyer.cur_speed * This_conveyer.number_of_bands,
                                           Prev_conveyer.cur_speed * Prev_conveyer.number_of_bands)
      accepting_quant set 0
      passing_quant   set 0
      cur_quant       set 0
      lap_number      set This_conveyer.lap_count + 1
      beg_pos         set This_conveyer.position
      length          set 0.0
      state           set in_accepting
  Batch_to_show
    Choice from  Batch_to_show.conv_number = Conveyer_number and
                 Batch_to_show.state = free
    first
    Convert_rule
      batch_number    set This_conveyer.batch_quant
      state           set busy
      lap_number      set This_conveyer.lap_count + 1
      beg_pos         set This_conveyer.position
      length          set 0.0
$End

$Pattern  Conveyer_accepting_pat  : operation

$Parameters
  Conveyer_number  : such_as a_Conveyer.number

$Relevant_resources
  This_conveyer : a_Conveyer       Keep      Keep
  Prev_conveyer : a_Conveyer       NoChange  Keep
  This_batch    : a_Batch          Keep      Keep
  Batch_to_show : a_Batch_to_show  NoChange  Keep

$Time = (Bottle_size + This_batch.inter_dist) / This_conveyer.cur_speed
$Body
  This_conveyer
    Choice from  This_conveyer.number = Conveyer_number and
                 This_conveyer.state = free and
                 This_conveyer.enter_state = enter_in_process and
                 This_conveyer.change_speed <> yes and
                 This_conveyer.cur_speed > 0.0 and
                 This_conveyer.cur_quant * Bottle_size / This_conveyer.number_of_bands <=
                 This_conveyer.length - Bottle_size
    first
    Convert_begin
      state         set moving
    Convert_end
      state         set free
      lap_count     set This_conveyer.lap_count +
                        If_LT(This_conveyer.position -
                              (Bottle_size + This_batch.inter_dist))
      position      set New_position(This_conveyer.position -
                          (Bottle_size + This_batch.inter_dist),
                          This_conveyer.length)
  Prev_conveyer
    Choice from  Prev_conveyer.next_conv_number = Conveyer_number and
                 Prev_conveyer.cur_quant > 0 and
                 Prev_conveyer.change_speed <> yes and
                 Prev_conveyer.cur_speed > 0.0
    first
    Convert_end
      cur_quant       set Prev_conveyer.cur_quant - This_batch.accepting_quant
  This_batch
    Choice from  This_batch.conv_number = Conveyer_number and
                 This_batch.state = in_accepting
    first
    Convert_begin
      accepting_quant set IMin(This_conveyer.passing_cap, Prev_conveyer.cur_quant)
    Convert_end
      cur_quant       set This_batch.cur_quant + This_batch.accepting_quant
      length          set This_batch.length + (Bottle_size + This_batch.inter_dist)
  Batch_to_show
    Choice from  Batch_to_show.conv_number = Conveyer_number and
                 Batch_to_show.batch_number = This_batch.number
    first
    Convert_end
      length          set This_batch.length
$End

$Pattern  Batch_cutting_pat  : rule

$Parameters
  Conveyer_number  : such_as a_Conveyer.number

$Relevant_resources
  This_conveyer : a_Conveyer      Keep
  Prev_conveyer : a_Conveyer      Keep
  This_batch    : a_Batch         Keep

$Body
  This_conveyer
    Choice from  This_conveyer.number = Conveyer_number and
                 This_conveyer.state = free and
                 This_conveyer.enter_state = enter_in_process and
                 This_conveyer.cur_speed > 0.0 and
                 This_conveyer.cur_quant * Bottle_size / This_conveyer.number_of_bands <=
                 This_conveyer.length - Bottle_size
    first
    Convert_rule
      change_speed    set no
      enter_state     set enter_free
  Prev_conveyer
    Choice from  Prev_conveyer.next_conv_number = Conveyer_number and
                 [Prev_conveyer.cur_quant = 0 or Prev_conveyer.cur_speed = 0.0 or
                 Prev_conveyer.change_speed = yes or This_conveyer.change_speed = yes]
    first
    Convert_rule
      change_speed    set no
  This_batch
    Choice from  This_batch.conv_number = Conveyer_number and
                 This_batch.state = in_accepting
    first
    Convert_rule
      state           set moving
$End

$Pattern  Batch_passing_pat  : rule   {trace}

$Parameters
  Conveyer_number    : such_as a_Conveyer.number
  Number_of_bottles  : integer

$Relevant_resources
  This_batch    : a_Batch         Keep
  This_conveyer : a_Conveyer      Keep
  Batch_to_show : a_Batch_to_show Keep

$Body
  This_batch
    Choice from  This_batch.conv_number = Conveyer_number and
                 This_batch.cur_quant > 0
    with_min  This_batch.number
    Convert_rule
      passing_quant   set IMin(
                          Up_to_next(
                            (This_conveyer.cur_quant * Bottle_size / This_conveyer.number_of_bands -
                            (This_conveyer.position - This_batch.beg_pos -
                            (This_conveyer.lap_count - This_batch.lap_number) *
                            This_conveyer.length)) / (This_batch.length / This_batch.cur_quant *
                            This_conveyer.number_of_bands - Bottle_size) +
                            Number_of_bottles) * This_conveyer.number_of_bands,
                          This_batch.cur_quant)
      cur_quant       set This_batch.cur_quant - This_batch.passing_quant
      lap_number      set This_batch.lap_number +
                          If_LT(This_batch.beg_pos -
                          This_batch.length /
                          (This_batch.cur_quant + This_batch.passing_quant) *
                          This_batch.passing_quant)
      beg_pos         set New_position(This_batch.beg_pos -
                          This_batch.length /
                          (This_batch.cur_quant + This_batch.passing_quant) *
                          This_batch.passing_quant,
                          This_conveyer.length)
      length          set This_batch.length -
                          This_batch.length /
                          (This_batch.cur_quant + This_batch.passing_quant) *
                          This_batch.passing_quant
  This_conveyer
    Choice from  This_conveyer.number = Conveyer_number and
                 This_conveyer.position - This_batch.beg_pos -
                 (This_conveyer.lap_count - This_batch.lap_number) * This_conveyer.length -
                 This_conveyer.cur_quant *
                 Bottle_size / This_conveyer.number_of_bands < 0.0
    first
    Convert_rule
      cur_quant       set This_conveyer.cur_quant + This_batch.passing_quant
  Batch_to_show
    Choice from  Batch_to_show.conv_number = This_batch.conv_number and
                 Batch_to_show.batch_number = This_batch.number
    first
    Convert_rule
      lap_number      set This_batch.lap_number
      beg_pos         set This_batch.beg_pos
      length          set This_batch.length
$End

$Pattern  Batch_erasing_pat  : rule

$Relevant_resources
  This_batch    : a_Batch         Erase
  This_conveyer : a_Conveyer      Keep
  Batch_to_show : a_Batch_to_show Keep

$Body
  This_batch
    Choice from  This_batch.state = moving and
                 This_batch.cur_quant = 0
    first
  This_conveyer
    Choice from  This_conveyer.number = This_batch.conv_number
    first
    Convert_rule
      cur_batch_quant set This_conveyer.cur_batch_quant - 1
  Batch_to_show
    Choice from  Batch_to_show.conv_number = This_batch.conv_number and
                 Batch_to_show.batch_number = This_batch.number
    first
    Convert_rule
      state      set free
$End

$Pattern  Batch_erasing_detector_pat  : rule

$Relevant_resources
  This_batch    : a_Batch         Erase
  This_conveyer : a_Conveyer      Keep
  Some_detector  : a_Detector       Keep
  Batch_to_show : a_Batch_to_show Keep

$Body
  This_batch
    Choice from  This_batch.state = moving and
                 This_batch.cur_quant = 0
    first
  This_conveyer
    Choice from  This_conveyer.number = This_batch.conv_number
    first
    Convert_rule
      cur_batch_quant set This_conveyer.cur_batch_quant - 1
  Some_detector
    Choice from  Some_detector.state = batch and
                 Some_detector.batch_number = This_batch.number and
                 Some_detector.conv_number = This_batch.conv_number
    first
    Convert_rule
      state        set  nothing
      switch_time  set  Time_now
      batch_number set  0
  Batch_to_show
    Choice from  Batch_to_show.conv_number = This_batch.conv_number and
                 Batch_to_show.batch_number = This_batch.number
    first
    Convert_rule
      state      set free
$End

$Pattern  Detector_to_accum_pat  : rule

$Parameters
  Conveyer_number  : such_as a_Conveyer.number

$Relevant_resources
  This_conveyer : a_Conveyer   NoChange
  Some_detector  : a_Detector    Keep

$Body
  This_conveyer
    Choice from  This_conveyer.number = Conveyer_number
    first
  Some_detector
    Choice from  Some_detector.conv_number = Conveyer_number and
                 Some_detector.state <> accum and
                 Some_detector.coord <=
                 This_conveyer.cur_quant * Bottle_size / This_conveyer.number_of_bands
    first
    Convert_rule
      state        set  accum
      switch_time  set  Time_now
$End

$Pattern  Detector_to_nothing_pat  : rule

$Parameters
  Conveyer_number  : such_as a_Conveyer.number

$Relevant_resources
  This_conveyer : a_Conveyer   NoChange
  Some_detector  : a_Detector    Keep

$Body
  This_conveyer
    Choice from  This_conveyer.number = Conveyer_number
    first
  Some_detector
    Choice from  Some_detector.conv_number = Conveyer_number and
                 Some_detector.state = accum and
                 Some_detector.coord >
                 This_conveyer.cur_quant * Bottle_size / This_conveyer.number_of_bands
    first
    Convert_rule
      state        set  nothing
      switch_time  set  Time_now
$End

$Pattern  Detector_to_batch_pat  : rule

$Parameters
  Detector_number  : such_as a_Detector.number

$Relevant_resources
  Some_detector  : a_Detector    Keep
  This_conveyer : a_Conveyer   NoChange
  Some_batch    : a_Batch      NoChange

$Body
  Some_detector
    Choice from  Some_detector.number = Detector_number and
                 Some_detector.state = nothing
    first
    Convert_rule
      state        set  batch
      switch_time  set  Time_now
      batch_number set  Some_batch.number
  This_conveyer
    Choice from  This_conveyer.number = Some_detector.conv_number
    first
  Some_batch
    Choice from  Some_batch.conv_number = Some_detector.conv_number and
                 This_conveyer.position - Some_batch.beg_pos -
                 (This_conveyer.lap_count - Some_batch.lap_number) *
                 This_conveyer.length                     < Some_detector.coord and
                 This_conveyer.position - Some_batch.beg_pos -
                 (This_conveyer.lap_count - Some_batch.lap_number) *
                 This_conveyer.length + Some_batch.length > Some_detector.coord
    first
$End

$Pattern  Detector_to_end_batch_pat  : rule

$Parameters
  Detector_number  : such_as a_Detector.number

$Relevant_resources
  Some_detector  : a_Detector    Keep
  This_conveyer : a_Conveyer   NoChange
  Some_batch    : a_Batch      NoChange

$Body
  Some_detector
    Choice from  Some_detector.number = Detector_number and
                 Some_detector.state = batch
    first
    Convert_rule
      state        set  nothing
      switch_time  set  Time_now
      batch_number set  0
  This_conveyer
    Choice from  This_conveyer.number = Some_detector.conv_number
    first
  Some_batch
    Choice from  Some_batch.number = Some_detector.batch_number and
                 Some_batch.conv_number = Some_detector.conv_number and
                 This_conveyer.position - Some_batch.beg_pos -
                 (This_conveyer.lap_count - Some_batch.lap_number) *
                 This_conveyer.length + Some_batch.length < Some_detector.coord
    first
$End

$Pattern  Machine_A_pat  : operation

$Parameters
  Number_of_bottles  : integer

$Relevant_resources
  Machine       : Machine_A     Keep       Keep
  This_conveyer : Conveyer_A    NoChange   Keep

$Time = 1.0 / (Machine.capasity * Machine.cur_rate) * Number_of_bottles

$Body
  Machine
    Choice from  Machine.state = free and Machine.status = in_run
    first
    Convert_begin
      time_to_problem  set Machine.time_to_problem + Time_now
      proc_quant       set Number_of_bottles
      state            set busy
    Convert_end
      time_to_problem  set Machine.time_to_problem - Time_now
      state            set free
      status           set New_status(Machine.time_to_problem, Machine.status)
      bot_count        set Machine.bot_count + Machine.proc_quant
  This_conveyer
    Choice NoCheck first
    Convert_end
      cur_quant    set This_conveyer.cur_quant + Machine.proc_quant
$End

$Pattern  Machine_B_pat  : operation

$Parameters
  Number_of_bottles  : integer

$Relevant_resources
  Machine       : Machine_B     Keep       Keep
  This_conveyer : Conveyer_B    NoChange   Keep
  Prev_conveyer : Conveyer_3    Keep       NoChange

$Time = 1.0 / (Machine.capasity * Machine.cur_rate) * Number_of_bottles

$Body
  Machine
    Choice from  Machine.state = free and Machine.status = in_run
    first
    Convert_begin
      time_to_problem  set Machine.time_to_problem + Time_now
      proc_quant       set IMin(Number_of_bottles, Prev_conveyer.cur_quant)
      state            set busy
    Convert_end
      time_to_problem  set Machine.time_to_problem - Time_now
      state            set free
      status           set New_status(Machine.time_to_problem, Machine.status)
      bot_count        set Machine.bot_count + Machine.proc_quant
  This_conveyer
    Choice NoCheck first
    Convert_end
      cur_quant    set This_conveyer.cur_quant + Machine.proc_quant
  Prev_conveyer
    Choice from  Prev_conveyer.cur_quant > 0
    first
    Convert_begin
      cur_quant    set Prev_conveyer.cur_quant - Machine.proc_quant
$End

$Pattern  Machine_C_pat  : operation

$Parameters
  Number_of_bottles  : integer

$Relevant_resources
  Machine       : Machine_C      Keep    Keep
  This_conveyer : Conveyer_6     Keep    NoChange

$Time = 1.0 / (Machine.capasity * Machine.cur_rate) *
        IMin(Number_of_bottles, This_conveyer.cur_quant)
$Body
  Machine
    Choice from  Machine.state = free and Machine.status = in_run
    first
    Convert_begin
      time_to_problem  set Machine.time_to_problem + Time_now
      proc_quant       set IMin(Number_of_bottles, This_conveyer.cur_quant)
      state            set busy
    Convert_end
      time_to_problem  set Machine.time_to_problem - Time_now
      state            set free
      status           set New_status(Machine.time_to_problem, Machine.status)
      bot_count        set Machine.bot_count + Machine.proc_quant
  This_conveyer
    Choice from  This_conveyer.cur_quant > 0
    first
    Convert_begin
      cur_quant    set This_conveyer.cur_quant - Machine.proc_quant
$End

$Pattern  Machine_A_problem_pat  : operation

$Relevant_resources
  Machine       : Machine_A     Keep       Keep

$Time = 0.0
{$Time = Machine_A_average_time(Machine_A_problems)/3600.0}
{$Time = Machine_A_solving_time(Machine_A_average_time(Machine_A_problems)/3600.0*0.5,
                               Machine_A_average_time(Machine_A_problems.Last)/3600.0*1.5)}
$Body
  Machine
    Choice from  Machine.state = free and Machine.status = broken
    first
    Convert_begin
      state            set busy
      problem_type_A   set Machine_A.problem_type_A
    Convert_end
      time_to_problem  set {Machine_A_inter_time(0.3)} 0.07
      state            set free
      status           set stop
      switch_time      set Time_now
$End

$Pattern  Machine_B_problem_pat  : operation

$Relevant_resources
  Machine       : Machine_B     Keep       Keep

$Time = 0.0
{$Time = Machine_B_average_time(Machine_B_problems)/3600.0}
{$Time = Machine_B_solving_time(Machine_B_average_time(Machine_B_problems)/3600.0*0.5,
                               Machine_B_average_time(Machine_B_problems.Last)/3600.0*1.5)}
$Body
  Machine
    Choice from  Machine.state = free and Machine.status = broken
    first
    Convert_begin
      state            set busy
      problem_type_B   set Machine_B.problem_type_B
    Convert_end
      time_to_problem  set {Machine_B_inter_time(0.1)} 0.04
      state            set free
      status           set stop
      switch_time      set Time_now
$End

$Pattern  Machine_C_problem_pat  : operation

$Relevant_resources
  Machine       : Machine_C     Keep       Keep

$Time = 0.0
{$Time = Machine_B_average_time(Machine_B_problems)/3600.0}
{$Time = Machine_B_solving_time(Machine_B_average_time(Machine_B_problems)/3600.0*0.5,
                               Machine_B_average_time(Machine_B_problems.Last)/3600.0*1.5)}
$Body
  Machine
    Choice from  Machine.state = free and Machine.status = broken
    first
    Convert_begin
      state            set busy
      problem_type_B   set Machine_B.problem_type_B
    Convert_end
      time_to_problem  set {Machine_B_inter_time(0.1)} 0.04
      state            set free
      status           set stop
      switch_time      set Time_now
$End

$Pattern  Control_MA_stop_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = stop and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed > Machine.capasity * 0.44 * Bottle_size
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_40_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.4 and
                 [Detector_2_1.state = accum and
                 Time_now - Detector_2_1.switch_time > 0.00005 or
                 Conveyer_1.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set stop
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_40_to_80_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.4 and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed > Machine.capasity * 0.88 * Bottle_size and
                 Time_now - Machine.switch_time > 0.002
    first
    Convert_rule
      cur_rate      set 0.8
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_80_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.8 and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed > Machine.capasity * 0.44 * Bottle_size and
                 [Conveyer_1.cur_speed < Machine.capasity * 0.88 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_80_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.8 and
                 [Detector_2_1.state = accum and
                 Time_now - Detector_2_1.switch_time > 0.00005 or
                 Conveyer_1.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set stop
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_80_to_100_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.8 and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed > Machine.capasity * 1.1 * Bottle_size and
                 Time_now - Machine.switch_time > 0.001 and
                 Machine_B.status <> broken and
                 [[Detector_1_2.state = nothing or
                 Time_now - Detector_1_2.switch_time < 0.002] or
                 [Detector_1_2.state <> nothing and
                 Time_now - Detector_1_2.switch_time > 0.002] and
                 [Detector_2_2.state = nothing and
                 Time_now - Detector_2_2.switch_time > 0.0002] and
                 Time_now - Machine.switch_time > Min_120_80_time]
    first
    Convert_rule
      cur_rate      set 1.0
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_100_to_80_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed > Machine.capasity * 0.88 * Bottle_size and
                 [Detector_2_2.state = accum and
                 Time_now - Detector_2_2.switch_time > Smooth_time and
                 Time_now - Machine.switch_time > Smooth_time or
                 Machine_B.status = broken or
                 Conveyer_1.cur_speed < Machine.capasity * 1.1 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_100_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed >  Machine.capasity * 0.44 * Bottle_size and
                 [Conveyer_1.cur_speed <= Machine.capasity * 0.88 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_100_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 [Detector_2_1.state = accum and
                 Time_now - Detector_2_1.switch_time > 0.00005 or
                 Conveyer_1.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 1.0
      status        set stop
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_100_to_120_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed > Machine.capasity * 1.32 * Bottle_size and
                 Time_now - Machine.switch_time > 0.001 and
                 Machine_B.status <> broken and
                 Detector_2_2.state <> accum and
                 [[Detector_1_2.state = nothing or
                 Time_now - Detector_1_2.switch_time < 0.002] or
                 [Detector_1_2.state <> nothing and
                 Time_now - Detector_1_2.switch_time > 0.002] and
                 Machine_B.cur_rate > 0.9 and
                 [Detector_2_2.state = nothing and
                 Time_now - Detector_2_2.switch_time > Smooth_time] and
                 Time_now - Machine.switch_time > Smooth_time]
    first
    Convert_rule
      cur_rate      set 1.2
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_120_to_100_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed >  Machine.capasity * 1.10 * Bottle_size and
                 [Detector_2_2.state = accum and
                 Time_now - Detector_2_2.switch_time > 0.0002 and
                 Time_now - Machine.switch_time > Min_120_80_time or
                 [Detector_1_2.state <> nothing and
                 Time_now - Detector_1_2.switch_time > 0.002] and
                 Machine_B.cur_rate < 0.9 or
                 Conveyer_1.cur_speed <= Machine.capasity * 1.32 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 1.0
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_120_to_80_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed >  Machine.capasity * 0.88 * Bottle_size and
                 [Machine_B.status = broken or
                 Conveyer_1.cur_speed <= Machine.capasity * 1.10 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_120_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 [Detector_2_1.state <> accum or
                 Time_now - Detector_2_1.switch_time < 0.00005] and
                 Conveyer_1.cur_speed >  Machine.capasity * 0.44 * Bottle_size and
                 [Conveyer_1.cur_speed <= Machine.capasity * 0.88 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MA_120_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_A     Keep
  Dummy         : Conveyer_A    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 [Detector_2_1.state = accum and
                 Time_now - Detector_2_1.switch_time > 0.00005 or
                 Conveyer_1.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 1.2
      status        set stop
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_stop_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = stop and
                 Conveyer_3.cur_speed > Machine.capasity * 0.44 * Bottle_size and
                 Conveyer_4.cur_speed > Machine.capasity * 0.44 * Bottle_size and
                 [Detector_2_3.state <> nothing or
                 Time_now - Detector_2_3.switch_time <= 0.0005] and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_40_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.4 and
                 [Machine.status = in_run and
                 Time_now - Machine.switch_time > 2 * 0.0034 and
                 Detector_2_3.state = nothing and
                 Time_now - Detector_2_3.switch_time > 0.001 or
                 Detector_2_4.state = accum and
                 Time_now - Detector_2_4.switch_time > 0.00005 or
                 Conveyer_3.cur_speed < Machine.capasity * 0.44 * Bottle_size or
                 Conveyer_4.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set stop
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_40_to_80_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.4 and
                 Conveyer_3.cur_speed > Machine.capasity * 0.88 * Bottle_size and
                 Conveyer_4.cur_speed > Machine.capasity * 0.88 * Bottle_size and
                 [Detector_2_3.state <> nothing or
                 Time_now - Detector_2_3.switch_time <= 0.0005] and
                 Time_now - Machine.switch_time > 0.002 and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_80_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.8 and
                 Conveyer_3.cur_speed > Machine.capasity * 0.44 * Bottle_size and
                 Conveyer_4.cur_speed > Machine.capasity * 0.44 * Bottle_size and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005] and
                 [Conveyer_3.cur_speed < Machine.capasity * 0.88 * Bottle_size or
                 Conveyer_4.cur_speed < Machine.capasity * 0.88 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_80_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.8 and
                 [Machine.status = in_run and
                 Time_now - Machine.switch_time > 2 * 0.0017 and
                 Detector_2_3.state = nothing and
                 Time_now - Detector_2_3.switch_time > 0.001 or
                 Conveyer_3.cur_speed < Machine.capasity * 0.44 * Bottle_size or
                 Conveyer_4.cur_speed < Machine.capasity * 0.44 * Bottle_size or
                 Detector_2_4.state = accum and
                 Time_now - Detector_2_4.switch_time > 0.00005]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set stop
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_80_to_100_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.8 and
                 Conveyer_3.cur_speed > Machine.capasity * 1.1 * Bottle_size and
                 Conveyer_4.cur_speed > Machine.capasity * 1.1 * Bottle_size and
                 [Detector_2_3.state <> nothing and
                 Time_now - Detector_2_3.switch_time > 0.002 or
                 Detector_2_2.state = accum] and
                 Machine_A.status <> broken and
                 Time_now - Machine.switch_time > 0.001 and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005] and
                 Machine_C.status <> broken and
                 [[Detector_1_5.state = nothing or
                 Time_now - Detector_1_5.switch_time < 0.002] or
                 [Detector_1_5.state <> nothing and
                 Time_now - Detector_1_5.switch_time > 0.002] and
                 [Detector_2_5.state = nothing and
                 Time_now - Detector_2_5.switch_time > 0.0002] and
                 Time_now - Machine.switch_time > Min_120_80_time]
    first
    Convert_rule
      cur_rate      set 1.0
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_100_to_80_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 Conveyer_3.cur_speed > Machine.capasity * 0.88 * Bottle_size and
                 Conveyer_4.cur_speed > Machine.capasity * 0.88 * Bottle_size and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005] and
                 [Detector_2_3.state = nothing or
                 Machine_A.status = broken or
                 Detector_2_5.state = accum and
                 Time_now - Detector_2_5.switch_time > Smooth_time and
                 Time_now - Machine.switch_time > Smooth_time or
                 Machine_C.status = broken or
                 Conveyer_3.cur_speed < Machine.capasity * 1.1 * Bottle_size or
                 Conveyer_4.cur_speed < Machine.capasity * 1.1 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_100_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005] and
                 Conveyer_3.cur_speed >  Machine.capasity * 0.44 * Bottle_size and
                 Conveyer_4.cur_speed >  Machine.capasity * 0.44 * Bottle_size and
                 [Conveyer_3.cur_speed <= Machine.capasity * 0.88 * Bottle_size or
                 Conveyer_4.cur_speed <= Machine.capasity * 0.88 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_100_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 [Machine.status = in_run and
                 Time_now - Machine.switch_time > 2 * 0.0014 and
                 Detector_2_3.state = nothing and
                 Time_now - Detector_2_3.switch_time > 0.001 or
                 Conveyer_3.cur_speed < Machine.capasity * 0.44 * Bottle_size or
                 Detector_2_4.state = accum and
                 Time_now - Detector_2_4.switch_time > 0.00005 or
                 Conveyer_4.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 1.0
      status        set stop
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_100_to_120_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 Conveyer_3.cur_speed > Machine.capasity * 1.32 * Bottle_size and
                 Conveyer_4.cur_speed > Machine.capasity * 1.32 * Bottle_size and
                 [Detector_2_3.state <> nothing and
                 Time_now - Detector_2_3.switch_time > 0.001] and
                 Machine_A.status <> broken and
                 Time_now - Machine.switch_time > 0.001 and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005] and
                 Machine_C.status <> broken and
                 Detector_2_5.state <> accum and
                 [[Detector_1_5.state = nothing or
                 Time_now - Detector_1_5.switch_time < 0.002] or
                 [Detector_1_5.state <> nothing and
                 Time_now - Detector_1_5.switch_time > 0.002] and
                 Machine_C.cur_rate > 0.9 and
                 [Detector_2_5.state = nothing and
                 Time_now - Detector_2_5.switch_time > Smooth_time] and
                 Time_now - Machine.switch_time > Smooth_time]
    first
    Convert_rule
      cur_rate      set 1.2
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_120_to_100_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 Conveyer_3.cur_speed >  Machine.capasity * 1.10 * Bottle_size and
                 Conveyer_4.cur_speed >  Machine.capasity * 1.10 * Bottle_size and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005] and
                 [Detector_2_5.state = accum and
                 Time_now - Detector_2_5.switch_time > 0.0002 and
                 Time_now - Machine.switch_time > Min_120_80_time or
                 [Detector_1_5.state <> nothing and
                 Time_now - Detector_1_5.switch_time > 0.002] and
                 Machine_C.cur_rate < 0.9 or
                 Conveyer_3.cur_speed <= Machine.capasity * 1.32 * Bottle_size or
                 Conveyer_4.cur_speed <= Machine.capasity * 1.32 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 1.0
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_120_to_80_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 Conveyer_3.cur_speed >  Machine.capasity * 0.88 * Bottle_size and
                 Conveyer_4.cur_speed >  Machine.capasity * 0.88 * Bottle_size and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005] and
                 [Machine_A.status = broken or
                 Detector_2_3.state = nothing or
                 Machine_C.status = broken or
                 Conveyer_3.cur_speed <= Machine.capasity * 1.10 * Bottle_size or
                 Conveyer_4.cur_speed <= Machine.capasity * 1.10 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_120_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 Conveyer_3.cur_speed >  Machine.capasity * 0.44 * Bottle_size and
                 Conveyer_4.cur_speed >  Machine.capasity * 0.44 * Bottle_size and
                 [Detector_2_4.state <> accum or
                 Time_now - Detector_2_4.switch_time < 0.00005] and
                 [Conveyer_3.cur_speed <= Machine.capasity * 0.88 * Bottle_size or
                 Conveyer_4.cur_speed <= Machine.capasity * 0.88 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MB_120_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_B     Keep
  Dummy         : Conveyer_B    Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 [Machine.status = in_run and
                 Time_now - Machine.switch_time > 2 * 0.0012 and
                 Detector_2_3.state = nothing and
                 Time_now - Detector_2_3.switch_time > 0.001 or
                 Detector_2_4.state = accum and
                 Time_now - Detector_2_4.switch_time > 0.00005 or
                 Conveyer_3.cur_speed < Machine.capasity * 0.44 * Bottle_size or
                 Conveyer_4.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 1.2
      status        set stop
      switch_time   set Time_now
  Dummy
    Choice NoCheck first
    Convert_rule
      cur_speed     set Machine.capasity * Machine.cur_rate * Bottle_size
      change_speed  set yes
$End

$Pattern  Control_MC_stop_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = stop and
                 Conveyer_6.cur_speed > Machine.capasity * 0.44 * Bottle_size and
                 [Detector_2_6.state <> nothing or
                 Time_now - Detector_2_6.switch_time <= 0.0005]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_40_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.4 and
                 [Machine.status = in_run and
                 Time_now - Machine.switch_time > 2 * 0.0034 and
                 Detector_2_6.state = nothing and
                 Time_now - Detector_2_6.switch_time > 0.001 or
                 Conveyer_6.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set stop
      switch_time   set Time_now
$End

$Pattern  Control_MC_40_to_80_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.4 and
                 Conveyer_6.cur_speed > Machine.capasity * 0.88 * Bottle_size and
                 [Detector_2_6.state <> nothing or
                 Time_now - Detector_2_6.switch_time <= 0.0005] and
                 Time_now - Machine.switch_time > 0.002
    first
    Convert_rule
      cur_rate      set 0.8
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_80_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.8 and
                 Conveyer_6.cur_speed > Machine.capasity * 0.44 * Bottle_size and
                 [Conveyer_6.cur_speed < Machine.capasity * 0.88 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_80_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.8 and
                 [Machine.status = in_run and
                 Time_now - Machine.switch_time > 2 * 0.0017 and
                 Detector_2_6.state = nothing and
                 Time_now - Detector_2_6.switch_time > 0.001 or
                 Conveyer_6.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set stop
      switch_time   set Time_now
$End

$Pattern  Control_MC_80_to_100_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 0.8 and
                 Conveyer_6.cur_speed > Machine.capasity * 1.1 * Bottle_size and
                 [Detector_2_6.state <> nothing and
                 Time_now - Detector_2_6.switch_time > 0.002 or
                 Detector_2_5.state = accum] and
                 Machine_B.status <> broken and
                 Time_now - Machine.switch_time > 0.001
    first
    Convert_rule
      cur_rate      set 1.0
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_100_to_80_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 Conveyer_6.cur_speed > Machine.capasity * 0.88 * Bottle_size and
                 [Detector_2_6.state = nothing or
                 Machine_B.status = broken or
                 Conveyer_6.cur_speed < Machine.capasity * 1.1 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_100_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 Conveyer_6.cur_speed >  Machine.capasity * 0.44 * Bottle_size and
                 [Conveyer_6.cur_speed <= Machine.capasity * 0.88 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_100_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 [Machine.status = in_run and
                 Time_now - Machine.switch_time > 2 * 0.0014 and
                 Detector_2_6.state = nothing and
                 Time_now - Detector_2_6.switch_time > 0.001 or
                 Conveyer_6.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 1.0
      status        set stop
      switch_time   set Time_now
$End

$Pattern  Control_MC_100_to_120_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.0 and
                 Conveyer_6.cur_speed > Machine.capasity * 1.32 * Bottle_size and
                 [Detector_2_6.state <> nothing and
                 Time_now - Detector_2_6.switch_time > 0.001] and
                 Machine_B.status <> broken and
                 Time_now - Machine.switch_time > 0.001 and
                 [Detector_2_5.state = accum and
                 Time_now - Detector_2_5.switch_time > 2 * Smooth_time]
    first
    Convert_rule
      cur_rate      set 1.2
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_120_to_100_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 Conveyer_6.cur_speed >  Machine.capasity * 1.10 * Bottle_size and
                 [[Detector_2_5.state <> accum or
                 Time_now - Detector_2_5.switch_time < 0.0002] and
                 Time_now - Machine.switch_time > Min_120_80_time or
                 Conveyer_6.cur_speed <= Machine.capasity * 1.32 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 1.0
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_120_to_80_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 Conveyer_6.cur_speed >  Machine.capasity * 0.88 * Bottle_size and
                 [Machine_B.status = broken or
                 Detector_2_6.state = nothing or
                 Conveyer_6.cur_speed <= Machine.capasity * 1.10 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.8
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_120_to_40_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 Conveyer_6.cur_speed >  Machine.capasity * 0.44 * Bottle_size and
                 [Conveyer_6.cur_speed <= Machine.capasity * 0.88 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 0.4
      status        set in_run
      switch_time   set Time_now
$End

$Pattern  Control_MC_120_to_stop_pat  : rule

$Relevant_resources
  Machine       : Machine_C     Keep

$Body
  Machine
    Choice from  Machine.status = in_run and
                 Machine.cur_rate = 1.2 and
                 [Machine.status = in_run and
                 Time_now - Machine.switch_time > 2 * 0.0012 and
                 Detector_2_6.state = nothing and
                 Time_now - Detector_2_6.switch_time > 0.001 or
                 Conveyer_6.cur_speed < Machine.capasity * 0.44 * Bottle_size]
    first
    Convert_rule
      cur_rate      set 1.2
      status        set stop
      switch_time   set Time_now
$End

$Pattern  Control_C2_1_to_1_3_pat  : rule

$Relevant_resources
  Conveyer      : Conveyer_2     Keep

$Body
  Conveyer
    Choice from  Conveyer.cur_rate = 1.0 and
                 [Detector_2_2.state <> accum and
                 Time_now - Detector_2_2.switch_time > 0.002] and
                 Detector_3_2.state <> nothing
    first
    Convert_rule
      cur_speed     set Conveyer.cur_speed * 1.3
      cur_rate      set 1.3
      change_speed  set yes
$End

$Pattern  Control_C2_1_3_to_1_pat  : rule

$Relevant_resources
  Conveyer      : Conveyer_2     Keep

$Body
  Conveyer
    Choice from  Conveyer.cur_rate = 1.3 and
                 [Detector_2_2.state = accum and
                 Time_now - Detector_2_2.switch_time > 0.002]
    first
    Convert_rule
      cur_speed     set Conveyer.cur_speed / 1.3
      cur_rate      set 1.0
      change_speed  set yes
$End

$Pattern  Control_C5_1_to_1_3_pat  : rule

$Relevant_resources
  Conveyer      : Conveyer_5     Keep

$Body
  Conveyer
    Choice from  Conveyer.cur_rate = 1.0 and
                 [Detector_2_5.state <> accum and
                 Time_now - Detector_2_5.switch_time > 0.002] and
                 Detector_3_5.state <> nothing
    first
    Convert_rule
      cur_speed     set Conveyer.cur_speed * 1.3
      cur_rate      set 1.3
      change_speed  set yes
$End

$Pattern  Control_C5_1_3_to_1_pat  : rule

$Relevant_resources
  Conveyer      : Conveyer_5     Keep

$Body
  Conveyer
    Choice from  Conveyer.cur_rate = 1.3 and
                 [Detector_2_5.state = accum and
                 Time_now - Detector_2_5.switch_time > 0.002]
    first
    Convert_rule
      cur_speed     set Conveyer.cur_speed / 1.3
      cur_rate      set 1.0
      change_speed  set yes
$End
