$Constant
	Con_1:	(z_1,z_2,z_3)=z_1
$End

$Function Inc_to4:integer[1..4]
$Type = algorithmic
$Parameters
	Par:	integer[1..4]
$Body
  Calculate_if Par<4  Inc_to4 = Par + 1
  Calculate_if Par=4  Inc_to4 =	1
$End

$Function Priv:integer[1..4]
$Type = algorithmic
$Parameters
	Par:	integer
$Body
  Calculate_if Par > 4  Priv = Par - 4
  Calculate_if Par <= 4 Priv = Par
$End

$Function Stoi:integer[1..3]
$Type = algorithmic
$Parameters
	Par:	such_as Con_1
$Body
  Calculate_if Par = z_1  Stoi = 1
  Calculate_if Par = z_2  Stoi = 2
  Calculate_if Par = z_3  Stoi = 3
$End

$Sequence How_many:integer[1..20]
$Type = by_hist 111111111
$Body
 1  2  0.20
 2  4  0.40
 4  6  0.30
 6  10 0.10
$End

$Sequence Inc:such_as Con_1
$Type = by_hist 222222222
$Body
 z_1  0.35
 z_2  0.29
 z_3  0.36
$End

$Sequence Exp_need1:real
$Type = exponential 123456789
$End	

$Sequence Exp_need2:real
$Type = exponential 223333339
$End	

$Sequence Exp_need3:real
$Type = exponential 123444444
$End	

$Sequence Exp_need4:real
$Type = exponential 123455555
$End	

$Sequence Exp_form:real
$Type = exponential 987654321
$End

$Sequence Exp_opr:real
$Type = exponential 111111111
$End
