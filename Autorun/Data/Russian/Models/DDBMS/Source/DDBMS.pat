
{-------------------------���������  ��������------------------------------------------}
{ / 1 / - ����������� ������� �� ������������
          \��������� ����� ������� � ������ ��������\}
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
{ / 2 / - �������  �� ����� ������� � �������� ��������������� ���������}
$Pattern	 Generate : rule {trace} 
$Relevant_resources
	Sys:Sy				Keep
	Cn:�������			Keep
	Tr:����������		Create
$Body
Sys
	Choice from
	Sys.Fl_g = 1
first
Convert_rule
	Fl_g	set	0
Cn
	Choice from
	Cn.����� = Sys.N_g and Cn.��� = A
first
Convert_rule
	C_t	set	Cn.C_t + 1
Tr	
Convert_rule	{trace}
�����	                set	Cn.C_t			          {����� ����������}
���������	        set	Pr_ch(���������_hst( Cn.����� ))  {��������� �������}
��������_�������	set	Cn.�����			  {�������� �������}
�����_�������   	set	0
���������	        set	Q
��               	set	0
���              	set	1
���                     set	0
���              	set	M
$End
{----����� �� ������ ������ / 33 / - Get_Transaction_Statistic-}
{-----------------------------------------����  �  �������-----------------------------------------------}
{/ 3 / - ���� ���������� � ������� �������������� � ����������}
$Pattern	 QueueInPr : rule	{trace} 
$Parameters
	Par: such_as �������.���	        {��� �������:�������, ����(�� ������), ��(�� �����.)}
$Relevant_resources
	Tr:����������		Keep
	Cn:�������		Keep
	FL:RegFl		Keep
$Body
Tr
	Choice from
	Tr.�����_������� = 0 and Tr.��������� = Cmt1(Par) 
first
Convert_rule
�����_�������      set   Cn.C_p1 * Qst(1, Tr.���������) + Cn.C_p2 * Qst(2, Tr.���������)
              + Cn.C_p3 * Qst(3, Tr.���������) + 1
��	set	Cmt( Par, 0, 1 + Cn.C_t)
Cn
	Choice from
	Cn.����� = Cmt(Par, Tr.��������_�������, Mux(Par, Tr.���,
                   Aws(Par, Tr.���,Tr.���))) and  Cn.��� = Par
first
Convert_rule
	C_t	set	Cmt(Par, Cn.C_t, Cn.C_t + 1)
	C_n	set	Cmt(Par, Tr.�����, Tr.��)
	C_q	set	Tr.�����_�������
	C_p1	set	Cn.C_p1 + Pr_Inc(1, Tr.���������)
	C_p2	set	Cn.C_p2 + Pr_Inc(2, Tr.���������)		
	C_p3	set	Cn.C_p3 + Pr_Inc(3, Tr.���������)		
FL
	Choice from
           FL.����� = Cmt(Par, Tr.��������_�������, Mux(Par, Tr.���,
           Aws(Par, Tr.���,Tr.���))) and FL.Fl_O = 0 and FL.Fl_I = 0 
           and FL.��� = Par
first
Convert_rule
	Fl_I	set	1		{���������� ���� ����� � �������}
	Sum	set	FL.Sum + 1	{INC ������� ������ �������}
$End
{/ 4 / - ����������� ������� � ����� � ������ ����� ����������}
$Pattern	 QueueIn : rule {trace} 
$Parameters
	Par: such_as �������.���
$Relevant_resources
	FL:RegFl		NoChange
	Cn:�������		Keep
	Tr:����������		Keep
$Body
FL
	Choice from
	FL.Fl_I = 1 and FL.��� = Par	{���� ���. ���� �����}
first
Cn
	Choice from
	Cn.����� = FL.����� and Cn.��� = Par
first
Convert_rule
	C_n	set	Cmt( Par, Tr.�����, Tr.��)
	C_q	set	Tr.�����_������� + 1 
Tr
	Choice from
	Tr.��������� = Cmt1(Par) and Cmt(Par, Tr.��������_�������, 
                 Mux(Par, Tr.���, Aws(Par,Tr.���,Tr.���))) = Cn.�����
                 and Tr.�����_������� = Cn.C_q  and Cmt(Par, Tr.�����, Tr.��) <> Cn.C_n
first
Convert_rule
	�����_�������	set	Tr.�����_������� + 1
$End
{/ 5 /-����� ����� ����� � ������� ����� � ��������������----------------------------------}
$Pattern	 ResInFl : rule {trace} 
$Parameters
	Par: such_as �������.���
$Relevant_resources
	FL:RegFl		Keep
	Cn:�������		NoChange
$Body
FL
	Choice from
	FL.Fl_I = 1 and FL.��� = Par
first
Convert_rule
	Fl_I	set	0
Cn
	Choice from
Cn.C_q = Cn.C_p1 + Cn.C_p2 + Cn.C_p3 and Cn.����� = FL.����� and Cn.��� = Par
first
$End

{-----------------------------�����  ��  �������-----------------------------------}
{/ 6 / - ����� ���������� �� ������� ��� ��������� ����� ���������� ������}
$Pattern	 QueueOutPr : rule {trace} 
$Parameters
	Par: such_as �������.���
$Relevant_resources
	FL:RegFl		Keep
	Cn:�������		Keep
	Tr:����������		Keep
