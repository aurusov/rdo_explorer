$Pattern  Command_1_2_pat  : rule
$Parameters
  Conveyer_number       : integer
  Where_to_go           : such_as Robots.Location
  What_is_loaded_AP     : such_as Machines.What_is_loaded
  Kind_of_part          : such_as Parts.Kind
  Location_of_part_par  : such_as Parts.Location

$Relevant_resources
  From           : Conveyers           NoChange
  Conveyer_part  : Part_of_conveyer    NoChange
  Part           : Parts               NoChange
  Tr_Robot       : TR                  Keep
  To             : AP                  NoChange

$Body
  From
    Choice from  From.Number = Conveyer_number and
                 From.Quantity_of_parts > 0
    first

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = Conveyer_number  and
                Conveyer_part.Part_number = From.Position  and
                Conveyer_part.State = is_filled
    first

  Part
    Choice from  Part.Kind = Kind_of_part and
                 Part.Location = Location_of_part_par
    first

  Tr_Robot
    Choice from Tr_Robot.Busyness = Free
    first
    Convert_rule
      Busyness            set Moving_empty
      Place_to_go         set Where_to_go

  To
    Choice from To.Busyness = Free  and
                To.What_is_loaded = What_is_loaded_AP
    first
$End

$Pattern  Loading_from_C1_2_pat  : operation
$Parameters
  Conveyer_number       : integer
  Where_to_go           : such_as Robots.Location
  What_is_loaded_AP     : such_as Machines.What_is_loaded
  Kind_of_part          : such_as Parts.Kind
  Location_of_part_par  : such_as Parts.Location

$Relevant_resources
  From           : Conveyers           NoChange  Keep
  Conveyer_part  : Part_of_conveyer    NoChange  Keep
  Part           : Parts               NoChange  Keep
  Tr_Robot       : TR                  Keep      Keep
  To             : AP                  NoChange  NoChange

$Time = Loading_time
$Body
  From
    Choice from  From.Number = Conveyer_number and
                 From.Quantity_of_parts > 0
    first
    Convert_end
      Quantity_of_parts     set From.Quantity_of_parts - 1

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = Conveyer_number and
                Conveyer_part.Part_number = From.Position  and
                Conveyer_part.State = is_filled
    first
    Convert_end
      State        set  Empty

  Part
    Choice from  Part.Kind = Kind_of_part and
                 Part.Location = Location_of_part_par
    first
    Convert_end
      Location     set Robot

  Tr_Robot
    Choice from Tr_Robot.Busyness = Moving_empty and
                Tr_Robot.Place_to_go = Where_to_go and
                Tr_Robot.Coordinate = TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Busyness      set Loading
      Location      set Where_to_go
    Convert_end
      Busyness      set Moving_loaded
      Place_to_go   set AssPos

  To
    Choice from To.Busyness = Free and
                To.What_is_loaded = What_is_loaded_AP
    first
$End

$Pattern  Unloading_to_AP_pat  : operation
$Parameters
  What_is_loaded_AP     : such_as Machines.What_is_loaded
  New_What_is_loaded_AP : such_as Machines.What_is_loaded

$Relevant_resources
  To       : AP           NoChange  Keep
  Part     : Parts        NoChange  Keep
  Tr_Robot : TR           Keep      Keep

$Time = Unloading_time
$Body
  To
    Choice from To.Busyness = Free  and
                To.What_is_loaded = What_is_loaded_AP
    first
    Convert_end
      What_is_loaded    set New_What_is_loaded_AP

  Part
    Choice from  Part.Location = Robot
    first
    Convert_end
      Location          set AssPos

  Tr_Robot
    Choice from Tr_Robot.Busyness = Moving_loaded and
                Tr_Robot.Place_to_go = AssPos and
                Tr_Robot.Coordinate = TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Busyness          set Unloading
      Location          set AssPos
    Convert_end
      Busyness          set Free
      Place_to_go       set Not
$End

$Pattern  Command_3_pat  : rule

$Relevant_resources
  From          : AP                 NoChange
  Part          : Parts              NoChange
  Tr_Robot      : TR                 Keep
  To            : CP                 NoChange
  Conveyer_part : Part_of_conveyer   NoChange

$Body
  From
    Choice from From.Busyness = Free and
                From.What_is_loaded = Processed
    first

  Part
    Choice from  Part.Kind = a_rotor and
                 Part.Location = AssPos
    first

  Tr_Robot
    Choice from Tr_Robot.Busyness = Free
    first
    Convert_rule
      Busyness            set Moving_empty
      Place_to_go         set AssPos

  To
    Choice from To.Quantity_of_parts < 10
    first

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = 4 and
                Conveyer_part.Part_number = Last_conveyer_part_fun(To.Position, 10) and
                Conveyer_part.State = Empty
    first
