$Sequence  Tanker_arrival_interval : integer
$Type = uniform  123456789
$End

$Sequence  Random_tanker_type : such_as a_Tanker.Type
$Type = by_hist  123456789
$Body
  type_1   0.25
  type_2   0.55
  type_3   0.20
$End

$Sequence  Generator : integer
$Type = uniform  234567891
$End

$Function Time_of_filling_fun : integer
$Type = algorithmic
$Parameters
  tanker_type : such_as a_Tanker.Type
$Body
  Calculate_if tanker_type = type_1  Time_of_filling_fun = Generator(16, 20)
  Calculate_if tanker_type = type_2  Time_of_filling_fun = Generator(21, 27)
  Calculate_if tanker_type = type_3  Time_of_filling_fun = Generator(32, 40)
  Calculate_if tanker_type = type_4  Time_of_filling_fun = Generator(18, 24)
$End

$Sequence  Interval_between_storms : integer [12..360]
$Type = exponential  234567891
$End

$Sequence  Storm_duration : integer
$Type = uniform  234567891
$End

$Sequence  Navigation_time : integer
$Type = uniform  123456789
$End

$Function TTS_X_Road : integer = 0
$Type = list
$Parameters
  number     : such_as a_Tanker_to_show.Number
$Body
  1 = 170
  2 = 215
  3 = 260
  4 = 305
  5 = 350
  6 = 390
  7 = 430
  8 = 470
  9 = 510
 10 = 550
$End

$Function Terminal_X : integer = 0
$Type = list
$Parameters
  terminal    : such_as a_Tanker_to_show.Terminal
$Body
  1 = 290
  2 = 420
  3 = 550
$End

$Function TTS_X : real
$Type = algorithmic
$Parameters
  number    : such_as a_Tanker_to_show.Number
  state     : such_as a_Tanker_to_show.State
  terminal  : such_as a_Tanker_to_show.Terminal
$Body
  Calculate_if state = just_arrived  TTS_X = TTS_X_Road(number)
  Calculate_if state = mooring    
    TTS_X = (((Terminal_X(terminal) - TTS_X_Road(number)) * 1.0 * Tug.Counter) / 100) + TTS_X_Road(number)
  Calculate_if state = moored        TTS_X = Terminal_X(terminal)
  Calculate_if state = filling       TTS_X = Terminal_X(terminal)
  Calculate_if state = filled        TTS_X = Terminal_X(terminal)
  Calculate_if state = leaving 
    TTS_X = (((770 - Terminal_X(terminal)) * 1.0 * Tug.Counter) / 100) + Terminal_X(terminal)
  Calculate_if state = gone     
    TTS_X = (((770 - Terminal_X(terminal)) * 1.0 * Tug.Counter) / 100) + Terminal_X(terminal)
$End

$Function TTS_Y_Road : integer = 0
$Type = list
$Parameters
  number     : such_as a_Tanker_to_show.Number
$Body
  1 = 20
  2 = 90
  3 = 160
  4 = 20
  5 = 90
  6 = 160
  7 = 20
  8 = 90
  9 = 160
 10 = 20
$End

$Function Terminal_Y : integer = 0
$Type = list
$Parameters
  terminal    : such_as a_Tanker_to_show.Terminal
$Body
  1 = 300
  2 = 300
  3 = 290
$End

$Function TTS_Y : real
$Type = algorithmic
$Parameters
  number    : such_as a_Tanker_to_show.Number
  state     : such_as a_Tanker_to_show.State
  terminal  : such_as a_Tanker_to_show.Terminal
$Body
  Calculate_if state = just_arrived  TTS_Y = TTS_Y_Road(number)
  Calculate_if state = mooring    
    TTS_Y = (((Terminal_Y(terminal) - TTS_Y_Road(number)) * 1.0 * Tug.Counter) / 100) + TTS_Y_Road(number)
  Calculate_if state = moored        TTS_Y = Terminal_Y(terminal)
  Calculate_if state = filling       TTS_Y = Terminal_Y(terminal)
  Calculate_if state = filled        TTS_Y = Terminal_Y(terminal)
  Calculate_if state = leaving  
    TTS_Y = (((200 - Terminal_Y(terminal)) * 1.0 * Tug.Counter) / 100) + Terminal_Y(terminal)
  Calculate_if state = gone     
    TTS_Y = (((200 - Terminal_Y(terminal)) * 1.0 * Tug.Counter) / 100) + Terminal_Y(terminal)
$End