$Body
FL
	Choice from
	FL.Fl_O = 0 and FL.Fl_I = 0 and FL.En_f = 1 and FL.��� = Par
	                                  {���� �������� ����� �� �������}
with_max( FL.Sum )
Convert_rule
	Fl_O	set	1		{���������� ���� ������ �� �������}
	En_f	set	0		{��������� ����� �� �������}
	Sum	set	FL.Sum  - 1	{DEC ������� ������ �������}
Cn
	Choice from
	Cn.����� = FL.����� and Cn.��� = Par
first	
 Convert_rule
	C_q	set	2
	C_p1	set	Cn.C_p1 - Pr_Inc(1, Tr.��������� )
	C_p2	set	Cn.C_p2 - Pr_Inc(2, Tr.��������� )		
	C_p3	set	Cn.C_p3 - Pr_Inc(3, Tr.��������� )		
Tr
	Choice from
	Tr.��������� = Cmt1(Par) and		{������ ������ �� ���������}
	Tr.�����_������� = 1 and
	Cmt( Par, Tr.��������_�������, Mux(Par, Tr.���, Aws(Par,Tr.���,Tr.���))) = FL.����� 
first
Convert_rule
	�����_�������	set	Cmt( Par, -1, -5)
$End
{/ 7 /-����������� ������� � ����� � ������� �� ��� ����������}
$Pattern	 QueueOut : rule {trace} 
$Parameters
	Par: such_as �������.���
$Relevant_resources
	FL:RegFl		NoChange
	Cn:�������		Keep
	Tr:����������    	Keep
$Body
FL
	Choice from
	FL.Fl_O = 1 and FL.��� = Par
first
Cn
	Choice from
	Cn.����� = FL.����� and Cn.��� = Par
first
Convert_rule
C_q	set	Cn.C_q + 1
Tr
	Choice from
	Tr.��������� = Cmt1(Par) and Tr.�����_������� = Cn.C_q and Cmt(Par, Tr.��������_�������, 
                 Mux(Par, Tr.���, Aws(Par, Tr.���,Tr.���))) = FL.����� 
first
Convert_rule
	�����_�������	set	Tr.�����_������� - 1
$End
{/ 8 / - ����� ����� ������ �� ������� ����� � �����������}
$Pattern	 ResOutFl : rule {trace} 
$Parameters
	Par: such_as �������.���
$Relevant_resources
	Cn:�������	Keep
	FL:RegFl	Keep
$Body
Cn
	Choice from
Cn.��� = Par and Cn.C_q = Cn.C_p1 + Cn.C_p2 + Cn.C_p3 + 2
first
Convert_rule
	C_q	set	0
FL
	Choice from
	FL.����� = Cn.����� and FL.Fl_O = 1 and FL.��� = Par
first
Convert_rule
	Fl_O	set	0
$End

{ -------------------------------����������  ������------------------------------ }
{/ 9 / - ���������� � ������������ ������ �� ������������� ����������}
$Pattern	 FiDecPr : rule {trace}
$Relevant_resources
	Tr:����������	Keep
	Sys:Sy		Keep	
$Body
Tr
	Choice from
	Tr.�����_������� = -1 and Tr.��������� = I	{���� ���-�� ����� �� ������� ���������}
first
Convert_rule
	�����_�������  set	-2		         {������������ ���������� ������}
	���������	set	R_W_Fun		       {��������� ��: -������ ��� ������}
	���	set	Pr_ch( Kin_hst( Tr.��������_�������))	{ - ��� ����� }
Sys
	Choice from
	Sys.T_f = 0				{���� ������� ��������}
first 
Convert_rule
	T_f	set	1			{������ �������}
	F_c	set	1			{������� ������ ���. �� �1}
$End 

{/ 10 / - ������������ ������ �� ������������� ����������}
$Pattern	 FiDec: rule {trace}
$Relevant_resources
	Tr:����������    	Keep
	Sys: Sy			Keep	
	DTr:����������		Create
$Body
Tr
	Choice from
	Tr.�����_������� = -2 and [Tr.��������� = R or Tr.��������� = W ]
first
Convert_rule
	�����_�������  set  -2 - Pr_Inc(0,FF_table(Sys.F_c + 1,Tr.���)) {-3,���� ������ ��������� 
								��������� ���������(����)}
	��  set	 Tr.�� + 1 	         {������� ������, ����������� ������� ��������}
Sys
	Choice from
	Sys.T_f = 1
