$Constant
	Сост_1:	(z_1,z_2,z_3) = z_1
	X_nul:	integer [1..800] = 32
	Y_nul:	integer [1..600] = 30
	X_step:	integer [1..800] = 138
	Y_step:	integer [1..600] = 93
$End

$Sequence  R_W_Fun:such_as Транзакция.Состояние 
$Type = by_hist 222222333
$Body
 R  0.60
 W  0.40
$End

$Sequence  Hst1:such_as Сост_1
$Type = by_hist 222222222
$Body
 z_1  0.50
 z_2  0.40
 z_3  0.10
$End

$Sequence  Hst2:such_as Сост_1
$Type = by_hist 112222222
$Body
 z_1  0.90
 z_2  0.09
 z_3  0.01
$End

$Sequence  Hst3:such_as Сост_1
$Type = by_hist 222452622
$Body
 z_1  0.60
 z_2  0.35
 z_3  0.05
$End

$Sequence  Hst4:such_as Сост_1
$Type = by_hist 224562222
$Body
 z_1  0.50
 z_2  0.40
 z_3  0.10
$End

$Sequence  Hst5:such_as Сост_1
$Type = by_hist 112222256
$Body
 z_1  0.90
 z_2  0.09
 z_3  0.01
$End

$Sequence  Hst6:such_as Сост_1
$Type = by_hist 226752698
$Body
 z_1  0.60
 z_2  0.35
 z_3  0.05
$End

$Sequence  Khst1:such_as Сост_1
$Type = by_hist 222222222
$Body
 z_1  0.60
 z_2  0.20
 z_3  0.20
$End

$Sequence  Khst2:such_as Сост_1
$Type = by_hist 112222222
$Body
 z_1  0.40
 z_2  0.30
 z_3  0.30
$End

$Sequence  Khst3:such_as Сост_1
$Type = by_hist 222452622
$Body
 z_1  0.50
 z_2  0.20
 z_3  0.30
$End

$Sequence  Khst4:such_as Сост_1
$Type = by_hist 224562222
$Body
 z_1  0.20
 z_2  0.20
 z_3  0.60
$End

$Sequence  Khst5:such_as Сост_1
$Type = by_hist 112222256
$Body
 z_1  0.45
 z_2  0.35
 z_3  0.20
$End

$Sequence  Khst6:such_as Сост_1
$Type = by_hist 226752698
$Body
 z_1  0.30
 z_2  0.40
 z_3  0.30
$End

$Function Приоритет_hst: such_as Сост_1
$Type = algorithmic
$Parameters
	Par:	integer[1..6]
$Body
  Calculate_if  Par = 1  Приоритет_hst = Hst1
  Calculate_if  Par = 2  Приоритет_hst = Hst2
  Calculate_if  Par = 3  Приоритет_hst = Hst3
  Calculate_if  Par = 4  Приоритет_hst = Hst4
  Calculate_if  Par = 5  Приоритет_hst = Hst5
  Calculate_if  Par = 6  Приоритет_hst = Hst6
$End

$Function Kin_hst: such_as Сост_1
$Type = algorithmic
$Parameters
	Par:	integer[1..6]
$Body
  Calculate_if  Par = 1  Kin_hst = Khst1
  Calculate_if  Par = 2  Kin_hst = Khst2
  Calculate_if  Par = 3  Kin_hst = Khst3
  Calculate_if  Par = 4  Kin_hst = Khst4
  Calculate_if  Par = 5  Kin_hst = Khst5
  Calculate_if  Par = 6  Kin_hst = Khst6
$End

$Function Pr_ch:integer[1..3]
$Type = algorithmic
$Parameters
	Par:	such_as Сост_1
$Body
  Calculate_if  Par = z_1  Pr_ch = 1
  Calculate_if  Par = z_2  Pr_ch = 2
  Calculate_if  Par = z_3  Pr_ch = 3
$End

$Sequence Exp_need1:real
$Type = exponential 123456789
$End	

$Sequence Exp_need2:real
$Type = exponential 223333339
$End	

$Sequence Exp_need3:real
$Type = exponential 123444444
$End	

$Sequence Exp_need4:real
$Type = exponential 123455555
$End
	
$Sequence Exp_need5:real
$Type = exponential 122455658
$End	

$Sequence Exp_need6:real
$Type = exponential 523457559
$End	

$Function B_time:real
$Type = algorithmic
$Parameters
	Par1:	real
	Par2:	integer[1..6]
$Body
Calculate_if Par2=1 B_time = Exp_need1(Par1)
Calculate_if Par2=2 B_time = Exp_need2(Par1)
Calculate_if Par2=3 B_time = Exp_need3(Par1)
Calculate_if Par2=4 B_time = Exp_need4(Par1) 
Calculate_if Par2=5 B_time = Exp_need5(Par1)
Calculate_if Par2=6 B_time = Exp_need6(Par1) 
$End

$Function Qst : integer[0..1]
$Type = algorithmic
$Parameters
	Par1:integer
	Par2:integer
$Body
Calculate_if  Par1 >= Par2		Qst = 1
Calculate_if  Par1 < Par2		Qst = 0
$End