$End

$Pattern  Loading_from_AP_pat  : operation

$Relevant_resources
  From          : AP                 NoChange  Keep
  Part          : Parts              NoChange  Keep
  Tr_Robot      : TR                 Keep      Keep
  To            : CP                 NoChange  NoChange
  Conveyer_part : Part_of_conveyer   NoChange  NoChange

$Time = Loading_time
$Body
  From
    Choice from From.Busyness = Free and
                From.What_is_loaded = Processed
    first
    Convert_end
      What_is_loaded  set Unloaded

  Part
    Choice from  Part.Kind = a_rotor and
                 Part.Location = AssPos
    first
    Convert_end
      Location        set Robot

  Tr_Robot
    Choice from Tr_Robot.Busyness = Moving_empty  and
                Tr_Robot.Place_to_go = AssPos  and
                Tr_Robot.Coordinate = TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Busyness      set Loading
      Location      set AssPos
    Convert_end
      Busyness      set Moving_loaded
      Place_to_go   set CoolPos_entrance

  To
    Choice from To.Quantity_of_parts < 10
    first

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = 4 and
		   Conveyer_part.Part_number = Last_conveyer_part_fun(To.Position, 10) and
		   Conveyer_part.State = Empty
    first
$End

$Pattern  Unloading_to_CP_pat  : operation

$Relevant_resources
  To             : CP                 Keep      Keep
  Conveyer_part  : Part_of_conveyer   NoChange  Keep
  Part           : Parts              NoChange  Keep
  Tr_Robot       : TR                 Keep      Keep

$Time = Unloading_time
$Body
  To
    Choice from To.Quantity_of_parts < 10 and
		   To.Moving = Stop
    first
    Convert_begin
      Moving             set Blocked
    Convert_end
      Quantity_of_parts  set To.Quantity_of_parts + 1
      Moving             set Stop

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = 4  and
		   Conveyer_part.Part_number = Last_conveyer_part_fun(To.Position, 10) and
		   Conveyer_part.State = Empty
    first
    Convert_end
      State              set  is_filled

  Part
    Choice from  Part.Location = Robot
    first
    Convert_end
      Location           set CoolPos
      Time_on_CP         set Time_now

  Tr_Robot
    Choice from Tr_Robot.Busyness = Moving_loaded and
		   Tr_Robot.Place_to_go = CoolPos_entrance and
		   Tr_Robot.Coordinate = TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Busyness      set Unloading
      Location      set CoolPos_entrance
    Convert_end
      Busyness      set Free
      Place_to_go   set Not
$End

$Pattern  Command_4_pat  : rule

$Relevant_resources
  From           : CP                 NoChange
  Conveyer_part  : Part_of_conveyer   NoChange
  Part           : Parts              NoChange
  Tr_Robot       : TR                 Keep
  To             : GM                 NoChange

$Body
  From
    Choice from  From.Quantity_of_parts > 0
    first

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = 4  and
                Conveyer_part.Part_number = From.Position  and
                Conveyer_part.State = is_filled
    first

  Part
    Choice from  Part.Kind = a_rotor and
                 Part.Location = CoolPos
    first

  Tr_Robot
    Choice from Tr_Robot.Busyness = Free
    first
    Convert_rule
      Busyness            set Moving_empty
      Place_to_go         set CoolPos_delivery

  To
    Choice from To.Busyness = Free  and
                To.What_is_loaded = Unloaded
    first
$End

$Pattern  Loading_from_CP_pat  : operation

$Relevant_resources
  From           : CP                 NoChange  Keep
  Conveyer_part  : Part_of_conveyer   NoChange  Keep
  Part           : Parts              NoChange  Keep
  Tr_Robot       : TR                 Keep      Keep
  To             : GM                 NoChange  NoChange

$Time = Loading_time
$Body
  From
    Choice from  From.Quantity_of_parts > 0
    first
    Convert_end
      Quantity_of_parts  set From.Quantity_of_parts - 1

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = 4 and
                Conveyer_part.Part_number = From.Position  and
                Conveyer_part.State = is_filled
    first
    Convert_end
      State              set  Empty

  Part
    Choice from  Part.Kind = a_rotor and
                 Part.Location = CoolPos
    first
    Convert_end
      Location      set Robot
      Time_on_CP    set Time_now - Part.Time_on_CP

  Tr_Robot
    Choice from Tr_Robot.Busyness = Moving_empty  and
		Tr_Robot.Place_to_go = CoolPos_delivery and
		Tr_Robot.Coordinate = TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Busyness      set Loading
      Location      set CoolPos_delivery
    Convert_end
      Busyness      set Moving_loaded
      Place_to_go   set GrindMach

  To
    Choice from To.Busyness = Free  and
                To.What_is_loaded = Unloaded
    first
