$Pattern ���������_������ : irregular_event {trace}
$Relevant_resources
 ����      : ������ Keep 
$Time= ������(1000.0,2000.0) 
$Body
   ����
      Convert_event
	���_�������     set 0
	�����_������    set ����.�����_������ + ������(����.�����_������)
	�����_�_������  set �����_����(1,6) * ������(����.�����_������)
$End

$Pattern ���������_������ : rule {trace}
$Relevant_resources
 �������_� : �������  Keep
 �����     : ������   Keep 
$Body
   �������_�
    Choice NoCheck
      first
      Convert_rule
	�����_����� set �������_�.�����_����� + �������_�.�����_�_������ 
   �����
    Choice from �����.����� = �������_�.�����_������ and �����.��������� = �������
      first
      Convert_rule {trace}
	���������   set �������������
	���������   set �����_����(1,10)
	���_�����   set �������_�.�����_�_������
	����������� set 0
$End

$Pattern ���������  : rule {trace}
$Relevant_resources
 �������_� : �������  Keep
$Body
   �������_�
    Choice from �������_�.���_������� < �������_�.�����_�_������  and �������_�.���_������� = �������_�.���_���
      first
      Convert_rule
	���_�������  set �������_�.���_������� + 1
	���_�������  set 0
	���_�������  set �����_����(1,6)
	���_�����    set �������_�.���_����� + 1 
	���_������   set ���_�����(1,3)
        ���_���      set �������(�������_�.���_�������)
	�������      set 1
$End

$Pattern ���������_������� : rule {trace}
$Relevant_resources
 �������_2 : ������� Keep 
 ������    : ������  Create 
$Body
   �������_2
    Choice from �������_2.���_������� <= �������_2.�����_�_������ and �������_2.���_������� < �������(�������_2.���_�������) 
      first
      Convert_rule
	���_������� set �������_2.���_������� + 1

   ������
      Convert_rule {trace}
	�����       set 0
	�����_���   set �������_2.���_�������
	���_�����   set �������_2.���_����� {���_�������}
	�����_����� set �����_���(�������_2.���_�������, �������_2.���_�������)
  	�����       set �������_2.���_������
	����        set 2
	����        set ��������
        ���������   set ���
        �����       set ��������2
        ��_�����    set ���������� 
	�����       set ����������  
	������_�    set ������(0.0, 1.0)
	���_������  set �������_2.�����_������
$End

$Pattern ��������_������ : rule {trace}
$Relevant_resources
 ������    : ������      Keep
 ���_1     : �����_1     NoChange
 ����      : �������     Keep
$Body
  ������
    Choice from ������.���� = �������� and ������.����� <> ����������  and ��������_����( ������.�����_�����) = 1
      with_min  ������.������_�
      Convert_rule 
        �����       set ����������
  ���_1
    Choice from ���_1.��������� = ��������
      first 
 ����
    Choice from ����.��������� = ��_��������
      first
      Convert_rule
	��������� set ��_������
$End

$Pattern ������_������ : rule {trace}
$Relevant_resources
 ������    : ������      Keep
 ���_1     : �����_1     Keep
 �������_2 : �������     Keep
 ���       : ��������    Keep
$Body
  ������
    Choice from ������.���� = �������� and ������.����� = ���������� and ��������_����( ������.�����_�����) = 1
      first 
      Convert_rule 
        �����     set �������_2.�����_������
	����      set ���_����(������.�����_�����)
        ����      set ���������
	��_�����  set ����_����������(������.�����, ������.����)
        �����     set ���_�������(���.���_���_�)
  ���_1
    Choice from ���_1.��������� = ��������
      first
      Convert_rule 
	��������� set �����
	����      set ������.�����
  �������_2
    Choice from �������_2.��������� = ��_������
      first
      Convert_rule
	���������    set ��_��������
        �����_������ set �������_2.�����_������ + 1
        �����_�����  set ������.�����_����� 
   ���
    Choice from [���.�����_��� = ������.���_����� or ���.�����_��� = 0] and ���.���_���_� >= 6 and ���.�������� <> �����
      with_min ������.���_����� - ���.�����_���  {���.��������}
      Convert_rule
	�����_���    set ������.���_�����
	���_��_���   set ������.�����_���
