
$Pattern GeneratePr:irregular_event  {trace}
$Parameters
	Nm:integer[1..256]
	Av_t:real
$Relevant_resources
	Sys: Sy		Keep
$Time = B_time(Av_t,Nm)
$Body
Sys
Convert_event
	Fl_g	set	1
	N_g	set	Nm
$End 
{ / 2 / - �������  �� ����� ������� � �������� ��������������� ��������� - }
$Pattern	 Generate : rule {trace} 
$Relevant_resources
	Sys:Sy				Keep
	Cn:Counter			Keep
	Tr:Transaction			Create
$Body
Sys
	Choice from
	Sys.Fl_g = 1
first
Convert_rule
	Fl_g	set	0
Cn
	Choice from
	Cn.Num = Sys.N_g and Cn.Who = A
first
Convert_rule
	C_t	set	Cn.C_t + 1
Tr	
Convert_rule	{trace}
Num	set	Cn.C_t			{����� ����������}
Pr	set	Pr_ch( Pr_hst( Cn.Num ))	{��������� �������}
Soc	set	Cn.Num			{�������� �������}
Qu	set	0
Act	set	Q
Ct	set	0
Kin	set	1
Np	set	0
Who	set	M
$End
{----����� �� ������ ������ / 33 / - Get_Transaction_Statistic-}
{-----------------------------------------����  �  �������-----------------------------------------------}
{/ 3 /-���� ���������� � ������� �������������� � ����������----------------------------}
$Pattern	 QueueInPr : rule	{trace} 
$Parameters
	Par: such_as Counter.Who	             {��� �������:�������, ����(�� ������), ��(�� �����.)}
$Relevant_resources
	Tr:Transaction		Keep
	Cn:Counter		Keep
	FL:RegFl		Keep
$Body
Tr
	Choice from
	Tr.Qu = 0 and Tr.Act = Cmt1(Par) 
first
Convert_rule
Qu   set   Cn.C_p1 * Qst(1, Tr.Pr) + Cn.C_p2 * Qst(2, Tr.Pr) + Cn.C_p3 * Qst(3, Tr.Pr) + 1
Ct	set	Cmt( Par, 0, 1 + Cn.C_t)
Cn
	Choice from
	Cn.Num = Cmt( Par, Tr.Soc, Mux( Par, Tr.Kin, Aws(Par, Tr.Np,Tr.Kin))) and
Cn.Who = Par
first
Convert_rule
	C_t	set	Cmt( Par, Cn.C_t, Cn.C_t + 1)
	C_n	set	Cmt( Par, Tr.Num, Tr.Ct)
	C_q	set	Tr.Qu
	C_p1	set	Cn.C_p1 + Pr_Inc( 1, Tr.Pr )
	C_p2	set	Cn.C_p2 + Pr_Inc( 2, Tr.Pr )		
	C_p3	set	Cn.C_p3 + Pr_Inc( 3, Tr.Pr )		
FL
	Choice from
FL.Num = Cmt( Par, Tr.Soc, Mux( Par, Tr.Kin, Aws(Par, Tr.Np,Tr.Kin))) and 
FL.Fl_O = 0 and FL.Fl_I = 0 and FL.Who = Par
first
Convert_rule
	Fl_I	set	1		{���������� ���� ����� � �������}
	Sum	set	FL.Sum + 1	{INC ������� ������ �������}
$End
{/ 4 /-����������� ������� � ����� � ������ ����������------------------------------------------}
$Pattern	 QueueIn : rule {trace} 
$Parameters
	Par: such_as Counter.Who
$Relevant_resources
	FL:RegFl		NoChange
	Cn:Counter		Keep
	Tr:Transaction		Keep
$Body
FL
	Choice from
	FL.Fl_I = 1 and FL.Who = Par	{���� ���. ���� �����}
first
Cn
	Choice from
	Cn.Num = FL.Num and Cn.Who = Par
first
Convert_rule
	C_n	set	Cmt( Par, Tr.Num, Tr.Ct)
	C_q	set	Tr.Qu + 1 
Tr
	Choice from
	Tr.Act = Cmt1(Par) and 
Cmt( Par, Tr.Soc, Mux(Par, Tr.Kin, Aws( Par,Tr.Np,Tr.Kin))) = Cn.Num
 and Tr.Qu = Cn.C_q  and Cmt( Par, Tr.Num, Tr.Ct) <> Cn.C_n
first
Convert_rule
	Qu	set	Tr.Qu + 1
$End
{/ 5 /-����� ����� ����� � ������� ����� � ��������������----------------------------------}
$Pattern	 ResInFl : rule {trace} 
$Parameters
	Par: such_as Counter.Who
$Relevant_resources
	FL:RegFl		Keep
	Cn:Counter		NoChange
$Body
FL
	Choice from
	FL.Fl_I = 1 and FL.Who = Par
first
Convert_rule
	Fl_I	set	0
Cn
	Choice from
Cn.C_q = Cn.C_p1 + Cn.C_p2 + Cn.C_p3 and Cn.Num = FL.Num and Cn.Who = Par
first
$End

{------------------------------------------------------------�����  ��  �������-----------------------------------}
{/ 6 /-----------------------------------------------------------}
$Pattern	 QueueOutPr : rule {trace} 
$Parameters
	Par: such_as Counter.Who
$Relevant_resources
	FL:RegFl		Keep
	Cn:Counter		Keep
	Tr:Transaction		Keep