first 
Convert_rule
	T_f  set  1 - Pr_Inc(0,FF_table(Sys.F_c  + 1, Tr.���)) {0 ,���� ������ ���������
                                                                  ��������� ���������(����)}
	F_c  set  Sys.F_c + 1
	Q_c  set  Sys.Q_c + ActComp( Tr.��������� ,R )	{��������� '�������' ��������� �����-
 							������(���������� ����� !!*�� ������ only*!!)
  							������������� �� 1}
	Q_f  set  ActComp( Tr.��������� ,R )		{1,���� ������ �� ������ (�������������� �������
                                                ��������� ������� (���������� ����� !!!*�� ������ only*!!!)}
	Q_s  set  1				{������� ������ � �1}
DTr
Convert_rule  {trace}
�����	           set	Tr.�����		{����� "��������" ������� ����������}
���������	   set	Tr.���������		{��������� "��������" ������� ����������}
��������_�������   set	Tr.��������_�������     {��-�������� "��������" ������� ����������}
�����_�������      set	Sys.Q_c * ActComp(Tr.��������� , R)	{���������� ����� � ��������� '�������' ���������
                                                �����������(��.����� !!!*�� ������*!!!)}
���������          set	Tr.���������
��                 set	-1
���                set	FF_table(Sys.F_c - 1, Tr.���)	{����� ������������ ��������� ����������� ����� }
���      	  set	0
���                set	F
$End

{/ 11 / - ���������� ����� �� ������ � ����������� ������������� ����������}
$Pattern	 RdFiAcc: operation {trace}
$Parameters
	Par:real
$Relevant_resources
	Sys: Sy			Keep		Keep	
	TrD:����������		Erase		NonExist
	Fi:����			Keep		NoChange
	Tr:����������		NoChange 	Keep
	FL:RegFl		Keep		NoChange 	
$Time = Par
$Body
Sys
	Choice from
	Sys.Q_f = 1			{���� ������� ���� �������� ��������� �������
                                        (���������� ����� !!!*�� ������ only*!!!)}
first
Convert_begin
	Q_c  set  Sys.Q_c - 1		         {���������� ��������� '�������' �� 1}
	Q_f  set  -1 + Pr_Inc( Sys.Q_c + 1, Sys.Q_s) {-1,���� �� ��������� '�������' 
                                                  ����� �� ��������� ��������� (go RdQuOu); 
						 0,���� ����� ���������(��������� �������)}
Convert_end
{**}	Nf  set  Fi.�����
TrD
	Choice from
	TrD.�� = -1 and TrD.�����_������� = Sys.Q_s and  TrD.��������� = R	{������ �������}
first
Fi
	Choice from
	Fi.����� = TrD.���  and  Fi.������ >= 0	{���� ���� �� ������������ �� ������}
first
Convert_begin
	������  set  Fi.������ + 1   	{������������� ���� (��������������� 
					�������� ���������� ����������) �� ������ }
Tr
	Choice from
	Tr.�����_������� = -3 and Tr.��������_������� = TrD.��������_������� and 
                 Tr.����� = TrD.����� and Tr.��������� = R
first
Convert_end
	��  set  Tr.�� - 1	        {��������� ���������� ����������������� ������
                                        (� ������ ������� "��������") �� 1}
FL
	Choice from
	FL.Sum = 0 and FL.����� = TrD.��� and FL.��� = F {���� ���� �� ����� �����������
                                                          �� ������}
first
Convert_begin
	En_f	set	0		{��������� ������������� ������ � 
					����� ����������� �� ������}
$End

{/ 12 / - ���������� ����� �� ������ � ����������� ������������� ����������}
$Pattern	 WrFiCom: operation {trace}
$Parameters
	Par:real
$Relevant_resources
	TrD:����������		Erase		NonExist
	Fi:����			Keep		NoChange
	Tr:����������		NoChange	Keep
	Sys: Sy			NoChange	Keep	
$Time = Par
$Body
TrD
	Choice from
	TrD.�����_������� =  -5 and  TrD.��������� = W	    {���� ���-�� ����� �� ������� ���������� 
					    ����� �� ������}
first
Fi
	Choice from
	Fi.����� = TrD.��� and Fi.������ = 0  	{���� ������ ��� ���� ��������}
first
Convert_begin
	������	set	 -1			{������������� ���� �� ������}
Tr
	Choice from
	Tr.�����_������� = -3 and Tr.��������_������� = TrD.��������_������� and
                Tr.����� = TrD.����� and Tr.��������� = W
first
Convert_end
	��	set	Tr.�� - 1     {��������� ���������� �����������������
                                      ������ (� ������ ������� "��������") �� 1}
Sys
	Choice NoCheck
first
Convert_end
{**}	Nf	set	Fi.�����
$End

{/ 13 / - ������� ����������, ����������� �� ������}
$Pattern	 RdQuC: rule {trace}
$Relevant_resources
	Sys: Sy			Keep	
$Body
Sys
	Choice from
	Sys.Q_f = 1			{���� ������� ���� �������� �������:}
first
Convert_rule
	Q_f  set  1 - Qst( Sys.Q_s, Sys.Q_c) {-�������� ����, ���� ��������� ����� �������}   
	Q_s  set  Sys.Q_s + 1	             {-������� �� ��������� �� ������� ���������}	
$End

{/ 14 / - ������� ����������, ����������� �� ������}
$Pattern	 RdQuOu: rule {trace}
$Relevant_resources
	Sys: Sy			Keep	
	Tr:����������		Keep
$Body
Sys
	Choice from
	Sys.Q_f = -1		{,���� �� ������� ���-�� ����� (�� ���������):}
first
Convert_rule
	Ch_n  set  Sys.Q_s	{-��������� ��� ���������� ����� � �������}
	Q_f   set   1           {-�������������� ����� �������}
	Q_s   set   1	        { � �1}
Tr
	Choice from
	Tr.�� = -1 and Tr.��������� = R and Tr.�����_������� = Sys.Q_c + 1 {-������� ���������� �� �������}
first
Convert_rule
	�����_�������	set	Sys.Ch_n			{� ��������� �� ��� �����}
$End

{/15 / - ��������� ���������� ������, ����������� � �������}
$Pattern	 FiCom: rule {trace}
$Relevant_resources
	Tr:����������		Keep
$Body
Tr	
	Choice from
	Tr.�����_������� = -3 and Tr.�� = 0 and
               [Tr.��������� = R or Tr.��������� = W ] {���� ������� ������,
                                      ������� ������������ ��� ����������� ��� �����}
first
Convert_rule
	�����_�������	set	-4			      {�������� ���}	
$End	

{----------------------------------������������ �������  ��  ����������----------------------}
{/ 16 / - ���������� � ������������ ������� �� ����������}
$Pattern	 SerDecPr : rule {trace}
$Relevant_resources
	Tr:����������	Keep
	Sys:Sy1		Keep	
$Body
Tr
	Choice from
	Tr.�����_������� = -4 and [Tr.��������� = R or Tr.��������� = W ]		{��. ����.}
first
Convert_rule
	�����_�������	set	-6		{�������� ������ ��� ������������}
Sys
	Choice from
	Sys.T_f = 0			{���� ������� ��������}
first 
Convert_rule
	T_f	set	3		{���������� ���� �������� ������������}
	Pz_c	set	1		{���������� ������� �� 1}
$End 

{/ 17 / - ���������� � ������� �������������� ����������} 
$Pattern	 CouDecPr : rule {trace}
$Relevant_resources
	Tr:����������	NoChange
	Sys:Sy1		Keep	
$Body
Tr
	Choice from
	Tr.�����_������� = -6 and [Tr.��������� = R or Tr.��������� = W ]	{������� ���������� ������}	
first
Sys
	Choice from
	Sys.T_f = 3			{���� ���������� ���� �������� ������������}
first 
Convert_rule
	T_f   set  3 - Pr_Inc(Gr_table( Sys.Pz_c,Tr.���), -1) {���������� ����
                                            ������������ 2, ���� ��������� ������ 
                                            ����� ����������� (������� ����� ���������
                                            ���������� ����������� +1 )}
	Pz_c  set  Sys.Pz_c + 1		{������� ��������� �� 1}
$End

{/ 18 / - ��������� �������������� ����������}
$Pattern	 TopSubInqPr : rule {trace}
$Relevant_resources
	Sys:Sy1			Keep
	Tr:����������		Keep
	DTr:����������		Create
$Body
Sys
	Choice from
	Sys.T_f = 2			{���� ���������� ���� ������������}
first 
Convert_rule
	T_f   set  1 - Pr_Inc( Sys.Pz_c - 1, 1)	{���� ���������-������ ������������,
                                                �� ��������� ������������}
	Pz_c  set  Sys.Pz_c - 1			{��������� ������� ����������� �� 1}
Tr
	Choice from
	Tr.�����_������� = -6 and [Tr.��������� = R or Tr.��������� = W ]
first
Convert_rule
	�����_�������	set	-6 - Pr_Inc( Sys.Pz_c, 1)   {���� ������������ ���������,
                                                    ����� ������������� (go SerCom)}
DTr						    {������ ���������-������}
Convert_rule  {trace}
�����	          set	Tr.�����		{����� "��������" ������� ���������� }
���������	  set	Tr.���������		{��������� "��������" ������� ����������}
��������_�������  set	Tr.��������_�������	{��-�������� "��������" ������� ����������}
�����_�������     set	0
���������         set	B
��                set	0
���               set	Tr.���			{��� �����}
���	          set	Sys.Pz_c			{����� ���������� � �����}
���               set	S
$End

{/ 19 / - ������������ ������� �� ����������}
$Pattern	 SerDec: rule {trace}
$Relevant_resources
	Sys: Sy1			Keep	
	Tr:����������		Keep
 	DTr:����������	Create
	FTr:����������		Keep
$Body
Sys
	Choice from
	Sys.T_f = 1			{���������� ������������}
first 
Convert_rule
	T_f   set  1 - Pr_Inc( Sys.Pz_c - 1, 1)  {���� ��������� ������ ���������,
                                                      ��������� ������������}
	Pz_c  set  Sys.Pz_c - 1		         {��������� ������� ����������� �� 1}	
Tr
	Choice from
	Tr.�����_������� = -6 and [Tr.��������� = R or Tr.��������� = W ]
first
Convert_rule
	�����_�������  set  -6 - Pr_Inc( Sys.Pz_c, 1)  {���� ������������ ���������, �����
                                            ������������� (go SerCom)}
DTr					    {������ ���������}
Convert_rule  {trace}

�����             set	Tr.�����	    {����� "��������" ������� ����������}
���������	  set	Tr.���������	    {��������� "��������" ������� ����������}
��������_�������  set	Tr.��������_������� {��-�������� "��������" ������� ����������}
�����_�������     set	0
���������         set	B				{������������� "�� �������������"}
��                set	0
���	          set	Tr.���				{��� �����}
���               set	Sys.Pz_c			{����� ���������� � �����}
���               set	S
FTr
	Choice from
	FTr.����� = Tr.����� and FTr.��������_������� = Tr.��������_�������
                    and FTr.��������� = B and FTr.��� = Gr_table( Sys.Pz_c - 1, Tr.���)
                                              {������� "����" ����������� ����������}
first
Convert_rule
	��  set  FTr.�� + 1	   {��������� ������� ����������� "�������" �� 1}
$End

{--------------------------��������� �����������-------------------------------------------}
{/ 20 / - ������� �� ��������� ������ ��������������� ��������� ��������}
$Pattern	 FicSubInqMovPr: rule {trace}
$Relevant_resources
	DTr:����������		Keep
	ST:�������		Keep
	FL: RegFl		Keep	
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
DTr
    Choice from
      DTr.�����_������� = 0 and DTr.��������� = B and DTr.�� = 0 and Sq_table( DTr.���, DTr.���) = -1
	   {������� ���������, ��������������� ��������� �������� ���������� �����}
first
Convert_rule
	���������  set  M			     {���������� ���� ���������� ���������}
	��   set  FA_table( FF_table( DTr.���,DTr.���))	{������ ���������� (���)}
ST
	Choice from
	ST.����� = FA_table( FF_table( DTr.���,DTr.���))	{������� ������� "��������"}
first
Convert_rule
	���_����  set  ST.���_���� + 1	      {��������� ������� ���������� ����������� 
				       ��������� ��������� � ������ �� �� 1}
FL
	Choice from
	FL.����� = ST.����� and FL.��� = S
first
Convert_rule
	En_f	set	0			{��������� ��������� �����������}
SQS
	Choice from
	SQS.����� = DTr.���
first
Convert_rule
Arr	set	Ccm(Qst2(Pr_Inc(DTr.�����, CTr.�����),
                Pr_Inc(DTr.��������_�������, CTr.��������_�������)),MN,SQS.Arr)
CTr
	Choice NoCheck
first
$End

{/ 21 / - ���������� ����������-���������� � ����� � ������� �������� ���������}
$Pattern	 SubInqSerPr: rule {trace}
$Relevant_resources
	DTr:����������		Keep
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
DTr
     Choice from
	DTr.�����_������� = 0 and DTr.��������� = B and DTr.�� = 0 and Sq_table(DTr.���, DTr.���) > 0
                 {������� ���������, ��������������� �� ��������� ��������}
first
Convert_rule
	���������	set	P	{���������� ���� ���������� ��������� (go QueueInPr)}
SQS
	Choice from
	SQS.����� = DTr.���
first
Convert_rule
����	set	Ccn(Qst2(Pr_Inc(DTr.�����, CTr.�����),
                Pr_Inc(DTr.��������_�������, CTr.��������_�������)),PN,SQS.����)
CTr
	Choice NoCheck
first
$End

{/ 22 / - ��������� ���������� �� �� ���}
$Pattern	 SubInqSer: operation {trace}
$Parameters
	Par1:real
	Par2: real 
$Relevant_resources
	DTr:����������   	Keep 		Keep
	ST:�������		Keep		Keep
	SQS:SubQ		Keep		Keep
	CTr:AT			NoChange	NoChange
$Time = Proc_Fun( Par1, Par2)
$Body
DTr
	Choice from
	DTr.�����_������� = -5 and DTr.��������� = P	{���� ���-�� ����� �� ������� ��������  
					 ��������� ���������� �� ��}
first
Convert_begin
	�����_�������   set  -6	              {������ ���������}
Convert_end				      {��������� ���������}
	���������       set  M		      {���������� ���� ���������� ���������}
	��   set  Sq_table( DTr.���, DTr.���)  {������ ���������� (���)}
ST
	Choice from
	ST.���� = F and ST.����� = Sq_table( DTr.���, DTr.���)
	                         {������� �� ��������������� �� ��������� ��������}
first
Convert_begin
	����   set  P		   {������ ���������}
Convert_end					
	����   set  F		   {��������� ���������}
	���_����   set  ST.���_���� + 1	   {��������� ������� ���������� �����������, 
                                    ��������� ��������� � ������ �� �� 1}
SQS
	Choice from
	SQS.����� = DTr.���
first
Convert_begin
����	set	Ccn(Qst2(Pr_Inc(DTr.�����, CTr.�����),
                Pr_Inc(DTr.��������_�������, CTr.��������_�������)),PS,SQS.����)
Convert_end
����	set	Ccn(Qst2(Pr_Inc(DTr.�����, CTr.�����),
                Pr_Inc(DTr.��������_�������, CTr.��������_�������)),PE,SQS.����)
Arr	set	Ccm(Qst2(Pr_Inc(DTr.�����, CTr.�����),
                Pr_Inc(DTr.��������_�������, CTr.��������_�������)),MN,SQS.Arr)
CTr
	Choice NoCheck
first
$End

{/ 23 / - ������� ����������-���������� � ��������� ��������� ����������� ��������}
$Pattern	 SubInqMov: rule {trace}
$Parameters
	Par1:integer
	Par2:integer
$Relevant_resources
	ST  : �������		Keep
	DTr : ����������		Keep
	Sys : Sy1		Keep
	SQS : SubQ		Keep
	CTr : AT		NoChange	
$Body
ST
	Choice from
	ST.���� = F and ST.���_���� > 0      {������� �� � �������� �����������,
                                         ��������� ���������}
with_max(ST.���_����)
Convert_rule
	���� set  R		        {������� � ��������� ���������}
	�����_������ set  (1 - Pr_Inc(ST.�����,Sq_table(Gr_table(DTr.���,DTr.���),DTr.���))) * 
	(Wei_Fun(Par1,Par2)  + 1)	{��� ������ ���������� ���������, ���� ����� ���������}
  				    {��� 0,���� ���������-"����" ����� �������������� ����� ��}
	���_����	set	ST.���_���� - 1	{��������� ������� ���������� �����������, 
					 ��������� ��������� � ������ �� �� 1}
DTr
	Choice from
	DTr.��������� = M and DTr.�� = ST.����� and Gr_table(DTr.���,DTr.���) > 0
with_max( DTr.���������)	        {������� ���������, ��������� ��������� � ������ ��}
Convert_rule
	��	set	0 - DTr.��	{�������� ���}
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c + 1  {INC  ������� ���������� ��, ����������� � ���������}
SQS
	Choice from
	SQS.����� = DTr.���
first
Convert_rule
Arr	set	Ccm(Qst2(Pr_Inc(DTr.�����, CTr.�����),
                Pr_Inc(DTr.��������_�������, CTr.��������_�������)),MS,SQS.Arr)
CTr
	Choice NoCheck
first
$End

{/ 24 / - ������� ����������-���������� � ��������� ��������� ����������� 
          ������������� �������� �������}
$Pattern	 TopSubInqMov: rule {trace}
$Parameters
	Par1:integer
	Par2:integer
$Relevant_resources
	ST:�������		Keep
	DTr:����������		Keep
	Sys: Sy1			Keep
$Body
     {�� ����� ��� � ���������� �������, �� ��� ���������� "�����" �����-"������"}
ST
	Choice from
	ST.���� = F and ST.���_���� > 0
with_max(ST.���_����)
Convert_rule
	����  set R
	�����_������  set (1 - Pr_Inc(ST.�����,DTr.��������_�������)) * (Wei_Fun(Par1,Par2) + 1)
	���_����  set ST.���_���� - 1
DTr
	Choice from
	DTr.��������� = M and DTr.�� = ST.����� and Gr_table(DTr.���,DTr.���) = -1
with_max( DTr.���������)
Convert_rule
	��	set	0 - DTr.��
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c + 1
$End

{/ 25 / - ��������� ������ ������ ������ ��� ���� ������������ ��}
$Pattern	 Move: operation {trace}
$Parameters
	Nm:integer[1..256]	{���-�� �� � ����}
	Cir_t:real		{����� ��������� ������ ������ � 1 ��}
$Relevant_resources
	Sys: Sy1		Keep	Keep
$Time = Cir_t * Sys.M_c		{���� ��������� ������ ������ � ������ �� ��}
$Body
Sys
	Choice from
	Sys.M_f = 0 and Sys.O_c = Nm  + 1 and Sys.M_c > 0
	{���� ���������� ���������� ���� ���������� ���� ������ �� 1 � 
         ���������� ��, ��������� ���������}
first 
Convert_begin			
	M_f	set	1	{��������� ���� ���������� ���� ������ �� 1}
Convert_end
	M_f	set	0	{ ��������� ���� ���������� ���� ������ �� 1}
	O_c	set	1	{���������� ������� �� �� �1}
$End

{/ 26 / - ��������� ������ ������ ����� ����� ���������}
$Pattern	 OutWei: rule {trace}
$Relevant_resources
	Sys: Sy1			Keep	
	ST:�������		Keep
$Body
Sys
	Choice from
	Sys.M_f  = 0 and Sys.M_c > 0	{���� ���������� ���� ������ �� 1}
first 
Convert_rule
	O_c	set	Sys.O_c + 1	{��������� ������� �� �� 1}
ST
	Choice from
	ST.����� = Sys.O_c
first
Convert_rule
	�����_������	set	ST.�����_������  - 1	{���������� ���� ������������� ������ �� 1}
$End

{/ 27 / - ��������� ��������� ������}
$Pattern	 EndSubInqMov: rule {trace}
$Relevant_resources
	ST:�������		Keep
	DTr:����������		Keep
	Sys: Sy1		Keep	
	FL: RegFl		Keep	
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
ST
	Choice from
	ST.�����_������  <= 0 and ST.���� = R	{������� �� ����������� ���� �����}
first
Convert_rule
	����	set	F		{�������� � �� ������� ���������}
DTr
	Choice from
	DTr.��������� = M and DTr.�� = 0 - ST.����� {������� ���������, ������� �����������
                                               ���������}
first
Convert_rule
	��	set	0		{�������� � ���� ������� ���������}
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c - 1	{DEC ������� ���������� ��, �����������
                                         � ���������}
	O_c	set	Sys.O_c - Pr_Inc(Sys.M_c,0) * (Sys.O_c - 1) 
	                {���� ���������� ���� ��, �� ���������� ������� �� �� �1 }
FL
	Choice from
	FL.����� = ST.����� and FL.��� = S
first
Convert_rule
	En_f	set	Pr_Inc( ST.���_����, 0)	{��������� ��������� ����������� ��
                                      ��, ���� ��� �� ����� ����������� �� ���������}
SQS
	Choice from
	SQS.����� = DTr.���
first
Convert_rule
Arr	set	Ccm(Qst2(Pr_Inc(DTr.�����, CTr.�����),
                Pr_Inc(DTr.��������_�������, CTr.��������_�������)),ME,SQS.Arr)
CTr
	Choice NoCheck
first
$End

{/ 28 / - ������������� � ����������� ����������-�����������}
$Pattern	 SubInqCom: rule {trace}
$Relevant_resources
	DTr:����������		Erase
	FTr:����������		Keep
$Body
DTr
	Choice from
	DTr.��������� = M and DTr.�� = 0 and Gr_table( DTr.���, DTr.���) > 0
	{������� ���������, ������� �������� ���������, � ������� ���}
first
FTr
	Choice from
	FTr.����� = DTr.����� and FTr.��������_������� = DTr.��������_������� and
                    FTr.��������� = B and FTr.��� = Gr_table( DTr.���, DTr.���)	
                                                       {������� "����" ����������}
first
Convert_rule
	��	set	FTr.�� - 1	{DEC ������� ����������� - "�������" }
$End

{----------------------------------������������� �����������--------------------------------------------}
{/ 29 / - ��������� ���� ������������� ����������� � ������}
$Pattern	 SerCom: rule {trace}
$Relevant_resources
	DTr:����������		Erase
	FTr:����������		Keep
$Body
DTr
	Choice from
DTr.��������� = M and DTr.�� = 0 and Gr_table( DTr.���, DTr.���) = -1
	{������� ���������-"������", ������� �������� ���������, � ������� ���}
first
FTr
	Choice from
	FTr.����� = DTr.����� and FTr.��������_������� = DTr.��������_�������
                    and FTr.�����_������� = -7 and [FTr.��������� = R or FTr.��������� = W ]	
                        	{������� "����"(������ ��������) ����������}
first
Convert_rule
	�����_�������	set	-8		{������������� ������� ����������}
$End

{ --------------------------�������������  ������------------------------------ }
{/ 30 / - ���������� � ��������������� ������}
$Pattern	 FiDeBlPr : rule {trace}
$Relevant_resources
	Tr:����������	Keep
	Sys:Sy		Keep	
$Body
Tr
	Choice from
	Tr.�����_������� = -8 and [Tr.��������� = R or Tr.��������� = W ]    {������� ������ ������������� 
                                                       �������� ����������}
first
Convert_rule
	�����_�������	set	-9			{������������ ������������� ������}
Sys
	Choice from
	Sys.T_f = 0				{���� ������� ��������}
first 
Convert_rule
	T_f	set	1			{������ �������}
	F_c	set	1			{������� ������ ���������� �� �1}
$End

{/ 31 / - ��������������� ������, ����������� � �������}
$Pattern	 FiDeBlock: rule {trace}
$Relevant_resources
	Tr:����������	Keep
	Sys: Sy		Keep
	Fi:����		Keep
	FL: RegFl	Keep

$Body
Tr
	Choice from
	Tr.�����_������� = -9 and [Tr.��������� = R or Tr.��������� = W ]
first
Convert_rule
	�����_�������   set  -9 - Pr_Inc(0,FF_table(Sys.F_c + 1,Tr.���))	{-10,���� ������
                                            ��������� ��������� ���������(����)}
Sys
	Choice from
	Sys.T_f = 1						
first 
Convert_rule
	T_f  set  1 - Pr_Inc(0,FF_table(Sys.F_c  + 1, Tr.���))	{0,���� ������
                                            ��������� ��������� ���������(����)}
	F_c  set  Sys.F_c + 1				{INC ������� ������}
	Q_f  set  1			    {�������������� ������� ���������
                                            ������� ������������� ������ �� ������}
	Q_s  set  1				{������� ������ � �1}
Fi
	Choice from
	Fi.����� = FF_table(Sys.F_c , Tr.���)	{������� �������������� ����}
first
Convert_rule
	������  set  Fi.������ + CirFun( Fi.������)	{�������� ���������� �������, ���� 
						���� ���������� �� ������ ��� DEC,
                                                ���� �� ������}
FL
	Choice from
	FL.����� = Fi.����� and FL.��� = F
first
Convert_rule
	En_f	set	Pr_Inc(Fi.������, 0)	{��������� ������ � ����� ��
                                                 ������ � �� ������)}
