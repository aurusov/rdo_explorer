
{-------------------------Генератор  запросов------------------------------------------}
{ / 1 / - Генерарация запроса на обслуживание
          \установка флага запроса и номера абонента\}
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
{ / 2 / - Выборка  по флагу запроса и рождение соответствующей тразакции}
$Pattern	 Generate : rule {trace} 
$Relevant_resources
	Sys:Sy				Keep
	Cn:Счетчик			Keep
	Tr:Транзакция		Create
$Body
Sys
	Choice from
	Sys.Fl_g = 1
first
Convert_rule
	Fl_g	set	0
Cn
	Choice from
	Cn.Номер = Sys.N_g and Cn.Кто = A
first
Convert_rule
	C_t	set	Cn.C_t + 1
Tr	
Convert_rule	{trace}
Номер	                set	Cn.C_t			          {Номер транзакции}
Приоритет	        set	Pr_ch(Приоритет_hst( Cn.Номер ))  {Приоритет запроса}
Источник_запроса	set	Cn.Номер			  {Источник запроса}
Номер_очереди   	set	0
Состояние	        set	Q
Сч               	set	0
Тип              	set	1
Ноп                     set	0
Кто              	set	M
$End
{----Далее по смыслу смотри / 33 / - Get_Transaction_Statistic-}
{-----------------------------------------Вход  в  очередь-----------------------------------------------}
{/ 3 / - Вход транзакции в очередь соответственно её приоритету}
$Pattern	 QueueInPr : rule	{trace} 
$Parameters
	Par: such_as Счетчик.Кто	        {Вид очереди:абонент, файл(на запись), РС(на обраб.)}
$Relevant_resources
	Tr:Транзакция		Keep
	Cn:Счетчик		Keep
	FL:RegFl		Keep
$Body
Tr
	Choice from
	Tr.Номер_очереди = 0 and Tr.Состояние = Cmt1(Par) 
first
Convert_rule
Номер_очереди      set   Cn.C_p1 * Qst(1, Tr.Приоритет) + Cn.C_p2 * Qst(2, Tr.Приоритет)
              + Cn.C_p3 * Qst(3, Tr.Приоритет) + 1
Сч	set	Cmt( Par, 0, 1 + Cn.C_t)
Cn
	Choice from
	Cn.Номер = Cmt(Par, Tr.Источник_запроса, Mux(Par, Tr.Тип,
                   Aws(Par, Tr.Ноп,Tr.Тип))) and  Cn.Кто = Par
first
Convert_rule
	C_t	set	Cmt(Par, Cn.C_t, Cn.C_t + 1)
	C_n	set	Cmt(Par, Tr.Номер, Tr.Сч)
	C_q	set	Tr.Номер_очереди
	C_p1	set	Cn.C_p1 + Pr_Inc(1, Tr.Приоритет)
	C_p2	set	Cn.C_p2 + Pr_Inc(2, Tr.Приоритет)		
	C_p3	set	Cn.C_p3 + Pr_Inc(3, Tr.Приоритет)		
FL
	Choice from
           FL.Номер = Cmt(Par, Tr.Источник_запроса, Mux(Par, Tr.Тип,
           Aws(Par, Tr.Ноп,Tr.Тип))) and FL.Fl_O = 0 and FL.Fl_I = 0 
           and FL.Кто = Par
first
Convert_rule
	Fl_I	set	1		{Установить флаг входа в очередь}
	Sum	set	FL.Sum + 1	{INC текущий размер очереди}
$End
{/ 4 / - Перестройка очереди в связи с входом новой транзакции}
$Pattern	 QueueIn : rule {trace} 
$Parameters
	Par: such_as Счетчик.Кто
$Relevant_resources
	FL:RegFl		NoChange
	Cn:Счетчик		Keep
	Tr:Транзакция		Keep
$Body
FL
	Choice from
	FL.Fl_I = 1 and FL.Кто = Par	{Если уст. флаг входа}
first
Cn
	Choice from
	Cn.Номер = FL.Номер and Cn.Кто = Par
first
Convert_rule
	C_n	set	Cmt( Par, Tr.Номер, Tr.Сч)
	C_q	set	Tr.Номер_очереди + 1 
Tr
	Choice from
	Tr.Состояние = Cmt1(Par) and Cmt(Par, Tr.Источник_запроса, 
                 Mux(Par, Tr.Тип, Aws(Par,Tr.Ноп,Tr.Тип))) = Cn.Номер
                 and Tr.Номер_очереди = Cn.C_q  and Cmt(Par, Tr.Номер, Tr.Сч) <> Cn.C_n
first
Convert_rule
	Номер_очереди	set	Tr.Номер_очереди + 1
$End
{/ 5 /-Сброс флага входа в очередь после её упорядочивания----------------------------------}
$Pattern	 ResInFl : rule {trace} 
$Parameters
	Par: such_as Счетчик.Кто
$Relevant_resources
	FL:RegFl		Keep
	Cn:Счетчик		NoChange
$Body
FL
	Choice from
	FL.Fl_I = 1 and FL.Кто = Par
first
Convert_rule
	Fl_I	set	0
Cn
	Choice from
Cn.C_q = Cn.C_p1 + Cn.C_p2 + Cn.C_p3 and Cn.Номер = FL.Номер and Cn.Кто = Par
first
$End

{-----------------------------Выход  из  очереди-----------------------------------}
{/ 6 / - Выход транзакции из очереди при установке флага разрешения выхода}
$Pattern	 QueueOutPr : rule {trace} 
$Parameters
	Par: such_as Счетчик.Кто
$Relevant_resources
	FL:RegFl		Keep
	Cn:Счетчик		Keep
	Tr:Транзакция		Keep