$End

$Pattern  Unloading_to_GM_pat  : operation

$Relevant_resources
  To       : GM          NoChange  Keep
  Part     : Parts       NoChange  Keep
  Tr_Robot : TR          Keep      Keep

$Time = Unloading_time
$Body
  To
    Choice from To.Busyness = Free  and
                To.What_is_loaded = Unloaded
    first
    Convert_end
      What_is_loaded    set Loaded

  Part
    Choice from  Part.Location = Robot
    first
    Convert_end
      Location          set GrindMach

  Tr_Robot
    Choice from Tr_Robot.Busyness = Moving_loaded and
                Tr_Robot.Place_to_go = GrindMach and
                Tr_Robot.Coordinate = TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Busyness      set Unloading
      Location      set GrindMach
    Convert_end
      Busyness      set Free
      Place_to_go   set Not
$End

$Pattern  Command_5_pat  : rule

$Relevant_resources
  From           : GM                 NoChange
  Part           : Parts              NoChange
  Tr_Robot       : TR                 Keep
  To             : C3                 NoChange
  Conveyer_part  : Part_of_conveyer   NoChange

$Body
  From
    Choice from From.Busyness <> Busy  and
                From.What_is_loaded = Processed
    first

  Part
    Choice from  Part.Kind = a_rotor and
                 Part.Location = GrindMach
    first

  Tr_Robot
    Choice from Tr_Robot.Busyness = Free
    first
    Convert_rule
      Busyness            set Moving_empty
      Place_to_go         set GrindMach

  To
    Choice from To.Quantity_of_parts < 6
    first

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = 3 and
                Conveyer_part.Part_number = Last_conveyer_part_fun(To.Position, 6) and
                Conveyer_part.State = Empty
    first
$End

$Pattern  Loading_from_GM_pat  : operation

$Relevant_resources
  From           : GM                 NoChange  Keep
  Part           : Parts              NoChange  Keep
  Tr_Robot       : TR                 Keep      Keep
  To             : C3                 NoChange  NoChange
  Conveyer_part  : Part_of_conveyer   NoChange  NoChange

$Time = Loading_time
$Body
  From
    Choice from From.Busyness <> Busy  and
                From.What_is_loaded = Processed
    first
    Convert_end
      What_is_loaded  set Unloaded

  Part
    Choice from  Part.Kind = a_rotor and
                 Part.Location = GrindMach
    first
    Convert_end
      Location        set Robot

  Tr_Robot
    Choice from Tr_Robot.Busyness = Moving_empty  and
                Tr_Robot.Place_to_go = GrindMach and
                Tr_Robot.Coordinate = TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Busyness      set Loading
      Location      set GrindMach
    Convert_end
      Busyness      set Moving_loaded
      Place_to_go   set Conveyer_3

  To
    Choice from To.Quantity_of_parts < 6
    first

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = 3 and
                Conveyer_part.Part_number = Last_conveyer_part_fun(To.Position, 6) and
                Conveyer_part.State = Empty
    first
$End

$Pattern  Unloading_to_C3_pat  : operation

$Relevant_resources
  To             : C3                 Keep      Keep
  Conveyer_part  : Part_of_conveyer   NoChange  Keep
  Part           : Parts              NoChange  Keep
  Tr_Robot       : TR                 Keep      Keep

$Time = Unloading_time
$Body
  To
    Choice from To.Quantity_of_parts < 6 and
                To.Moving = Stop
    first
    Convert_begin
      Moving             set Blocked
    Convert_end
      Quantity_of_parts  set To.Quantity_of_parts + 1
      Moving             set Stop

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = 3  and
                Conveyer_part.Part_number = Last_conveyer_part_fun(To.Position, 6) and
                Conveyer_part.State = Empty
    first
    Convert_end
      State        set  is_filled

  Part
    Choice from  Part.Location = Robot
    first
    Convert_end
      Location     set Conveyer_3

  Tr_Robot
    Choice from Tr_Robot.Busyness = Moving_loaded and
                Tr_Robot.Place_to_go = Conveyer_3     and
                Tr_Robot.Coordinate = TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Busyness      set Unloading
      Location      set Conveyer_3
    Convert_end
      Busyness      set Free
      Place_to_go   set Not
$End

$Pattern  Move_left_pat  : operation

$Relevant_resources
  Tr_Robot : Robots      Keep   Keep

