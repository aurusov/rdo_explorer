$Pattern  Transfer_on_half_fin_prod_area : operation
$Parameters
  The_time            : real
$Relevant_resources
  rel_1_Sheets_store          : Store_house_9       Keep  Keep
  rel_2_The_crane             : The_crane           Keep  Keep
  rel_3_Half_fin_prod_area    : Half_fin_prod_area  Keep  Keep
$Time = The_time
$Body
rel_1_Sheets_store
  Choice from
    rel_1_Sheets_store.Number_of_sheets >= 36
  first

  Convert_begin
    Number_of_sheets   set rel_1_Sheets_store.Number_of_sheets - 36

  Convert_end
    Number_of_sheets   NoChange

rel_2_The_crane
  Choice from
    rel_2_The_crane.Busyness = Free
  first

  Convert_begin
    Busyness            set Busy
    Position       NoChange

  Convert_end
    Busyness            set Free
    Position       set _Half_finished_product_area

rel_3_Half_fin_prod_area
  Choice from
    rel_3_Half_fin_prod_area.Busyness = Free and
    rel_3_Half_fin_prod_area.Functioning = Unloaded and
    rel_3_Half_fin_prod_area.Number_of_the_bands = 0
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    Number_of_the_bands     NoChange

  Convert_end
    Busyness            NoChange
    Functioning        set Loaded
    Number_of_the_bands     NoChange

$End

$Pattern  Work_of_half_fin_prod_area : operation
$Parameters
  The_time : real
$Relevant_resources
  rel_1_Half_fin_prod_area : Half_fin_prod_area  Keep  Keep
$Time = The_time
$Body
rel_1_Half_fin_prod_area
  Choice from
    rel_1_Half_fin_prod_area.Busyness = Free and
    rel_1_Half_fin_prod_area.Functioning = Loaded and
    rel_1_Half_fin_prod_area.Number_of_the_bands = 0
  first

  Convert_begin
    Busyness            set Busy
    Functioning        NoChange
    Number_of_the_bands     NoChange

  Convert_end
    Busyness            set Free
    Functioning        set Worked
    Number_of_the_bands     set 216

$End

$Pattern  Transfer_by_crane_to_band_forwarding_device : operation
$Parameters
  The_time        : real
  Name_of_band_forwarding_device  : such_as Band_forwarding_device.Name
  Name_of_shelving                : such_as a_Shelving.Name
  Old_place                       : such_as a_Crane.Position
  New_place                       : such_as a_Crane.Position
$Relevant_resources
  rel_1_Half_fin_prod_area      : Half_fin_prod_area      Keep  Keep
  rel_2_The_crane               : The_crane               Keep  Keep
  rel_3_Band_forwarding_device  : Band_forwarding_device  Keep  Keep
  rel_4_Shelving                : a_Shelving              Keep  Keep
$Time = The_time
$Body
rel_1_Half_fin_prod_area
  Choice from
    rel_1_Half_fin_prod_area.Busyness = Free and
    rel_1_Half_fin_prod_area.Functioning = Worked and
    rel_1_Half_fin_prod_area.Number_of_the_bands = 216
  first

  Convert_begin
    Busyness            NoChange
    Functioning        set Unloaded
    Number_of_the_bands     set 0

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Number_of_the_bands     NoChange

rel_2_The_crane
  Choice from
    rel_2_The_crane.Busyness = Free
  first

  Convert_begin
    Busyness            set Busy
    Position       set Old_place

  Convert_end
    Busyness            set Free
    Position       set New_place

rel_3_Band_forwarding_device
  Choice from
    rel_3_Band_forwarding_device.Busyness = Free and
    rel_3_Band_forwarding_device.Number_of_the_bands = 0 and
    rel_3_Band_forwarding_device.Name = Name_of_band_forwarding_device
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_bands     NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_bands     set 216
    Name                  NoChange

rel_4_Shelving
  Choice from
    rel_4_Shelving.Number_of_the_bands = 0 and
    rel_4_Shelving.Name = Name_of_shelving 
  first

  Convert_begin
    Number_of_the_bands     NoChange
    Name                  NoChange

  Convert_end
    Number_of_the_bands     NoChange
    Name                  NoChange

$End

$Pattern  Transfer_by_crane_to_shelving : operation
$Parameters
  The_time                        : real
  Name_of_band_forwarding_device  : such_as Band_forwarding_device.Name
  Name_of_shelving                : such_as a_Shelving.Name
  Old_place                       : such_as a_Crane.Position
  New_place                       : such_as a_Crane.Position
$Relevant_resources
  rel_1_Half_fin_prod_area      : Half_fin_prod_area      Keep  Keep
  rel_2_The_crane               : The_crane               Keep  Keep
  rel_3_Band_forwarding_device  : Band_forwarding_device  Keep  Keep
  rel_4_Shelving                : a_Shelving              Keep  Keep
$Time = The_time
$Body
rel_1_Half_fin_prod_area
  Choice from
    rel_1_Half_fin_prod_area.Busyness = Free and
    rel_1_Half_fin_prod_area.Functioning = Worked and
    rel_1_Half_fin_prod_area.Number_of_the_bands = 216
  first

  Convert_begin
    Busyness            NoChange
    Functioning        set Unloaded
    Number_of_the_bands     set 0

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Number_of_the_bands     NoChange

rel_2_The_crane
  Choice from
    rel_2_The_crane.Busyness = Free
  first

  Convert_begin
    Busyness            set Busy
    Position       set Old_place

  Convert_end
    Busyness            set Free
    Position       set New_place

rel_3_Band_forwarding_device
  Choice from
    rel_3_Band_forwarding_device.Number_of_the_bands > 0 and
    rel_3_Band_forwarding_device.Name = Name_of_band_forwarding_device
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_bands     NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_bands     NoChange
    Name                  NoChange

rel_4_Shelving
  Choice from
    rel_4_Shelving.Number_of_the_bands <= 864 and
    rel_4_Shelving.Name = Name_of_shelving 
  first

  Convert_begin
    Number_of_the_bands     NoChange
    Name                  NoChange

  Convert_end
    Number_of_the_bands     set rel_4_Shelving.Number_of_the_bands + 216
    Name                  NoChange

$End

$Pattern  Transfer_from_shelving_to_band_forwarding_device : operation
$Parameters
  The_time                        : real
  Name_of_band_forwarding_device  : such_as Band_forwarding_device.Name
  Name_of_shelving                : such_as a_Shelving.Name
  Old_place                       : such_as a_Crane.Position
  New_place                       : such_as a_Crane.Position