$Body
FL
	Choice from
	FL.Fl_O = 0 and FL.Fl_I = 0 and FL.En_f = 1 and FL.Кто = Par
	                                  {Если разрешен выход из очереди}
with_max( FL.Sum )
Convert_rule
	Fl_O	set	1		{Установить флаг выхода из очереди}
	En_f	set	0		{Запретить выход из очереди}
	Sum	set	FL.Sum  - 1	{DEC текущий размер очереди}
Cn
	Choice from
	Cn.Номер = FL.Номер and Cn.Кто = Par
first	
 Convert_rule
	C_q	set	2
	C_p1	set	Cn.C_p1 - Pr_Inc(1, Tr.Приоритет )
	C_p2	set	Cn.C_p2 - Pr_Inc(2, Tr.Приоритет )		
	C_p3	set	Cn.C_p3 - Pr_Inc(3, Tr.Приоритет )		
Tr
	Choice from
	Tr.Состояние = Cmt1(Par) and		{Первый уходит на обработку}
	Tr.Номер_очереди = 1 and
	Cmt( Par, Tr.Источник_запроса, Mux(Par, Tr.Тип, Aws(Par,Tr.Ноп,Tr.Тип))) = FL.Номер 
first
Convert_rule
	Номер_очереди	set	Cmt( Par, -1, -5)
$End
{/ 7 /-Перестройка очереди в связи с выходом из нее транзакции}
$Pattern	 QueueOut : rule {trace} 
$Parameters
	Par: such_as Счетчик.Кто
$Relevant_resources
	FL:RegFl		NoChange
	Cn:Счетчик		Keep
	Tr:Транзакция    	Keep
$Body
FL
	Choice from
	FL.Fl_O = 1 and FL.Кто = Par
first
Cn
	Choice from
	Cn.Номер = FL.Номер and Cn.Кто = Par
first
Convert_rule
C_q	set	Cn.C_q + 1
Tr
	Choice from
	Tr.Состояние = Cmt1(Par) and Tr.Номер_очереди = Cn.C_q and Cmt(Par, Tr.Источник_запроса, 
                 Mux(Par, Tr.Тип, Aws(Par, Tr.Ноп,Tr.Тип))) = FL.Номер 
first
Convert_rule
	Номер_очереди	set	Tr.Номер_очереди - 1
$End
{/ 8 / - Сброс флага выхода из очереди после её перестройки}
$Pattern	 ResOutFl : rule {trace} 
$Parameters
	Par: such_as Счетчик.Кто
$Relevant_resources
	Cn:Счетчик	Keep
	FL:RegFl	Keep
$Body
Cn
	Choice from
Cn.Кто = Par and Cn.C_q = Cn.C_p1 + Cn.C_p2 + Cn.C_p3 + 2
first
Convert_rule
	C_q	set	0
FL
	Choice from
	FL.Номер = Cn.Номер and FL.Fl_O = 1 and FL.Кто = Par
first
Convert_rule
	Fl_O	set	0
$End

{ -------------------------------Блокировка  файлов------------------------------ }
{/ 9 / - Подготовка к декомпозиции заявки на блокировочные транзакции}
$Pattern	 FiDecPr : rule {trace}
$Relevant_resources
	Tr:Транзакция	Keep
	Sys:Sy		Keep	
$Body
Tr
	Choice from
	Tr.Номер_очереди = -1 and Tr.Состояние = I	{Если кто-то вышел из очереди абонентов}
first
Convert_rule
	Номер_очереди  set	-2		         {Инициировать блокировку файлов}
	Состояние	set	R_W_Fun		       {Озадачить на: -чтение или запись}
	Тип	set	Pr_ch( Kin_hst( Tr.Источник_запроса))	{ - вид графа }
Sys
	Choice from
	Sys.T_f = 0				{Если система свободна}
first 
Convert_rule
	T_f	set	1			{Занять систему}
	F_c	set	1			{Счетчик файлов уст. на №1}
$End 

{/ 10 / - Декомпозиция заявки на блокировочные транзакции}
$Pattern	 FiDec: rule {trace}
$Relevant_resources
	Tr:Транзакция    	Keep
	Sys: Sy			Keep	
	DTr:Транзакция		Create
$Body
Tr
	Choice from
	Tr.Номер_очереди = -2 and [Tr.Состояние = R or Tr.Состояние = W ]
first
Convert_rule
	Номер_очереди  set  -2 - Pr_Inc(0,FF_table(Sys.F_c + 1,Tr.Тип)) {-3,если выбран последний 
								фиктивный подзапрос(файл)}
	Сч  set	 Tr.Сч + 1 	         {счетчик файлов, блокируемых текущим запросом}
Sys
	Choice from
	Sys.T_f = 1
