$Pattern  �������_��������_��������_���������  : rule  {trace}
$Relevant_resources
  �����            : �������     NoChange
  �����            : �����       Erase

$Body
  �����
    Choice from �����.�����_��������� > �������_���������_�������
    first

  �����
    Choice from �����.�����_��������� <= �����.�����_��������� - �������_���������_�������
    first
$End

$Pattern  ���������_������_���������  : rule  {trace}
$Relevant_resources
  �����      : �������     Keep
  �����      : �����       Create
$Body
  �����
    Choice from �����.�����_��������� <= ����������_��������� and
                �����.����� = ������������� and
                �����.������� < �����.������_���������
    first
    Convert_rule
      �������          set �����.������� + 1

  �����
    Convert_rule  trace
      ��������_1           set ����������(0, 255)
      ��������_2           set ����������(0, 255)
      ��������_3           set ����������(0, 255)
      ��������_4           set ����������(0, 255)
      �����_���������      set 1
      �����_�����          set �����.�������
      ��������_1           set 0
      ��������_2           set 0
      ����������_��������  set 0
      �����������_����     set 0
      �����������_���      set 0
      �������_����         set 0
      �������_���          set 0
      ������               set ��_����������
      ��������_��          set -1.0
      �����_��             set 0.0
      �����_�����          set 0.0
$End

$Pattern  �����_���������_�������_���������  : rule  {trace}
$Relevant_resources
  �����      : �������     Keep
  ���������  : ���������   Create
$Body
  �����
    Choice from �����.�����_��������� <= ����������_��������� and
                �����.����� = ������������� and
                �����.������� = �����.������_���������
    first
    Convert_rule
      �����_���������  set 1
      �����            set �����������_�_������_��
      �������          set 0
      �������_���      set 0

  ���������
    Convert_rule  trace
      �����                     set 1
      ������                    set �����.������_���������
      �����_��������_��         set 0.0
      �������_��������_��       set 0.0
      �����������_��������_��   set 1.0e20
      ������������_��������_��  set -1.0e20
      ����������_�����������    set 0
      ����������_�������        set 0
$End

$Pattern  �����������_�����_�_������_��  : rule  {trace}
$Relevant_resources
  �����            : �������             Keep
  �����            : �����               Keep
  ���������        : ���������           Keep
  �����_���_������ : �����_���_������    Keep

$Body
  �����
    Choice from �����.�����_��������� <= ����������_��������� and
                �����.����� = �����������_�_������_�� and
                �����.������� < �����.������_���������
    first
    Convert_rule
      �������          set �����.������� + 1
      �������_���      set �����.�������_��� +
                           I_IfEQZero(�������(�����.��������_1, 3, 1), 0, 1)

  �����
    Choice from �����.�����_��������� = �����.�����_��������� and
                �����.�����_����� = �����.������� + 1
    first
    Convert_rule
      ��������_��      set ����������_��((�������(�����.��������_1, 1, 8) +
                                         �������(�����.��������_2, 1, 8) / 256.0) / 256.0,
                                         (�������(�����.��������_3, 1, 8) +
                                         �������(�����.��������_4, 1, 8) / 256.0) / 256.0)
      �����_��         set ���������.�����_��������_��
      �����_�����      set ���������.�����_��������_�� + �����.��������_��

  ���������
    Choice from ���������.����� = �����.�����_���������
    first
    Convert_rule
      �����_��������_��         set ���������.�����_��������_�� + �����.��������_��
      �����������_��������_��   set RMin(���������.�����������_��������_��, �����.��������_��)
      ������������_��������_��  set RMax(���������.������������_��������_��, �����.��������_��)

  �����_���_������
    Choice from �����_���_������.�����_����� = �����.�����_�����
    first
    Convert_rule
		X_��������    set (�������(�����.��������_1, 1, 8) +
								�������(�����.��������_2, 1, 8) / 256.0) / 256.0
		Y_��������    set (�������(�����.��������_3, 1, 8) +
								�������(�����.��������_4, 1, 8) / 256.0) / 256.0
		X_����������  set {(�������(�����.��������_1, 1, 8) * 128 +
								�������(�����.��������_2, 1, 8) / 2) / 546}
								34 + �����_���_������.X_�������� * 450
		Y_����������  set {(�������(�����.��������_3, 1, 8) * 128 +
								�������(�����.��������_4, 1, 8) / 2) / 1725}
								475 - �����_���_������.Y_�������� * 450
$End

$Pattern  �������_�����_�����������  : rule  trace
$Relevant_resources
  �����            : �������             Keep
  ���������        : ���������           Keep