$End

$Pattern ��������_������ : rule {trace}
$Relevant_resources
 ������    : ������      Keep
 ����      : �������     Keep
$Body
  ������
    Choice from ������.���� = �������� and ������.����� = ����������  and ������.����� = 0 {and ��������_����( ������.�����_�����) = 1}
      with_min ������.������_�
      Convert_rule 
        �����       set ��������2
	������_�    set ������.������_� + 0.05
 ����
    Choice NoCheck
      first
      Convert_rule
	��������� set ��_��������
$End

$Pattern ������������_1 : operation {trace}
$Relevant_resources
 ������ : ������    NoChange Keep
 ���_1  : �����_1   Keep     Keep
$Time= �����_����(���_1.�������, ���_1.����, ���_1.�����_�) / 50 
$Body
  ������
    Choice from ������.���� = ��������� and ������.����� = ���_1.���� and ������.����� <> 0
     first
    Convert_end 
	��������� set ���
  ���_1
    Choice from ���_1.��������� = �����  
     first
     Convert_begin
       ��������� set ��������_��
     Convert_end
       �������   set ���_1.����
       ��������� set �������� 
       ����      set ������.��_����� 
$End

$Pattern ��������_��� : operation {trace}
$Relevant_resources
 ���  : �����   Keep     Keep			{100}
$Time= 0.5
$Body
  ���
    Choice from ���.��������� = ��������
     first
     Convert_begin
       ��������� set �����������
     Convert_end
       ��������� set �������� 
$End

$Pattern ��������������� : operation {trace}
$Relevant_resources
 ���_1  : �����    Keep     Keep
 ������ : ������   Keep     Keep
 ���    : �����    NoChange Keep
$Time= �����_����(���_1.�������, ���_1.����, ���_1.�����_�) / 50  
$Body
  ���_1
    Choice from ���_1.��������� = ��������  
     first
     Convert_begin
       ��������� set ��������_���
     Convert_end
       �������   set ���_1.����
       ��������� set ���������
  ������
    Choice from ������.���� = ��������� and ������.��_����� = ���_1.���� and ������.��������� = ��� and ������.����� = ���_1.�������
     first
     Convert_begin
       ���������  set �����1
     Convert_end
       ���������  set ���
       �����      set ������.��_�����
       ��_�����   set ����_����������(������.�����, ������.����)
  ���
    Choice from ���.���_���_� = �������(������.��_�����) and ���.��������� <> ������ 
      first
      Convert_end
        �����_��� set ������.�����
        �����     set ������.�����
	����_���  set ��
$End

$Pattern ���������_��� : operation {trace}
$Relevant_resources
 ���  : �����   Keep     Keep
$Time= 0.5
$Body
  ���
    Choice from ���.��������� = ���������
     first
     Convert_begin
       ��������� set ������������
     Convert_end
       ��������� set �������� 
$End

$Pattern �����������_� : operation {trace}
$Relevant_resources
 ������ : ������    NoChange NoChange 
 ���    : �����     Keep     Keep 
$Time= �����_�����������(������.�����, ���.�����, ���.�����_���)  
$Body
  ������
    Choice from ������.���� = ��������� and  ������.����� = ���������� and ������.����� <> 0
     first
  ���
    Choice from ����_�_����(������.����, ���.���_���_�) = 1 and ���.��������� = �������� 
      first
      Convert_begin
        �����_��� set ������.�����
	�����     set ������.�����
	��������� set �����������
	�����_��� set ������.���_�����
     Convert_end
        ��������� set ������
$End

$Pattern ��������_1_2 : operation {trace}
$Relevant_resources
 ���    : �����         Keep     Keep 
 ������ : ������        NoChange Keep 
 ���_2  : �����_2       NoChange Keep 
 ������ : �����������   NoChange Keep