$Relevant_resources
  rel_1_The_crane               : The_crane               Keep  Keep
  rel_2_Band_forwarding_device  : Band_forwarding_device  Keep  Keep
  rel_3_a_Shelving              : a_Shelving              Keep  Keep
$Time = The_time
$Body
rel_1_The_crane
  Choice from
    rel_1_The_crane.Busyness = Free
  first

  Convert_begin
    Busyness            set Busy
    Position       set Old_place

  Convert_end
    Busyness            set Free
    Position       set New_place

rel_2_Band_forwarding_device
  Choice from
    rel_2_Band_forwarding_device.Busyness = Free and
    rel_2_Band_forwarding_device.Number_of_the_bands = 0 and
    rel_2_Band_forwarding_device.Name = Name_of_band_forwarding_device
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_bands     NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_bands     set 216
    Name                  NoChange

rel_3_a_Shelving
  Choice from
    rel_3_a_Shelving.Number_of_the_bands >= 216 and
    rel_3_a_Shelving.Name = Name_of_shelving 
  first

  Convert_begin
    Number_of_the_bands     set rel_3_a_Shelving.Number_of_the_bands - 216
    Name                  NoChange

  Convert_end
    Number_of_the_bands     NoChange
    Name                  NoChange
$End

$Pattern  Work_of_band_forwarding_device : operation
$Parameters
  The_time                       : real
  Name_of_band_forwarding_device : such_as Band_forwarding_device.Name
  Name_of_presses                : such_as a_Press_punch.Name
$Relevant_resources
  rel_1_Band_forwarding_device : Band_forwarding_device  Keep  Keep
  rel_2_Press_punch            : a_Press_punch           Keep  Keep
$Time = The_time
$Body
rel_1_Band_forwarding_device
  Choice from
    rel_1_Band_forwarding_device.Busyness = Free and
    rel_1_Band_forwarding_device.Number_of_the_bands >= 1 and
    rel_1_Band_forwarding_device.Name = Name_of_band_forwarding_device
  first

  Convert_begin
    Busyness            set Busy
    Number_of_the_bands     set rel_1_Band_forwarding_device.Number_of_the_bands - 1
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Number_of_the_bands     NoChange
    Name                  NoChange

rel_2_Press_punch
  Choice from
    rel_2_Press_punch.Busyness = Free and
    rel_2_Press_punch.Functioning = Worked_Unloaded and
    rel_2_Press_punch.Name = Name_of_presses
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        set Loaded
    Name                  NoChange
$End

$Pattern  Work_of_presses : operation
$Parameters
  The_time                    : real
  Name_of_smooth_out_machine  : such_as a_Smooth_out_device.Name
  Name_of_presses             : such_as a_Press_punch.Name
  Availability                : integer
  Addition                    : integer
$Relevant_resources
  rel_1_Smooth_out_machine  : a_Smooth_out_device  Keep  Keep
  rel_2_Press_punch         : a_Press_punch         Keep  Keep
$Time = The_time
$Body
rel_1_Smooth_out_machine
  Choice from
    rel_1_Smooth_out_machine.Busyness = Free and
    rel_1_Smooth_out_machine.Number_of_the_parts <= Availability and
    rel_1_Smooth_out_machine.Name = Name_of_smooth_out_machine
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_parts   set rel_1_Smooth_out_machine.Number_of_the_parts + Addition
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

rel_2_Press_punch
  Choice from
    rel_2_Press_punch.Busyness = Free and
    rel_2_Press_punch.Functioning = Loaded and
    rel_2_Press_punch.Name = Name_of_presses
  first

  Convert_begin
    Busyness            set Busy
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Functioning        set Worked_Unloaded
    Name                  NoChange
$End

$Pattern  Packing_in_casette : operation
$Parameters
  The_time                    : real
  Name_of_smooth_out_machine  : such_as a_Smooth_out_device.Name
  Name_of_casette             : such_as Device_of_packing_in_casette.Name
  Casette                     : integer
$Relevant_resources
  rel_1_Smooth_out_machine           : a_Smooth_out_device             Keep  Keep
  rel_2_Device_of_packing_in_casette : Device_of_packing_in_casette     Keep  Keep
$Time = The_time
$Body
rel_1_Smooth_out_machine
  Choice from
    rel_1_Smooth_out_machine.Busyness = Free and
    rel_1_Smooth_out_machine.Number_of_the_parts >= Casette and
    rel_1_Smooth_out_machine.Name = Name_of_smooth_out_machine
  first

  Convert_begin
    Busyness            set Busy
    Number_of_the_parts   set rel_1_Smooth_out_machine.Number_of_the_parts -
                             Casette
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Number_of_the_parts   NoChange
    Name                  NoChange

rel_2_Device_of_packing_in_casette
  Choice from
    rel_2_Device_of_packing_in_casette.Busyness = Free and
    rel_2_Device_of_packing_in_casette.Number_of_the_parts = 0 and
    rel_2_Device_of_packing_in_casette.Name = Name_of_casette
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_parts   set Casette
    Name                  NoChange
$End

$Pattern  Transfer_to_the_store_block : operation
$Parameters
  The_time         : real
  Name_of_robot1   : such_as a_Transport_robot.Name
  Name_of_robot2   : such_as a_Transport_robot.Name
  Name_of_casette  : such_as Device_of_packing_in_casette.Name
  Name_of_block    : such_as a_Store_block.Name
  Casette     : integer
$Relevant_resources
  rel_1_Transport_robot1             : a_Transport_robot                Keep  Keep
  rel_2_Device_of_packing_in_casette : Device_of_packing_in_casette     Keep  Keep
  rel_3_Transport_robot2             : a_Transport_robot                Keep  Keep
  rel_4_Store_block                  : a_Store_block                    Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot1 
  Choice from
    rel_1_Transport_robot1.Busyness = Busy and
    rel_1_Transport_robot1.Name = Name_of_robot1 
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Position       NoChange
    Condition            NoChange
    Name                  NoChange

rel_2_Device_of_packing_in_casette
  Choice from
    rel_2_Device_of_packing_in_casette.Busyness = Free and
    rel_2_Device_of_packing_in_casette.Number_of_the_parts = Casette and
    rel_2_Device_of_packing_in_casette.Name = Name_of_casette
  first

  Convert_begin
    Busyness            set Busy
    Number_of_the_parts   NoChange
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Number_of_the_parts   set 0
    Name                  NoChange

