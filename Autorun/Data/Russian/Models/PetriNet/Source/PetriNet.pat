
$Pattern  ������������_��������_1  : operation   trace

$Relevant_resources
  ����_1   : �����_1    Keep  NoChange
  ����_2   : �����_7    Keep  NoChange
  ����_3   : �����_5    Keep  NoChange
  �������  : �������_1  Keep  Keep
  �����_1  : �����_2    NoChange  Keep
  �����_2  : �����_5    NoChange  Keep

$Time = ���������_������_1 (m1, d1)

$Body
  ����_1
    Choice from ����_1.������� > 0
                first
    Convert_begin
      �������   set ����_1.������� - 1
      Pic       set ����_1.Pic - 1
  ����_2
    Choice from ����_2.������� > 0
                first
    Convert_begin
      �������   set ����_2.������� - 1
      Pic       set ����_2.Pic - 1
  ����_3
    Choice from ����_3.������� > 0
                first
    Convert_begin
      �������   set ����_3.������� - 1
      Pic       set ����_3.Pic - 1
  �������
    Choice from �������.��������� = ��������
                first
    Convert_begin
      ���������  set �����
    Convert_end
      ���������  set ��������
  �����_1
    Choice NoCheck 
                first
    Convert_end
      ����  set �����_1.���� + 1
      Pic   set �����_1.Pic + 1
  �����_2
    Choice NoCheck 
                first
    Convert_end
      ����  set �����_2.���� + 1
      Pic   set �����_2.Pic + 1
$End

$Pattern  ������������_��������_2  : operation   trace

$Relevant_resources
  ����_1   : �����_2    Keep  NoChange
  ����_2   : �����_5    Keep  NoChange
  ����_3   : �����_6    Keep  NoChange
  �������  : �������_2  Keep  Keep
  �����_1  : �����_3    NoChange  Keep
  �����_2  : �����_5    NoChange  Keep
  �����_3  : �����_7    NoChange  Keep

$Time = ���������_������_2 (m2, d2)

$Body
  ����_1
    Choice from ����_1.������� > 0
                first
    Convert_begin
      �������   set ����_1.������� - 1
      Pic       set ����_1.Pic - 1
  ����_2
    Choice from ����_2.������� > 0
                first
    Convert_begin
      �������   set ����_2.������� - 1
      Pic       set ����_2.Pic - 1
  ����_3
    Choice from ����_3.������� > 0
                first
    Convert_begin
      �������   set ����_3.������� - 1
      Pic       set ����_3.Pic - 1
  �������
    Choice from �������.��������� = ��������
                first
    Convert_begin
      ���������  set �����
    Convert_end
      ���������  set ��������
  �����_1
    Choice NoCheck 
              first
    Convert_end
      ����  set �����_1.���� + 1
      Pic   set �����_1.Pic + 1
  �����_2
    Choice NoCheck 
              first
    Convert_end
      ����  set �����_2.���� + 1
      Pic   set �����_2.Pic + 1
  �����_3
    Choice NoCheck 
              first
    Convert_end
      ����  set �����_3.���� + 1
      Pic   set �����_3.Pic + 1
$End

$Pattern  ������������_��������_3  : operation   trace

$Relevant_resources
  ����_1   : �����_3    Keep  NoChange
  ����_2   : �����_5    Keep  NoChange
  �������  : �������_3  Keep  Keep
  �����_1  : �����_4    NoChange  Keep
  �����_2  : �����_5    NoChange  Keep
  �����_3  : �����_6    NoChange  Keep

$Time = ���������_������_3 (m3, d3)

$Body
  ����_1
    Choice from ����_1.������� > 0
                first
    Convert_begin
      �������   set ����_1.������� - 1
      Pic       set ����_1.Pic - 1
  ����_2
    Choice from ����_2.������� > 0
                first
    Convert_begin
      �������   set ����_2.������� - 1
      Pic       set ����_2.Pic - 1
  �������
    Choice from �������.��������� = ��������
                first
    Convert_begin
      ���������  set �����
    Convert_end
      ���������  set ��������
  �����_1
    Choice NoCheck 
                first
    Convert_end
      ����  set �����_1.���� + 1
      Pic   set �����_1.Pic + 1
  �����_2
    Choice NoCheck 
                first
    Convert_end
      ����  set �����_2.���� + 1
      Pic   set �����_2.Pic + 1
  �����_3
    Choice NoCheck first
    Convert_end
      ����  set �����_3.���� + 1
      Pic   set �����_3.Pic + 1
$End

$Pattern  ��������_�_�������  : operation   trace

$Parameters
  �����_�����     : integer [0..20]
  �����_��������  : real
  ����            : integer
$Relevant_resources
  �����    : �����      Keep  Keep

$Time =���� * ���������_������_4(m4, d4) + �����_��������


$Body
  �����
    Choice from  �����.�����=�����_����� and
                 �����.���� > 0
                 first
    Convert_begin
      ����    set  �����.���� - 1
    Convert_end
      ������� set  �����.������� + 1

$End

