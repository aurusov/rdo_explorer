$Constant
  Gauges_working_time          : real = 5.0
  Computer_processing_time     : real = 3.0
  Data_inputing_time           : real = 10.0
  Data_inputing_by_doctor_time : real = 40.0
  Help_time                    : real = 50.0
  Doctor_s_moving_time         : real = 40.0
$End

$Sequence Patient_s_state_changing_time : integer 
$Type = exponential 123456787 
$End 
 
$Sequence Doctor_wants_to  : real 
$Type = uniform 123456572 
$End 
 
$Sequence Doctor_dont_want_to : real 
$Type = exponential 127569308 
$End 
 
$Sequence Rythm_changing: integer 
$Type = uniform 10453209 
$End 
 
$Sequence Pressure_changing : integer 
$Type = uniform 18546732 
$End 
 
$Sequence Temperature_changing : integer 
$Type = uniform 430957038 
$End 
 
$Sequence Resistance_changing : integer 
$Type = uniform 135468231 
$End 

$Function Next_step : such_as Nurses.Step_No
$Type = algorithmic
$Parameters
  Last_step : such_as Nurses.Step_No
$Body
  Calculate_if [Last_step < 47]
    Next_step = Last_step + 1
  Calculate_if [Last_step = 47]
    Next_step = 0
$End

$Function Doctor_s_last_step : such_as Doctors.Step_No
$Type = algorithmic
$Parameters
  Last_step : such_as Doctors.Step_No
$Body
  Calculate_if [Last_step <> 43]
    Doctor_s_last_step = Last_step + 1
  Calculate_if [Last_step = 43]
    Doctor_s_last_step = 0
$End

$Function Nurse_coordinate_X : integer
$Type = algorithmic
$Parameters
  Step : such_as Nurses.Step_No
  Current_coordinates : such_as Nurses.Coordinate_X
$Body
  Calculate_if [Step = 0]
 Nurse_coordinate_X = 650
  Calculate_if [Step = 1]
 Nurse_coordinate_X = 560
  Calculate_if [[[Step > 1] and [Step < 8]] or
               [[Step > 8] and [Step < 24]]]
 Nurse_coordinate_X = Current_coordinates - 10
  Calculate_if [Step = 8]
 Nurse_coordinate_X = 460 
  Calculate_if [Step = 41]
 Nurse_coordinate_X = 500 
  Calculate_if [Step = 24]
 Nurse_coordinate_X = 285 
  Calculate_if [[[Step > 24] and [Step < 41]] or
               [[Step > 41] and [Step <= 47]]]
 Nurse_coordinate_X = Current_coordinates + 10
$End

$Function Doctor_coordinate_X : integer
$Type = algorithmic
$Parameters
  Step : such_as Doctors.Step_No
 Current_coordinate : such_as Doctors.Coordinate_X
$Body
  Calculate_if [Step = 1]
    Doctor_coordinate_X = 0
  Calculate_if [Step > 1] and [Step < 21]
    Doctor_coordinate_X = Current_coordinate + 10
  Calculate_if [Step = 21]
    Doctor_coordinate_X = 220
  Calculate_if [Step = 22]
    Doctor_coordinate_X = 200 
  Calculate_if [Step > 22] and [Step < 43]
    Doctor_coordinate_X = Current_coordinate - 10 
$End

$Function Doctor_coordinate_Y : integer
$Type = algorithmic
$Parameters
  Step : such_as Doctors.Step_No
  Current_coordinate : such_as Doctors.Coordinate_Y
$Body
  Calculate_if [1 = 1]
    Doctor_coordinate_Y = 55
$End

$Function Nurse_coordinate_Y : integer
$Type = algorithmic
$Parameters
  Step : such_as Nurses.Step_No
  Current_coordinate : such_as Nurses.Coordinate_Y
$Body
  Calculate_if [Step = 0] or [Step = 1]
 Nurse_coordinate_Y = 59
  Calculate_if [[[Step > 1] and [Step < 8]] or [[Step > 8]
               and [Step < 13]] or [Step = 25] or [Step = 26]]
 Nurse_coordinate_Y = Current_coordinate + 10
  Calculate_if [Step = 8]
 Nurse_coordinate_Y = 290 
  Calculate_if [Step = 41]
 Nurse_coordinate_Y = 120 
  Calculate_if [[[Step >= 13] and [Step <= 22]] or
               [[Step >= 27] and [Step <= 36]]]
 Nurse_coordinate_Y = 330
  Calculate_if [[[Step >= 37] and [Step <= 40]] or
               [[Step >= 42] and [Step <= 47]] or [Step = 23] or [Step = 24]]
 Nurse_coordinate_Y = Current_coordinate - 10
$End