rel_3_Transport_robot2
  Choice from
    rel_3_Transport_robot2.Busyness = Busy and
    rel_3_Transport_robot2.Name = Name_of_robot2 
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Position       NoChange
    Condition            NoChange
    Name                  NoChange

rel_4_Store_block
  Choice from
    rel_4_Store_block.Busy_cells < 392 and
    rel_4_Store_block.Busyness = Free and
    rel_4_Store_block.Name = Name_of_block 
  first

  Convert_begin
    Busy_cells  NoChange
    Busyness            set Busy
    Name                  NoChange

  Convert_end
    Busy_cells  set rel_4_Store_block.Busy_cells + 1
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Transport_from_store_house3333_to_robot  : operation
$Parameters
  The_time       : real
  Name_of_robot  : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot               : a_Transport_robot        Keep  Keep
  rel_2_Device_of_packing_in_casette1 : Caset17                  Keep  Keep
  rel_3_Device_of_packing_in_casette2 : Caset171                 Keep  Keep
  rel_4_Store_block                   : Block3333                Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Store_block3333
    Condition            set Stand
    Name                  NoChange

rel_2_Device_of_packing_in_casette1
  Choice from
    rel_2_Device_of_packing_in_casette1.Busyness = Free and
    rel_2_Device_of_packing_in_casette1.Number_of_the_parts = 0
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

rel_3_Device_of_packing_in_casette2
  Choice from
    rel_3_Device_of_packing_in_casette2.Busyness = Free and
    rel_3_Device_of_packing_in_casette2.Number_of_the_parts = 0
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

rel_4_Store_block
  Choice from
    rel_4_Store_block.Busy_cells >= 1 and
    rel_4_Store_block.Busyness = Free
  first

  Convert_begin
    Busy_cells  set rel_4_Store_block.Busy_cells - 1
    Busyness            set Busy
    Name                  NoChange

  Convert_end
    Busy_cells  NoChange
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Transfer_from_device_of_packing_in_casette_to_robot: operation
$Parameters
  The_time         : real
  Name_of_robot    : such_as a_Transport_robot.Name
  Name_of_casette  : such_as Device_of_packing_in_casette.Name
  The_position     : such_as a_Transport_robot.Position
$Relevant_resources
  rel_1_Transport_robot               : a_Transport_robot                Keep  Keep
  rel_2_Device_of_packing_in_casette  : Device_of_packing_in_casette     Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set The_position
    Condition            set Stand
    Name                  NoChange

rel_2_Device_of_packing_in_casette
  Choice from
    rel_2_Device_of_packing_in_casette.Busyness = Free and
    rel_2_Device_of_packing_in_casette.Number_of_the_parts = 50 and
    rel_2_Device_of_packing_in_casette.Name = Name_of_casette
  first

  Convert_begin
    Busyness            set Busy
    Number_of_the_parts   NoChange
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Number_of_the_parts   set 0
    Name                  NoChange
$End

$Pattern  Transfer_by_robot_to_reception_device2526: operation
$Parameters
  The_time       : real
  Name_of_robot  : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot      : a_Transport_robot        Keep  Keep
  rel_2_Input_output_device  : Reception2526            Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Busy and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Position       set Reception_device2526
    Condition            set Stand
    Name                  NoChange

rel_2_Input_output_device
  Choice from
    rel_2_Input_output_device.Busyness = Free
  first

  Convert_begin
    Busyness            set Wait
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Name                  NoChange
$End

$Pattern  Reception_of_parts_by_robots_AMR26 : operation
$Parameters
  The_time       : real
  Name_of_robot  : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot      : a_Transport_robot        Keep  Keep
  rel_2_Input_output_device  : Reception2526            Keep  Keep
  rel_3_Smooth_out_machine   : a_Smooth_out_machine     Keep  Keep
  rel_4_The_man1             : The_man1                 Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Reception_device2526
    Condition            set Stand
    Name                  NoChange

rel_2_Input_output_device
  Choice from
    rel_2_Input_output_device.Busyness = Busy
  first

  Convert_begin
    Busyness            set Wait
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange

rel_3_Smooth_out_machine
  Choice from
    rel_3_Smooth_out_machine.Busyness = Free and
    rel_3_Smooth_out_machine.Functioning <= 550
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange

rel_4_The_man1
  Choice from
    rel_4_The_man1.Busyness = Free
  first

  Convert_begin
    Busyness            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Name                  NoChange
$End

$Pattern  Transfer_by_robot_to_man : operation
$Parameters
  The_time          : real
  Name_of_robot     : such_as a_Transport_robot.Name
  Name_of_the_man   : such_as a_Man.Name
  Old_place         : such_as a_Transport_robot.Position
  New_place         : such_as a_Transport_robot.Position
$Relevant_resources
  rel_1_Transport_robot : a_Transport_robot  Keep  Keep
  rel_2_Man             : a_Man              Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Busy and
    rel_1_Transport_robot.Position = Old_place and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Position       set New_place
    Condition            set Stand
    Name                  NoChange

rel_2_Man
  Choice from
    rel_2_Man.Busyness = Free and
    rel_2_Man.Name = Name_of_the_man
  first

  Convert_begin
    Busyness            set Wait
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Name                  NoChange
$End

$Pattern  Work_of_the_man1 : operation
$Parameters
  The_time        : real
$Relevant_resources
  rel_1_Smooth_out_machine : a_Smooth_out_machine   Keep  Keep
  rel_2_The_man1           : The_man1               Keep  Keep
$Time = The_time
$Body
rel_1_Smooth_out_machine
  Choice from
    rel_1_Smooth_out_machine.Busyness = Free and
    rel_1_Smooth_out_machine.Functioning <= 550
  first

  Convert_begin
    Busyness            NoChange
    Functioning        set rel_1_Smooth_out_machine.Functioning + 50

  Convert_end
    Busyness            NoChange
    Functioning        NoChange

rel_2_The_man1
  Choice from
    rel_2_The_man1.Busyness = Busy
  first

  Convert_begin

    Busyness            set Load_in_machine
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Work_of_smooth_out_machine : operation
$Parameters
  The_time        : real
$Relevant_resources
  rel_1_Smooth_out_machine : a_Smooth_out_machine   Keep  Keep
$Time = The_time
$Body
rel_1_Smooth_out_machine
  Choice from
    rel_1_Smooth_out_machine.Busyness = Free and
    rel_1_Smooth_out_machine.Functioning = 600
  first

  Convert_begin
    Busyness            set Busy
    Functioning        NoChange

  Convert_end
    Busyness            set Free_but_not_shutting_off
    Functioning        NoChange
$End