$End

{/ 32 / - ��������� ��������� ������� � ����������� ��������������� ����������}
$Pattern	 SerEnd: rule {trace}
$Relevant_resources
	Tr:����������			Erase
	STr: ����������_�������_���������	Erase
	FL: RegFl			Keep	
$Body
Tr	
	Choice from
	Tr.�����_������� = -10 and [Tr.��������� = R or Tr.��������� = W ]
	     {������� ������,����������� ������������� ������ � ������� ���}
first
STr
	Choice from
	STr.����� = Tr.����� and STr.��������_������� = Tr.��������_�������
	{������� ��������������� �������� ���������� ������� � ������� ��� �����}
first
FL
	Choice from
	FL.����� = Tr.��������_������� and FL.En_f = 0 and FL.��� = A
first
Convert_rule
	En_f  set  1	{��������� ����� �� ������� �������� ��������������� ��}
$End	

{/33/  - }
$Pattern	 CreateAnTr: rule {trace} 
$Relevant_resources
	Sys:Sy1				Keep
	Tr:����������			NoChange
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
	Tr.��� = M and Tr.�����_������� = 0 and Tr.��������� = Q
first
STr
	Choice NoCheck
first					
Convert_rule
�����	          set	Tr.����� 
���������	  set	Tr.���������
��������_�������  set	Tr.��������_�������
���������         set 	Tr.��������� 
�����_���������	  set	Time_now
�����_�������	set	0
F_c	          set	0
��      	  set	0
Cn	set	0
Pz_c	set	0
$End
{/ 34 / -��������� ����������-�������� ��� ����� �������������� ������}
$Pattern	 Get_Transaction_Statistic : rule {trace} 
$Relevant_resources
	Tr:����������			Keep
	STr: ����������_�������_���������	Create
