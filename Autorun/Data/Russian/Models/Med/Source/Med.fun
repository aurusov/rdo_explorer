$Constant
  �����_������������_��������   : real = 5.0
  �����_������������_���������  : real = 3.0
  �����_������_�_��             : real = 10.0
  �����_�����_����������_������ : real = 40.0
  �����_��_������               : real = 50.0
  �����_��������_�����          : real = 40.0
$End

$Sequence ���_����_���_� : integer 
$Type = exponential 123456787 
$End 
 
$Sequence ����_������_�  : real 
$Type = uniform 123456572 
$End 
 
$Sequence ����_��_������_� : real 
$Type = exponential 127569308 
$End 
 
$Sequence ����_� : integer 
$Type = uniform 10453209 
$End 
 
$Sequence ��������_� : integer 
$Type = uniform 18546732 
$End 
 
$Sequence �����������_� : integer 
$Type = uniform 430957038 
$End 
 
$Sequence �������������_� : integer 
$Type = uniform 135468231 
$End 

$Function ���������_��� : such_as ���������.�����_����
$Type = algorithmic
$Parameters
  ����������_��� : such_as ���������.�����_����
$Body
  Calculate_if [����������_��� < 47]
    ���������_��� = ����������_��� + 1
  Calculate_if [����������_��� = 47]
    ���������_��� = 0
$End

$Function ���������_���_����� : such_as �����.�����_����
$Type = algorithmic
$Parameters
  ����������_��� : such_as �����.�����_����
$Body
  Calculate_if [����������_��� <> 43]
    ���������_���_����� = ����������_��� + 1
  Calculate_if [����������_��� = 43]
    ���������_���_����� = 0
$End

$Function ���������_�����_X : integer
$Type = algorithmic
$Parameters
  ��� : such_as ���������.�����_����
  �������_���������� : such_as ���������.����������_X
$Body
  Calculate_if [��� = 0]
    ���������_�����_X = 650
  Calculate_if [��� = 1]
    ���������_�����_X = 560
  Calculate_if [[[��� > 1] and [��� < 8]] or
               [[��� > 8] and [��� < 24]]]
    ���������_�����_X = �������_���������� - 10
  Calculate_if [��� = 8]
    ���������_�����_X = 460 
  Calculate_if [��� = 41]
    ���������_�����_X = 500 
  Calculate_if [��� = 24]
    ���������_�����_X = 285 
  Calculate_if [[[��� > 24] and [��� < 41]] or
               [[��� > 41] and [��� <= 47]]]
    ���������_�����_X = �������_���������� + 10
$End

$Function ����_�����_X : integer
$Type = algorithmic
$Parameters
  ��� : such_as �����.�����_����
  �������_���������� : such_as �����.����������_X
$Body
  Calculate_if [��� = 1]
    ����_�����_X = 0
  Calculate_if [��� > 1] and [��� < 21]
    ����_�����_X = �������_���������� + 10
  Calculate_if [��� = 21]
    ����_�����_X = 220
  Calculate_if [��� = 22]
    ����_�����_X = 200 
  Calculate_if [��� > 22] and [��� < 43]
    ����_�����_X = �������_���������� - 10 
$End

$Function ����_�����_Y : integer
$Type = algorithmic
$Parameters
  ��� : such_as �����.�����_����
  �������_���������� : such_as �����.����������_Y
$Body
  Calculate_if [1 = 1]
    ����_�����_Y = 55
$End

$Function ���������_�����_Y : integer
$Type = algorithmic
$Parameters
  ��� : such_as ���������.�����_����
  �������_���������� : such_as ���������.����������_Y
$Body
  Calculate_if [��� = 0] or [��� = 1]
    ���������_�����_Y = 59
  Calculate_if [[[��� > 1] and [��� < 8]] or [[��� > 8]
               and [��� < 13]] or [��� = 25] or [��� = 26]]
    ���������_�����_Y = �������_���������� + 10
  Calculate_if [��� = 8]
    ���������_�����_Y = 290 
  Calculate_if [��� = 41]
    ���������_�����_Y = 120 
  Calculate_if [[[��� >= 13] and [��� <= 22]] or
               [[��� >= 27] and [��� <= 36]]]
    ���������_�����_Y = 330
  Calculate_if [[[��� >= 37] and [��� <= 40]] or
               [[��� >= 42] and [��� <= 47]] or [��� = 23] or [��� = 24]]
     ���������_�����_Y = �������_���������� - 10
$End