$Body
FL
	Choice from
	FL.Fl_O = 0 and FL.Fl_I = 0 and FL.En_f = 1 and FL.Who = Par
	{���� �������� ����� �� �������}
with_max( FL.Sum )
Convert_rule
	Fl_O	set	1		{���������� ���� ������ �� �������}
	En_f	set	0		{��������� ����� �� �������}
	Sum	set	FL.Sum  - 1	{DEC ������� ������ �������}
Cn
	Choice from
	Cn.Num = FL.Num and Cn.Who = Par
first	
 Convert_rule
	C_q	set	2
	C_p1	set	Cn.C_p1 - Pr_Inc( 1, Tr.Pr )
	C_p2	set	Cn.C_p2 - Pr_Inc( 2, Tr.Pr )		
	C_p3	set	Cn.C_p3 - Pr_Inc( 3, Tr.Pr )		
Tr
	Choice from
	Tr.Act = Cmt1(Par) and		{������ ������ �� ���������}
	Tr.Qu = 1 and
	Cmt( Par, Tr.Soc, Mux(Par, Tr.Kin, Aws(Par,Tr.Np,Tr.Kin))) = FL.Num 
first
Convert_rule
	Qu	set	Cmt( Par, -1, -5)
$End
{/ 7 /-����������� ������� � ����� � ������� �������----------------------------------------------}
$Pattern	 QueueOut : rule {trace} 
$Parameters
	Par: such_as Counter.Who
$Relevant_resources
	FL:RegFl		NoChange
	Cn:Counter		Keep
	Tr:Transaction		Keep
$Body
FL
	Choice from
	FL.Fl_O = 1 and FL.Who = Par
first
Cn
	Choice from
	Cn.Num = FL.Num and Cn.Who = Par
first
Convert_rule
C_q	set	Cn.C_q + 1
Tr
	Choice from
	Tr.Act = Cmt1(Par) and Tr.Qu = Cn.C_q and
	Cmt( Par, Tr.Soc, Mux(Par, Tr.Kin, Aws(Par, Tr.Np,Tr.Kin))) = FL.Num 
first
Convert_rule
	Qu	set	Tr.Qu - 1
$End
{/ 8 /-����� ����� ������ �� ������� ����� � �����������---------------------------------------------}
$Pattern	 ResOutFl : rule {trace} 
$Parameters
	Par: such_as Counter.Who
$Relevant_resources
	Cn:Counter	Keep
	FL:RegFl	Keep
$Body
Cn
	Choice from
Cn.Who = Par and Cn.C_q = Cn.C_p1 + Cn.C_p2 + Cn.C_p3 + 2
first
Convert_rule
	C_q	set	0
FL
	Choice from
	FL.Num = Cn.Num and FL.Fl_O = 1 and FL.Who = Par
first
Convert_rule
	Fl_O	set	0
$End

{ -----------------------------------------------------����������  ������------------------------------ }
{----------------------------------------/ 9 /------------------------------------------------------}
$Pattern	 FiDecPr : rule {trace}
$Relevant_resources
	Tr:Transaction	Keep
	Sys:Sy		Keep	
$Body
Tr
	Choice from
	Tr.Qu = -1 and Tr.Act = I			{���� ���-�� ����� �� ������� ���������}
first
Convert_rule
	Qu	set	-2			{������������ ���������� ������}
	Act	set	R_W_Fun		{��������� ��: -������ ��� ������}
	Kin	set	Pr_ch( Kin_hst( Tr.Soc ))	{	            - ��� �����	 }
Sys
	Choice from
	Sys.T_f = 0				{���� ������� ��������}
first 
Convert_rule
	T_f	set	1			{������ �������}
	F_c	set	1			{������� ������ ���. �� �1}
$End
{----------------------------------------/ 10 /------------------------------------------------------}
$Pattern	 FiDec: rule {trace}
$Relevant_resources
	Tr:Transaction		Keep
	Sys: Sy			Keep	
	DTr:Transaction		Create
$Body
Tr
	Choice from
	Tr.Qu = -2 and [Tr.Act = R or Tr.Act = W ]
first
Convert_rule
	Qu	set	-2 - Pr_Inc(0,FF_table(Sys.F_c + 1,Tr.Kin)) {-3,���� ������ ��������� 
								����. ���������(����)}
	Ct	set	Tr.Ct + 1 	{������� ������, ����������� ������� ��������}
Sys
	Choice from
	Sys.T_f = 1