first 
Convert_rule
	T_f  set  1 - Pr_Inc(0,FF_table(Sys.F_c  + 1, Tr.Тип)) {0 ,если выбран последний
                                                                  фиктивный подзапрос(файл)}
	F_c  set  Sys.F_c + 1
	Q_c  set  Sys.Q_c + ActComp( Tr.Состояние ,R )	{служебная 'очередь' фиктивных подза-
 							просов(блокировка файла !!*на чтение only*!!)
  							увеличивается на 1}
	Q_f  set  ActComp( Tr.Состояние ,R )		{1,если запрос на чтение (активизировать перебор
                                                служебной очереди (блокировка файла !!!*на чтение only*!!!)}
	Q_s  set  1				{перебор начать с №1}
DTr
Convert_rule  {trace}
Номер	           set	Tr.Номер		{номер "родителя" данного подзапроса}
Приоритет	   set	Tr.Приоритет		{приоритет "родителя" данного подзапроса}
Источник_запроса   set	Tr.Источник_запроса     {РС-источник "родителя" данного подзапроса}
Номер_очереди      set	Sys.Q_c * ActComp(Tr.Состояние , R)	{порядковый номер в служебной 'очереди' фиктивных
                                                подзапросов(бл.файла !!!*на чтение*!!!)}
Состояние          set	Tr.Состояние
Сч                 set	-1
Тип                set	FF_table(Sys.F_c - 1, Tr.Тип)	{номер блокируемого фиктивным подзапросом файла }
Ноп      	  set	0
Кто                set	F
$End

{/ 11 / - Блокировка файла на чтение и уничтожение блокировочной транзакции}
$Pattern	 RdFiAcc: operation {trace}
$Parameters
	Par:real
$Relevant_resources
	Sys: Sy			Keep		Keep	
	TrD:Транзакция		Erase		NonExist
	Fi:Файл			Keep		NoChange
	Tr:Транзакция		NoChange 	Keep
	FL:RegFl		Keep		NoChange 	
$Time = Par
$Body
Sys
	Choice from
	Sys.Q_f = 1			{Если активен флаг перебора служебной очереди
                                        (блокировка файла !!!*на чтение only*!!!)}
first
Convert_begin
	Q_c  set  Sys.Q_c - 1		         {уменьшение служебной 'очереди' на 1}
	Q_f  set  -1 + Pr_Inc( Sys.Q_c + 1, Sys.Q_s) {-1,если из служебной 'очереди' 
                                                  вышел не последний подзапрос (go RdQuOu); 
						 0,если вышел последний(закончить перебор)}
Convert_end
{**}	Nf  set  Fi.Номер
TrD
	Choice from
	TrD.Сч = -1 and TrD.Номер_очереди = Sys.Q_s and  TrD.Состояние = R	{Убрать лишнего}
first
Fi
	Choice from
	Fi.Номер = TrD.Тип  and  Fi.Доступ >= 0	{если файл не заблокирован на запись}
first
Convert_begin
	Доступ  set  Fi.Доступ + 1   	{заблокировать файл (соответствующий 
					текущему фиктивному подзапросу) на чтение }
Tr
	Choice from
	Tr.Номер_очереди = -3 and Tr.Источник_запроса = TrD.Источник_запроса and 
                 Tr.Номер = TrD.Номер and Tr.Состояние = R
first
Convert_end
	Сч  set  Tr.Сч - 1	        {уменьшить количество незаблокированных файлов
                                        (в списке запроса "родителя") на 1}
FL
	Choice from
	FL.Sum = 0 and FL.Номер = TrD.Тип and FL.Кто = F {если файл не имеет очередников
                                                          на запись}
first
Convert_begin
	En_f	set	0		{запретить одновременный доступ к 
					файлу подзапросов на запись}
$End

{/ 12 / - Блокировка файла на запись и уничтожение блокировочной транзакции}
$Pattern	 WrFiCom: operation {trace}
$Parameters
	Par:real
$Relevant_resources
	TrD:Транзакция		Erase		NonExist
	Fi:Файл			Keep		NoChange
	Tr:Транзакция		NoChange	Keep
	Sys: Sy			NoChange	Keep	
$Time = Par
$Body
TrD
	Choice from
	TrD.Номер_очереди =  -5 and  TrD.Состояние = W	    {Если кто-то вышел из очереди блокировки 
					    файла на запись}
first
Fi
	Choice from
	Fi.Номер = TrD.Тип and Fi.Доступ = 0  	{Если нужный ему файл свободен}
first
Convert_begin
	Доступ	set	 -1			{Заблокировать файл на запись}
Tr
	Choice from
	Tr.Номер_очереди = -3 and Tr.Источник_запроса = TrD.Источник_запроса and
                Tr.Номер = TrD.Номер and Tr.Состояние = W
first
Convert_end
	Сч	set	Tr.Сч - 1     {уменьшить количество незаблокированных
                                      файлов (в списке запроса "родителя") на 1}
Sys
	Choice NoCheck
first
Convert_end
{**}	Nf	set	Fi.Номер
$End

{/ 13 / - Перебор транзакций, блокирующих на запись}
$Pattern	 RdQuC: rule {trace}
$Relevant_resources
	Sys: Sy			Keep	
$Body
Sys
	Choice from
	Sys.Q_f = 1			{Если активен флаг перебора очереди:}
first
Convert_rule
	Q_f  set  1 - Qst( Sys.Q_s, Sys.Q_c) {-сбросить флаг, если достигнут конец очереди}   
	Q_s  set  Sys.Q_s + 1	             {-перейти на следующий по порядку подзапрос}	
$End

{/ 14 / - Перебор транзакций, блокирующих на чтение}
$Pattern	 RdQuOu: rule {trace}
$Relevant_resources
	Sys: Sy			Keep	
	Tr:Транзакция		Keep
$Body
Sys
	Choice from
	Sys.Q_f = -1		{,если из очереди кто-то вышел (не последний):}
first
Convert_rule
	Ch_n  set  Sys.Q_s	{-запомнить его порядковый номер в очереди}
	Q_f   set   1           {-активизировать новый перебор}
	Q_s   set   1	        { с №1}
Tr
	Choice from
	Tr.Сч = -1 and Tr.Состояние = R and Tr.Номер_очереди = Sys.Q_c + 1 {-выбрать последнего из очереди}
first
Convert_rule
	Номер_очереди	set	Sys.Ch_n			{и поставить на его место}
$End

{/15 / - Окончание блокировки файлов, участвующих в запросе}
$Pattern	 FiCom: rule {trace}
$Relevant_resources
	Tr:Транзакция		Keep
$Body
Tr	
	Choice from
	Tr.Номер_очереди = -3 and Tr.Сч = 0 and
               [Tr.Состояние = R or Tr.Состояние = W ] {Если имеется запрос,
                                      который заблокировал все необходимые ему файлы}
first
Convert_rule
	Номер_очереди	set	-4			      {Отметить его}	
$End	

{----------------------------------Декомпозиция запроса  на  подзапросы----------------------}
{/ 16 / - Подготовка к декомпозиции запроса на подзапросы}
$Pattern	 SerDecPr : rule {trace}
$Relevant_resources
	Tr:Транзакция	Keep
	Sys:Sy1		Keep	
$Body
Tr
	Choice from
	Tr.Номер_очереди = -4 and [Tr.Состояние = R or Tr.Состояние = W ]		{См. пред.}
first
Convert_rule
	Номер_очереди	set	-6		{выделить запрос для декомпозиции}
Sys
	Choice from
	Sys.T_f = 0			{Если система свободна}
first 
Convert_rule
	T_f	set	3		{Установить флаг счетчика декомпозиции}
	Pz_c	set	1		{Установить счетчик на 1}
$End 

{/ 17 / - Нахождение в таблице предпоследнего подзапроса} 
$Pattern	 CouDecPr : rule {trace}
$Relevant_resources
	Tr:Транзакция	NoChange
	Sys:Sy1		Keep	
$Body
Tr
	Choice from
	Tr.Номер_очереди = -6 and [Tr.Состояние = R or Tr.Состояние = W ]	{выбрать выделенный запрос}	
first
Sys
	Choice from
	Sys.T_f = 3			{Если установлен флаг счетчика декомпозиции}
first 
Convert_rule
	T_f   set  3 - Pr_Inc(Gr_table( Sys.Pz_c,Tr.Тип), -1) {Установить флаг
                                            декомпозиции 2, если достигнут корень 
                                            графа подзапросов (счетчик будет содержать
                                            количество подзапросов +1 )}
	Pz_c  set  Sys.Pz_c + 1		{Счетчик увеличить на 1}
$End

{/ 18 / - Появление предпоследнего подзапроса}
$Pattern	 TopSubInqPr : rule {trace}
$Relevant_resources
	Sys:Sy1			Keep
	Tr:Транзакция		Keep
	DTr:Транзакция		Create
$Body
Sys
	Choice from
	Sys.T_f = 2			{Если установлен флаг декомпозиции}
first 
Convert_rule
	T_f   set  1 - Pr_Inc( Sys.Pz_c - 1, 1)	{Если подзапрос-корень единственный,
                                                то закончить декомпозицию}
	Pz_c  set  Sys.Pz_c - 1			{Уменьшить счетчик подзапросов на 1}
Tr
	Choice from
	Tr.Номер_очереди = -6 and [Tr.Состояние = R or Tr.Состояние = W ]
first
Convert_rule
	Номер_очереди	set	-6 - Pr_Inc( Sys.Pz_c, 1)   {если декомпозиция закончена,
                                                    ждать агрегирования (go SerCom)}
DTr						    {Родить подзапрос-корень}
Convert_rule  {trace}
Номер	          set	Tr.Номер		{номер "родителя" данного подзапроса }
Приоритет	  set	Tr.Приоритет		{приоритет "родителя" данного подзапроса}
Источник_запроса  set	Tr.Источник_запроса	{РС-источник "родителя" данного подзапроса}
Номер_очереди     set	0
Состояние         set	B
Сч                set	0
Тип               set	Tr.Тип			{вид графа}
Ноп	          set	Sys.Pz_c			{номер подзапроса в графе}
Кто               set	S
$End

{/ 19 / - Декомпозиция запроса на подзапросы}
$Pattern	 SerDec: rule {trace}
$Relevant_resources
	Sys: Sy1			Keep	
	Tr:Транзакция		Keep
 	DTr:Транзакция	Create
	FTr:Транзакция		Keep
$Body
Sys
	Choice from
	Sys.T_f = 1			{Продолжить декомпозицию}
first 
Convert_rule
	T_f   set  1 - Pr_Inc( Sys.Pz_c - 1, 1)  {Если достигнут первый подзапрос,
                                                      закончить декомпозицию}
	Pz_c  set  Sys.Pz_c - 1		         {Уменьшить счетчик подзапросов на 1}	
Tr
	Choice from
	Tr.Номер_очереди = -6 and [Tr.Состояние = R or Tr.Состояние = W ]
first
Convert_rule
	Номер_очереди  set  -6 - Pr_Inc( Sys.Pz_c, 1)  {если декомпозиция закончена, ждать
                                            агрегирования (go SerCom)}
DTr					    {Родить подзапрос}
Convert_rule  {trace}

Номер             set	Tr.Номер	    {номер "родителя" данного подзапроса}
Приоритет	  set	Tr.Приоритет	    {приоритет "родителя" данного подзапроса}
Источник_запроса  set	Tr.Источник_запроса {РС-источник "родителя" данного подзапроса}
Номер_очереди     set	0
Состояние         set	B				{Заблокировать "до востребования"}
Сч                set	0
Тип	          set	Tr.Тип				{вид графа}
Ноп               set	Sys.Pz_c			{номер подзапроса в графе}
Кто               set	S
FTr
	Choice from
	FTr.Номер = Tr.Номер and FTr.Источник_запроса = Tr.Источник_запроса
                    and FTr.Состояние = B and FTr.Ноп = Gr_table( Sys.Pz_c - 1, Tr.Тип)
                                              {Выбрать "отца" родившегося подзапроса}
first
Convert_rule
	Сч  set  FTr.Сч + 1	   {Увеличить счетчик подзапросов "сыновей" на 1}
$End

{--------------------------Обработка подзапросов-------------------------------------------}
{/ 20 / - Запросо на пересылку данных соответствующей фиктивной операции}
$Pattern	 FicSubInqMovPr: rule {trace}
$Relevant_resources
	DTr:Транзакция		Keep
	ST:Станция		Keep
	FL: RegFl		Keep	
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
DTr
    Choice from
      DTr.Номер_очереди = 0 and DTr.Состояние = B and DTr.Сч = 0 and Sq_table( DTr.Ноп, DTr.Тип) = -1
	   {Выбрать подзапрос, соответствующий фиктивной операции считывания файла}
first
Convert_rule
	Состояние  set  M			     {Установить флаг требования пересылки}
	Сч   set  FA_table( FF_table( DTr.Ноп,DTr.Тип))	{Откуда пересылать (№РС)}
ST
	Choice from
	ST.Номер = FA_table( FF_table( DTr.Ноп,DTr.Тип))	{Выбрать станцию "источник"}
first
Convert_rule
	Нал_запр  set  ST.Нал_запр + 1	      {Увеличить счетчик количества подзапросов 
				       требующих пересылки с данной РС на 1}
FL
	Choice from
	FL.Номер = ST.Номер and FL.Кто = S
first
Convert_rule
	En_f	set	0			{Запретить обработку подзапросов}
SQS
	Choice from
	SQS.Номер = DTr.Ноп
first
Convert_rule
Arr	set	Ccm(Qst2(Pr_Inc(DTr.Номер, CTr.Номер),
                Pr_Inc(DTr.Источник_запроса, CTr.Источник_запроса)),MN,SQS.Arr)
CTr
	Choice NoCheck
first
$End

{/ 21 / - Подготовка транзакции-подзапроса к входу в очередь ожидания обработки}
$Pattern	 SubInqSerPr: rule {trace}
$Relevant_resources
	DTr:Транзакция		Keep
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
DTr
     Choice from
	DTr.Номер_очереди = 0 and DTr.Состояние = B and DTr.Сч = 0 and Sq_table(DTr.Ноп, DTr.Тип) > 0
                 {Выбрать подзапрос, соответствующий не фиктивной операции}
first
Convert_rule
	Состояние	set	P	{Установить флаг требования обработки (go QueueInPr)}
SQS
	Choice from
	SQS.Номер = DTr.Ноп
first
Convert_rule
Сост	set	Ccn(Qst2(Pr_Inc(DTr.Номер, CTr.Номер),
                Pr_Inc(DTr.Источник_запроса, CTr.Источник_запроса)),PN,SQS.Сост)
CTr
	Choice NoCheck
first
$End

{/ 22 / - Обработка подзапроса на РС ЛВС}
$Pattern	 SubInqSer: operation {trace}
$Parameters
	Par1:real
	Par2: real 
$Relevant_resources
	DTr:Транзакция   	Keep 		Keep
	ST:Станция		Keep		Keep
	SQS:SubQ		Keep		Keep
	CTr:AT			NoChange	NoChange
$Time = Proc_Fun( Par1, Par2)
$Body
DTr
	Choice from
	DTr.Номер_очереди = -5 and DTr.Состояние = P	{Если кто-то вышел из очереди ожидания  
					 обработки подзапроса на РС}
first
Convert_begin
	Номер_очереди   set  -6	              {начать обработку}
Convert_end				      {закончить обработку}
	Состояние       set  M		      {Установить флаг требования пересылки}
	Сч   set  Sq_table( DTr.Ноп, DTr.Тип)  {Откуда пересылать (№РС)}
ST
	Choice from
	ST.Сост = F and ST.Номер = Sq_table( DTr.Ноп, DTr.Тип)
	                         {Выбрать РС соответствующую не фиктивной операции}
first
Convert_begin
	Сост   set  P		   {начать обработку}
Convert_end					
	Сост   set  F		   {закончить обработку}
	Нал_запр   set  ST.Нал_запр + 1	   {Увеличить счетчик количества подзапросов, 
                                    требующих пересылки с данной РС на 1}
SQS
	Choice from
	SQS.Номер = DTr.Ноп
first
Convert_begin
Сост	set	Ccn(Qst2(Pr_Inc(DTr.Номер, CTr.Номер),
                Pr_Inc(DTr.Источник_запроса, CTr.Источник_запроса)),PS,SQS.Сост)
Convert_end
Сост	set	Ccn(Qst2(Pr_Inc(DTr.Номер, CTr.Номер),
                Pr_Inc(DTr.Источник_запроса, CTr.Источник_запроса)),PE,SQS.Сост)
Arr	set	Ccm(Qst2(Pr_Inc(DTr.Номер, CTr.Номер),
                Pr_Inc(DTr.Источник_запроса, CTr.Источник_запроса)),MN,SQS.Arr)
CTr
	Choice NoCheck
first
$End

{/ 23 / - Переход транзакции-подзапроса в состояние пересылки результатов операции}
$Pattern	 SubInqMov: rule {trace}
$Parameters
	Par1:integer
	Par2:integer
$Relevant_resources
	ST  : Станция		Keep
	DTr : Транзакция		Keep
	Sys : Sy1		Keep
	SQS : SubQ		Keep
	CTr : AT		NoChange	
$Body
ST
	Choice from
	ST.Сост = F and ST.Нал_запр > 0      {Выбрать РС с наличием подзапросов,
                                         требующих пересылки}
with_max(ST.Нал_запр)
Convert_rule
	Сост set  R		        {Перейти в состояние пересылки}
	Объем_данных set  (1 - Pr_Inc(ST.Номер,Sq_table(Gr_table(DTr.Ноп,DTr.Тип),DTr.Тип))) * 
	(Wei_Fun(Par1,Par2)  + 1)	{Вес пакета требующего пересылки, если нужно переслать}
  				    {или 0,если подзапрос-"отец" будет обрабатываться здесь же}
	Нал_запр	set	ST.Нал_запр - 1	{Уменьшить счетчик количества подзапросов, 
					 требующих пересылки с данной РС на 1}
DTr
	Choice from
	DTr.Состояние = M and DTr.Сч = ST.Номер and Gr_table(DTr.Ноп,DTr.Тип) > 0
with_max( DTr.Приоритет)	        {Выбрать подзапрос, требующий пересылки с данной РС}
Convert_rule
	Сч	set	0 - DTr.Сч	{Отметить его}
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c + 1  {INC  счетчик количества РС, участвующих в пересылке}
SQS
	Choice from
	SQS.Номер = DTr.Ноп
first
Convert_rule
Arr	set	Ccm(Qst2(Pr_Inc(DTr.Номер, CTr.Номер),
                Pr_Inc(DTr.Источник_запроса, CTr.Источник_запроса)),MS,SQS.Arr)
CTr
	Choice NoCheck
first
$End

{/ 24 / - Переход транзакции-подзапроса в состояние пересылки результатов 
          предпоследней операции запроса}
$Pattern	 TopSubInqMov: rule {trace}
$Parameters
	Par1:integer
	Par2:integer
$Relevant_resources
	ST:Станция		Keep
	DTr:Транзакция		Keep
	Sys: Sy1			Keep
$Body
     {Всё также как в предыдущем правиле, но для подзапроса "корня" графа-"дерева"}
ST
	Choice from
	ST.Сост = F and ST.Нал_запр > 0
with_max(ST.Нал_запр)
Convert_rule
	Сост  set R
	Объем_данных  set (1 - Pr_Inc(ST.Номер,DTr.Источник_запроса)) * (Wei_Fun(Par1,Par2) + 1)
	Нал_запр  set ST.Нал_запр - 1
DTr
	Choice from
	DTr.Состояние = M and DTr.Сч = ST.Номер and Gr_table(DTr.Ноп,DTr.Тип) = -1
with_max( DTr.Приоритет)
Convert_rule
	Сч	set	0 - DTr.Сч
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c + 1
$End

{/ 25 / - Пересылка одного пакета данных для всех пересылающих РС}
$Pattern	 Move: operation {trace}
$Parameters
	Nm:integer[1..256]	{Кол-во РС в сети}
	Cir_t:real		{Время пересылки порции пакета с 1 РС}
$Relevant_resources
	Sys: Sy1		Keep	Keep
$Time = Cir_t * Sys.M_c		{Цикл пересылки порции пакета с каждой из РС}
$Body
Sys
	Choice from
	Sys.M_f = 0 and Sys.O_c = Nm  + 1 and Sys.M_c > 0
	{Если закончился предыдущий цикл уменьшения веса пакета на 1 и 
         существуют РС, требующие пересылки}
first 
Convert_begin			
	M_f	set	1	{Запретить цикл уменьшения веса пакета на 1}
Convert_end
	M_f	set	0	{ Разрешить цикл уменьшения веса пакета на 1}
	O_c	set	1	{Установить счетчик РС на №1}
$End

{/ 26 / - Вычитание пакета данных после цикла пересылки}
$Pattern	 OutWei: rule {trace}
$Relevant_resources
	Sys: Sy1			Keep	
	ST:Станция		Keep
$Body
Sys
	Choice from
	Sys.M_f  = 0 and Sys.M_c > 0	{Цикл уменьшения веса пакета на 1}
first 
Convert_rule
	O_c	set	Sys.O_c + 1	{Увеличить счетчик РС на 1}
ST
	Choice from
	ST.Номер = Sys.O_c
first
Convert_rule
	Объем_данных	set	ST.Объем_данных  - 1	{Уменьшение веса пересылаемого пакета на 1}
$End

{/ 27 / - Окончание пересылки данных}
$Pattern	 EndSubInqMov: rule {trace}
$Relevant_resources
	ST:Станция		Keep
	DTr:Транзакция		Keep
	Sys: Sy1		Keep	
	FL: RegFl		Keep	
	SQS:SubQ		Keep
	CTr:AT			NoChange	
$Body
ST
	Choice from
	ST.Объем_данных  <= 0 and ST.Сост = R	{Выбрать РС переславшую весь пакет}
first
Convert_rule
	Сост	set	F		{Сбросить с неё признак пересылки}
DTr
	Choice from
	DTr.Состояние = M and DTr.Сч = 0 - ST.Номер {Выбрать подзапрос, который инициировал
                                               пересылку}
first
Convert_rule
	Сч	set	0		{Сбросить с него признак пересылки}
Sys
	Choice NoCheck
first 
Convert_rule
	M_c	set 	Sys.M_c - 1	{DEC счетчик количества РС, участвующих
                                         в пересылке}
	O_c	set	Sys.O_c - Pr_Inc(Sys.M_c,0) * (Sys.O_c - 1) 
	                {Если пересылала одна РС, то установить счетчик РС на №1 }
FL
	Choice from
	FL.Номер = ST.Номер and FL.Кто = S
first
Convert_rule
	En_f	set	Pr_Inc( ST.Нал_запр, 0)	{Разрешить обработку подзапросов на
                                      РС, если она не имеет очередников на пересылку}
SQS
	Choice from
	SQS.Номер = DTr.Ноп
first
Convert_rule
Arr	set	Ccm(Qst2(Pr_Inc(DTr.Номер, CTr.Номер),
                Pr_Inc(DTr.Источник_запроса, CTr.Источник_запроса)),ME,SQS.Arr)
CTr
	Choice NoCheck
first
$End

{/ 28 / - Агрегирование и уничтожение транзакций-подзапросов}
$Pattern	 SubInqCom: rule {trace}
$Relevant_resources
	DTr:Транзакция		Erase
	FTr:Транзакция		Keep
$Body
DTr
	Choice from
	DTr.Состояние = M and DTr.Сч = 0 and Gr_table( DTr.Ноп, DTr.Тип) > 0
	{Выбрать подзапрос, который закончил пересылку, и удалить его}
first
FTr
	Choice from
	FTr.Номер = DTr.Номер and FTr.Источник_запроса = DTr.Источник_запроса and
                    FTr.Состояние = B and FTr.Ноп = Gr_table( DTr.Ноп, DTr.Тип)	
                                                       {Выбрать "отца" удаленного}
first
Convert_rule
	Сч	set	FTr.Сч - 1	{DEC счетчик подзапросов - "сыновей" }
$End

{----------------------------------Агрегирование подзапросов--------------------------------------------}
{/ 29 / - Последний этап агрегирования подзапросов в запрос}
$Pattern	 SerCom: rule {trace}
$Relevant_resources
	DTr:Транзакция		Erase
	FTr:Транзакция		Keep
$Body
DTr
	Choice from
DTr.Состояние = M and DTr.Сч = 0 and Gr_table( DTr.Ноп, DTr.Тип) = -1
	{Выбрать подзапрос-"корень", который закончил пересылку, и удалить его}
first
FTr
	Choice from
	FTr.Номер = DTr.Номер and FTr.Источник_запроса = DTr.Источник_запроса
                    and FTr.Номер_очереди = -7 and [FTr.Состояние = R or FTr.Состояние = W ]	
                        	{Выбрать "отца"(запрос абонента) удаленного}
first
Convert_rule
	Номер_очереди	set	-8		{Агрегирование запроса состоялось}
$End

{ --------------------------Разблокировка  файлов------------------------------ }
{/ 30 / - Подготовка к разблокированию файлов}
$Pattern	 FiDeBlPr : rule {trace}
$Relevant_resources
	Tr:Транзакция	Keep
	Sys:Sy		Keep	
$Body
Tr
	Choice from
	Tr.Номер_очереди = -8 and [Tr.Состояние = R or Tr.Состояние = W ]    {Выбрать запрос агрегирование 
                                                       которого состоялось}
first
Convert_rule
	Номер_очереди	set	-9			{Инициировать разблокировку файлов}
Sys
	Choice from
	Sys.T_f = 0				{Если система свободна}
first 
Convert_rule
	T_f	set	1			{Занять систему}
	F_c	set	1			{Счетчик файлов установить на №1}
$End

{/ 31 / - Разблокирование файлов, участвующих в запросе}
$Pattern	 FiDeBlock: rule {trace}
$Relevant_resources
	Tr:Транзакция	Keep
	Sys: Sy		Keep
	Fi:Файл		Keep
	FL: RegFl	Keep

$Body
Tr
	Choice from
	Tr.Номер_очереди = -9 and [Tr.Состояние = R or Tr.Состояние = W ]
first
Convert_rule
	Номер_очереди   set  -9 - Pr_Inc(0,FF_table(Sys.F_c + 1,Tr.Тип))	{-10,если выбран
                                            последний фиктивный подзапрос(файл)}
Sys
	Choice from
	Sys.T_f = 1						
first 
Convert_rule
	T_f  set  1 - Pr_Inc(0,FF_table(Sys.F_c  + 1, Tr.Тип))	{0,если выбран
                                            последний фиктивный подзапрос(файл)}
	F_c  set  Sys.F_c + 1				{INC счетчик файлов}
	Q_f  set  1			    {активизировать перебор служебной
                                            очереди блокированных файлов на чтение}
	Q_s  set  1				{перебор начать с №1}
Fi
	Choice from
	Fi.Номер = FF_table(Sys.F_c , Tr.Тип)	{Выбрать разблокируемый файл}
first
Convert_rule
	Доступ  set  Fi.Доступ + CirFun( Fi.Доступ)	{Обнулить переменную доступа, если 
						была блокировка на запись или DEC,
                                                если на чтение}
FL
	Choice from
	FL.Номер = Fi.Номер and FL.Кто = F
first
Convert_rule
	En_f	set	Pr_Inc(Fi.Доступ, 0)	{Разрешить доступ к файлу на
                                                 чтение и на запись)}
