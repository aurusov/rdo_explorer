
$Sequence  �����_��������_1  : such_as �������.�����
$Type =  by_hist  12345678
$Body
�����     0.4
��������� 0.6
$End

$Sequence  �����_��������_2  : such_as �������.�����
$Type =  by_hist  6783456
$Body
�����      0.5
���������  0.5
$End

$Sequence  �����_��������_3  : such_as �������.�����
$Type =  by_hist  12349876
$Body
�����     0.3
��������� 0.7
$End

{   $Function F1  : such_as �������.�����
$Tipe = algorithmic
$Parametrs
   ��������       :  integer
$Body
  Calculate_if   �������� = 1    F1 = �����_��������_1
  Calculate_if   �������� = 2    F1 = �����_��������_2 
  Calculate_if   �������� = 3    F1 = �����_��������_3
$End   }