$Time= �����_���������(���.���_���_�, ���.�����, ���.����_���)
$Body
  ���
    Choice from ���.��������� = ������ and ���.����_��� = �� and [���.���_���_� = 1 or ���.���_���_� = 2] and ���.����� = �������
      first
      Convert_begin
	��������� set ������
	�������   set 0
     Convert_end
        �����     set �����(���.�����)
	����_���  set ���
	��������� set ������
  ������
    Choice from ������.���� = ��������� and �������(������.�����) = ���.���_���_�
     first
     Convert_end
	���������  set �����_��(���.���_���_�, ���.�����)
        ��_�����   set ����_����������(������.�����, ������.����)
  ���_2	
    Choice NoCheck
     first
     Convert_end
	���������  set �������(���.�����, ���.���_���_�, ���_2.���������)
	����       set ������.�����
  ������
    Choice NoCheck 
     first
     Convert_end
	�������    set ������.�����
	���������  set ���������_��(���.�����, ���.���_���_�, ������.���������)
	����       set ������.��_�����
	�_����     set 450
	�_����     set 200
$End

$Pattern ��������_31 : operation {trace}
$Relevant_resources
 ����   : �������       Keep     NoChange
 ���1   : �����_31      Keep     Keep
 ���2   : �����_32      Keep     Keep
 ������ : ������        NoChange Keep 
 ���_1  : �����_1       NoChange Keep 
$Time= 48.0 {�����_���������(���1.���_���_�, ���1.�����, ���1.����_���)}
$Body
  ����
    Choice NoCheck
      first
      Convert_begin
	���_32_�  set ���2.���������
  ���1
    Choice from [���1.��������� = ������ or ���1.��������� = ��������] and ���1.����_��� = ��
      first
      Convert_begin
	��������� set ������
	�������   set 0
     Convert_end
	����_���  set ���
	��������� set ��������
  ���2
    Choice from ���2.��������� = ������ or ���2.��������� = ��������
      first
      Convert_begin
	��������� set ������
     Convert_end
	��������� set ����.���_32_�
  ������
    Choice from ������.���� = ��������� and �������(������.�����) = 3 and ������.�����_����� <> 2
     first
     Convert_end
	���������  set �����1 
        ��_�����   set ����_����������(������.�����, ������.����)
  ���_1
    Choice NoCheck 
      first
      Convert_end
	��������� set �����
	����      set ������.����� 
$End

$Pattern ��������_32 : operation {trace}
$Relevant_resources
 ����   : �������       Keep     NoChange
 ���1   : �����_32      Keep     Keep 
 ���2   : �����_31      Keep     Keep 
 ������ : ������        NoChange Keep 
 ���_1  : �����_1       NoChange Keep 
$Time= 48.0 {�����_���������(���.���_���_�, ���.�����, ���.����_���)}
$Body
  ����
    Choice NoCheck
      first
      Convert_begin
	���_31_�  set ���2.���������
  ���1
    Choice from [���1.��������� = ������ or ���1.��������� = ��������] and ���1.����_��� = ��
      first
      Convert_begin
	��������� set ������
	�������   set 0
     Convert_end
	����_���  set ���
	��������� set ��������
  ���2
    Choice from ���2.��������� = ������ or ���2.��������� = ��������
      first
      Convert_begin
	��������� set ������
     Convert_end
	��������� set ����.���_31_�
  ������
    Choice from ������.���� = ��������� and �������(������.�����) = 4 and ������.�����_����� <> 2
     first
     Convert_end
	���������  set �����1 
        ��_�����   set ����_����������(������.�����, ������.����)
  ���_1
    Choice NoCheck
      first
      Convert_end
	��������� set �����
	����      set ������.����� 
$End

