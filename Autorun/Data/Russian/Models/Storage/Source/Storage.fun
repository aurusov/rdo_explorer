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

$Function �����_��_�������  : real
$Type = algorithmic
$Parameters
  �������  : integer
$Body
  Calculate_if �����_1.���������� >= �������  �����_��_�������=0.0
  Calculate_if �����_1.���������� <  �������  �����_��_�������=C_3*
                                                (�������-�����_1.����������)
$End

$Function �������  : integer
$Type = algorithmic
$Parameters
  �������  : integer
$Body
  Calculate_if �����_1.���������� >  ������� �������=�����_1.����������-�������
  Calculate_if �����_1.���������� <= ������� �������=0
$End

$Sequence  ������� : integer
$Type =  uniform 123456789
$End

$Sequence  �����_�������� : integer
$Type =  uniform 987654321
$End