$Pattern  Cutting_off_smooth_out_machine : operation
$Parameters
  The_time        : real
$Relevant_resources
  rel_1_Smooth_out_machine : a_Smooth_out_machine   Keep  Keep
$Time = The_time
$Body
rel_1_Smooth_out_machine
  Choice from
    rel_1_Smooth_out_machine.Busyness = Free_but_not_shutting_off and
    rel_1_Smooth_out_machine.Functioning = 0
  first

  Convert_begin
    Busyness            set Free
    Functioning        NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
$End

$Pattern  Unloading_from_smooth_out_machine : operation
$Parameters
  The_time        : real
  Name_of_robot   : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Smooth_out_machine : a_Smooth_out_machine     Keep  Keep
  rel_2_The_man1           : The_man1                 Keep  Keep
  rel_3_Transport_robot    : a_Transport_robot        Keep  Keep
  rel_4_The_washing19      : The_washing19            Keep  Keep
$Time = The_time
$Body
rel_1_Smooth_out_machine
  Choice from
    rel_1_Smooth_out_machine.Busyness = Free_but_not_shutting_off and
    rel_1_Smooth_out_machine.Functioning >= 50
  first

  Convert_begin
    Busyness            NoChange
    Functioning        set rel_1_Smooth_out_machine.Functioning - 50

  Convert_end
    Busyness            NoChange
    Functioning        NoChange

rel_2_The_man1
  Choice from
    rel_2_The_man1.Busyness = Free
  first

  Convert_begin
    Busyness            set Unload_from_smooth_out_machine
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange

rel_3_Transport_robot
  Choice from
    rel_3_Transport_robot.Busyness = Free and
    rel_3_Transport_robot.Condition = Stand and
    rel_3_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Man1
    Condition            set Stand
    Name                  NoChange

rel_4_The_washing19
  Choice from
    rel_4_The_washing19.Busyness = Free and
    rel_4_The_washing19.Functioning = Unloaded
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange
$End

$Pattern  Work_of_the_man2_with_washing_machine19 : operation
$Parameters
  The_time        : real
$Relevant_resources
  rel_1_Washing_machine   : The_washing19     Keep  Keep
  rel_2_Man               : The_man2          Keep  Keep
$Time = The_time
$Body
rel_1_Washing_machine 
  Choice from
    rel_1_Washing_machine.Busyness = Free and
    rel_1_Washing_machine.Functioning = Wait_loading
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        set Loaded
    Name                  NoChange

rel_2_Man
  Choice from
    rel_2_Man.Busyness = Busy and
    rel_2_Man.Name = Man_2
  first

  Convert_begin
    Busyness            set Load_in_machine
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Work_of_washing_machine : operation
$Parameters
  The_time                 : real
  Name_of_washing_machine  : such_as a_Washing_machine.Name
  Condition1               : such_as a_Washing_machine.Functioning
  Condition2               : such_as a_Washing_machine.Functioning
$Relevant_resources
  rel_1_Washing_machine  : a_Washing_machine   Keep  Keep
$Time = The_time
$Body
rel_1_Washing_machine 
  Choice from
    rel_1_Washing_machine.Busyness = Free and
    rel_1_Washing_machine.Functioning = Condition1 and
    rel_1_Washing_machine.Name = Name_of_washing_machine
  first

  Convert_begin
    Busyness            set Busy
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Functioning        set Condition2
    Name                  NoChange
$End

$Pattern  Unloading_from_washing_machine19 : operation
$Parameters
  The_time        : real
  Name_of_robot   : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_The_washing19      : The_washing19       Keep  Keep
  rel_2_The_man2           : The_man2            Keep  Keep
  rel_3_Transport_robot    : a_Transport_robot   Keep  Keep
  rel_4_Assembling_place   : an_Assembling_place  Keep  Keep
$Time = The_time
$Body
rel_1_The_washing19
  Choice from
    rel_1_The_washing19.Busyness = Free and
    rel_1_The_washing19.Functioning = The_end_of_washing
  first

  Convert_begin
    Busyness            NoChange
    Functioning        set Unloaded
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

rel_2_The_man2
  Choice from
    rel_2_The_man2.Busyness = Free
  first

  Convert_begin
    Busyness            set Unload_from_washing_machine_first_time
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange

rel_3_Transport_robot
  Choice from
    rel_3_Transport_robot.Busyness = Free and
    rel_3_Transport_robot.Condition = Stand and
    rel_3_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Man2
    Condition            set Stand
    Name                  NoChange

rel_4_Assembling_place
  Choice from
    rel_4_Assembling_place.Busyness = Free and
    rel_4_Assembling_place.Functioning = Unloaded and
    rel_4_Assembling_place.The_rest_of_parts <= 44
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    The_rest_of_parts      NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    The_rest_of_parts      NoChange
    Name                  NoChange
$End

$Pattern  Transfer_to_assembling : operation
$Parameters
  The_time                 : real
  Name_of_the_assembling   : such_as an_Assembling_place.Name
  Name_of_robot            : such_as a_Transport_robot.Name
  The_position             : such_as a_Transport_robot.Position
$Relevant_resources
  rel_1_Transport_robot    : a_Transport_robot      Keep  Keep
  rel_2_Assembling_place   : an_Assembling_place    Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Busy and
    rel_1_Transport_robot.Position = Man2 and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Position       set The_position
    Condition            set Stand
    Name                  NoChange

rel_2_Assembling_place
  Choice from
    rel_2_Assembling_place.Busyness = Free and
    rel_2_Assembling_place.Functioning = Unloaded and
    rel_2_Assembling_place.The_rest_of_parts <= 44 and
    rel_2_Assembling_place.Name = Name_of_the_assembling
  first

  Convert_begin
    Busyness            set Wait
    Functioning        NoChange
    The_rest_of_parts      NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        set Loaded
    The_rest_of_parts      NoChange
    Name                  NoChange
$End

$Pattern  Work_of_the_assembling : operation
$Parameters
  The_time        : real
  Name_of_the_assembling   : such_as an_Assembling_place.Name
$Relevant_resources
  rel_1_Assembling_place   : an_Assembling_place    Keep  Keep
$Time = The_time
$Body
rel_1_Assembling_place
  Choice from
    rel_1_Assembling_place.Busyness = Wait and
    rel_1_Assembling_place.Functioning = Loaded and
    rel_1_Assembling_place.The_rest_of_parts <= 44 and
    rel_1_Assembling_place.Name = Name_of_the_assembling
  first

  Convert_begin
    Busyness            set Busy
    Functioning        NoChange
    The_rest_of_parts      set rel_1_Assembling_place.The_rest_of_parts + 4
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Functioning        set The_end_of_assembling
    The_rest_of_parts      NoChange
    Name                  NoChange
