$Constant
  X_1  : integer =  40
  X_2  : integer =  60
  Dmin : integer =  25
  Dmax : integer =  40
  Lmin : integer =  1
  Lmax : integer =  3
  C_1  : real    =  20.0
  C_2  : real    = 300.0
  C_3  : real    =  50.0
$End

$Function Плата_за_дефицит  : real
$Type = algorithmic
$Parameters
  Покупка  : integer
$Body
  Calculate_if Склад_1.Количество >= Покупка  Плата_за_дефицит=0.0
  Calculate_if Склад_1.Количество <  Покупка  Плата_за_дефицит=C_3*
                                                (Покупка-Склад_1.Количество)
$End

$Function Остаток  : integer
$Type = algorithmic
$Parameters
  Покупка  : integer
$Body
  Calculate_if Склад_1.Количество >  Покупка Остаток=Склад_1.Количество-Покупка
  Calculate_if Склад_1.Количество <= Покупка Остаток=0
$End

$Sequence  Покупка : integer
$Type =  uniform 123456789
$End

$Sequence  Время_поставки : integer
$Type =  uniform 987654321
$End
