$Pattern ���������_��������_1 : rule { trace }
$Relevant_resources
  �������_   :  �������   Keep

$Body
  �������_
    Choice from
       �������_.������             =  �������� and
       �������_.���������_�������� =  1
     first
    Convert_rule
          ������     set   �������
          �����      set   �����_��������_1
          �������_1  set   �������.�������_1 + 1
$End

$Pattern ���������_��������_2 : rule { trace }
$Relevant_resources
  �������_   :  �������   Keep

$Body
  �������_
    Choice from
       �������_.������    =  �������� and
       �������_.���������_��������  =  2
     first
    Convert_rule
          ������     set   �������
          �����      set   �����_��������_2
          �������_2  set   �������.�������_2 + 1
$End

$Pattern ���������_��������_3 : rule { trace }
$Relevant_resources
  �������_   :  �������   Keep

$Body
  �������_
    Choice from
       �������_.������    =  �������� and
       �������_.���������_��������  =  3
     first
    Convert_rule
          ������     set   �������
          �����      set   �����_��������_3
          �������_3  set   �������.�������_3 + 1
$End

$Pattern  ������������_��������_����� : rule   { trace }
$Parameters
   ��������       :  integer
   �������        :  integer
   ��������_�_�   :  integer
   �������_�_�    :  integer
$Relevant_resources
  �������_  : �������  Keep 
 
$Body
  �������_
    Choice from �������_.������ = �������  and
                �������_.�����  = �����    and
                �������_.���������_�������� = �������� and
                �������_.���������_�������  = �������
          first
    Convert_rule
                ���������_��������  set  ��������_�_�
                ���������_�������   set  �������_�_�
                ������              set  ��������
                �������             set  �������_.������� + 1
$End
   

$Pattern  ������������_��������_��������� : rule  { trace }
$Parameters
   ��������       :  integer
   �������        :  integer
   �������_�_�    :  integer
$Relevant_resources
  �������_  : �������  Keep 
 
$Body
  �������_
    Choice from �������_.������ = �������  and
                �������_.�����  = ��������� and
                �������_.���������_�������� = �������� and
                �������_.���������_�������  = ������� 
          first
    Convert_rule
                ���������_�������   set  �������_�_�
                ������              set  ��������
                �������             set  �������_.������� + 1
$End
   