$Time = 0.02 / Speed_of_robot
$Body
  Tr_Robot
    Choice from [Tr_Robot.Busyness = Moving_empty or
		Tr_Robot.Busyness = Moving_loaded] and
		Tr_Robot.Moving = No_moving and
		Tr_Robot.Place_to_go <> Not and
		Tr_Robot.Coordinate > TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Moving            set Moving_left
    Convert_end
      Coordinate        set Tr_Robot.Coordinate - 1
      Moving            set No_moving
$End

$Pattern  Move_right_pat  : operation

$Relevant_resources
  Tr_Robot : Robots      Keep   Keep

$Time = 0.02 / Speed_of_robot
$Body
  Tr_Robot
    Choice from [Tr_Robot.Busyness = Moving_empty or
                Tr_Robot.Busyness = Moving_loaded] and
                Tr_Robot.Moving = No_moving and
                Tr_Robot.Place_to_go <> Not and
                Tr_Robot.Coordinate < TR_Coordinate(Tr_Robot.Place_to_go)
    first
    Convert_begin
      Moving            set Moving_right
    Convert_end
      Coordinate        set Tr_Robot.Coordinate + 1
      Moving            set No_moving
$End

$Pattern  Assembling_pat  : operation
$Parameters
  Time_of_operation  : real

$Relevant_resources
  Machine  : AP     Keep       Keep
  Part_1   : Parts  NoChange   Keep
  Part_2   : Parts  NoChange   Erase

$Time = Time_of_operation
$Body
  Machine
    Choice from Machine.Busyness = Free  and
                Machine.What_is_loaded = Loaded
    first
    Convert_begin
      Busyness        set Busy
    Convert_end
      Busyness        set Free
      What_is_loaded  set Processed

  Part_1
    Choice from  Part_1.Kind = a_shaft and
                 Part_1.Location = AssPos
    first
    Convert_end
      Kind            set a_rotor

  Part_2
    Choice from  Part_2.Kind = a_fan and
                 Part_2.Location = AssPos
    first
$End

$Pattern  Grinding_pat        : operation
$Parameters
  Time_of_operation  : real

$Relevant_resources
  Machine  : GM        Keep       Keep
  Part     : Parts     NoChange   NoChange

$Time = Time_of_operation
$Body
  Machine
    Choice from Machine.Busyness     = Free  and
                Machine.What_is_loaded = Loaded
    first
    Convert_begin
      Busyness        set Busy
      Keeper          set Machine.Number_of_breakdowns
    Convert_end
      Busyness        set New_Busyness(Machine.Number_of_breakdowns - Machine.Keeper,
                                       Free, Machine.Busyness)
      What_is_loaded  set New_What_is_loaded(Machine.Number_of_breakdowns - Machine.Keeper,
                                             Processed, Machine.What_is_loaded)
  Part
    Choice from  Part.Kind = a_rotor and
                 Part.Location = GrindMach
    first
$End

$Pattern  Fans_Shafts_Arrival_pat : irregular_event
$Parameters
  Interval  : real

$Relevant_resources
  Conveyer_1     : C1         Keep
  Conveyer_2     : C2         Keep
  Part_a_shaft   : Parts      Create
  Part_a_fan     : Parts      Create

$Time = Sequence_1(Interval, 0.1)
$Body
  Conveyer_1
    Convert_event
      Quantity_of_parts  set Conveyer_1.Quantity_of_parts + 1

  Conveyer_2
    Convert_event
      Quantity_of_parts  set Conveyer_2.Quantity_of_parts + 1

  Part_a_shaft
    Convert_event
      Arrival_time       set Time_now
      Kind               set a_shaft
      Location           set near_Conveyer_1
      Time_on_CP         set 0.0

  Part_a_fan
    Convert_event
      Arrival_time       set Time_now
      Kind               set a_fan
      Location           set near_Conveyer_2
      Time_on_CP         set 0.0
$End

$Pattern  Fans_Shafts_Placing_pat        : rule
$Parameters
  Conveyer_number  : integer
  Old_location     : such_as Parts.Location
  New_location_par : such_as Parts.Location

$Relevant_resources
  Part           : Parts             Keep
  Conveyer       : Conveyers         NoChange
  Conveyer_part  : Part_of_conveyer  Keep

$Body
  Part
    Choice from  Part.Location = Old_location
    first
    Convert_rule
      Location      set New_location_par

  Conveyer
    Choice from  Conveyer.Number = Conveyer_number and
                 Conveyer.Quantity_of_parts > 0
    first

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = Conveyer_number and
                Conveyer_part.Part_number = Last_conveyer_part_fun(Conveyer.Position, 6) and
                Conveyer_part.State = Empty
    first
    Convert_rule
      State  set is_filled