$Body
Tr
	Choice from
	Tr.��� = M and Tr.�����_������� = 0 and Tr.��������� = Q		{������� �������� (������)}	
first
Convert_rule
���������	set	I			{��������� ��� ����� � ������� ��������}
STr					{������ ��� ��������������� ��������}
Convert_rule	{trace}
�����	set	Tr.����� 
���������	set	Tr.���������
��������_�������	set	Tr.��������_������� 
�����_���������	set	Time_now
$End

{/ 35 / -}
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



{/ 36 / -}
$Pattern	 QuAnTr: rule {trace} 
$Relevant_resources
	Sys: Sy1				NoChange
	STr:AT				Keep
	Tr:����������			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice NoCheck
first					
Convert_rule 
�����_�������  set	Tr.�����_�������
Tr
	Choice from
	Tr.��� = M and Tr.�����= STr.�����
                and Tr.��������_������� = STr.��������_������� and Tr.�����_������� <> STr.�����_�������
first
$End

{/ 37 / -}
$Pattern	 ActAnTr: rule {trace}
$Relevant_resources
	Sys:Sy1				NoChange
	STr:AT				Keep
	Tr:����������			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice NoCheck
first					
Convert_rule 
���������	set	Tr.���������
Tr
Choice from
	Tr.��� = M and Tr.����� = STr.�����
               and Tr.��������_������� = STr.��������_������� and Tr.��������� <> STr.���������
first
$End

{/ 38 /-}
$Pattern	 KinAnTr: rule {trace}
$Relevant_resources
	Sys:Sy1				NoChange
	STr:AT				Keep
	Tr:����������			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice NoCheck
first					
Convert_rule 
���	set	Tr.���
Tr
	Choice from
	Tr.��� = M and Tr.����� = STr.����� 
           and Tr.��������_������� = STr.��������_������� and Tr.��� <> STr.���
first
$End

{/ 39 / - }
$Pattern	 RedFiOn: rule {trace}
$Relevant_resources
	Ss:Sy1				NoChange
	STr:AT				Keep
	Sys: Sy				NoChange
	Fi:����				Keep
$Body
Ss
	Choice from
	Ss.An_f = 2
first
STr
	Choice from
	STr.�����_������� = -2 and STr.F_c <> Sys.F_c 
first					
Convert_rule 
F_c	set	Sys.F_c
Sys
	Choice from
	Sys.T_f = 1
first
Fi
	Choice from
	Fi.����� = FF_table(Sys.F_c , STr.���)
first
Convert_rule
	Red	set	On
$End
{/ 40 / -}
$Pattern	 CtAnTr: rule {trace}
$Relevant_resources
	Sys: Sy1				NoChange
	STr:AT				Keep
	Tr:����������			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice from
	STr.�����_������� = -3
