$Pattern  ��������_��_�����  : operation   trace
$Relevant_resources
  �����  :  �����_1  Keep  Keep
$Time = �����_��������(Lmin, Lmax)*24.0
$Body
  �����
    Choice from �����.���������� <= X_2 and
                �����.��������� = �����
    first
    Convert_begin
      ���������         set ��������_��������
    Convert_end
      ����������        set �����.���������� + X_1
      ���������         set �����
      �����_��_�������� set �����.�����_��_�������� + C_2
$End

$Pattern  �����������  : operation   trace
$Relevant_resources
  �����  :  �����_1       Keep  Keep
$Time = 24.0
$Body
  �����
    Choice from �����.�����_��_���� = 0
    first
    Convert_begin
      �����_��_����       set �������(Dmin,Dmax)
      �����_��_��������   set �����.�����_��_�������� +
                              �����.���������� * C_1
      �����_��_���������  set �����.�����_��_��������� +
                              �����_��_�������(�����.�����_��_����)
    Convert_end
      ����������          set �������(�����.�����_��_����)
      �����_��_����       set 0
$End