first 
Convert_rule
	T_f	set	1 - Pr_Inc(0,FF_table(Sys.F_c  + 1, Tr.Kin))	         {0 ,���� ������ ������-
								  ��� ����. ���������(����)}
	F_c	set	Sys.F_c + 1
	Q_c	set	Sys.Q_c + ActComp( Tr.Act ,R )	{��������� '�����-��' ����. �����-
 							������(��.����� !!*�� ������ only*!!)
  							������. �� 1}
	Q_f	set	ActComp( Tr.Act ,R )		{1,���� ������ �� ������ (����������-
   							       ���� ������� ��������� ������� 
   							       (��.����� !!!*�� ������ only*!!!)}
	Q_s	set	1				{������� ������ � �1}
DTr
Convert_rule  {trace}
Num	set	Tr.Num				{����� "��������" ������� �/� }
Pr	set	Tr.Pr				{�����. "��������" ������� �/� }
Soc	set	Tr.Soc				{��-�������� "��������" ������� �/� }
Qu	set	Sys.Q_c * ActComp(Tr.Act , R)	{���.����� � ��������� '�����-��' ����. ���-
							��������(��.����� !!!*�� ������*!!!)}
Act	set	Tr.Act
Ct	set	-1
Kin	set	FF_table(Sys.F_c - 1, Tr.Kin)	{ ����� ������������ ����. �/�-�� ����� }
Np	set	0
Who	set	F
$End
{----------------------------------------/ 11 /------------------------------------------------------}
$Pattern	 RdFiAcc: operation {trace}
$Parameters
	Par:real
$Relevant_resources
	Sys: Sy			Keep		Keep	
	TrD:Transaction		Erase		NonExist
	Fi:File			Keep		NoChange
	Tr:Transaction		NoChange 	Keep
	FL:RegFl		Keep		NoChange 	
$Time = Par
$Body
Sys
	Choice from
	Sys.Q_f = 1				{���� ������� ���� �������� ��������� ���-
							���� (��.����� !!!*�� ������ only*!!!)}
first
Convert_begin
	Q_c	set	Sys.Q_c - 1		         { ���������� ��������� '�����-��' �� 1}
	Q_f	set	-1 + Pr_Inc( Sys.Q_c + 1, Sys.Q_s) {-1,���� �� ��������� '�������' ��-
							    ��� �� ��������� �/� (go RdQuOu); 
						 0,���� ����� ���������(��������� �������)}
Convert_end
{**}	Nf	set	Fi.Num
TrD
	Choice from
	TrD.Ct = -1 and TrD.Qu = Sys.Q_s	and  TrD.Act = R	{����� �������}
first
Fi
	Choice from
	Fi.Num = TrD.Kin  and  Fi.AccV >= 0	{ ���� ���� �� ������������ �� ������}
first
Convert_begin
	AccV	set	Fi.AccV + 1		{,��  ��-����������� ���� (��������������� 
							�������� ����. �/�-�) �� ������ }
Tr
	Choice from
	Tr.Qu = -3 and Tr.Soc = TrD.Soc and Tr.Num = TrD.Num and Tr.Act = R
first
Convert_end
	Ct	set	Tr.Ct - 1		{ ��������� ���-�� ����������������� ������ (� 
						������ ������� "��������") �� 1}
FL
	Choice from
	FL.Sum = 0 and FL.Num = TrD.Kin and FL.Who = F {���� ���� �� ����� ����������� �� 
								������}
first
Convert_begin
	En_f	set	0				{��������� ������������� ������ � 
								����� �/�-�� �� ������}
$End
{----------------------------------------/ 12 /------------------------------------------------------}
$Pattern	 WrFiCom: operation {trace}
$Parameters
	Par:real
$Relevant_resources
	TrD:Transaction		Erase		NonExist
	Fi:File			Keep		NoChange
	Tr:Transaction		NoChange	Keep
	Sys: Sy			NoChange	Keep	
$Time = Par
$Body
TrD
	Choice from
	TrD.Qu =  -5 and  TrD.Act = W		{���� ���-�� ����� �� ������� ���������� 
							����� �� ������}
first
Fi
	Choice from
	Fi.Num = TrD.Kin and Fi.AccV = 0  	{���� ������ ��� ���� ��������}
first
Convert_begin
	AccV	set	 -1			{������������� ���� �� ������}
Tr
	Choice from
	Tr.Qu = -3 and Tr.Soc = TrD.Soc and Tr.Num = TrD.Num and Tr.Act = W
first
Convert_end
	Ct	set	Tr.Ct - 1		{ ��������� ���-�� ����������������� ������ (� 
						������ ������� "��������") �� 1}
Sys
	Choice NoCheck
first
Convert_end
{**}	Nf	set	Fi.Num
$End
{----------------------------------------/ 13 /------------------------------------------------------}
$Pattern	 RdQuC: rule {trace}
$Relevant_resources
	Sys: Sy			Keep	
$Body
Sys
	Choice from
	Sys.Q_f = 1				{���� ������� ���� �������� �������:}
first
Convert_rule
	Q_f	set	1 - Qst( Sys.Q_s, Sys.Q_c) {-�������� ����,��. ��������� ����� �������}   
	Q_s	set	Sys.Q_s + 1		 {-������� �� ����. �� ������� �/� }	
$End
{----------------------------------------/ 14 /------------------------------------------------------}
$Pattern	 RdQuOu: rule {trace}
$Relevant_resources
	Sys: Sy			Keep	
	Tr:Transaction		Keep
$Body
Sys
	Choice from
	Sys.Q_f = -1		{,���� �� ������� ���-�� ����� (�� ���������):}
first
Convert_rule
	Ch_n	set	Sys.Q_s	{-��������� ��� ���. ����� � �������}
	Q_f	set	1	{-�������������� ����� �������        }
	Q_s	set	1	{ � �1				       }
Tr
	Choice from
	Tr.Ct = -1 and Tr.Act = R and Tr.Qu = Sys.Q_c + 1	{-������� ���������� �� �������}
first
Convert_rule
	Qu	set	Sys.Ch_n			{� ��������� �� ��� �����	}
$End
{----------------------------------------------------/15 /--------------------------------------------------------------}
$Pattern	 FiCom: rule {trace}
$Relevant_resources
	Tr:Transaction		Keep
$Body
Tr	
	Choice from
	Tr.Qu = -3 and Tr.Ct = 0 and [Tr.Act = R or Tr.Act = W ] {���� ������� ������ ,������� 
							         ������������ ��� ����������� 
								��� �����}
first
Convert_rule
	Qu	set	-4				        {�������� ���}	
$End	

{----------------------------------������������ �������  ��  ����������----------------------}
{----------------------------------------/ 16 /------------------------------------------------------}
$Pattern	 SerDecPr : rule {trace}
$Relevant_resources
	Tr:Transaction	Keep
	Sys:Sy1		Keep	
$Body
Tr
	Choice from
	Tr.Qu = -4 and [Tr.Act = R or Tr.Act = W ]		{��. ����.}
first
Convert_rule
	Qu	set	-6				{�������� ����� ��� �/�}
Sys
	Choice from
	Sys.T_f = 0					{���� ������� ��������}
first 
Convert_rule
	T_f	set	3			{���������� ���� �������� ��������.}
	Pz_c	set	1			{���������� ������� �� 1}
$End
{----------------------------------------/ 17 /------------------------------------------------------} 
$Pattern	 CouDecPr : rule {trace}
$Relevant_resources
	Tr:Transaction	NoChange
	Sys:Sy1		Keep	
$Body
Tr
	Choice from
	Tr.Qu = -6 and [Tr.Act = R or Tr.Act = W ]	{������� ���������� ������}	
first
Sys
	Choice from
	Sys.T_f = 3			{���� ���������� ���� �������� ��������.}
first 
Convert_rule
	T_f	set	3 - Pr_Inc(Gr_table( Sys.Pz_c,Tr.Kin), -1) { ���������� ���� �/� 2,���� 
						           	            ��������� ������ ����� �/�-�� 
						  (������� ����� ��������� ���-�� �/�-�� +1 )}
	Pz_c	set	Sys.Pz_c + 1		{������� ��������� �� 1}
$End
{----------------------------------------/ 18 /------------------------------------------------------}
$Pattern	 TopSubInqPr : rule {trace}
$Relevant_resources
	Sys:Sy1			Keep
	Tr:Transaction		Keep
	DTr:Transaction		Create
$Body
Sys
	Choice from
	Sys.T_f = 2			{���� ���������� ���� ��������.}
first 
Convert_rule
	T_f	set	1 - Pr_Inc( Sys.Pz_c - 1, 1)	{���� �/�-������ �������. ,�� 
								��������� �/�}
	Pz_c	set	Sys.Pz_c - 1			{��������� ������� �/�-�� �� 1}
Tr
	Choice from
	Tr.Qu = -6 and [Tr.Act = R or Tr.Act = W ]
first
Convert_rule
	Qu	set	-6 - Pr_Inc( Sys.Pz_c, 1)	{���� �/� ���������, ����� ����.(go SerCom)}
DTr						{������ ���������-������}
Convert_rule  {trace}
Num	set	Tr.Num				{����� "��������" ������� �/� }
Pr	set	Tr.Pr				{�����. "��������" ������� �/� }
Soc	set	Tr.Soc				{��-�������� "��������" ������� �/� }
Qu	set	0
Act	set	B
Ct	set	0
Kin	set	Tr.Kin				{��� �����}
Np	set	Sys.Pz_c			{����� �/�-� � �����}
Who	set	S
$End
{----------------------------------------/ 19 /------------------------------------------------------}
$Pattern	 SerDec: rule {trace}
$Relevant_resources
	Sys: Sy1			Keep	
	Tr:Transaction		Keep
 	DTr:Transaction		Create
	FTr:Transaction		Keep
$Body
Sys
	Choice from
	Sys.T_f = 1			{���������� �/�}
first 
Convert_rule
	T_f	set	1 - Pr_Inc( Sys.Pz_c - 1, 1)  {���� ��������� 1 �/�-� ��������� �/�}
	Pz_c	set	Sys.Pz_c - 1		  {��������� ������� �/�-�� �� 1}	
Tr
	Choice from
	Tr.Qu = -6 and [Tr.Act = R or Tr.Act = W ]
first
Convert_rule
	Qu	set	-6 - Pr_Inc( Sys.Pz_c, 1)	{���� �/� ���������, ����� ����.(go SerCom)}
DTr					{������ ���������}
Convert_rule  {trace}

Num	set	Tr.Num				{����� "��������" ������� �/� }
Pr	set	Tr.Pr				{�����. "��������" ������� �/� }
Soc	set	Tr.Soc				{��-�������� "��������" ������� �/� }
Qu	set	0
Act	set	B				{������������� "�� �������������"}
Ct	set	0
Kin	set	Tr.Kin				{��� �����}
Np	set	Sys.Pz_c			{����� �/�-� � �����}
Who	set	S
FTr
	Choice from
	FTr.Num = Tr.Num and FTr.Soc = Tr.Soc and FTr.Act = B and  {������� "����" �����-}
	FTr.Np = Gr_table( Sys.Pz_c - 1, Tr.Kin)			   { ������ �/�-�                 }
first
Convert_rule
	Ct	set	FTr.Ct + 1		{��������� ������� �/�-�� "�������" �� 1}
$End
{--------------------------��������� �����������-------------------------------------------}
{----------------------------------------/ 20 /------------------------------------------------------}
$Pattern	 FicSubInqMovPr: rule {trace}
$Relevant_resources
	DTr:Transaction		Keep
	ST:Station		Keep
	FL: RegFl		Keep	
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
DTr
	Choice from
	DTr.Qu = 0 and DTr.Act = B and DTr.Ct = 0 and Sq_table( DTr.Np, DTr.Kin) = -1
	{������� �/� ��������������� ��������� �������� ���������� �����}
first
Convert_rule
	Act	set	M					{���������� ���� ���������� 
									���������}
	Ct	set	FA_table( FF_table( DTr.Np,DTr.Kin))	{������ ���������� (���)}
ST
	Choice from
	ST.Num = FA_table( FF_table( DTr.Np,DTr.Kin))	{������� ������� "��������"}
first
Convert_rule
	Inq	set	ST.Inq + 1			{��������� ������� ���-�� �/�-�� 
						        ��������� ��������� � ������ �� �� 1}
FL
	Choice from
	FL.Num = ST.Num and FL.Who = S
first
Convert_rule
	En_f	set	0			{��������� ��������� �/�-��}
SQS
	Choice from
	SQS.Num = DTr.Np
first
Convert_rule
Arr	set	Ccm(Qst2(Pr_Inc(DTr.Num, CTr.Num) ,Pr_Inc(DTr.Soc, CTr.Soc)),MN,SQS.Arr)
CTr
	Choice NoCheck
first
$End
{----------------------------------------/ 21 /------------------------------------------------------}
$Pattern	 SubInqSerPr: rule {trace}
$Relevant_resources
	DTr:Transaction		Keep
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
DTr
	Choice from
	DTr.Qu = 0 and DTr.Act = B and DTr.Ct = 0 and Sq_table( DTr.Np, DTr.Kin) > 0
{������� �/� ��������������� �� ��������� ��������}
first
Convert_rule
	Act	set	P					{���������� ���� ���������� 
								  ��������� (go QueueInPr)}
SQS
	Choice from
	SQS.Num = DTr.Np
first
Convert_rule
Con	set	Ccn(Qst2(Pr_Inc(DTr.Num, CTr.Num) ,Pr_Inc(DTr.Soc, CTr.Soc)),PN,SQS.Con)
CTr
	Choice NoCheck
first
$End
{----------------------------------------/ 22 /------------------------------------------------------}
$Pattern	 SubInqSer: operation {trace}
$Parameters
	Par1:real
	Par2: real 
$Relevant_resources
	DTr:Transaction		Keep 		Keep
	ST:Station		Keep		Keep
	SQS:SubQ		Keep		Keep
	CTr:AT			NoChange	NoChange
$Time = Proc_Fun( Par1, Par2)
$Body
DTr
	Choice from
	DTr.Qu = -5 and DTr.Act = P		{���� ���-�� ����� �� ������� ��������  
							��������� �/� �� ��}
first
Convert_begin
	Qu	set	-6			{������ ���������}
Convert_end					{��������� ���������}
	Act	set	M				{���������� ���� ���������� 
									���������}
	Ct	set	Sq_table( DTr.Np, DTr.Kin)	{������ ���������� (���)}
ST
	Choice from
	ST.Con = F and ST.Num = Sq_table( DTr.Np, DTr.Kin)
	{������� �� ��������������� �� ��������� ��������}
first
Convert_begin
	Con	set	P			{������ ���������}
Convert_end					
	Con	set	F			{��������� ���������}
	Inq	set	ST.Inq + 1		{��������� ������� ���-�� �/�-�� 
						        ��������� ��������� � ������ �� �� 1}
SQS
	Choice from
	SQS.Num = DTr.Np
first
Convert_begin
Con	set	Ccn(Qst2(Pr_Inc(DTr.Num, CTr.Num) ,Pr_Inc(DTr.Soc, CTr.Soc)),PS,SQS.Con)
Convert_end
Con	set	Ccn(Qst2(Pr_Inc(DTr.Num, CTr.Num) ,Pr_Inc(DTr.Soc, CTr.Soc)),PE,SQS.Con)
Arr	set	Ccm(Qst2(Pr_Inc(DTr.Num, CTr.Num) ,Pr_Inc(DTr.Soc, CTr.Soc)),MN,SQS.Arr)
CTr
	Choice NoCheck
first
$End
{----------------------------------------/ 23 /------------------------------------------------------}
$Pattern	 SubInqMov: rule {trace}
$Parameters
	Par1:integer
	Par2:integer
$Relevant_resources
	ST:Station		Keep
	DTr:Transaction		Keep
	Sys: Sy1			Keep
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
ST
	Choice from
	ST.Con = F and ST.Inq > 0           {������� �� � �������� �/�-�� ��������� ���������}
with_max(ST.Inq)
Convert_rule
	Con	set	R		{ ������� � ��������� ���������}
	Wei set (1 - Pr_Inc(ST.Num,Sq_table(Gr_table(DTr.Np,DTr.Kin),DTr.Kin))) * 
	(Wei_Fun(Par1,Par2)  + 1)	{��� ������ ����. ���������,���� ����� ���������}
					{0,���� �/� "����" ����� �������������� �����-��  }
	Inq	set	ST.Inq - 1	{��������� ������� ���-�� �/�-�� 
						        ��������� ��������� � ������ �� �� 1}
DTr
	Choice from
	DTr.Act = M and DTr.Ct = ST.Num and Gr_table(DTr.Np,DTr.Kin) > 0
with_max( DTr.Pr)	{������� �/� ��������� ��������� � ������ ��}
Convert_rule
	Ct	set	0 - DTr.Ct	{�������� ���}
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c + 1  {INC  ������� ���-�� �� ����������� � ���������}
SQS
	Choice from
	SQS.Num = DTr.Np
first
Convert_rule
Arr	set	Ccm(Qst2(Pr_Inc(DTr.Num, CTr.Num) ,Pr_Inc(DTr.Soc, CTr.Soc)),MS,SQS.Arr)
CTr
	Choice NoCheck
first
$End
{----------------------------------------/ 24 /------------------------------------------------------}
$Pattern	 TopSubInqMov: rule {trace}
$Parameters
	Par1:integer
	Par2:integer
$Relevant_resources
	ST:Station		Keep
	DTr:Transaction		Keep
	Sys: Sy1			Keep
$Body
{�� ��������� ����� ��� � ���������� ������� ,�� ��� �\�-� "�����" �����-"������"}
ST
	Choice from
	ST.Con = F and ST.Inq > 0
with_max(ST.Inq)
Convert_rule
	Con	set	R
	Wei set (1 - Pr_Inc(ST.Num,DTr.Soc)) * (Wei_Fun(Par1,Par2)  + 1)
	Inq	set	ST.Inq - 1
DTr
	Choice from
	DTr.Act = M and DTr.Ct = ST.Num and Gr_table(DTr.Np,DTr.Kin) = -1
with_max( DTr.Pr)
Convert_rule
	Ct	set	0 - DTr.Ct
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c + 1
$End
{----------------------------------------/ 25 /------------------------------------------------------}
$Pattern	 Move: operation {trace}
$Parameters
	Nm:integer[1..256]	{���-�� �� � ����}
	Cir_t:real		{����� ��������� 1������ ������ � 1 ��}
$Relevant_resources
	Sys: Sy1		Keep	Keep
$Time = Cir_t * Sys.M_c		{���� ��������� 1 ������ ������ � ������ �� ��}
$Body
Sys
	Choice from
	Sys.M_f = 0 and Sys.O_c = Nm  + 1 and Sys.M_c > 0
	{���� ���������� ���������� ���� ���������� ���� ������ �� 1 � ���. �� ����. ���������}
first 
Convert_begin			
	M_f	set	1	{��������� ���� ���������� ���� ������ �� 1}
Convert_end
	M_f	set	0	{ ��������� ���� ���������� ���� ������ �� 1}
	O_c	set	1	{���������� ������� �� �� �1}
$End
{----------------------------------------/ 26 /------------------------------------------------------}
$Pattern	 OutWei: rule {trace}
$Relevant_resources
	Sys: Sy1			Keep	
	ST:Station		Keep
$Body
Sys
	Choice from
	Sys.M_f  = 0 and Sys.M_c > 0	{���� ���������� ���� ������ �� 1}
first 
Convert_rule
	O_c	set	Sys.O_c + 1	{��������� ������� �� �� 1}
ST
	Choice from
	ST.Num = Sys.O_c
first
Convert_rule
	Wei	set	ST.Wei  - 1	{���������� ���� ������������� ������ �� 1}
$End
{----------------------------------------/ 27 /------------------------------------------------------}
$Pattern	 EndSubInqMov: rule {trace}
$Relevant_resources
	ST:Station		Keep
	DTr:Transaction		Keep
	Sys: Sy1			Keep	
	FL: RegFl		Keep	
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
ST
	Choice from
	ST.Wei  <= 0 and ST.Con = R	{������� �� ����������� ���� �����}
first
Convert_rule
	Con	set	F		{�������� � �� ������� ���������}
DTr
	Choice from
	DTr.Act = M and DTr.Ct = 0 - ST.Num {������� �/� ,������� ����������� ���������}
first
Convert_rule
	Ct	set	0		{�������� � ���� ������� ���������}
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c - 1	{DEC ������� ���-�� �� ����������� � ���������}
	O_c	set	Sys.O_c - Pr_Inc(Sys.M_c,0) * (Sys.O_c - 1) 
	{���� ���������� ���� �� ,���������� ������� �� �� �1 }
FL
	Choice from
	FL.Num = ST.Num and FL.Who = S
first
Convert_rule
	En_f	set	Pr_Inc( ST.Inq, 0)	{��������� ��������� �/�-�� �� ��, ���� ��� 
							�� ����� ����������� �� ���������}
SQS
	Choice from
	SQS.Num = DTr.Np
first
Convert_rule
Arr	set	Ccm(Qst2(Pr_Inc(DTr.Num, CTr.Num) ,Pr_Inc(DTr.Soc, CTr.Soc)),ME,SQS.Arr)
CTr
	Choice NoCheck
first
$End
{----------------------------------------/ 28 /------------------------------------------------------}
$Pattern	 SubInqCom: rule {trace}
$Relevant_resources
	DTr:Transaction		Erase
	FTr:Transaction		Keep
$Body
DTr
	Choice from
	DTr.Act = M and DTr.Ct = 0 and Gr_table( DTr.Np, DTr.Kin) > 0
	{������� �/� ,������� �������� ���������, � ����� ���}
first
FTr
	Choice from
	FTr.Num = DTr.Num and FTr.Soc = DTr.Soc and FTr.Act = B and
FTr.Np = Gr_table( DTr.Np, DTr.Kin)	{������� "����" �������}
first
Convert_rule
	Ct	set	FTr.Ct - 1	{DEC ������� �/�-�� "�������" }
$End

{----------------------------------���������� �����������--------------------------------------------}
{----------------------------------------/ 29 /------------------------------------------------------}
$Pattern	 SerCom: rule {trace}
$Relevant_resources
	DTr:Transaction		Erase
	FTr:Transaction		Keep
$Body
DTr
	Choice from
DTr.Act = M and DTr.Ct = 0 and Gr_table( DTr.Np, DTr.Kin) = -1
	{������� �/�-"������" ,������� �������� ���������, � ����� ���}
first
FTr
	Choice from
	FTr.Num = DTr.Num and FTr.Soc = DTr.Soc and FTr.Qu = -7 and
	[FTr.Act = R or FTr.Act = W ]		{������� "����"(������ ��������) �������}
first
Convert_rule
	Qu	set	-8			{����. ������� ����������}
$End

{ -----------------------------------------------------�������������  ������------------------------------ }
{----------------------------------------/ 30 /------------------------------------------------------}
$Pattern	 FiDeBlPr : rule {trace}
$Relevant_resources
	Tr:Transaction	Keep
	Sys:Sy		Keep	
$Body
Tr
	Choice from
	Tr.Qu = -8 and [Tr.Act = R or Tr.Act = W ] {������� ������ ����. ,�������� ����������}
first
Convert_rule
	Qu	set	-9			{������������ ������������� ������}
Sys
	Choice from
	Sys.T_f = 0				{���� ������� ��������}
first 
Convert_rule
	T_f	set	1			{������ �������}
	F_c	set	1			{������� ������ ���. �� �1}
$End
{----------------------------------------/ 31 /------------------------------------------------------}
$Pattern	 FiDeBlock: rule {trace}
$Relevant_resources
	Tr:Transaction	Keep
	Sys: Sy		Keep
	Fi:File		Keep
	FL: RegFl	Keep

$Body
Tr
	Choice from
	Tr.Qu = -9 and [Tr.Act = R or Tr.Act = W ]
first
Convert_rule
	Qu	set	-9 - Pr_Inc(0,FF_table(Sys.F_c + 1,Tr.Kin))	{-10,���� ������ ��������� 
								����. ���������(����)}
Sys
	Choice from
	Sys.T_f = 1						
first 
Convert_rule
	T_f	set	1 - Pr_Inc(0,FF_table(Sys.F_c  + 1, Tr.Kin))	{0,���� ������ ��������� 
								����. ���������(����)}
	F_c	set	Sys.F_c + 1				{INC ������� ������}
	Q_f	set	1					{�������������� �������
								  ��������� ������� ��. 
									������ �� ������}
	Q_s	set	1					{������� ������ � �1}
Fi
	Choice from
	Fi.Num = FF_table(Sys.F_c , Tr.Kin)	{������� �������������� ����}
first
Convert_rule
	AccV	set	Fi.AccV + CirFun( Fi.AccV )	{�������� ���������� �������, ���� 
							  ���� ���������� �� ������ ��� DEC							   ,���� �� ������}
FL
	Choice from
	FL.Num = Fi.Num and FL.Who = F
first
Convert_rule
	En_f	set	Pr_Inc(Fi.AccV, 0)	              {��������� ������ � �����(��R&W)}
$End
{----------------------------------------/ 32 /------------------------------------------------------}
$Pattern	 SerEnd: rule {trace}
$Relevant_resources
	Tr:Transaction			Erase
	STr: Transaction_Time_Statistics	Erase
	FL: RegFl			Keep	
$Body
Tr	
	Choice from
	Tr.Qu = -10 and [Tr.Act = R or Tr.Act = W ]
	{������� ������, ����������� ������������� ������ � ����� ���}
first
STr
	Choice from
	STr.Num = Tr.Num and STr.Soc = Tr.Soc
	{������� ��������������� �������� ������� ������� � ������� ��� ������}
first
FL
	Choice from
	FL.Num = Tr.Soc and FL.En_f = 0 and FL.Who = A
first
Convert_rule
	En_f	set	1		{��������� ����� �� ������� �������� �����. ��}
$End	

{ / 33 / -  - }
$Pattern	 Get_Transaction_Statistic : rule {trace} 
$Relevant_resources
	Tr:Transaction			Keep
	STr: Transaction_Time_Statistics	Create
$Body
Tr
	Choice from
	Tr.Who = M and Tr.Qu = 0 and Tr.Act = Q		{������� �������� (������)}	
first
Convert_rule
Act	set	I			{��������� ��� ����� � ������� ��������}
STr					{������ ��� ��������������� ��������}
Convert_rule	{trace}
Num	set	Tr.Num 
Pr	set	Tr.Pr
Soc	set	Tr.Soc 
Cr_time	set	Time_now
$End

{/34/--}
$Pattern	 Cartoon :rule
$Relevant_resources
	Sys:Sy1		Keep
$Body
Sys
	Choice from
	Sys.An_f = 0
first
Convert_rule
	An_f	set	1
$End

{ / 35 / -��������� ����� /33/  - }
$Pattern	 CreateAnTr: rule {trace} 
$Relevant_resources
	Sys:Sy1				Keep
	Tr:Transaction			NoChange
	STr:AT				Keep
$Body
Sys
	Choice from
	Sys.An_f = 1
first
Convert_rule
	An_f	set	2
	X_ct	set	0
	Lev	set	0
Tr
	Choice from
	Tr.Who = M and Tr.Qu = 0 and Tr.Act = Q
first
STr
	Choice NoCheck
first					
Convert_rule
Num	set	Tr.Num 
Pr	set	Tr.Pr
Soc	set	Tr.Soc
Act	set 	Tr.Act 
Cr_time	set	Time_now
Qu	set	0
F_c	set	0
Ct	set	0
Cn	set	0
Pz_c	set	0
$End

{/36/-}
$Pattern	 QuAnTr: rule {trace} 
$Relevant_resources
	Sys: Sy1				NoChange
	STr:AT				Keep
	Tr:Transaction			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice NoCheck
first					
Convert_rule 
Qu	set	Tr.Qu
Tr
	Choice from
	Tr.Who = M and Tr.Num = STr.Num and Tr.Soc = STr.Soc and Tr.Qu <> STr.Qu
first
$End

{/37/-}
$Pattern	 ActAnTr: rule {trace}
$Relevant_resources
	Sys:Sy1				NoChange
	STr:AT				Keep
	Tr:Transaction			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice NoCheck
first					
Convert_rule 
Act	set	Tr.Act
Tr
Choice from
	Tr.Who = M and Tr.Num = STr.Num and Tr.Soc = STr.Soc and Tr.Act <> STr.Act
first
$End

{/38/-}
$Pattern	 KinAnTr: rule {trace}
$Relevant_resources
	Sys:Sy1				NoChange
	STr:AT				Keep
	Tr:Transaction			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice NoCheck
first					
Convert_rule 
Kin	set	Tr.Kin
Tr
	Choice from
	Tr.Who = M and Tr.Num = STr.Num and Tr.Soc = STr.Soc and Tr.Kin <> STr.Kin
first
$End

{/39/-}
$Pattern	 RedFiOn: rule {trace}
$Relevant_resources
	Ss:Sy1				NoChange
	STr:AT				Keep
	Sys: Sy				NoChange
	Fi:File				Keep
$Body
Ss
	Choice from
	Ss.An_f = 2
first
STr
	Choice from
	STr.Qu = -2 and STr.F_c <> Sys.F_c 
first					
Convert_rule 
F_c	set	Sys.F_c
Sys
	Choice from
	Sys.T_f = 1
first
Fi
	Choice from
	Fi.Num = FF_table(Sys.F_c , STr.Kin)
first
Convert_rule
	Red	set	On
$End
{/40/-}
$Pattern	 CtAnTr: rule {trace}
$Relevant_resources
	Sys: Sy1				NoChange
	STr:AT				Keep
	Tr:Transaction			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice from
	STr.Qu = -3
first					
Convert_rule 
F_c	set	0
Ct	set	Tr.Ct
Cn	set	STr.Cn + 1
Tr
	Choice from
	Tr.Who = M and Tr.Num = STr.Num and Tr.Soc = STr.Soc and Tr.Ct <> STr.Ct
first
$End

{/41/-}
$Pattern	 GreenFiOn: rule {trace}
$Relevant_resources
	Ss: Sy1		NoChange
	STr:AT		Keep
	Sys: Sy		NoChange
	Fi:File		Keep
$Body
Ss
	Choice from
	Ss.An_f = 2
first
STr
	Choice from
	STr.Qu = -3 and STr.Cn > 1
first					
Convert_rule
	Cn	set	1
Sys
	Choice NoCheck
first
Fi
	Choice from
	Fi.Num = Sys.Nf
first
Convert_rule
	Red	set	Off
	Green	set	On
$End

{/42/-}
$Pattern	 AnTrEr: rule {trace}
$Relevant_resources
	Ss: Sy1		Keep
	Tr:AT		NoChange
$Body
Ss
	Choice from
	Ss.An_f = 2
first
Convert_rule
An_f	set	0
Tr
	Choice from
	Tr.Qu = -10
first
$End

{/43/-}
$Pattern	 FiOff: rule {trace}
$Relevant_resources
	Ss:Sy1				NoChange
	STr:AT				Keep
	Sys: Sy				NoChange
	Fi:File				Keep
$Body
Ss
	Choice from
	Ss.An_f = 2
first
STr
	Choice from
	STr.Qu = -9 and STr.F_c <> Sys.F_c 
first					
Convert_rule 
F_c	set	Sy.F_c
Sys
	Choice from
	Sys.T_f = 1
first
Fi
	Choice from
	Fi.Num = FF_table(Sys.F_c , STr.Kin)
first
Convert_rule
	Green	set	Off
$End

{/44/-}
$Pattern	 SubInqGr: rule {trace}
$Relevant_resources
	Ss:Sy1				Keep
	SQS:SubQ			Keep
	SQFd:SubQ			NoChange
	STr:AT				Keep
$Body
Ss
	Choice from
	Ss.An_f = 2 and Ss.T_f < 3
first
Convert_rule 
X_ct	set	( Ss.X_ct  + 1) *  Pr_Inc(SQFd.Lev + 1, Ss.Lev)
Lev	set	Ss.Lev + 1- Pr_Inc(SQFd.Lev + 1, Ss.Lev)
SQS
	Choice from
	SQS.Num = Ss.Pz_c
first
Convert_rule
Lev	set	SQFd.Lev + 1 
X_c	set	X_nul + Ss.X_ct * X_step	- 10 * SQS.Lev 
Y_c	set	Y_nul + SQS.Lev * Y_step
Con	set	EX
SQFd
	Choice from
	SQFd.Num = Gr_table(Ss.Pz_c, STr.Kin)
first
STr
	Choice from
	STr.Qu = -6 and STr.Pz_c <> Ss.Pz_c 
first					
Convert_rule 
Pz_c	set	Ss.Pz_c
$End

{/45/-}
$Pattern	 GrOff: rule {trace}
$Relevant_resources
	Ss:Sy1				NoChange 
	SQS:SubQ			Keep
$Body
Ss
	Choice from
	Ss.An_f = 0
first
SQS
	Choice from
	SQS.Arr <> Off or SQS.Con <> Off
first
Convert_rule
Con	set	Off
Arr	set	Off
$End

