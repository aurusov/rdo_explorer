$Constant
  �������_�������   : real = 1.0
  ��������_�������� : real = 0.5
  �����_�������     : integer = 80
  ����������_�����  : integer = 12
$End

$Sequence ����������_����� : real
$Type = normal
$End

$Sequence �����������_����� : real
$Type = uniform
$End

$Sequence ����������������_����� : real
$Type = exponential
$End

$Function ����������_�����_Abs : real
$Type = algorithmic
$Parameters
  ��������� : real
$Body
  Calculate_if ��������� > 0 ����������_�����_Abs = ���������
  Calculate_if ��������� < 0 ����������_�����_Abs = -1 * ���������
  Calculate_if ��������� = 0 ����������_�����_Abs = 1/60
$End

$Function ���������_������� : real
$Type = algorithmic
$Parameters
  _���    : such_as �������.���
  �����_1 : real
  �����_2 : real
$Body
  Calculate_if _��� = ���1 ���������_������� = �����������_�����(�����_1, �����_2)
  Calculate_if _��� = ���2 ���������_������� = �����������_�����(�����_1, �����_2)
$End

$Function ���������_������ : real
$Type = algorithmic
$Parameters
  �����   : such_as ���.���_���_���
  �����_1 : real
  �����_2 : real
$Body
  Calculate_if ����� = 1 ���������_������ = ����������_�����_Abs(����������_�����(�����_1, �����_2))
  Calculate_if ����� = 2 ���������_������ = ����������_�����_Abs(����������_�����(�����_1, �����_2))
  Calculate_if ����� = 3 ���������_������ = ����������_�����_Abs(����������_�����(�����_1, �����_2))
  Calculate_if ����� = 4 ���������_������ = ����������_�����_Abs(����������_�����(�����_1, �����_2))
$End

$Function ���_���� : integer
$Type = table
$Parameters
  ����� : such_as ��.����
$Body
  4 1 12 6 7 9
$End

$Function ���_���� : such_as ��.�������
$Type = table
$Parameters
  �����_�� : such_as ���_������.�����_��������
  ���      : such_as ���_������.���
$Body
  ���1 ���3 ���4 ���3 ��������
  ���2 ���4 ���3 ���4 ��������
$End

$Function ������� : real
$Type = table
$Parameters
  �����_�� : integer[1..4]
  ���      : such_as ���_������.���
$Body
  30 5 10 15
  20 10 8 10
$End

$Function ���������� : real
$Type = table
$Parameters
  ����_������ : such_as ��.����_����
  ����_����   : such_as ��.����_����
$Body
  0 2.8 0 0 0 0 0 0 0 0 0 0
  2.8 0 4 0 0 0 0 0 0 0 9 0
  0 4 0 6.85 4 0 0 0 0 0 0 0
  0 0 6.85 0 0 0 0 0 0 0 0 0
  0 0 4 0 0 5 0 9 0 0 0 0
  0 0 0 0 5 0 0 0 0 0 0 0
  0 0 0 0 0 0 0 2.6 0 0 0 0
  0 0 0 0 9 0 2.6 0 0 4 0 0
  0 0 0 0 0 0 0 0 0 7.15 0 0
  0 0 0 0 0 0 0 4 7.15 0 4 0
  0 9 0 0 0 0 0 0 0 4 0 2.8
  0 0 0 0 0 0 0 0 0 0 2.8 0
$End

$Function ����������_����� : real
$Type = table
$Parameters
  �_�  : (�, �) = �
  ���� : such_as ��.����_����
$Body
  13.85 5
  13.85 7.8
  13.85 11.8
  7 11.8
  13.85 15.8
  13.85 20.8
  22.85 18.4
  22.85 15.8
  30 11.8
  22.85 11.8
  22.85 7.8
  22.85 5
$End

$Function ��������� : integer
$Type = algorithmic
$Parameters
  ���������� : integer
  �����_���  : integer
  ������_    : integer
$Body
  Calculate_if ���������� <  �����_��� - ������_  ��������� = ������_
  Calculate_if ���������� >= �����_��� - ������_  ��������� = �����_��� - ����������
$End

$Function �����_��_������ : such_as ���_������.����
$Type = algorithmic
$Parameters
  ������� : such_as ��.�������
$Body
  Calculate_if �������  = �������  �����_��_������ = ���������
  Calculate_if ������� <> �������  �����_��_������ = ��������
$End

$Function _��������_���� : integer
$Type = algorithmic
$Parameters
  _�����1 : real
  _�����2 : real
$Body
  Calculate_if _�����1  < _�����2  _��������_���� = 1
  Calculate_if _�����1 >= _�����2  _��������_���� = 0
$End

$Function ������� : real
$Type = algorithmic
$Parameters
  _����1  : such_as ��.����_����
  _����2  : such_as ��.����_����
  _����3  : such_as ��.����_����
$Body
  Calculate_if _����1  = _����3  ������� = 0.0001
  Calculate_if _����2 <> _����3  ������� = �����������_�����(0.0, 1.0)
  Calculate_if _����2  = _����3  ������� = 1
  Calculate_if _����1 <> _����3  ������� = �����������_�����(0.0, 1.0)
$End

$Function ���_�� : integer [0..1]
$Type = algorithmic
$Parameters
  �����    : such_as ��.����
  �����_�� : integer
$Body
  Calculate_if 0 = 0 ���_�� = 1
$End