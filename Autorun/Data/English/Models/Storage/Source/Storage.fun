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

$Function Pay_for_deficit  : real
$Type = algorithmic
$Parameters
  Purchase  : integer
$Body
  Calculate_if Warehouse_1.Presence >= Purchase
              Pay_for_deficit=0.0
  Calculate_if Warehouse_1.Presence <  Purchase
              Pay_for_deficit=C_3*(Purchase - Warehouse_1.Presence)
$End

$Function Rest  : integer
$Type = algorithmic
$Parameters
  Purchase  : integer
$Body
  Calculate_if Warehouse_1.Presence >  Purchase Rest=Warehouse_1.Presence-Purchase
  Calculate_if Warehouse_1.Presence <= Purchase Rest=0
$End

$Sequence  Purchase : integer
$Type =  uniform 123456789
$End

$Sequence  Time_of_delivery : integer
$Type =  uniform 987654321
$End