$Body
  �����
    Choice from �����.�����_��������� <= ����������_��������� and
                �����.����� = �����������_�_������_�� and
                �����.������� = �����.������_���������
    first
    Convert_rule
      �����            set ���������������
      �������          set 0
      �����            set ��������_��������(0.0, ���������.�����_��������_��)

  ���������
    Choice from ���������.����� = �����.�����_���������
    first
    Convert_rule
      �������_��������_��       set ���������.�����_��������_�� / �����.������_���������
$End

$Pattern  �������_���������������  : rule  {trace}
$Relevant_resources
  �����            : �������             Keep
  ���������        : ���������           NoChange
  ��������         : �����               Keep
  �������          : �����               Create

$Body
  �����
    Choice from �����.�����_��������� < ����������_��������� and
                �����.����� = ��������������� and
                �����.������� < �����.������_���������
    first
    Convert_rule
      �������          set �����.������� + 1
      �����            set ��������_��������(0.0, ���������.�����_��������_��)

  ���������
    Choice from ���������.����� = �����.�����_���������
    first

  ��������
    Choice from ��������.�����_��������� = �����.�����_��������� and
                ��������.�����_��    <= �����.����� and
                ��������.�����_����� >= �����.�����
    first
    Convert_rule
      ����������_��������  set ��������.����������_�������� + 1

  �������
    Convert_rule  {trace}
      ��������_1           set ��������.��������_1
      ��������_2           set ��������.��������_2
      ��������_3           set ��������.��������_3
      ��������_4           set ��������.��������_4
      �����_���������      set �����.�����_��������� + 1
      �����_�����          set �����.�������
      ��������_1           set ��������.�����_�����
      ��������_2           set 0
      ����������_��������  set 0
      �����������_����     set 0
      �����������_���      set 0
      �������_����         set 0
      �������_���          set 0
      ������               set ��_����������
      ��������_��          set -1.0
      �����_��             set 0.0
      �����_�����          set 0.0
$End

$Pattern  �������_�����_���������������  : rule  {trace}
$Relevant_resources
  �����            : �������     Keep
  ���������        : ���������   Create

$Body
  �����
    Choice from �����.�����_��������� < ����������_��������� and
                �����.����� = ��������������� and
                �����.������� = �����.������_���������
    first
    Convert_rule
      �����            set �����������
      �������          set 0
      �����            set 2.0

  ���������
    Convert_rule  trace
      �����                     set �����.�����_��������� + 1
      ������                    set �����.������_���������
      �����_��������_��         set 0.0
      �������_��������_��       set 0.0
      �����������_��������_��   set 1.0e20
      ������������_��������_��  set -1.0e20
      ����������_�����������    set 0
      ����������_�������        set 0
$End

$Pattern  �������_�����������  : rule  {trace}
$Relevant_resources
  �����          : �������             Keep
  ���������      : ���������           Keep
  ������_1       : �����               Create
  ������_2       : �����               Create
  �����_1        : �����               Erase
  �����_2        : �����               Erase

$Body
  �����
    Choice from �����.�����_��������� < ����������_��������� and
                �����.����� = ����������� and
                �����.������� <= �����.������_��������� / 2 and
                �����.����� <= �����.�����������_�����������
    first
    Convert_rule
      �����            set 2.0

  ���������
    Choice from ���������.����� = �����.�����_��������� + 1
    first
    Convert_rule
      ����������_�����������  set ���������.����������_����������� + 1

  ������_1
    Convert_rule  {trace}
      ��������_1           set ��������_�������(1, �����_1.��������_1, �����_2.��������_1)
      ��������_2           set ��������_�������(2, �����_1.��������_2, �����_2.��������_2)
      ��������_3           set ��������_�������(3, �����_1.��������_3, �����_2.��������_3)
      ��������_4           set ��������_�������(4, �����_1.��������_4, �����_2.��������_4)
      �����_���������      set �����_1.�����_���������
      �����_�����          set �����_1.�����_�����
      ��������_1           set �����_1.��������_1
      ��������_2           set �����_2.��������_1
      ����������_��������  set �����_1.����������_��������
      �����������_����     set �����.�����������_����
      �����������_���      set �����.�����������_���
      �������_����         set �����_1.�������_����
      �������_���          set �����_1.�������_���
      ������               set �����_1.������
      ��������_��          set �����_1.��������_��
      �����_��             set �����_1.�����_��
      �����_�����          set �����_1.�����_�����

  ������_2
    Convert_rule  {trace}
      ��������_1           set ��������_�������(1, �����_2.��������_1, �����_1.��������_1)
      ��������_2           set ��������_�������(2, �����_2.��������_2, �����_1.��������_2)
      ��������_3           set ��������_�������(3, �����_2.��������_3, �����_1.��������_3)
      ��������_4           set ��������_�������(4, �����_2.��������_4, �����_1.��������_4)
      �����_���������      set �����_2.�����_���������
      �����_�����          set �����_2.�����_�����
      ��������_1           set �����_1.��������_1
      ��������_2           set �����_2.��������_1
      ����������_��������  set �����_2.����������_��������
      �����������_����     set �����.�����������_����
      �����������_���      set �����.�����������_���
      �������_����         set �����_2.�������_����
      �������_���          set �����_2.�������_���
      ������               set �����_2.������
      ��������_��          set �����_2.��������_��
      �����_��             set �����_2.�����_��
      �����_�����          set �����_2.�����_�����

  �����_1
    Choice from �����_1.�����_��������� = �����.�����_��������� + 1 and
                �����_1.�����_����� = �����.��������_1
    first

  �����_2
    Choice from �����_2.�����_��������� = �����.�����_��������� + 1 and
                �����_2.�����_����� = �����.��������_2
    first