$End

{/ 32 / - Окончание обработки запроса и уничтожение соответствующей транзакции}
$Pattern	 SerEnd: rule {trace}
$Relevant_resources
	Tr:Транзакция			Erase
	STr: Статистика_Времени_Обработки	Erase
	FL: RegFl			Keep	
$Body
Tr	
	Choice from
	Tr.Номер_очереди = -10 and [Tr.Состояние = R or Tr.Состояние = W ]
	     {Выбрать запрос,закончивший разблокировку файлов и удалить его}
first
STr
	Choice from
	STr.Номер = Tr.Номер and STr.Источник_запроса = Tr.Источник_запроса
	{Выявить статистического двойника удаленного запроса и послать ему вслед}
first
FL
	Choice from
	FL.Номер = Tr.Источник_запроса and FL.En_f = 0 and FL.Кто = A
first
Convert_rule
	En_f  set  1	{Разрешить выход из очереди абонента соответствующей РС}
$End	

{/33/  - }
$Pattern	 CreateAnTr: rule {trace} 
$Relevant_resources
	Sys:Sy1				Keep
	Tr:Транзакция			NoChange
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
	Tr.Кто = M and Tr.Номер_очереди = 0 and Tr.Состояние = Q
first
STr
	Choice NoCheck
first					
Convert_rule
Номер	          set	Tr.Номер 
Приоритет	  set	Tr.Приоритет
Источник_запроса  set	Tr.Источник_запроса
Состояние         set 	Tr.Состояние 
Время_появления	  set	Time_now
Номер_очереди	set	0
F_c	          set	0
Сч      	  set	0
Cn	set	0
Pz_c	set	0
$End
{/ 34 / -Генерация транзакции-двойника для сбора статистических данных}
$Pattern	 Get_Transaction_Statistic : rule {trace} 
$Relevant_resources
	Tr:Транзакция			Keep
	STr: Статистика_Времени_Обработки	Create
