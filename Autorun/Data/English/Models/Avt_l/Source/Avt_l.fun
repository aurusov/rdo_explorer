
$Sequence  Environment_action_1  : such_as System.Environment
$Type =  by_hist  12345678
$Body
Penalty         0.4
Encouragement   0.6
$End

$Sequence  Environment_action_2  : such_as System.Environment
$Type =  by_hist  6783456
$Body
Penalty         0.5
Encouragement   0.5
$End

$Sequence  Environment_action_3  : such_as System.Environment
$Type =  by_hist  12349876
$Body
Penalty         0.3
Encouragement   0.7
$End

{   $Function F1  : such_as System.Environment
$Tipe = algorithmic
$Parametrs
   Parametr       :  integer
$Body
  Calculate_if   Parametr = 1    F1 = Environment_action_1
  Calculate_if   Parametr = 2    F1 = Environment_action_2 
  Calculate_if   Parametr = 3    F1 = Environment_action_3
$End   }