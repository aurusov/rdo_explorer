$Pattern  �������_������_������� : irregular_event  trace
$Relevant_resources
  ������ : ��������������  Keep
$Time = {�����������_��������(0.25, 0.75)}
		  ����������������_��������(0.5)
		  {����������_��������(0.5, 0.2)}
		  {��������_��������}
		  {��������_��_�����������}
$Body
  ������
	 Convert_event
		����  set ������_������
$End

$Pattern  �������_���������� : rule  trace
$Relevant_resources
  ������ : �������         Keep
  ������ : ��������������  Keep
$Body
  ������
	 Choice from  ������.������ = ���
	 with_min  ���������_�����(0.0, 1.0)
	 Convert_rule
		������             set �_�������
		�����_�������      set Time_now
		�������_�_�������  set �����_�����_�_�������(0)
  ������
	 Choice from  ������.���� = ������_������ and
					  ������.����������_��������_�_������� < 6
	 first
	 Convert_rule
		����                           set ���_��������
		����������_��������_�_�������  set ������.����������_��������_�_������� + 1
$End

$Pattern  �������_������������_������� : operation  trace
$Relevant_resources
  ������ : ��������������  Keep  Keep
  ������ : �������         Keep  Keep
$Time = ����������_�������������_������������(0.45, 0.2)
$Body
  ������
	 Choice from ������.����������_��������_�_������� > 0 and
					 ������.���������_����������� = ��������
		first
	 Convert_begin
		���������_�����������          set �����
	 Convert_end
		����������_��������_�_�������  set ������.����������_��������_�_������� - 1
		���������_�����������          set ��������
		���������_��������             set ������.���������_�������� + 1
  ������
	 Choice from  ������.������ = �_�������
	 with_min ������.�����_�������
	 Convert_begin
		������             set �_�������
		�������_�_�������  set 0
	 Convert_end
		������             set ���
$End