$Function Qst2: integer[0..1]
$Type = algorithmic
$Parameters
	Par1:integer[0..1]
	Par2:integer[0..1]
$Body
Calculate_if  Par1 = 1 and Par2 = 1		Qst2 = 1
Calculate_if  Par1 =0 or Par2 = 0		Qst2 = 0
$End

$Function Qst1 : integer[0..1]
$Type = algorithmic
$Parameters
	Par1:integer
	Par2:integer
	Par3:integer 
$Body
Calculate_if  Par1 = Par2		Qst1 = 1
Calculate_if  Par1 < Par2		Qst1 =  Par3
$End

$Function Pr_Inc : integer[0..1]
$Type = algorithmic
$Parameters
	Par1:integer
	Par2:integer
$Body
Calculate_if  Par1 = Par2		Pr_Inc = 1
Calculate_if  Par1 <> Par2		Pr_Inc = 0
$End

$Function Cmt : integer
$Type = algorithmic
$Parameters
	Par1: such_as Счетчик.Кто 
	Par2:integer
	Par3:integer 
$Body
Calculate_if  Par1 = A			Cmt = Par2
Calculate_if  Par1 = F or Par1 = S		Cmt = Par3
$End

$Function Ccm :such_as SubQ.Arr 
$Type = algorithmic
$Parameters
	Par1:integer[0..1]
	Par2:such_as SubQ.Arr
	Par3:such_as SubQ.Arr 
$Body
Calculate_if  Par1 = 1		Ccm = Par2
Calculate_if  Par1 = 0		Ccm = Par3
$End

$Function Ccn : such_as SubQ.Сост
$Type = algorithmic
$Parameters
	Par1:integer[0..1]
	Par2:such_as SubQ.Сост
	Par3:such_as SubQ.Сост
$Body
Calculate_if  Par1 = 1		Ccn = Par2
Calculate_if  Par1 = 0		Ccn = Par3
$End

$Function Mux : integer
$Type = algorithmic
$Parameters
	Par1: such_as Счетчик.Кто
	Par2:integer
	Par3:integer 
$Body
Calculate_if  Par1 = F or Par1 = A		Mux = Par2
Calculate_if  Par1 = S		Mux = Par3
$End

$Function Cmt1 : such_as Транзакция.Состояние
$Type = algorithmic
$Parameters
	Par1: such_as Счетчик.Кто 
$Body
Calculate_if  Par1 = A		Cmt1 = I
Calculate_if  Par1 = F		Cmt1 = W
Calculate_if  Par1 = S		Cmt1 = P
$End

$Function ActComp : integer[0..1]
$Type = algorithmic
$Parameters
	Par1: such_as Транзакция.Состояние
	Par2: such_as Транзакция.Состояние 
$Body
Calculate_if  Par1 = Par2		ActComp = 1
Calculate_if  Par1 <> Par2		ActComp = 0
$End

$Function  FF_table : integer[0..256]
$Type = table
$Parameters
	Par1 : integer[1..9]
	Par2: integer[1..3]
$Body
	{ 1	2	3	4	5	6	7	8	9	}
{1}	   6	2	5	0	0	0	0	0	0
{2}	   1	3	4	0	0	0	0	0	0
{3}	   1	2	3	4	5	0	0	0	0	
$End

$Function  FA_table : integer[0..256]
$Type = table
$Parameters
	Par : integer[1..10]
$Body
{1	2	3	4	5	6	7	8	9	10	}
   1	2	3	4	5	6	1	2	3	4
$End

$Function  Gr_table : integer
$Type = table
$Parameters
	Par1 : integer[1..10]
	Par2 : integer[1..3]
$Body
 	{1	2	3	4	5	6	7	8	9	10	}
{1}	  4	4	5	6	6	-1	0	0	0	0
{2}	  4	5	6	5	7	7	-1	0	0	0
{3}	  6	7	7	8	8	8	9	9	-1	0
$End

$Function  Sq_table : integer
$Type = table
$Parameters
	Par1 : integer[1..10]
	Par2 : integer[1..3]
$Body
	 {1	2	3	4	5	6	7	8	9	10	}
{1}	  -1	-1	-1	1	3	1	0	0	0	0
{2}	  -1	-1	-1	1	1	4	1	0	0	0
{3}	  -1	-1	-1	-1	-1	2	5	6	4	0
$End

$Function CirFun: integer[-1..1] 
$Type = algorithmic
$Parameters
	Par:	integer
$Body
  Calculate_if  Par > 0	CirFun = -1
  Calculate_if  Par < 0	CirFun = 1
  Calculate_if  Par = 0	CirFun = 0
$End

$Sequence Wei_Fun:integer
$Type = uniform 123467444
$End	

$Sequence Proc_Fun:real
$Type = uniform 343465444
$End	

$Function Aws : integer
$Type = algorithmic
$Parameters
	Par1:such_as Счетчик.Кто 
	Par2:integer
	Par3:integer 
$Body
Calculate_if  Par1 <> S		Aws = 0
Calculate_if  Par1 = S		Aws = Sq_table( Par2, Par3)
$End
