$Constant
  Loading_time    : real  = 0.005
  Unloading_time  : real  = 0.005
  Speed_of_robot  : real  = 1200.0
$End

$Sequence  Sequence_1  :  real   [0.0..10.0]
$Type =  normal
$End

$Function  TR_Coordinate : integer [0..640]
$Type = table
$Parameters
  Parameter_1  : such_as Robots.Location
$Body
{ Parameter_1 = Not}       1
{ Conveyer_1       }       7
{ Conveyer_2       }      48
{ Conveyer_3       }     446
{ AssPos           }      88
{ GrindMach        }     349
{ CoolPos_entrance }     194
{ CoolPos_delivery }     268
$End

$Function  Distance  : real
$Type = table
$Parameters
  Place_from : such_as Robots.Location
  Place_to   : such_as Robots.Location
$Body
{              Not,   C_1,    C_2,    C_3,    AP,     GM,   CP_entrance, CP_delivery}
{Not}          0.0    0.0     0.0     0.0     0.0     0.0     0.0            0.0
{C_1}          0.0    0.0     0.6     5.1     1.2     4.0     2.2            3.0
{C_2}          0.0    0.6     0.0     4.5     0.6     3.4     1.6            2.4
{C_3}          0.0    5.1     4.5     0.0     3.9     1.1     2.9            2.1
{AP}           0.0    1.2     0.6     3.9     0.0     2.8     1.0            1.8
{GM}           0.0    4.0     3.4     1.1     2.8     0.0     1.8            1.0
{CP_entrance}  0.0    2.2     1.6     2.9     1.0     1.8     0.0            0.8
{CP_delivery}  0.0    3.0     2.4     2.1     1.8     1.0     0.8            0.0
$End

$Function  New_location : integer [1..10]
$Type = algorithmic
$Parameters
  Parameter_1     : integer [1..10]
  Number_of_parts : integer [1..10]
$Body
  Calculate_if Parameter_1 < Number_of_parts  New_location = Parameter_1 + 1
  Calculate_if Parameter_1 = Number_of_parts  New_location = 1
$End

$Function  Location_of_part : integer [1..10]
$Type = algorithmic
$Parameters
  Parameter_1      : integer [1..10]  {C1.Position}
  Parameter_2      : integer [1..10]  {PoC*_*.Part_number}
  Number_of_parts  : integer [1..10]
$Body
  Calculate_if Parameter_2 - Parameter_1 + 1 < 1  Location_of_part = Parameter_2 - Parameter_1 + 1 + Number_of_parts
  Calculate_if Parameter_2 - Parameter_1 + 1 > 0  Location_of_part = Parameter_2 - Parameter_1 + 1
$End

$Function  Last_conveyer_part_fun : integer [1..10]
$Type = algorithmic
$Parameters
  Parameter_1      : integer [1..10]
  Number_of_parts  : integer [1..10]
$Body
  Calculate_if Parameter_1 = 1  Last_conveyer_part_fun = Number_of_parts
  Calculate_if Parameter_1 > 1  Last_conveyer_part_fun = Parameter_1 - 1
$End

$Function  PoCP_X : integer
$Type = table
$Parameters
  Location : integer [1..10]
$Body
  277   277   277   277   257   223   203   203   203   203
$End

$Function  PoCP_Y : integer
$Type = table
$Parameters
  Location : integer [1..10]
$Body
  158   132   106    80    54    54    80   106   132   158
$End

$Function  New_Busyness : such_as Machines.Busyness
$Type = algorithmic
$Parameters
  Parameter  : integer
  New_value  : such_as Machines.Busyness
  Old_value  : such_as Machines.Busyness
$Body
  Calculate_if Parameter  = 0  New_Busyness = New_value
  Calculate_if Parameter <> 0  New_Busyness = Old_value
$End

$Function  New_What_is_loaded : such_as Machines.What_is_loaded
$Type = algorithmic
$Parameters
  Parameter  : integer
  New_value  : such_as Machines.What_is_loaded
  Old_value  : such_as Machines.What_is_loaded
$Body
  Calculate_if Parameter  = 0  New_What_is_loaded = New_value
  Calculate_if Parameter <> 0  New_What_is_loaded = Old_value
$End

$Sequence  Sequence_2  :  real   [0.0..10.0]
$Type =  exponential
$End

$Sequence  Sequence_3  :  real   [0.0..10.0]
$Type =  normal
$End

