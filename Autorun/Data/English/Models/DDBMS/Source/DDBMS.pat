
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
{ / 2 / - Выборка  по флагу запроса и рождение соответствующей тразакции - }
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
Num	set	Cn.C_t			{Номер транзакции}
Pr	set	Pr_ch( Pr_hst( Cn.Num ))	{Приоритет запроса}
Soc	set	Cn.Num			{Источник запроса}
Qu	set	0
Act	set	Q
Ct	set	0
Kin	set	1
Np	set	0
Who	set	M
$End
{----Далее по смыслу смотри / 33 / - Get_Transaction_Statistic-}
{-----------------------------------------Вход  в  очередь-----------------------------------------------}
{/ 3 /-Вход транзакции в очередь соответственно её приоритету----------------------------}
$Pattern	 QueueInPr : rule	{trace} 
$Parameters
	Par: such_as Counter.Who	             {Вид очереди:абонент, файл(на запись), РС(на обраб.)}
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
	Fl_I	set	1		{Установить флаг входа в очередь}
	Sum	set	FL.Sum + 1	{INC текущий размер очереди}
$End
{/ 4 /-Перестройка очереди в связи с входом новенького------------------------------------------}
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
	FL.Fl_I = 1 and FL.Who = Par	{Если уст. флаг входа}
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
{/ 5 /-Сброс флага входа в очередь после её упорядочивания----------------------------------}
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

{------------------------------------------------------------Выход  из  очереди-----------------------------------}
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
	{Если разрешен выход из очереди}
with_max( FL.Sum )
Convert_rule
	Fl_O	set	1		{Установить флаг выхода из очереди}
	En_f	set	0		{Запретить выход из очереди}
	Sum	set	FL.Sum  - 1	{DEC текущий размер очереди}
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
	Tr.Act = Cmt1(Par) and		{Первый уходит на обработку}
	Tr.Qu = 1 and
	Cmt( Par, Tr.Soc, Mux(Par, Tr.Kin, Aws(Par,Tr.Np,Tr.Kin))) = FL.Num 
first
Convert_rule
	Qu	set	Cmt( Par, -1, -5)
$End
{/ 7 /-Перестройка очереди в связи с выходом первого----------------------------------------------}
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
{/ 8 /-Сброс флага выхода из очереди после её перестройки---------------------------------------------}
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

{ -----------------------------------------------------Блокировка  файлов------------------------------ }
{----------------------------------------/ 9 /------------------------------------------------------}
$Pattern	 FiDecPr : rule {trace}
$Relevant_resources
	Tr:Transaction	Keep
	Sys:Sy		Keep	
$Body
Tr
	Choice from
	Tr.Qu = -1 and Tr.Act = I			{Если кто-то вышел из очереди абонентов}
first
Convert_rule
	Qu	set	-2			{Инициировать блокировку файлов}
	Act	set	R_W_Fun		{Озадачить на: -чтение или запись}
	Kin	set	Pr_ch( Kin_hst( Tr.Soc ))	{	            - вид графа	 }
Sys
	Choice from
	Sys.T_f = 0				{Если система свободна}
first 
Convert_rule
	T_f	set	1			{Занять систему}
	F_c	set	1			{Счетчик файлов уст. на №1}
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
	Qu	set	-2 - Pr_Inc(0,FF_table(Sys.F_c + 1,Tr.Kin)) {-3,если выбран последний 
								фикт. подзапрос(файл)}
	Ct	set	Tr.Ct + 1 	{счетчик файлов, блокируемых текущим запросом}
Sys
	Choice from
	Sys.T_f = 1
