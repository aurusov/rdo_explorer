$Pattern ������_�������_��_����� : operation
$Relevant_resources
  ���_��������� : ���������      NoChange NoChange
  ���_��������  : ����_��������  Keep     Keep
  ���_������    : �������        Create   NoChange
$Time = �����_�������_�������(���_��������.���,
                              ���_��������.�������_�������_�����,
                              ���_��������.��������_���������)
$Body
  ���_���������
    Choice from ���_���������.��������� = �������_����
    first
  ���_��������
    Choice from ���_��������.������� = ��
    first
    Convert_begin
      ������� set ���
    Convert_end
      ������� set ��
  ���_������
    Convert_begin
      ������           set ������_�������
      ���������        set ������
      �����_�_�������  set 1
      �����_����       set 1
      ������_�_������� set Time_now
      �����_�_�������  set 0.0
$End

$Pattern ����������_���� : rule
$Relevant_resources
  ���_������ : �������  Keep
  ���_����   : ����     NoChange
$Body
  ���_������
    Choice from ���_������.��������� = ������
    first
    Convert_rule
      ���������  set ������
      �����_���� set ���_����.�����
  ���_����
    Choice from [���_����.����� = ������_����1(���_������.������) and ����1.����������������� = �������] or
                [���_����.����� = ������_����2(���_������.������) and ����2.����������������� = �������] or
                [���_����.����� = ������_����3(���_������.������) and ����3.����������������� = �������] or
                [���_����.����� = ������_����4(���_������.������) and ����4.����������������� = �������] or
                [���_����.����� = ������_����5(���_������.������) and ����5.����������������� = �������]

    with_min(���_����.�_�������)
$End

$Pattern �������������� : rule
$Relevant_resources
  ���_������            :  �������            Erase
  ���_����������_������ : ����������_�������  Keep
$Body
  ���_������
    Choice from ���_������.��������� = ������
    first
  ���_����������_������
    Choice NoCheck
    first
    Convert_rule
      ���������� set ���_����������_������.���������� + 1
$End

$Pattern �������_���� : rule
$Relevant_resources
  ���_����� : �����  NoChange
  ���_����  : ����   Keep
$Body
  ���_�����
    Choice NoCheck
    first
  ���_����
    Choice from ���_����.����������������� = ������� and
               [���_����.��������1_������ = ���_�����.����  or
                ���_����.��������2_������ = ���_�����.����  or
                ���_����.��������3_������ = ���_�����.����]
    first
    Convert_rule
      ����������������� set �������
$End

$Pattern �������_���� : rule
$Relevant_resources
  ���_����� : �����  NoChange
  ���_����  : ����   Keep
$Body
  ���_�����
    Choice NoCheck
    first
  ���_����
    Choice from ���_����.����������������� = ������� and
               [���_����.��������1_����� = ���_�����.����  or
                ���_����.��������2_����� = ���_�����.����  or
                ���_����.��������3_����� = ���_�����.����]
    first
    Convert_rule
      ����������������� set �������
$End

$Pattern ������_�������_�_������� : rule
$Relevant_resources
  ���_������ : �������  Keep
  ���_����   : ����     Keep
$Body
  ���_������
    Choice from ���_������.��������� = ������
    first
    Convert_rule
      ���������        set �_�������
      �����_�_�������  set ���_����.�_������� + 1
      ������_�_������� set Time_now
  ���_����
    Choice from ���_����.����� = ���_������.�����_����
    first
    Convert_rule
      �_������� set ���_����.�_������� + 1
$End

$Pattern ��������_������� : rule
$Parameters
  ����� : such_as ����.�����
$Relevant_resources
  ���_������� : ��������  Keep
  ���_������  : �������   Keep
$Body
  ���_�������
    Choice from ���_�������.����� = �����
    first
    Convert_rule
      �������_������ set ���_�������.�������_������ + 1
  ���_������
    Choice from ���_������.�����_�_������� = ���_�������.�������_������  and
                ���_������.�����_���� = �����
    first
    Convert_rule
      �����_�_������� set ���_������.�����_�_������� - 1
$End

$Pattern ���������������� : operation
$Relevant_resources
  ���_��������� : ���������  Keep Keep
$Time = �����_��������_���
$Body
  ���_���������
    Choice from ���_���������.��������� = ������_���
    first
    Convert_begin
      ��������� set �������_����
    Convert_end
      ��������� set �����_���
$End

$Pattern ������������_������� : operation
$Parameters
  ����� : such_as ����.�����
$Relevant_resources
  ���_���������       : ���������             NoChange NoChange
  ���_����            : ����                  Keep     Keep
  ���_������          : �������               Keep     Keep
  ���_�������         : ��������              Keep     NoChange
  ���_�������_������  : ��������_������       NoChange Keep
  ���_�������_������� : ��������_�������      NoChange Keep
  ���_��_������       : ������������_�������  Keep     NoChange
