{1}
$Sequence �����_�����_s : integer
$Type = exponential 123456789
$End

{2}
$Sequence �����_������������_s : such_as �����_tt.������������
$Type = by_hist 123456789
$Body
����� 0.40
������� 0.50
����� 0.10
$End

{3}
$Sequence ������_����_�����_s : integer
$Type = exponential 123456789
$End

{4}
$Function ��������_������_f : such_as ����������_������_tt.����������_������_m
$Type = algorithmic
$Parameters
P1 : such_as ����_tt.�����
P2 : such_as ����_tt.�����
$Body
Calculate_if P1-P2 < 0 ��������_������_f=0
Calculate_if P1-P2 >= 0 ��������_������_f=1
$End

{5}
$Sequence ���������_�������_�_�������_s : integer
$Type = uniform 864096812
$End

{6}
$Function �����_�������_f : such_as ���������__��������_tt.�����_�������
$Type = algorithmic
$Parameters
P1 : integer
P2 : integer
$Body
Calculate_if P1-P2 <= 0 �����_�������_f=�����_������
Calculate_if P1-P2 > 0 �����_�������_f=�����_������
$End

{7}
$Function �����_�������_f1 : such_as ���������__��������_tt.�����_�������
$Type = algorithmic
$Parameters
P1 : such_as ���������__��������_tt.�����_�������
$Body
Calculate_if P1 = �����_������ �����_�������_f1=������
Calculate_if P1 = �����_������ �����_�������_f1=������
$End

{8}
$Function �����_�������_f : integer
$Type = algorithmic
$Parameters
P1 : such_as ���������__��������_tt.�����_�������
P2 : such_as ���������__��������_tt.�����_�������
$Body
Calculate_if P1 =  P2 �����_�������_f=1
Calculate_if P1 <> P2 �����_�������_f=0
$End