$Pattern ��������_3 : operation {trace}
$Relevant_resources
 ���1   : �����_32      Keep     Keep 
 ���2   : �����_31      Keep     Keep 
 ������ : ������        NoChange Keep 
 ���_1  : �����_1       NoChange Keep 
$Time= 86.0 {�����_���������(���.���_���_�, ���.�����, ���.����_���)}
$Body
  ���1
    Choice from ���1.��������� = ������ 
      first
      Convert_begin
	����_���  set ��
	��������� set ������
	�������   set 0
     Convert_end
	����_���  set ���
	��������� set ��������
  ���2
    Choice from ���2.��������� = ������ 
      first
      Convert_begin
	��������� set ������
	�������   set 0
     Convert_end
	����_���  set ���
	��������� set ��������
  ������
    Choice from ������.���� = ��������� and [�������(������.�����) = 3 or �������(������.�����) = 4] and ������.�����_����� = 2
     first
     Convert_end
	���������  set �����1
	�����      set �����32 
        ��_�����   set ����_����������(������.�����, ������.����)
  ���_1
    Choice NoCheck
      first
      Convert_end
	��������� set �����
	����      set ������.����� 
$End

$Pattern ��������_1_2_��� : operation {trace}
$Relevant_resources
 ���    : �����         Keep     Keep 
 ������ : ������        Keep     Keep 
 ���    : ��������      NoChange NoChange
 ���_3  : �����_3       NoChange Keep
$Time= �����_���������(���.���_���_�, ���.�����, ���.����_���)
$Body
  ���
    Choice from ���.��������� = ������ and ���.����_��� = �� and [���.���_���_� = 1 or ���.���_���_� = 2] and ���.����� = �����
      first
      Convert_begin
	��������� set ������
	�������   set 0
      Convert_end
        �����     set �����(���.�����)
	����_���  set ���
	��������� set ��������
  ������
    Choice from ������.���� = ��������� and �������(������.�����) = ���.���_���_�
     first
     Convert_begin
        ��_�����   set ������.�����
     Convert_end
	���������  set �����3 
	�����      set ���_�������(���.���_���_�)
  ���						
    Choice from ���.���_���_� = ���_��������(���.���_���_�)
     first
  ���_3
    Choice NoCheck
     first
     Convert_end
	���������  set �����
	����       set ���_�������(���.���_���_�)
$End



$Pattern ������������_2 : operation {trace}
$Relevant_resources
 ������ : ������    NoChange Keep
 ���_2  : �����_2   Keep     Keep
$Time= �����_����(���_2.�������, ���_2.����, ���_2.�����_�) / 50 
$Body
  ������
    Choice from ������.���� = ��������� and ������.��������� = �����2 and ������.����� = ���_2.����
     first
    Convert_end
	��������� set ���
  ���_2
    Choice from ���_2.��������� = �����  
     first
     Convert_begin
       ��������� set ��������_��
     Convert_end
       �������   set ���_2.����
       ��������� set �������� 
       ����      set ������.��_����� 
$End

$Pattern ������������_3 : operation {trace}
$Relevant_resources
 ������ : ������    NoChange Keep
 ���_3  : �����_3   Keep     Keep
 ���    : ��������  NoChange Keep
$Time= �����_3(���_3.�_����, ���.�_����) / 250  
$Body
  ������
    Choice from ������.���� = ��������� and ������.��������� = �����3 and ������.����� = ���_3.����
     first
    Convert_end
	��������� set ���
  ���_3
    Choice from ���_3.��������� = �����  
     first
     Convert_begin
       ��������� set ��������_��
     Convert_end
       �������   set ���_3.����
       ��������� set �������� 
       ����      set ������.��_����� 
  ���
    Choice from ���.���_���_� = �������(���_3.����)
     first
     Convert_end
	��������      set ���.�������� + �����(���.���_���_�)
$End

$Pattern ������_��_����� : rule {trace}
$Relevant_resources
 ���       : ��������    NoChange
 ������    : ������      Keep
 ���_3     : �����_3     Keep