first 
Convert_rule
	T_f	set	1 - Pr_Inc(0,FF_table(Sys.F_c  + 1, Tr.Kin))	         {0 ,если выбран послед-
								  ний фикт. подзапрос(файл)}
	F_c	set	Sys.F_c + 1
	Q_c	set	Sys.Q_c + ActComp( Tr.Act ,R )	{служебная 'очере-дь' фикт. подза-
 							просов(бл.файла !!*на чтение only*!!)
  							увелич. на 1}
	Q_f	set	ActComp( Tr.Act ,R )		{1,если запрос на чтение (активизиро-
   							       вать перебор служебной очереди 
   							       (бл.файла !!!*на чтение only*!!!)}
	Q_s	set	1				{перебор начать с №1}
DTr
Convert_rule  {trace}
Num	set	Tr.Num				{номер "родителя" данного п/з }
Pr	set	Tr.Pr				{приор. "родителя" данного п/з }
Soc	set	Tr.Soc				{РС-источник "родителя" данного п/з }
Qu	set	Sys.Q_c * ActComp(Tr.Act , R)	{пор.номер в служебной 'очере-ди' фикт. под-
							запросов(бл.файла !!!*на чтение*!!!)}
Act	set	Tr.Act
Ct	set	-1
Kin	set	FF_table(Sys.F_c - 1, Tr.Kin)	{ номер блокируемого фикт. п/з-ом файла }
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
	Sys.Q_f = 1				{Если активен флаг перебора служебной оче-
							реди (бл.файла !!!*на чтение only*!!!)}
first
Convert_begin
	Q_c	set	Sys.Q_c - 1		         { уменьшение служебной 'очере-ди' на 1}
	Q_f	set	-1 + Pr_Inc( Sys.Q_c + 1, Sys.Q_s) {-1,если из служебной 'очереди' вы-
							    шел не последний п/з (go RdQuOu); 
						 0,если вышел последний(закончить перебор)}
Convert_end
{**}	Nf	set	Fi.Num
TrD
	Choice from
	TrD.Ct = -1 and TrD.Qu = Sys.Q_s	and  TrD.Act = R	{Убить лишнего}
first
Fi
	Choice from
	Fi.Num = TrD.Kin  and  Fi.AccV >= 0	{ если файл не заблокирован на запись}
first
Convert_begin
	AccV	set	Fi.AccV + 1		{,то  за-блокировать файл (соответствующий 
							текущему фикт. п/з-у) на чтение }
Tr
	Choice from
	Tr.Qu = -3 and Tr.Soc = TrD.Soc and Tr.Num = TrD.Num and Tr.Act = R
first
Convert_end
	Ct	set	Tr.Ct - 1		{ уменьшить кол-во незаблокированных файлов (в 
						списке запроса "родителя") на 1}
FL
	Choice from
	FL.Sum = 0 and FL.Num = TrD.Kin and FL.Who = F {если файл не имеет очередников на 
								запись}
first
Convert_begin
	En_f	set	0				{запретить одновременный доступ к 
								файлу п/з-ов на запись}
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
	TrD.Qu =  -5 and  TrD.Act = W		{Если кто-то вышел из очереди блокировки 
							файла на запись}
first
Fi
	Choice from
	Fi.Num = TrD.Kin and Fi.AccV = 0  	{Если нужный ему файл свободен}
first
Convert_begin
	AccV	set	 -1			{Заблокировать файл на запись}
Tr
	Choice from
	Tr.Qu = -3 and Tr.Soc = TrD.Soc and Tr.Num = TrD.Num and Tr.Act = W
first
Convert_end
	Ct	set	Tr.Ct - 1		{ уменьшить кол-во незаблокированных файлов (в 
						списке запроса "родителя") на 1}
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
	Sys.Q_f = 1				{Если активен флаг перебора очереди:}
first
Convert_rule
	Q_f	set	1 - Qst( Sys.Q_s, Sys.Q_c) {-сбросить флаг,ес. достигнут конец очереди}   
	Q_s	set	Sys.Q_s + 1		 {-перейти на след. по порядку п/з }	
$End
{----------------------------------------/ 14 /------------------------------------------------------}
$Pattern	 RdQuOu: rule {trace}
$Relevant_resources
	Sys: Sy			Keep	
	Tr:Transaction		Keep
$Body
Sys
	Choice from
	Sys.Q_f = -1		{,если из очереди кто-то вышел (не последний):}
first
Convert_rule
	Ch_n	set	Sys.Q_s	{-запомнить его пор. номер в очереди}
	Q_f	set	1	{-активизировать новый перебор        }
	Q_s	set	1	{ с №1				       }
Tr
	Choice from
	Tr.Ct = -1 and Tr.Act = R and Tr.Qu = Sys.Q_c + 1	{-выбрать последнего из очереди}
first
Convert_rule
	Qu	set	Sys.Ch_n			{и поставить на его место	}
$End
{----------------------------------------------------/15 /--------------------------------------------------------------}
$Pattern	 FiCom: rule {trace}
$Relevant_resources
	Tr:Transaction		Keep
$Body
Tr	
	Choice from
	Tr.Qu = -3 and Tr.Ct = 0 and [Tr.Act = R or Tr.Act = W ] {Если имеется запрос ,который 
							         заблокировал все необходимые 
								ему файлы}
first
Convert_rule
	Qu	set	-4				        {Отметить его}	
$End	

{----------------------------------Декомпозиция запроса  на  подзапросы----------------------}
{----------------------------------------/ 16 /------------------------------------------------------}
$Pattern	 SerDecPr : rule {trace}
$Relevant_resources
	Tr:Transaction	Keep
	Sys:Sy1		Keep	
$Body
Tr
	Choice from
	Tr.Qu = -4 and [Tr.Act = R or Tr.Act = W ]		{См. пред.}
first
Convert_rule
	Qu	set	-6				{выделить запос для д/к}
Sys
	Choice from
	Sys.T_f = 0					{Если система свободна}
first 
Convert_rule
	T_f	set	3			{Установить флаг счетчика декомпоз.}
	Pz_c	set	1			{Установить счетчик на 1}
$End
{----------------------------------------/ 17 /------------------------------------------------------} 
$Pattern	 CouDecPr : rule {trace}
$Relevant_resources
	Tr:Transaction	NoChange
	Sys:Sy1		Keep	
$Body
Tr
	Choice from
	Tr.Qu = -6 and [Tr.Act = R or Tr.Act = W ]	{выбрать выделенный запрос}	
first
Sys
	Choice from
	Sys.T_f = 3			{Если установлен флаг счетчика декомпоз.}
first 
Convert_rule
	T_f	set	3 - Pr_Inc(Gr_table( Sys.Pz_c,Tr.Kin), -1) { Установить флаг д/к 2,если 
						           	            достигнут корень графа п/з-ов 
						  (счетчик будет содержать кол-во п/з-ов +1 )}
	Pz_c	set	Sys.Pz_c + 1		{Счетчик увеличить на 1}
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
	Sys.T_f = 2			{Если установлен флаг декомпоз.}
first 
Convert_rule
	T_f	set	1 - Pr_Inc( Sys.Pz_c - 1, 1)	{Если п/з-корень единств. ,то 
								закончить д/к}
	Pz_c	set	Sys.Pz_c - 1			{Уменьшить счетчик п/з-ов на 1}
Tr
	Choice from
	Tr.Qu = -6 and [Tr.Act = R or Tr.Act = W ]
first
Convert_rule
	Qu	set	-6 - Pr_Inc( Sys.Pz_c, 1)	{если д/к закончена, ждать комп.(go SerCom)}
DTr						{Родить подзапрос-корень}
Convert_rule  {trace}
Num	set	Tr.Num				{номер "родителя" данного п/з }
Pr	set	Tr.Pr				{приор. "родителя" данного п/з }
Soc	set	Tr.Soc				{РС-источник "родителя" данного п/з }
Qu	set	0
Act	set	B
Ct	set	0
Kin	set	Tr.Kin				{вид графа}
Np	set	Sys.Pz_c			{номер п/з-а в графе}
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
	Sys.T_f = 1			{Продолжить д/к}
first 
Convert_rule
	T_f	set	1 - Pr_Inc( Sys.Pz_c - 1, 1)  {Если достигнут 1 п/з-с закончить д/к}
	Pz_c	set	Sys.Pz_c - 1		  {Уменьшить счетчик п/з-ов на 1}	
Tr
	Choice from
	Tr.Qu = -6 and [Tr.Act = R or Tr.Act = W ]
first
Convert_rule
	Qu	set	-6 - Pr_Inc( Sys.Pz_c, 1)	{если д/к закончена, ждать комп.(go SerCom)}
DTr					{Родить подзапрос}
Convert_rule  {trace}

Num	set	Tr.Num				{номер "родителя" данного п/з }
Pr	set	Tr.Pr				{приор. "родителя" данного п/з }
Soc	set	Tr.Soc				{РС-источник "родителя" данного п/з }
Qu	set	0
Act	set	B				{Заблокировать "до востребования"}
Ct	set	0
Kin	set	Tr.Kin				{вид графа}
Np	set	Sys.Pz_c			{номер п/з-а в графе}
Who	set	S
FTr
	Choice from
	FTr.Num = Tr.Num and FTr.Soc = Tr.Soc and FTr.Act = B and  {Выбрать "отца" родив-}
	FTr.Np = Gr_table( Sys.Pz_c - 1, Tr.Kin)			   { шегося п/з-а                 }
first
Convert_rule
	Ct	set	FTr.Ct + 1		{Увеличить счетчик п/з-ов "сыновей" на 1}
$End
{--------------------------Обработка подзапросов-------------------------------------------}
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
	{Выбрать п/з соответствующий фиктивной операции считывания файла}
first
Convert_rule
	Act	set	M					{Установить флаг требования 
									пересылки}
	Ct	set	FA_table( FF_table( DTr.Np,DTr.Kin))	{Откуда пересылать (№РС)}
ST
	Choice from
	ST.Num = FA_table( FF_table( DTr.Np,DTr.Kin))	{Выбрать станцию "источник"}
first
Convert_rule
	Inq	set	ST.Inq + 1			{Увеличить счетчик кол-ва п/з-ов 
						        требующих пересылки с данной РС на 1}
FL
	Choice from
	FL.Num = ST.Num and FL.Who = S
first
Convert_rule
	En_f	set	0			{Запретить обработку п/з-ов}
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
{Выбрать п/з соответствующий не фиктивной операции}
first
Convert_rule
	Act	set	P					{Установить флаг требования 
								  обработки (go QueueInPr)}
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
	DTr.Qu = -5 and DTr.Act = P		{Если кто-то вышел из очереди ожидания  
							обработки п/з на РС}
first
Convert_begin
	Qu	set	-6			{начать обработку}
Convert_end					{закончить обработку}
	Act	set	M				{Установить флаг требования 
									пересылки}
	Ct	set	Sq_table( DTr.Np, DTr.Kin)	{Откуда пересылать (№РС)}
ST
	Choice from
	ST.Con = F and ST.Num = Sq_table( DTr.Np, DTr.Kin)
	{Выбрать РС соответствующую не фиктивной операции}
first
Convert_begin
	Con	set	P			{начать обработку}
Convert_end					
	Con	set	F			{закончить обработку}
	Inq	set	ST.Inq + 1		{Увеличить счетчик кол-ва п/з-ов 
						        требующих пересылки с данной РС на 1}
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
	ST.Con = F and ST.Inq > 0           {Выбрать РС с наличием п/з-ов требующих пересылки}
with_max(ST.Inq)
Convert_rule
	Con	set	R		{ Перейти в состояние пересылки}
	Wei set (1 - Pr_Inc(ST.Num,Sq_table(Gr_table(DTr.Np,DTr.Kin),DTr.Kin))) * 
	(Wei_Fun(Par1,Par2)  + 1)	{Вес пакета треб. пересылки,если нужно переслать}
					{0,если п/з "отец" будет обрабатываться здесь-же  }
	Inq	set	ST.Inq - 1	{Уменьшить счетчик кол-ва п/з-ов 
						        требующих пересылки с данной РС на 1}
DTr
	Choice from
	DTr.Act = M and DTr.Ct = ST.Num and Gr_table(DTr.Np,DTr.Kin) > 0
with_max( DTr.Pr)	{Выбрать п/з требующий пересылки с данной РС}
Convert_rule
	Ct	set	0 - DTr.Ct	{Отметить его}
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c + 1  {INC  счетчик кол-ва РС участвующих в пересылке}
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
{Всё абсолютно также как в предыдущем правиле ,но для п\з-а "корня" графа-"дерева"}
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
	Nm:integer[1..256]	{Кол-во РС в сети}
	Cir_t:real		{Время пересылки 1порции пакета с 1 РС}
$Relevant_resources
	Sys: Sy1		Keep	Keep
$Time = Cir_t * Sys.M_c		{Цикл пересылки 1 порции пакета с каждой из РС}
$Body
Sys
	Choice from
	Sys.M_f = 0 and Sys.O_c = Nm  + 1 and Sys.M_c > 0
	{Если закончился предыдущий цикл уменьшения веса пакета на 1 и сущ. РС треб. пересылки}
first 
Convert_begin			
	M_f	set	1	{Запретить цикл уменьшения веса пакета на 1}
Convert_end
	M_f	set	0	{ Разрешить цикл уменьшения веса пакета на 1}
	O_c	set	1	{Установить счетчик РС на №1}
$End
{----------------------------------------/ 26 /------------------------------------------------------}
$Pattern	 OutWei: rule {trace}
$Relevant_resources
	Sys: Sy1			Keep	
	ST:Station		Keep
$Body
Sys
	Choice from
	Sys.M_f  = 0 and Sys.M_c > 0	{Цикл уменьшения веса пакета на 1}
first 
Convert_rule
	O_c	set	Sys.O_c + 1	{Увеличить счетчик РС на 1}
ST
	Choice from
	ST.Num = Sys.O_c
first
Convert_rule
	Wei	set	ST.Wei  - 1	{Уменьшение веса пересылаемого пакета на 1}
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
	ST.Wei  <= 0 and ST.Con = R	{Выбрать РС переславшую весь пакет}
first
Convert_rule
	Con	set	F		{Сбросить с неё признак пересылки}
DTr
	Choice from
	DTr.Act = M and DTr.Ct = 0 - ST.Num {Выбрать п/з ,который инициировал пересылку}
first
Convert_rule
	Ct	set	0		{Сбросить с него признак пересылки}
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c - 1	{DEC счетчик кол-ва РС участвующих в пересылке}
	O_c	set	Sys.O_c - Pr_Inc(Sys.M_c,0) * (Sys.O_c - 1) 
	{Если пересылала одна РС ,установить счетчик РС на №1 }
FL
	Choice from
	FL.Num = ST.Num and FL.Who = S
first
Convert_rule
	En_f	set	Pr_Inc( ST.Inq, 0)	{Разрешить обработку п/з-ов на РС, если она 
							не имеет очередников на пересылку}
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
	{Выбрать п/з ,который закончил пересылку, и убить его}
first
FTr
	Choice from
	FTr.Num = DTr.Num and FTr.Soc = DTr.Soc and FTr.Act = B and
FTr.Np = Gr_table( DTr.Np, DTr.Kin)	{Выбрать "отца" убитого}
first
Convert_rule
	Ct	set	FTr.Ct - 1	{DEC счетчик п/з-ов "сыновей" }
$End

{----------------------------------Композиция подзапросов--------------------------------------------}
{----------------------------------------/ 29 /------------------------------------------------------}
$Pattern	 SerCom: rule {trace}
$Relevant_resources
	DTr:Transaction		Erase
	FTr:Transaction		Keep
$Body
DTr
	Choice from
DTr.Act = M and DTr.Ct = 0 and Gr_table( DTr.Np, DTr.Kin) = -1
	{Выбрать п/з-"корень" ,который закончил пересылку, и убить его}
first
FTr
	Choice from
	FTr.Num = DTr.Num and FTr.Soc = DTr.Soc and FTr.Qu = -7 and
	[FTr.Act = R or FTr.Act = W ]		{Выбрать "отца"(запрос абонента) убитого}
first
Convert_rule
	Qu	set	-8			{Комп. Запроса состоялась}
$End

{ -----------------------------------------------------Разблокировка  файлов------------------------------ }
{----------------------------------------/ 30 /------------------------------------------------------}
$Pattern	 FiDeBlPr : rule {trace}
$Relevant_resources
	Tr:Transaction	Keep
	Sys:Sy		Keep	
$Body
Tr
	Choice from
	Tr.Qu = -8 and [Tr.Act = R or Tr.Act = W ] {Выбрать Запрос комп. ,которого состоялась}
first
Convert_rule
	Qu	set	-9			{Инициировать разблокировку файлов}
Sys
	Choice from
	Sys.T_f = 0				{Если система свободна}
first 
Convert_rule
	T_f	set	1			{Занять систему}
	F_c	set	1			{Счетчик файлов уст. на №1}
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
	Qu	set	-9 - Pr_Inc(0,FF_table(Sys.F_c + 1,Tr.Kin))	{-10,если выбран последний 
								фикт. подзапрос(файл)}
Sys
	Choice from
	Sys.T_f = 1						
first 
Convert_rule
	T_f	set	1 - Pr_Inc(0,FF_table(Sys.F_c  + 1, Tr.Kin))	{0,если выбран последний 
								фикт. подзапрос(файл)}
	F_c	set	Sys.F_c + 1				{INC счетчик файлов}
	Q_f	set	1					{активизировать перебор
								  служебной очереди бл. 
									файлов на чтение}
	Q_s	set	1					{перебор начать с №1}
Fi
	Choice from
	Fi.Num = FF_table(Sys.F_c , Tr.Kin)	{Выбрать разблокируемый файл}
first
Convert_rule
	AccV	set	Fi.AccV + CirFun( Fi.AccV )	{Обнулить переменную доступа, если 
							  была блокировка на запись или DEC							   ,если на чтение}
FL
	Choice from
	FL.Num = Fi.Num and FL.Who = F
first
Convert_rule
	En_f	set	Pr_Inc(Fi.AccV, 0)	              {Разрешить доступ к файлу(наR&W)}
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
	{Выбрать запрос, закончивший разблокировку файлов и убить его}
first
STr
	Choice from
	STr.Num = Tr.Num and STr.Soc = Tr.Soc
	{Выявить статистического двойника убитого запроса и послать ему вослед}
first
FL
	Choice from
	FL.Num = Tr.Soc and FL.En_f = 0 and FL.Who = A
first
Convert_rule
	En_f	set	1		{Разрешить выход из очереди абонента соотв. РС}
$End	

{ / 33 / -  - }
$Pattern	 Get_Transaction_Statistic : rule {trace} 
$Relevant_resources
	Tr:Transaction			Keep
	STr: Transaction_Time_Statistics	Create
$Body
Tr
	Choice from
	Tr.Who = M and Tr.Qu = 0 and Tr.Act = Q		{Выявить младенца (запрос)}	
first
Convert_rule
Act	set	I			{Разрешить ему войти в очередь абонента}
STr					{Родить ему статистического двойника}
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

{ / 35 / -Поставить перед /33/  - }
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