$End

$Pattern  Reception_of_the_assembling : operation
$Parameters
  The_time                 : real
  Name_of_the_assembling   : such_as an_Assembling_place.Name
  Name_of_robot            : such_as a_Transport_robot.Name
  The_position             : such_as a_Transport_robot.Position
$Relevant_resources
  rel_1_Transport_robot    : a_Transport_robot      Keep  Keep
  rel_2_Assembling_place   : an_Assembling_place    Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set The_position
    Condition            set Stand
    Name                  NoChange

rel_2_Assembling_place
  Choice from
    rel_2_Assembling_place.Busyness = Free and
    rel_2_Assembling_place.Functioning = The_end_of_assembling and
    rel_2_Assembling_place.Name = Name_of_the_assembling
  first

  Convert_begin
    Busyness            set Wait
    Functioning        NoChange
    The_rest_of_parts      NoChange
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Functioning        set Unloaded
    The_rest_of_parts      NoChange
    Name                  NoChange
$End

$Pattern  Transfer_to_the_store_house : operation
$Parameters
  The_time        : real
  Name_of_robot   : such_as a_Transport_robot.Name
  Name_of_block   : such_as a_Store_block.Name
  The_position1   : such_as a_Transport_robot.Position
  The_position2   : such_as a_Transport_robot.Position
  Cells           : integer  [0..448]
  Condition1      : such_as a_Transport_robot.Condition
$Relevant_resources
  rel_1_Transport_robot : a_Transport_robot  Keep  Keep
  rel_2_Store_block     : a_Store_block      Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Busy and
    rel_1_Transport_robot.Position = The_position1 and
    rel_1_Transport_robot.Condition = Condition1 and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Position       set The_position2
    Condition            set Stand
    Name                  NoChange

rel_2_Store_block
  Choice from
    rel_2_Store_block.Busy_cells < Cells and
    rel_2_Store_block.Busyness = Free and
    rel_2_Store_block.Name = Name_of_block 
  first

  Convert_begin
    Busy_cells  NoChange
    Busyness            set Busy
    Name                  NoChange

  Convert_end
    Busy_cells  set rel_2_Store_block.Busy_cells + 1
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Transfer_to_the_conveyer : operation
$Parameters
  The_time            : real
$Relevant_resources
  rel_1_Sheets_store : Store_house_8            Keep  Keep
  rel_2_The_crane    : The_crane                Keep  Keep
  rel_3_Conveyer     : a_Roller_conveyer        Keep  Keep
$Time = The_time
$Body
rel_1_Sheets_store
  Choice from
    rel_1_Sheets_store.Number_of_sheets >= 72
  first

  Convert_begin
    Number_of_sheets   set rel_1_Sheets_store.Number_of_sheets - 72

  Convert_end
    Number_of_sheets   NoChange

rel_2_The_crane
  Choice from
    rel_2_The_crane.Busyness = Free
  first

  Convert_begin
    Busyness            set Busy
    Position       set _Sheets_store8

  Convert_end
    Busyness            set Free
    Position       set _Roller_conveyer

rel_3_Conveyer
  Choice from
    rel_3_Conveyer.Busyness = Free and
    rel_3_Conveyer.Number_of_sheets = 0 and
    rel_3_Conveyer.Position = Roller_conveyer
  first

  Convert_begin
    Busyness            NoChange
    Number_of_sheets    NoChange
    Position       NoChange

  Convert_end
    Busyness            NoChange
    Number_of_sheets    set 72
    Position       NoChange
$End

$Pattern  Work_of_the_conveyer : operation
$Parameters
  The_time : real
$Relevant_resources
  rel_1_Conveyer     : a_Roller_conveyer  Keep  Keep
$Time = The_time
$Body
rel_1_Conveyer
  Choice from
    rel_1_Conveyer.Busyness = Free and
    rel_1_Conveyer.Number_of_sheets = 72 and
    rel_1_Conveyer.Position = Roller_conveyer
  first

  Convert_begin
    Busyness            set Busy
    Number_of_sheets    NoChange
    Position       NoChange

  Convert_end
    Busyness            set Free
    Number_of_sheets    NoChange
    Position       set Scissors_
$End

$Pattern  Work_of_the_scissors : operation
$Parameters
  The_time            : real
$Relevant_resources
  rel_1_Conveyer      : a_Roller_conveyer  Keep  Keep
  rel_2_Scissors      : a_Scissors         Keep  Keep
  rel_3_Input_table   : an_Input_table     Keep  Keep
$Time = The_time
$Body
rel_1_Conveyer
  Choice from
    rel_1_Conveyer.Busyness = Free and
    rel_1_Conveyer.Number_of_sheets > 0 and
    rel_1_Conveyer.Position = Scissors_
  first

  Convert_begin
    Busyness            NoChange
    Number_of_sheets    set rel_1_Conveyer.Number_of_sheets - 1
    Position       NoChange

  Convert_end
    Busyness            NoChange
    Number_of_sheets    NoChange
    Position       NoChange

rel_2_Scissors
  Choice from
    rel_2_Scissors.Busyness = Free and
    rel_2_Scissors.Functioning = Worked_Unloaded
  first

  Convert_begin
    Busyness           set Busy
    Functioning       set Loaded

  Convert_end
    Busyness           set Free
    Functioning       set Worked_Unloaded

rel_3_Input_table
  Choice from
    rel_3_Input_table.Number_of_the_bands <= 213
  first

  Convert_begin
    Number_of_the_bands     NoChange

  Convert_end
    Number_of_the_bands     set rel_3_Input_table.Number_of_the_bands + 3
$End

$Pattern  Return_of_the_conveyer : operation
$Parameters
  The_time : real
$Relevant_resources
  rel_1_Conveyer     : a_Roller_conveyer  Keep  Keep
$Time = The_time
$Body
rel_1_Conveyer
  Choice from
    rel_1_Conveyer.Busyness = Free and
    rel_1_Conveyer.Number_of_sheets = 0 and
    rel_1_Conveyer.Position = Scissors_
  first

  Convert_begin
    Busyness            set Busy
    Number_of_sheets    NoChange
    Position       NoChange

  Convert_end
    Busyness            set Free
    Number_of_sheets    NoChange
    Position       set Roller_conveyer
$End