$End

$Pattern  Rotors_delivery_pat        : operation
$Parameters
  Time_of_operation   : real
  Rotors_finished     : integer

$Relevant_resources
  Conveyer            : C3                 Keep      NoChange
  Last_conveyer_part  : Part_of_conveyer   Keep      NoChange
  Part                : Parts              NoChange  Erase

$Time = Time_of_operation

$Body
  Conveyer
    Choice from  Conveyer.Quantity_of_parts >= Rotors_finished
    first
    Convert_begin
      Quantity_of_parts  set Conveyer.Quantity_of_parts - 1

  Last_conveyer_part
    Choice from Last_conveyer_part.Conveyer_number = 3 and
                Last_conveyer_part.Part_number = Last_conveyer_part_fun(Conveyer.Position, 6) and
                Last_conveyer_part.State = is_filled
    first
    Convert_begin
      State           set Empty

  Part
    Choice from  Part.Kind = a_rotor and
                 Part.Location = Conveyer_3
    first
$End

$Pattern  Moving_of_conveyer_1_2_pat  : operation
$Parameters
  Time_of_operation  : real
  Conveyer_number    : integer

$Relevant_resources
  Conveyer        : Conveyers          Keep       Keep
  Conveyer_part   : Part_of_conveyer   NoChange   NoChange

$Time = Time_of_operation

$Body
  Conveyer
    Choice from  Conveyer.Number = Conveyer_number  and
                 Conveyer.Quantity_of_parts > 0   and
                 Conveyer.Moving = Stop
    first
    Convert_begin
      Moving            set  Move
    Convert_end
      Position          set  New_location(Conveyer.Position, 6)
      Moving            set  Stop

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = Conveyer_number and
                Conveyer_part.Part_number = Conveyer.Position  and
                Conveyer_part.State = Empty
    first
$End

$Pattern  Moving_of_conveyer_3_pat  : operation

$Parameters
  Time_of_operation  : real

$Relevant_resources
  Conveyer             : C3                 Keep       Keep
  First_conveyer_part  : Part_of_conveyer   NoChange   NoChange
  Last_conveyer_part   : Part_of_conveyer   NoChange   NoChange

$Time = Time_of_operation

$Body
  Conveyer
    Choice from  Conveyer.Quantity_of_parts > 0 and
                 Conveyer.Moving = Stop
    first
    Convert_begin
      Moving            set  Move
    Convert_end
      Position          set  New_location(Conveyer.Position, 6)
      Moving            set  Stop

  First_conveyer_part
    Choice from First_conveyer_part.Conveyer_number = 3 and
                First_conveyer_part.Part_number   = Conveyer.Position and
                First_conveyer_part.State       = Empty
    first

  Last_conveyer_part
    Choice from Last_conveyer_part.Conveyer_number = 3 and
                Last_conveyer_part.Part_number = Last_conveyer_part_fun(Conveyer.Position, 6) and
                Last_conveyer_part.State = is_filled
    first
$End

$Pattern  Moving_of_CP_pat  : operation
$Parameters
  Time_of_operation  : real

$Relevant_resources
  Conveyer       : CP                 Keep       Keep
  Conveyer_part  : Part_of_conveyer   NoChange   NoChange

$Time = Time_of_operation

$Body
  Conveyer
    Choice from  Conveyer.Quantity_of_parts > 0   and
                 Conveyer.Moving = Stop
    first
    Convert_begin
      Moving            set  Move
    Convert_end
      Position          set  New_location(Conveyer.Position, 10)
      Moving            set  Stop

  Conveyer_part
    Choice from Conveyer_part.Conveyer_number = 4 and
                Conveyer_part.Part_number = Conveyer.Position  and
                Conveyer_part.State = Empty
    first
$End

$Pattern  Breakdown_of_GM_pat : irregular_event
$Parameters
  Interval  : real

$Relevant_resources
  Machine     : GM         Keep

$Time = Sequence_2(Interval)
$Body
  Machine
    Convert_event
      Busyness              set Is_broken
      Number_of_breakdowns  set Machine.Number_of_breakdowns + 1
$End

$Pattern  Repairing_of_GM_pat        : operation
$Parameters
  Average_time  : real

$Relevant_resources
  Machine     : GM         Keep       Keep

$Time = Sequence_3(Average_time, Average_time / 5)
$Body
  Machine
    Choice from Machine.Busyness = Is_broken
    first
    Convert_begin
      Busyness      set Repairing
    Convert_end
      Busyness      set Free
$End