$Body
   ���
    Choice from ���.�������� = ����� and ���.���_���_� >= 6 and ���.���_���_� <> 16 and ���.�������� < 9
      with_min ���.���_�_�������
  ������
    Choice from ������.����� = ���_�������(���.���_���_�)
      first
      Convert_rule 
	��������� set �����3
	��_�����  set ����_����������(������.�����, ������.����)
  ���_3
    Choice from ���_3.��������� = ��������
      first
      Convert_rule 
	��������� set �����
	����      set ������.�����
$End

$Pattern ���������������_3 : operation {trace}
$Relevant_resources
 ���_3  : �����_3    Keep     Keep
 ������ : ������     Keep     Keep
 ���    : ��������   NoChange Keep
$Time= �����_3(���_3.�_����, ���.�_����) / 250   
$Body
  ���_3
    Choice from ���_3.��������� = ��������  
     first
     Convert_begin
       ��������� set ��������_���
     Convert_end
       �������   set ���_3.����
       ��������� set ���������
  ������
    Choice from ������.���� = ��������� and ������.��_����� = ���_3.���� and ������.��������� = ��� and ������.����� <> ������.��_����� 
     first
     Convert_begin
       ���������  set �����3
     Convert_end
       ���������  set ���
       �����      set ������.��_�����
  ���
    Choice from ���.���_���_� = �������(������.��_�����) 
      first
      Convert_end
	��������  set ���.�������� - 1
$End

$Pattern ����������  : rule {trace}
$Relevant_resources
 ���       : ��������  Keep
 ������    : ������    NoChange
 �������_2 : �������     Keep
 �����     : ������      Keep
$Body
   ���
    Choice from ���.���_���_� >= 6 and ���.�������� = 9 - �������(���.���_��_���) and ���.�������� = ��_�����
      first
      Convert_rule
	��������      set �����
	���_�_������� set �������_2.�������
   ������
    Choice from ������.���� = ��������� and ������.����� = ���_�������(���.���_���_�)
      first
   �������_2
    Choice NoCheck 
      first
      Convert_rule
	�������      set �������_2.������� + 1
  �����
    Choice from �����.��������� = ������������� and �����.����� = ������.���_������
      first
      Convert_rule 
	����������� set �����.����������� + 1
$End

$Pattern ����������_������  : rule {trace}
$Relevant_resources
 �����     : ������      Keep
$Body
  �����
    Choice from �����.��������� = ������������� and �����.���_����� = �����.�����������
      first
      Convert_rule 
	���������   set �����
	����������� set 0
$End

$Pattern ����������_���  : rule {trace}
$Relevant_resources
 ���    : ��������  Keep
 ������ : ������    Erase
$Body
   ���
    Choice from ���.���_���_� = 16 and ���.�������� <> 9 
      first
      Convert_rule
	��������  set ���.�������� + 1
   ������
    Choice from ������.����� = �����_���
      first
$End

$Pattern ����������  : rule {trace}
$Relevant_resources
 ���  : ��������  Keep
 ���� : �������   Keep
$Body
   ���
    Choice from ���.���_���_� >= 6 and ���.�������� = 9 and ���.�����_��� <> 0 and ���.�������� = �����
      first
      Convert_rule
	�����_���      set 0
	��������       set ��_�����
	���_�_�������  set 0
   ����
    Choice NoCheck
      first
      Convert_rule
	�����_�����    set ����.�����_����� - 1
$End

$Pattern ��������_���_1 : operation {trace}
$Relevant_resources
 ����   : ������    Keep     Keep  
 ���_1  : �����_1   Keep     NoChange
$Time= 0.02
$Body
  ����
    Choice from ����.�_1 = ����
     first
     Convert_begin
       �_1 set ����
     Convert_end
       �_1 set ����
  ���_1
    Choice from ���_1.��������� = ��������_�� or ���_1.��������� = ��������_���{and ���_1.���� <> �����1}
     first
     Convert_begin
       �_���� set ���_1.�_���� + 5 * �����_����(���_1.�������, ���_1.����)  