$Body
Tr
	Choice from
	Tr.Кто = M and Tr.Номер_очереди = 0 and Tr.Состояние = Q		{Выявить младенца (запрос)}	
first
Convert_rule
Состояние	set	I			{Разрешить ему войти в очередь абонента}
STr					{Родить ему статистического двойника}
Convert_rule	{trace}
Номер	set	Tr.Номер 
Приоритет	set	Tr.Приоритет
Источник_запроса	set	Tr.Источник_запроса 
Время_появления	set	Time_now
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
	Tr:Транзакция			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice NoCheck
first					
Convert_rule 
Номер_очереди  set	Tr.Номер_очереди
Tr
	Choice from
	Tr.Кто = M and Tr.Номер= STr.Номер
                and Tr.Источник_запроса = STr.Источник_запроса and Tr.Номер_очереди <> STr.Номер_очереди
first
$End

{/ 37 / -}
$Pattern	 ActAnTr: rule {trace}
$Relevant_resources
	Sys:Sy1				NoChange
	STr:AT				Keep
	Tr:Транзакция			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice NoCheck
first					
Convert_rule 
Состояние	set	Tr.Состояние
Tr
Choice from
	Tr.Кто = M and Tr.Номер = STr.Номер
               and Tr.Источник_запроса = STr.Источник_запроса and Tr.Состояние <> STr.Состояние