$Pattern  Transfer_from_inp_table_to_band_forwarding_device : operation
$Parameters
  The_time                        : real
  Name_of_band_forwarding_device  : such_as Band_forwarding_device.Name
  Name_of_shelving                : such_as a_Shelving.Name
  The_position                    : such_as a_Crane.Position
$Relevant_resources
  rel_1_Input_table            : an_Input_table          Keep  Keep
  rel_2_The_crane              : The_crane               Keep  Keep
  rel_3_Band_forwarding_device : Band_forwarding_device  Keep  Keep
  rel_4_Shelving               : a_Shelving              Keep  Keep
$Time = The_time
$Body
rel_1_Input_table
  Choice from
    rel_1_Input_table.Number_of_the_bands = 216
  first

  Convert_begin
    Number_of_the_bands     set 0

  Convert_end
    Number_of_the_bands     NoChange

rel_2_The_crane
  Choice from
    rel_2_The_crane.Busyness = Free
  first

  Convert_begin
    Busyness            set Busy
    Position       set _Input_table

  Convert_end
    Busyness            set Free
    Position       set The_position

rel_3_Band_forwarding_device
  Choice from
    rel_3_Band_forwarding_device.Busyness = Free and
    rel_3_Band_forwarding_device.Number_of_the_bands = 0 and
    rel_3_Band_forwarding_device.Name = Name_of_band_forwarding_device
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_bands     NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_bands     set 216
    Name                  NoChange

rel_4_Shelving
  Choice from
    rel_4_Shelving.Number_of_the_bands = 0 and
    rel_4_Shelving.Name = Name_of_shelving 
  first

  Convert_begin
    Number_of_the_bands     NoChange
    Name                  NoChange

  Convert_end
    Number_of_the_bands     NoChange
    Name                  NoChange
$End

$Pattern  Transfer_from_inp_table_to_shelving : operation
$Parameters
  The_time                        : real
  Name_of_band_forwarding_device  : such_as Band_forwarding_device.Name
  Name_of_shelving                : such_as a_Shelving.Name
  The_position                    : such_as a_Crane.Position
$Relevant_resources
  rel_1_Input_table             : an_Input_table          Keep  Keep
  rel_2_The_crane               : The_crane               Keep  Keep
  rel_3_Band_forwarding_device  : Band_forwarding_device  Keep  Keep
  rel_4_Shelving                : a_Shelving              Keep  Keep
$Time = The_time
$Body
rel_1_Input_table
  Choice from
    rel_1_Input_table.Number_of_the_bands = 216
  first

  Convert_begin
    Number_of_the_bands     set 0

  Convert_end
    Number_of_the_bands     NoChange

rel_2_The_crane
  Choice from
    rel_2_The_crane.Busyness = Free
  first

  Convert_begin
    Busyness            set Busy
    Position       set _Input_table

  Convert_end
    Busyness            set Free
    Position       set The_position

rel_3_Band_forwarding_device
  Choice from
    rel_3_Band_forwarding_device.Number_of_the_bands > 0 and
    rel_3_Band_forwarding_device.Name = Name_of_band_forwarding_device
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_bands     NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_bands     NoChange
    Name                  NoChange

rel_4_Shelving
  Choice from
    rel_4_Shelving.Number_of_the_bands <= 864 and
    rel_4_Shelving.Name = Name_of_shelving 
  first

  Convert_begin
    Number_of_the_bands     NoChange
    Name                  NoChange

  Convert_end
    Number_of_the_bands     set rel_4_Shelving.Number_of_the_bands + 216
    Name                  NoChange
$End

$Pattern  Transfer_from_store_house3_to_robot : operation
$Parameters
  The_time       : real
  Name_of_robot  : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot               : a_Transport_robot  Keep  Keep
  rel_2_Device_of_packing_in_casette1 : Caset15            Keep  Keep
  rel_3_Device_of_packing_in_casette2 : Caset151           Keep  Keep
  rel_4_Store_block                   : Block3             Keep  Keep
  rel_5_Washing_machine               : The_washing        Keep  Keep
  rel_6_Input_output_device           : Reception2827      Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Store_block3
    Condition            set Stand_by_the_store_block3
    Name                  NoChange

rel_2_Device_of_packing_in_casette1
  Choice from
    rel_2_Device_of_packing_in_casette1.Busyness = Free and
    rel_2_Device_of_packing_in_casette1.Number_of_the_parts = 0
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

rel_3_Device_of_packing_in_casette2
  Choice from
    rel_3_Device_of_packing_in_casette2.Busyness = Free and
    rel_3_Device_of_packing_in_casette2.Number_of_the_parts = 0
  first

  Convert_begin
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Number_of_the_parts   NoChange
    Name                  NoChange

rel_4_Store_block
  Choice from
    rel_4_Store_block.Busy_cells >= 1 and
    rel_4_Store_block.Busyness = Free
  first

  Convert_begin
    Busy_cells  set rel_4_Store_block.Busy_cells - 1
    Busyness            set Busy
    Name                  NoChange

  Convert_end
    Busy_cells  NoChange
    Busyness            set Free
    Name                  NoChange

rel_5_Washing_machine
  Choice from
    rel_5_Washing_machine.Busyness = Free and
    rel_5_Washing_machine.Functioning = Unloaded
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

rel_6_Input_output_device
  Choice from
    rel_6_Input_output_device.Busyness = Free
  first

  Convert_begin
    Busyness            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Name                  NoChange
$End

$Pattern  Transfer_from_casset_to_robot_AMR27 : operation
$Parameters
  The_time         : real
  Name_of_robot    : such_as a_Transport_robot.Name
  Name_of_casette  : such_as Device_of_packing_in_casette.Name
  The_position     : such_as a_Transport_robot.Position
$Relevant_resources
  rel_1_Transport_robot              : a_Transport_robot             Keep  Keep
  rel_2_Device_of_packing_in_casette : Device_of_packing_in_casette  Keep  Keep
  rel_3_Washing_machine              : The_washing                   Keep  Keep
  rel_4_Input_output_device          : Reception2827                 Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set The_position
    Condition            set Stand_by_the_store_block3
    Name                  NoChange

rel_2_Device_of_packing_in_casette
  Choice from
    rel_2_Device_of_packing_in_casette.Busyness = Free and
    rel_2_Device_of_packing_in_casette.Number_of_the_parts = 40 and
    rel_2_Device_of_packing_in_casette.Name = Name_of_casette
  first

  Convert_begin
    Busyness            set Busy
    Number_of_the_parts   NoChange
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Number_of_the_parts   set 0
    Name                  NoChange