$End

$Pattern  �������_������_���  : rule  {trace}
$Relevant_resources
  �����        : �������             Keep
  �����_1      : �����               Keep
  �����_2      : �����               Keep

$Body
  �����
    Choice from �����.�����_��������� < ����������_��������� and
                �����.����� = ����������� and
                �����.������� < �����.������_��������� / 2
    first
    Convert_rule
      �������          set �����.������� + 1
      �����            set ��������_�����������(0.0, 1.0)
      ��������_1       set �����_1.�����_�����
      ��������_2       set �����_2.�����_�����
      �����������_���� set �����_�����(1, ����������_������_�_������)
      �����������_���  set �����_����(1, ������_����������(�����.�����������_����))

  �����_1
    Choice from �����_1.�����_��������� = �����.�����_��������� + 1 and
                �����_1.������ = ��_����������
    with_min ��������_�����������(0.0, 1.0)
    Convert_rule
      ������           set ����������

  �����_2
    Choice from �����_2.�����_��������� = �����.�����_��������� + 1 and
                �����_2.������ = ��_���������� and
                �����_2.�����_����� <> �����_1.�����_����� and
                �����_2.��������_1 <> �����_1.��������_1
    with_min ��������_�����������(0.0, 1.0)
    Convert_rule
      ������           set ����������
$End

$Pattern  �������_�����_�����������  : rule  {trace}
$Relevant_resources
  �����            : �������     Keep

$Body
  �����
    Choice from �����.�����_��������� < ����������_��������� and
                �����.����� = �����������
    first
    Convert_rule
      �����            set �������
      �������          set 0
$End

$Pattern  �������_�������  : rule  {trace}
$Relevant_resources
  �����            : �������             Keep
  �����            : �����               Keep
  ���������        : ���������           Keep

$Body
  �����
    Choice from �����.�����_��������� < ����������_��������� and
                �����.����� = ������� and
                �����.������� < �����.������_���������
    first
    Convert_rule
      �������          set �����.������� + 1
      �����            set ��������_�������(0.0, 1.0)
      �������_����     set �����_�����(1, ����������_������_�_������)
      �������_���      set �����_����(1, ������_�������(�����.�������_����))

  �����
    Choice from �����.�����_��������� = �����.�����_��������� + 1 and
                �����.�����_����� = �����.������� + 1
    first
    Convert_rule
      ��������_1           set ����_�������(��������_�������(1, �����.��������_1), �����.��������_1)
      ��������_2           set ����_�������(��������_�������(2, �����.��������_2), �����.��������_2)
      ��������_3           set ����_�������(��������_�������(3, �����.��������_3), �����.��������_3)
      ��������_4           set ����_�������(��������_�������(4, �����.��������_4), �����.��������_4)
      �������_����         set ����_�������(�����.�������_����, 0)
      �������_���          set ����_�������(�����.�������_���, 0)

  ���������
    Choice from ���������.����� = �����.�����_��������� + 1
    first
    Convert_rule
      ����������_�������  set ���������.����������_������� + ����_�������(1, 0)
$End

$Pattern  �������_�����_�������  : rule  {trace}
$Relevant_resources
  �����            : �������     Keep

$Body
  �����
    Choice from �����.�����_��������� < ����������_��������� and
                �����.����� = ������� and
                �����.������� = �����.������_���������
    first
    Convert_rule
      �����_���������  set �����.�����_��������� + 1
      �����            set �����������_�_������_��
      �������          set 0
      �������_���      set 0
$End