$End

$Pattern ��������_���_2 : operation {trace}
$Relevant_resources
 ����   : ������    Keep     Keep  
 ���_1  : �����_2   Keep     NoChange
$Time= 0.02
$Body
  ����
    Choice from ����.�_2 = ����
     first
     Convert_begin
       �_2 set ����
     Convert_end
       �_2 set ����
  ���_1
    Choice from ���_1.��������� = ��������_�� or ���_1.��������� = ��������_���{and ���_1.���� <> �����1}
     first
     Convert_begin
       �_���� set ���_1.�_���� + 5 * �����_����(���_1.�������, ���_1.����)  
$End

$Pattern ��������_���_3 : operation {trace}
$Relevant_resources
 ����   : ������    Keep     Keep  
 ���_1  : �����_3   Keep     NoChange
$Time= 0.02
$Body
  ����
    Choice from ����.�_3 = ����
     first
     Convert_begin
       �_3 set ����
     Convert_end
       �_3 set ����
  ���_1
    Choice from ���_1.��������� = ��������_�� or ���_1.��������� = ��������_��� {and ���_1.���� <> �����1}
     first
     Convert_begin
       �_���� set ���_1.�_���� + 5 * �����_����(���_1.�������, ���_1.����)  
$End

$Pattern ��������_�� : operation {trace}
$Relevant_resources
 ����    : ������        Keep     Keep  
 ������  : �����������   Keep     NoChange
$Time= 0.02
$Body
  ����
    Choice from ����.�� = ����
     first
     Convert_begin
       �� set ����
     Convert_end
       �� set ����
  ������
    Choice from ������.��������� = ��������_�� or ������.��������� = ��������_���
     first
     Convert_begin
       �_���� set ������.�_���� + 5 * �����_����(������.�������, ������.����)  
$End

$Pattern ��������_���_1 : operation {trace}
$Relevant_resources
 ����   : ������    Keep     Keep  
 ���    : �����     Keep     NoChange
$Time= 0.15
$Body
  ����
    Choice from ����.�_���_1 = ����
     first
     Convert_begin
       �_���_1 set ����
     Convert_end
       �_���_1 set ����
  ���
    Choice from ���.��������� = ������ and ���.����_��� = �� and ���.���_���_� = 1 
      first
     Convert_begin
       ������� set ���.������� + 1 
$End

$Pattern ��������_���_2 : operation {trace}
$Relevant_resources
 ����   : ������    Keep     Keep  
 ���    : �����     Keep     NoChange
$Time= 0.15
$Body
  ����
    Choice from ����.�_���_2 = ����
     first
     Convert_begin
       �_���_2 set ����
     Convert_end
       �_���_2 set ����
  ���
    Choice from ���.��������� = ������ and ���.����_��� = �� and  ���.���_���_� = 2
      first
     Convert_begin
       ������� set ���.������� + 1 
$End

$Pattern ��������_���_31 : operation {trace}
$Relevant_resources
 ����   : ������       Keep     Keep  
 ���    : �����_31     Keep     NoChange
$Time= 0.35
$Body
  ����
    Choice from ����.�_���_31 = ����
     first
     Convert_begin
       �_���_31 set ����
     Convert_end
       �_���_31 set ����
  ���
    Choice from ���.��������� = ������ and ���.����_��� = ��
      first
     Convert_begin
       ������� set ���.������� + 1 
$End

$Pattern ��������_���_32 : operation {trace}
$Relevant_resources
 ����   : ������       Keep     Keep  
 ���    : �����_32     Keep     NoChange
$Time= 0.35
$Body
  ����
    Choice from ����.�_���_32 = ����
     first
     Convert_begin
       �_���_32 set ����
     Convert_end
       �_���_32 set ����
  ���
    Choice from ���.��������� = ������ and ���.����_��� = �� 
      first
     Convert_begin
       ������� set ���.������� + 1 
$End