rel_3_Washing_machine
  Choice from
    rel_3_Washing_machine.Busyness = Free and
    rel_3_Washing_machine.Functioning = Unloaded
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

rel_4_Input_output_device
  Choice from
    rel_4_Input_output_device.Busyness = Free
  first

  Convert_begin
    Busyness            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Name                  NoChange
$End

$Pattern  Transfer_by_robot_to_man3 : operation
$Parameters
  The_time               : real
  Name_of_robot          : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot  : a_Transport_robot   Keep  Keep
  rel_2_The_man3         : The_man3            Keep  Keep
  rel_3_Washing_machine  : The_washing         Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Busy and
    rel_1_Transport_robot.Condition =
                             Stand_by_the_store_block3 and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Position       set Man3
    Condition            set Stand
    Name                  NoChange

rel_2_The_man3
  Choice from
    rel_2_The_man3.Busyness = Free
  first

  Convert_begin
    Busyness            set Wait
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Name                  NoChange

rel_3_Washing_machine
  Choice from
    rel_3_Washing_machine.Busyness = Free and
    rel_3_Washing_machine.Functioning = Unloaded
  first

  Convert_begin
    Busyness            NoChange
    Functioning        set Wait_loading
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange
$End

$Pattern  Work_of_the_man3_with_washing_machine : operation
$Parameters
  The_time    : real
  Condition1  : such_as a_Washing_machine.Functioning
  Condition2  : such_as a_Washing_machine.Functioning
  Busy1       : such_as a_Man.Busyness
  Busy2       : such_as a_Man.Busyness
$Relevant_resources
  rel_1_Washing_machine  : The_washing       Keep  Keep
  rel_2_The_man3         : The_man3          Keep  Keep
$Time = The_time
$Body
rel_1_Washing_machine 
  Choice from
    rel_1_Washing_machine.Busyness = Free and
    rel_1_Washing_machine.Functioning = Condition1
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        set Condition2
    Name                  NoChange

rel_2_The_man3
  Choice from
    rel_2_The_man3.Busyness = Busy1
  first

  Convert_begin
    Busyness            set Busy2
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Unloading_from_the_washing_mchine : operation
$Parameters
  The_time        : real
  Name_of_robot   : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_The_washing         : The_washing        Keep  Keep
  rel_2_The_man3            : The_man3           Keep  Keep
  rel_3_Transport_robot     : a_Transport_robot  Keep  Keep
  rel_4_Input_output_device : Reception2728      Keep  Keep
$Time = The_time
$Body
rel_1_The_washing
  Choice from
    rel_1_The_washing.Busyness = Free and
    rel_1_The_washing.Functioning = The_end_of_washing
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        set Unloaded
    Name                  NoChange

rel_2_The_man3
  Choice from
    rel_2_The_man3.Busyness = Free
  first

  Convert_begin
    Busyness            set Unload_from_washing_machine_first_time
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange

rel_3_Transport_robot
  Choice from
    rel_3_Transport_robot.Busyness = Free and
    rel_3_Transport_robot.Condition = Stand and
    rel_3_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Man3
    Condition            set Stand
    Name                  NoChange

rel_4_Input_output_device
  Choice from
    rel_4_Input_output_device.Busyness = Free
  first

  Convert_begin
    Busyness            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Name                  NoChange
$End

$Pattern  Transfer_by_robot_to_recept_device27_28 : operation
$Parameters
  The_time              : real
  Name_of_robot         : such_as a_Transport_robot.Name
  Name_of_input_device  : such_as a_Input_output_device.Name
  The_position1         : such_as a_Transport_robot.Position
  The_position2         : such_as a_Transport_robot.Position
$Relevant_resources
  rel_1_Transport_robot      : a_Transport_robot         Keep  Keep
  rel_2_Input_output_device  : a_Input_output_device     Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Busy and
    rel_1_Transport_robot.Position = The_position1 and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Position       set The_position2
    Condition            set Stand
    Name                  NoChange

rel_2_Input_output_device
  Choice from
    rel_2_Input_output_device.Busyness = Free and
    rel_2_Input_output_device.Name = Name_of_input_device
  first

  Convert_begin
    Busyness            set Wait
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Name                  NoChange
$End

$Pattern  Reception_of_details_by_robots_AMR28 : operation
$Parameters
  The_time       : real
  Name_of_robot  : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot      : a_Transport_robot   Keep  Keep
  rel_2_Input_output_device  : Reception2728       Keep  Keep
  rel_3_The_man4             : The_man4            Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Reception_device2728
    Condition            set Stand
    Name                  NoChange

rel_2_Input_output_device
  Choice from
    rel_2_Input_output_device.Busyness = Busy
  first

  Convert_begin
    Busyness            set Wait
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange

rel_3_The_man4
  Choice from
    rel_3_The_man4.Busyness = Free
  first

  Convert_begin
    Busyness            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Name                  NoChange
$End

$Pattern  Work_of_the_man__4 : operation
$Parameters
  The_time       : real
  Name_of_robot  : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot     : a_Transport_robot        Keep  Keep
  rel_2_The_man4            : The_man4                 Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Man4
    Condition            set Stand
    Name                  NoChange

rel_2_The_man4
  Choice from
    rel_2_The_man4.Busyness = Busy
  first

  Convert_begin
    Busyness            set Work_of_man4
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Transfer_to_block23 : operation
$Parameters
  The_time       : real
  Name_of_robot  : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot     : a_Transport_robot  Keep  Keep
  rel_2_The_man5            : The_man5           Keep  Keep
  rel_3_Store_block         : Block23            Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Busy and
    rel_1_Transport_robot.Position = Man4 and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Position       set Store_block23
    Condition            set Stand
    Name                  NoChange

rel_2_The_man5
  Choice from
    rel_2_The_man5.Busyness = Busy
  first

  Convert_begin
    Busyness            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Name                  NoChange

rel_3_Store_block
  Choice from
    rel_3_Store_block.Busy_cells < 448 and
    rel_3_Store_block.Busyness = Free
  first

  Convert_begin
    Busy_cells  NoChange
    Busyness            set Busy
    Name                  NoChange

  Convert_end
    Busy_cells  set rel_3_Store_block.Busy_cells + 1
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Giving_out_from_block23 : operation
$Parameters
  The_time       : real
  Name_of_robot  : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot     : a_Transport_robot  Keep  Keep
  rel_2_The_man5            : The_man5           Keep  Keep
  rel_3_Store_block         : Block23            Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Store_block23
    Condition            set Stand
    Name                  NoChange