first					
Convert_rule 
F_c	set	0
��	set	Tr.��
Cn	set	STr.Cn + 1
Tr
	Choice from
	Tr.��� = M and Tr.����� = STr.����� 
            and Tr.��������_������� = STr.��������_������� and Tr.�� <> STr.��
first
$End

{/ 41 / - }
$Pattern	 GreenFiOn: rule {trace}
$Relevant_resources
	Ss: Sy1		NoChange
	STr:AT		Keep
	Sys: Sy		NoChange
	Fi:����		Keep
$Body
Ss
	Choice from
	Ss.An_f = 2
first
STr
	Choice from
	STr.�����_������� = -3 and STr.Cn > 1
first					
Convert_rule
	Cn	set	1
Sys
	Choice NoCheck
first
Fi
	Choice from
	Fi.����� = Sys.Nf
first
Convert_rule
	Red	set	Off
	Green	set	On
$End

{/ 42 / -}
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
	Tr.�����_������� = -10
first
$End

{/ 43 / -}
$Pattern	 FiOff: rule {trace}
$Relevant_resources
	Ss:Sy1				NoChange
	STr:AT				Keep
	Sys: Sy				NoChange
	Fi:����				Keep
$Body
Ss
	Choice from
	Ss.An_f = 2
first
STr
	Choice from
	STr.�����_������� = -9 and STr.F_c <> Sys.F_c 
first					
Convert_rule 
F_c	set	Sy.F_c
Sys
	Choice from
	Sys.T_f = 1
first
Fi
	Choice from
	Fi.����� = FF_table(Sys.F_c , STr.���)
first
Convert_rule
	Green	set	Off
$End

{/ 44 / -}
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
	SQS.����� = Ss.Pz_c
first
Convert_rule
Lev	set	SQFd.Lev + 1 
X_c	set	X_nul + Ss.X_ct * X_step	- 10 * SQS.Lev 
Y_c	set	Y_nul + SQS.Lev * Y_step
����	set	EX
SQFd
	Choice from
	SQFd.����� = Gr_table(Ss.Pz_c, STr.���)
first
STr
	Choice from
	STr.�����_������� = -6 and STr.Pz_c <> Ss.Pz_c 
first					
Convert_rule 
Pz_c	set	Ss.Pz_c
$End

{/ 45 / -}
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
	SQS.Arr <> Off or SQS.���� <> Off
first
Convert_rule
����	set	Off
Arr	set	Off
$End

