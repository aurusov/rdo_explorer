$Pattern  �������_��������_������� : irregular_event  trace
$Relevant_resources
  _����        : ����     Keep
$Time = ��������_��������_��������(4, 18)
$Body
  _����
	 Convert_event
		������_������  set ��
$End

$Pattern  �������_��������_������� : rule  trace
$Relevant_resources
  _����        : ����                Keep
  �����_������ : �������             Create
  ���          : �������_���_������  Keep
$Body
  _����
	 Choice from _����.������_������ = �� first
	 Convert_rule
		������_������   set ���
		�������         set _����.������� + 1
		���_����������  set ��������_����_�������
  �����_������
	 Convert_rule  trace
		�����            set _����.�������
		���              set _����.���_����������
		���������        set ������
		�����_��������   set Time_now
		�����_��_�����   set 0.0
		�����_���������� set 0.0
  ���
	 Choice from ���.�����_������� = 0  first
	 Convert_rule
		�����_�������   set _����.�������
		���             set _����.���_����������
		���������       set ������
$End

$Pattern  �������_���������_�������� : operation  trace
$Relevant_resources
  _����   : ����                Keep  NoChange
  _������ : �������             Keep  NoChange
  _������ : �������             Keep  Keep
  _������ : ������              Keep  Keep
  ���     : �������_���_������  Keep  Keep
$Time = 1.0
$Body
  _����
	 Choice from _����.����������_���������_�������� > 0 and
					 _����.������ = ��_�������
	 first
	 Convert_begin
		����������_���������_��������  set _����.����������_���������_�������� - 1
  _������
	 Choice from _������.��������� = ��������
	 first
	 Convert_begin
		���������        set �����
  _������
	 Choice from _������.��������� = ������
	 first
	 Convert_begin
		���������        set ����������
		�����_��_�����   set Time_now - _������.�����_��������
	 Convert_end
		���������        set ������������
  _������
	 Choice from _������.��������� = ��������
	 first
	 Convert_begin
		���������        set �����
	 Convert_end
		���������        set ��������
      ��               set 0          
  ���
	 Choice from ���.�����_������� = _������.�����  first
	 Convert_begin
		���������        set ����������
		������           set _������.�����
	 Convert_end
		���������        set ������������
$End

 $Pattern �������_��� : operation
 $Relevant_resources
    _������ : ������  Keep Keep
 $Time = 0.01
 $Body
   _������
	  Choice from _������.��������� = ����� and _������.��� = ���
			 first
		  Convert_begin
				 ��  set _������.�� + 1
				 ��� set ��
		  Convert_end
				 ��� set ���
 $End



$Pattern  �������_����������_������� : operation  trace
$Relevant_resources
  _������ : �������   Keep  Keep
$Time = ������������_����������(_������.���)
$Body
  _������
    Choice from _������.��������� = ������������
    first
    Convert_begin
      ���������        set �����������
      �����_���������� set Time_now
    Convert_end
      ���������        set ��������
      �����_���������� set Time_now - _������.�����_����������
$End

$Pattern  �������_��������_�������� : operation  trace
$Relevant_resources
  _����        : ����                Keep      NoChange
  _������      : �������             Keep      Erase
  ���_������   : �������_���_������  Keep      Keep
  _������      : �������             Keep      NoChange
  _������      : ������              Keep      Keep
$Time = 1.0
$Body
  _����
    Choice from _����.������ = ��_�������
    first
    Convert_begin
      ����������_���������_��������  set _����.����������_���������_�������� + 1
  _������
    Choice from _������.��������� = �������� and
                _������.��� <> ���_4
    first
    Convert_begin
      ���������   set ������������
  ���_������
	 Choice from ���_������.�����_������� = _������.�����  first
	 Convert_begin
      ���������       set ������������
	 Convert_end
		�����_�������   set 0
		������          set 0
  _������
	 Choice from _������.����� = ���_������.������
	 first
	 Convert_begin
		���������        set ��������
  _������
    Choice from _������.��������� = ��������
    first
    Convert_begin
      ���������   set �����
    Convert_end
      ���������   set ��������
		��          set 0
$End

$Pattern  �������_������_������ : irregular_event  trace
$Relevant_resources
  _����   : ����  Keep
$Time = ��������_�����_��������(48)
$Body
  _����
    Convert_event
      ������      set ������_������
$End

$Pattern  �������_����� : operation  trace
$Relevant_resources
  _����   : ����  Keep  Keep
$Time = ������������_������(2, 6)
$Body
  _����
    Choice from _����.������ = ������_������
    first
    Convert_begin
      ������      set �������
    Convert_end
      ������      set ��_�������
$End

$Pattern  �������_��������_��������_���_4 : operation  trace
$Relevant_resources
  _����        : ����                Keep  NoChange
  _������      : �������             Keep  Keep
  ���_������   : �������_���_������  Keep  Keep
  _������      : �������             Keep  NoChange
  _������      : ������              Keep  Keep
$Time = 1.0
$Body
  _����
	 Choice from _����.������ = ��_�������
	 first
    Convert_begin
      ����������_���������_��������  set _����.����������_���������_�������� + 1
  _������
    Choice from _������.��������� = �������� and
                _������.��� = ���_4
    first
    Convert_begin
		���������   set ������������
	 Convert_end
		���������   set ���������
  ���_������
	 Choice from ���_������.�����_������� = _������.�����  first
	 Convert_begin
		���������       set ������������
	 Convert_end
		���������       set ���������
		�����_�������   set 0
      ������          set 0
  _������
	 Choice from _������.����� = ���_������.������
	 first
	 Convert_begin
		���������        set ��������
  _������
    Choice from _������.��������� = ��������
    first
    Convert_begin
      ���������   set �����
    Convert_end
      ���������   set ��������
      ��          set 0
$End

$Pattern  �������_��������_������� : operation  trace
$Relevant_resources
  _������      : �������             Erase     NonExist
  ���_������   : �������_���_������  Keep      NoChange
  _����        : �����               NoChange  Keep
  �����_������ : �������             NonExist  Create
  ���          : �������_���_������  Keep      Keep
$Time = �����_��������(216, 264)
$Body
  _������
	 Choice from _������.��������� = ��������� and
					 _������.��� = ���_4
	 first
  ���_������
	 Choice from ���_������.�����_������� = _������.�����  first
	 Convert_begin
		�����_�������   set 0
  _����
	 Choice NoCheck first
	 Convert_end
		�������         set _����.������� + 1
  �����_������
	 Convert_end
		�����            set _����.�������
		���              set ���_4
		���������        set ������
		�����_��������   set Time_now
		�����_��_�����   set 0.0
		�����_���������� set 0.0
  ���
	 Choice from ���.�����_������� = 0  first
	 Convert_begin
		�����_�������   set -1
	 Convert_end
		�����_�������   set _����.�������
		���             set ���_4
		���������       set ������
$End

