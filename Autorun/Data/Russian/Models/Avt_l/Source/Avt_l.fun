
$Sequence  Среда_действие_1  : such_as Система.Среда
$Type =  by_hist  12345678
$Body
Штраф     0.4
Поощрение 0.6
$End

$Sequence  Среда_действие_2  : such_as Система.Среда
$Type =  by_hist  6783456
$Body
Штраф      0.5
Поощрение  0.5
$End

$Sequence  Среда_действие_3  : such_as Система.Среда
$Type =  by_hist  12349876
$Body
Штраф     0.3
Поощрение 0.7
$End

{   $Function F1  : such_as Система.Среда
$Tipe = algorithmic
$Parametrs
   Параметр       :  integer
$Body
  Calculate_if   Параметр = 1    F1 = Среда_действие_1
  Calculate_if   Параметр = 2    F1 = Среда_действие_2 
  Calculate_if   Параметр = 3    F1 = Среда_действие_3
$End   }