$Time = ����_������� * �����_������������(���_������.������)
$Body
  ���_���������
    Choice from ���_���������.��������� = �������_����
    first
  ���_����
    Choice from ���_����.����� = ����� and
                ���_����.��������� = ��������
    first
    Convert_begin
      ��������� set �����
    Convert_end
      ��������� set ��������
      ��������� set ���_����.��������� + 1
      �_������� set ���_����.�_������� - 1
  ���_������
    Choice from  ���_������.��������� = �_������� and
                 ���_������.�����_���� = ����� and
                 ���_����.��������� = �������� and
                 ���_������.�����_�_������� = 1
    first
    Convert_begin
      ���������       set �������������
      �����_�_������� set Time_now - ���_������.������_�_�������
    Convert_end
      ���������      set  ����
  ���_�������
    Choice from ���_�������.����� = ����� and
                ���_���������.��������� = �������_����
    first
    Convert_begin
      �������_������ set 2
  ���_�������_������
    Choice from ���_�������_������.������ = ���_������.������
    first
    Convert_end
      ���������� set ���_�������_������.���������� + 1
  ���_�������_�������
    Choice from ���_�������_�������.����� = �����
    first
    Convert_end
      �����_��_��������� set ���_�������_�������.�����_��_��������� +
                               ��������(���_������.������)
 ���_��_������
   Choice from ���_��_������.����� = �����
   first
   Convert_begin
     ������ set ���_������.������
$End

$Pattern ����������� : rule
$Parameters
  ����� : such_as ����.�����
$Relevant_resources
  ���_��������� : ���������  NoChange
  ���_����      : ����       Keep
  ���_������    : �������    Erase
$Body
  ���_���������
    Choice from ���_���������.��������� = �����_���
    first
  ���_����
    Choice from ���_����.����� = ����� and
                ���_����.��������� = �������� and
                ���_����.�_������� > 0
    first
    Convert_rule
      �_������� set ���_����.�_������� - 1
  ���_������
    Choice from ���_������.��������� = �_������� and
                ���_������.�����_���� = �����
    first
$End

$Pattern �������_�_������_��� : rule
$Relevant_resources
  ���_���������        : ���������         Keep
  ���_�������_����     : ��������_����     Keep
  ���_�������_�������1 : ��������_�������  Keep
  ���_�������_�������2 : ��������_�������  Keep
  ���_�������_�������3 : ��������_�������  Keep
  ���_�������_�������4 : ��������_�������  Keep
  ���_�������_�������5 : ��������_�������  Keep
  ���_�����            : �����             Keep
$Body
  ���_���������
    Choice from ����1.�_������� + ����2.�_������� + ����3.�_������� +
                ����4.�_������� + ����5.�_������� = 0 and
                ���_���������.��������� = �����_���
    first
    Convert_rule
      ��������� set ������_���
  ���_�������_����
    Choice  NoCheck
    first
    Convert_rule
      ����������_���� set ���_�������_����.����������_���� + 1
  ���_�������_�������1
    Choice from ���_�������_�������1.����� = 1
    first
    Convert_rule
      �����_��_��������� set 0.0
  ���_�������_�������2
    Choice from ���_�������_�������2.����� = 2
    first
    Convert_rule
      �����_��_��������� set 0.0
  ���_�������_�������3
    Choice from ���_�������_�������3.����� = 3
    first
    Convert_rule
      �����_��_��������� set 0.0
  ���_�������_�������4
    Choice from ���_�������_�������4.����� = 4
    first
    Convert_rule
     �����_��_��������� set 0.0
  ���_�������_�������5
    Choice from ���_�������_�������5.����� = 5
    first
    Convert_rule
      �����_��_��������� set 0.0
  ���_�����
    Choice NoCheck
    first
    Convert_rule
      ����                set 9.0
      ���������_��������� set Time_now
$End

$Pattern ����_������� : rule
$Parameters
  ����� : such_as ����.�����
$Relevant_resources
  ���_����    : ����     NoChange
  ���_������  : �������  Erase
$Body
  ���_����
    Choice from ���_����.����� = �����
    first
  ���_������
    Choice from ���_������.��������� = ����
    first
$End

$Pattern ������������ : keyboard
$Parameters
  ����� : such_as  ����.�����
$Relevant_resources
  ���_���������� : ����������  Keep NoChange
$Time = 0.0
$Body
  ���_����������
    Choice from ���_����������.�����  =  �����
    first
    Convert_begin
      ��������� set ��������_��������(���_����������.���������,�����)
$End

$Pattern ������������_������� : operation
$Relevant_resources
  ���_����� : �����  Keep Keep
$Time = 1.0
$Body
  ���_�����
    Choice from ���_�����.������������ = ��� and
                (Time_now - ���_�����.���������_���������) >= 1.0
    first
    Convert_begin
      ����                set ���_�����.���� + 1
      ������������        set ��
      ���������_��������� set Time_now
    Convert_end
      ������������        set ���
$End

