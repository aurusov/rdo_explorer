$Constant
  ����������_���������                 : integer = 2
  ����������_������_�_������           : integer = 4
  ����������_�����_�_���������_�����   : integer = 8
  �������_���������_�������            : integer = 1
$End

$Sequence  ����������  : integer [0..255]
$Type =  uniform
$End

$Function  ����_������  : integer
$Type = table
$Parameters
  �����_����   : integer  [1..9]
$Body
  256   128   64   32   16    8    4    2    1
$End

$Function  �������  : integer [0..255]
$Type = algorithmic
$Parameters
  ������        : integer [0..255]
  �_������_���� : integer [1..8]
  �������_����� : integer [1..8]
$Body
  Calculate_if  0 = 0
    ������� = (������ - ������ / ����_������(�_������_����) * ����_������(�_������_����)) /
              ����_������(�_������_���� + �������_�����)
$End

$Function  RMin  : real
$Type = algorithmic
$Parameters
  ��������_1  : real
  ��������_2  : real
$Body
  Calculate_if ��������_1 <  ��������_2 RMin = ��������_1
  Calculate_if ��������_1 >= ��������_2 RMin = ��������_2
$End

$Function  RMax  : real
$Type = algorithmic
$Parameters
  ��������_1  : real
  ��������_2  : real
$Body
  Calculate_if ��������_1 >  ��������_2 RMax = ��������_1
  Calculate_if ��������_1 <= ��������_2 RMax = ��������_2
$End

$Function  ��������_������� : integer [0..255]
$Type = algorithmic
$Parameters
  �����       : integer
  ��������_1  : integer [0..255]
  ��������_2  : integer [0..255]
$Body
  Calculate_if ����� < �������.�����������_���� ��������_������� = ��������_1
  Calculate_if ����� > �������.�����������_���� ��������_������� = ��������_2
  Calculate_if ����� = �������.�����������_���� and
               �������.�����������_��� = 8      ��������_������� = ��������_1
  Calculate_if ����� = �������.�����������_���� and
               �������.�����������_��� < 8
               ��������_������� = �������(��������_1, 1, �������.�����������_���) *
                                  ����_������(�������.�����������_��� + 1) +
                                  �������(��������_2, �������.�����������_��� + 1, 8 - �������.�����������_���)
$End

$Sequence  ��������_��������  : real
$Type =  uniform
$End

$Sequence  �����_�����  : integer
$Type =  uniform
$End

$Sequence  �����_����  : integer
$Type =  uniform
$End

$Function  ������_����������  : integer [1..8]
$Type = algorithmic
$Parameters
  ��������  : integer
$Body
  Calculate_if �������� < ����������_������_�_������ ������_���������� = 8
  Calculate_if �������� = ����������_������_�_������
    ������_���������� = ����������_�����_�_���������_����� - 1
$End

$Sequence  ��������_�����������  : real
$Type =  uniform
$End

$Sequence  ��������_�������  : real
$Type =  uniform
$End

$Function  ������_�������  : integer [1..8]
$Type = algorithmic
$Parameters
  ��������  : integer
$Body
  Calculate_if �������� < ����������_������_�_������ ������_������� = 8
  Calculate_if �������� = ����������_������_�_������
    ������_������� = ����������_�����_�_���������_�����
$End

$Function  ����_�������  : integer
$Type = algorithmic
$Parameters
  ��������_1  : integer
  ��������_2  : integer
$Body
  Calculate_if �������.����� <= �������.�����������_������� ����_������� = ��������_1
  Calculate_if �������.����� >  �������.�����������_������� ����_������� = ��������_2
$End

$Function  ��������_������� : integer [0..255]
$Type = algorithmic
$Parameters
  �����       : integer
  ��������    : integer [0..255]
$Body
  Calculate_if ����� <> �������.�������_���� ��������_������� = ��������
  Calculate_if ����� =  �������.�������_���� and �������(��������, �������.�������_���, 1) = 1
               ��������_������� = �������� - ����_������(�������.�������_��� + 1)
  Calculate_if ����� =  �������.�������_���� and �������(��������, �������.�������_���, 1) = 0
               ��������_������� = �������� + ����_������(�������.�������_��� + 1)
$End

$Function  ����������_��  : real [0.0..1.0]
$Type = algorithmic
$Parameters
  ��������_1  : real [0.0..1.0]
  ��������_2  : real [0.0..1.0]
$Body
  Calculate_if  0 = 0
  ����������_�� = {(1 - (��������_1 * 2 - 1) * (��������_1 * 2 - 1)) / 2.0 +
                  (1 - (��������_2 * 2 - 1) * (��������_2 * 2 - 1)) / 2.0}
						(��������_1 * ��������_1 + ��������_2 * ��������_2) / 2.0
						{(��������_1 - ��������_2) * (��������_1 - ��������_2) }
$End

$Function  I_IfEQZero : integer
$Type = algorithmic
$Parameters
  ����      : integer
  ����_��   : integer
  ����_���  : integer
$Body
  Calculate_if ���� =  0  I_IfEQZero = ����_��
  Calculate_if ���� <> 0  I_IfEQZero = ����_���
$End