rel_2_The_man5
  Choice from
    rel_2_The_man5.Busyness = Free
  first

  Convert_begin
    Busyness            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Name                  NoChange

rel_3_Store_block
  Choice from
    rel_3_Store_block.Busy_cells >= 1 and
    rel_3_Store_block.Busyness = Free
  first

  Convert_begin
    Busy_cells  set rel_3_Store_block.Busy_cells - 1
    Busyness            set Busy
    Name                  NoChange

  Convert_end
    Busy_cells  NoChange
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Work_of_the_man__5 : operation
$Parameters
  The_time       : real
  Name_of_robot  : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot      : a_Transport_robot        Keep  Keep
  rel_2_Input_output_device  : Reception2827            Keep  Keep
  rel_3_The_man5             : The_man5                 Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Man5
    Condition            set Stand
    Name                  NoChange

rel_2_Input_output_device
  Choice from
    rel_2_Input_output_device.Busyness = Free
  first

  Convert_begin
    Busyness            NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Name                  NoChange

rel_3_The_man5
  Choice from
    rel_3_The_man5.Busyness = Busy
  first

  Convert_begin
    Busyness            set Work_of_man5
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange
$End

$Pattern  Transfer_to_second_washing_machine : operation
$Parameters
  The_time               : real
  Name_of_robot          : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot     : a_Transport_robot   Keep  Keep
  rel_2_Input_output_device : Reception2827       Keep  Keep
  rel_3_Washing_machine     : The_washing         Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Reception_device2827
    Condition            set Stand
    Name                  NoChange

rel_2_Input_output_device
  Choice from
    rel_2_Input_output_device.Busyness = Busy
  first

  Convert_begin
    Busyness            set Wait
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange

rel_3_Washing_machine
  Choice from
    rel_3_Washing_machine.Busyness = Free and
    rel_3_Washing_machine.Functioning = Unloaded
  first

  Convert_begin
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange
$End

$Pattern  The_man3_wait_second_time : operation
$Parameters
  The_time               : real
  Name_of_robot          : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot   : a_Transport_robot   Keep  Keep
  rel_2_The_man3          : The_man3            Keep  Keep
  rel_3_Washing_machine   : The_washing         Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Busy and
    rel_1_Transport_robot.Position =
                             Reception_device2827 and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Position       set Man3
    Condition            set Stand
    Name                  NoChange

rel_2_The_man3
  Choice from
    rel_2_The_man3.Busyness = Free
  first

  Convert_begin
    Busyness            set Man3_wait_for_the_second_time
    Name                  NoChange

  Convert_end
    Busyness            set Man3_busy_with_washing_machine_for_the_second_time
    Name                  NoChange

rel_3_Washing_machine
  Choice from
    rel_3_Washing_machine.Busyness = Free and
    rel_3_Washing_machine.Functioning = Unloaded
  first

  Convert_begin
    Busyness            NoChange
    Functioning        set Wait_second_loading
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange
$End

$Pattern  Unloading_second_time_from_washing_machine : operation
$Parameters
  The_time               : real
  Name_of_robot          : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot  : a_Transport_robot   Keep  Keep
  rel_2_The_man3         : The_man3            Keep  Keep
  rel_3_Washing_machine  : The_washing         Keep  Keep
  rel_4_Store_block      : Block30             Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Free and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Position       set Man3
    Condition            set Stand_by_block30
    Name                  NoChange

rel_2_The_man3
  Choice from
    rel_2_The_man3.Busyness = Free
  first

  Convert_begin
    Busyness            set Unload_from_washing_machine_second_time
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Name                  NoChange

rel_3_Washing_machine
  Choice from
    rel_3_Washing_machine.Busyness = Free and
    rel_3_Washing_machine.Functioning = The_end_of_second_washing
  first

  Convert_begin
    Busyness            NoChange
    Functioning        set Unloaded
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange

rel_4_Store_block
  Choice from
    rel_4_Store_block.Busy_cells < 392 and
    rel_4_Store_block.Busyness = Free
  first

  Convert_begin
    Busy_cells  NoChange
    Busyness            NoChange
    Name                  NoChange

  Convert_end
    Busy_cells  NoChange
    Busyness            NoChange
    Name                  NoChange
$End

$Pattern  Work_piling : operation
$Parameters
  The_time                 : real
  Name_of_the_assembling   : such_as an_Assembling_place.Name
$Relevant_resources
  rel_1_Assembling_place   : an_Assembling_place    Keep  Keep
$Time = The_time
$Body
rel_1_Assembling_place
  Choice from
    rel_1_Assembling_place.Busyness = Free and
    rel_1_Assembling_place.Functioning = Unloaded and
    rel_1_Assembling_place.The_rest_of_parts >= 46 and
    rel_1_Assembling_place.Name = Name_of_the_assembling
  first

  Convert_begin
    Busyness            set Busy
    Functioning        set Loaded
    The_rest_of_parts      set rel_1_Assembling_place.The_rest_of_parts - 46
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Functioning        set The_end_of_assembling
    The_rest_of_parts      NoChange
    Name                  NoChange
$End

$Pattern  Transfer_by_robot_to_man2 : operation
$Parameters
  The_time               : real
  Name_of_robot          : such_as a_Transport_robot.Name
$Relevant_resources
  rel_1_Transport_robot : a_Transport_robot   Keep  Keep
  rel_2_Man             : The_man2            Keep  Keep
  rel_3_The_washing19   : The_washing19       Keep  Keep
$Time = The_time
$Body
rel_1_Transport_robot
  Choice from
    rel_1_Transport_robot.Busyness = Busy and
    rel_1_Transport_robot.Position = Man1 and
    rel_1_Transport_robot.Condition = Stand and
    rel_1_Transport_robot.Name = Name_of_robot
  first

  Convert_begin
    Busyness            NoChange
    Position       NoChange
    Condition            set Go
    Name                  NoChange

  Convert_end
    Busyness            set Free
    Position       set Man2
    Condition            set Stand
    Name                  NoChange

rel_2_Man
  Choice from
    rel_2_Man.Busyness = Free
  first

  Convert_begin
    Busyness            set Wait
    Name                  NoChange

  Convert_end
    Busyness            set Busy
    Name                  NoChange

rel_3_The_washing19
  Choice from
    rel_3_The_washing19.Busyness = Free and
    rel_3_The_washing19.Functioning = Unloaded
  first

  Convert_begin
    Busyness            NoChange
    Functioning        set Wait_loading
    Name                  NoChange

  Convert_end
    Busyness            NoChange
    Functioning        NoChange
    Name                  NoChange
$End

