$Pattern Born1:irregular_event trace
$Parameters
	��_�����:real
$Relevant_resources
	���:S1 Keep
$Time = Exp_need1(��_�����)
$Body
 ���
  Convert_event
	������	set ����
$End

$Pattern Born2:irregular_event
$Parameters
	��_�����:real
$Relevant_resources
	���:S2 Keep
$Time = Exp_need2(��_�����)
$Body
 ���
  Convert_event
	������	set ����
$End

$Pattern Born3:irregular_event
$Parameters
	��_�����:real
$Relevant_resources
	���:S3 Keep
$Time = Exp_need3(��_�����)
$Body
 ���
  Convert_event
	������	set ����
$End

$Pattern Born4:irregular_event
$Parameters
	��_�����:real
$Relevant_resources
	���:S4 Keep
$Time = Exp_need4(��_�����)
$Body
 ���
  Convert_event
	������	set ����
$End

$Pattern Move:operation trace
$Parameters
	Mov_time:real
$Relevant_resources
	Mar:M1	Keep	Keep
$Time = Mov_time
$Body
  Mar
	Choice from
	Mar.���� = �����
 first
 Convert_begin
 	����	set ��������
 Convert_end	
	���	set Inc_to4(Mar.���)
	����	set ����
$End

$Pattern Take:operation
$Parameters
	Av_time:real
$Relevant_resources
	����:M1	  	Keep	 	Keep
	���: �������	NoChange	Keep
$Time = Exp_form(Av_time)
$Body
  ����
	Choice from
	����.���� = ���� and
	����.��������� = ��������
 first
 Convert_begin
 	��������	set ����.���
	���������	set �����
	����		set Priv(����.��� + Stoi(Inc))
	���		set How_many
	����		set ��������
Convert_end	
	����	set �����
  ���
	Choice from
	���.����� = ����.��� and
	���.������ = ����
 first
 Convert_end
	������		set ���
$End
	
$Pattern Out:operation
$Parameters
	Av_time:real
$Relevant_resources
	�1:M1	  Keep		  Keep
$Time = Exp_form(Av_time)
$Body
  �1
Choice from
	�1.���� = ���� and �1.��������� = �����  and
	�1.�������� = �1.��� and �1.��� = 0
 first
Convert_begin
	����		set ��������
Convert_end
	���������	set ��������	
	����		set �����
$End

$Pattern Copy:operation
$Parameters
	Av_time:real
$Relevant_resources
	���:M1	  	Keep	 Keep
$Time = Exp_opr(Av_time)
$Body
  ���
	Choice from
	���.���� = ���� and
	���.��������� = ����� and
	���.���� = ���.��� and
	���.��� <> 0
 first
 Convert_begin
	����		set ��������
 Convert_end
	���		set ���.��� - 1
	����		set �����
$End

$Pattern Put:operation
$Parameters
	Av_time:real
$Relevant_resources
	���:M1	  	Keep	Keep 
$Time = Exp_opr(Av_time)
$Body
  ���
	Choice from
	���.���� = ���� and
	���.��������� = ����� and
	���.�������� = ���.��� and
	���.��� <> 0
 first
 Convert_begin
	����		set ��������
Convert_end
	����		set �����
$End

$Pattern Thru:operation trace
$Parameters
	Av_time:real
$Relevant_resources
	���:M1	  	Keep    	 Keep
$Time = Av_time
$Body
  ���
  Choice from
	���.���� = ����  and
	���.��������<>���.��� and
	���.����<>���.��� 
 first
 Convert_begin
	����		set ��������
 Convert_end
	����	set �����
$End