first
$End

{/ 38 /-}
$Pattern	 KinAnTr: rule {trace}
$Relevant_resources
	Sys:Sy1				NoChange
	STr:AT				Keep
	Tr:Транзакция			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice NoCheck
first					
Convert_rule 
Тип	set	Tr.Тип
Tr
	Choice from
	Tr.Кто = M and Tr.Номер = STr.Номер 
           and Tr.Источник_запроса = STr.Источник_запроса and Tr.Тип <> STr.Тип
first
$End

{/ 39 / - }
$Pattern	 RedFiOn: rule {trace}
$Relevant_resources
	Ss:Sy1				NoChange
	STr:AT				Keep
	Sys: Sy				NoChange
	Fi:Файл				Keep
$Body
Ss
	Choice from
	Ss.An_f = 2
first
STr
	Choice from
	STr.Номер_очереди = -2 and STr.F_c <> Sys.F_c 
first					
Convert_rule 
F_c	set	Sys.F_c
Sys
	Choice from
	Sys.T_f = 1
first
Fi
	Choice from
	Fi.Номер = FF_table(Sys.F_c , STr.Тип)
first
Convert_rule
	Red	set	On
$End
{/ 40 / -}
$Pattern	 CtAnTr: rule {trace}
$Relevant_resources
	Sys: Sy1				NoChange
	STr:AT				Keep
	Tr:Транзакция			NoChange
$Body
Sys
	Choice from
	Sys.An_f = 2
first
STr
	Choice from
	STr.Номер_очереди = -3
first					
Convert_rule 
F_c	set	0
Сч	set	Tr.Сч
Cn	set	STr.Cn + 1
Tr
	Choice from
	Tr.Кто = M and Tr.Номер = STr.Номер 
            and Tr.Источник_запроса = STr.Источник_запроса and Tr.Сч <> STr.Сч
first
$End

{/ 41 / - }
$Pattern	 GreenFiOn: rule {trace}
$Relevant_resources
	Ss: Sy1		NoChange
	STr:AT		Keep
	Sys: Sy		NoChange
	Fi:Файл		Keep
$Body
Ss
	Choice from
	Ss.An_f = 2
first
STr
	Choice from
	STr.Номер_очереди = -3 and STr.Cn > 1
first					
Convert_rule
	Cn	set	1
Sys
	Choice NoCheck
first
Fi
	Choice from
	Fi.Номер = Sys.Nf
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
	Tr.Номер_очереди = -10
first
$End

{/ 43 / -}
$Pattern	 FiOff: rule {trace}
$Relevant_resources
	Ss:Sy1				NoChange
	STr:AT				Keep
	Sys: Sy				NoChange
	Fi:Файл				Keep
$Body
Ss
	Choice from
	Ss.An_f = 2
first
STr
	Choice from
	STr.Номер_очереди = -9 and STr.F_c <> Sys.F_c 
first					
Convert_rule 
F_c	set	Sy.F_c
Sys
	Choice from
	Sys.T_f = 1
first
Fi
	Choice from
	Fi.Номер = FF_table(Sys.F_c , STr.Тип)
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
	SQS.Номер = Ss.Pz_c
first
Convert_rule
Lev	set	SQFd.Lev + 1 
X_c	set	X_nul + Ss.X_ct * X_step	- 10 * SQS.Lev 
Y_c	set	Y_nul + SQS.Lev * Y_step
Сост	set	EX
SQFd
	Choice from
	SQFd.Номер = Gr_table(Ss.Pz_c, STr.Тип)
first
STr
	Choice from
	STr.Номер_очереди = -6 and STr.Pz_c <> Ss.Pz_c 
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
	SQS.Arr <> Off or SQS.Сост <> Off
first
Convert_rule
Сост	set	Off
Arr	set	Off
$End

