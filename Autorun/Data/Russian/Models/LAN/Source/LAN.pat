$Pattern Born1:irregular_event trace
$Parameters
	Ср_время:real
$Relevant_resources
	Кто:S1 Keep
$Time = Exp_need1(Ср_время)
$Body
 Кто
  Convert_event
	Запрос	set Есть
$End

$Pattern Born2:irregular_event
$Parameters
	Ср_время:real
$Relevant_resources
	Кто:S2 Keep
$Time = Exp_need2(Ср_время)
$Body
 Кто
  Convert_event
	Запрос	set Есть
$End

$Pattern Born3:irregular_event
$Parameters
	Ср_время:real
$Relevant_resources
	Кто:S3 Keep
$Time = Exp_need3(Ср_время)
$Body
 Кто
  Convert_event
	Запрос	set Есть
$End

$Pattern Born4:irregular_event
$Parameters
	Ср_время:real
$Relevant_resources
	Кто:S4 Keep
$Time = Exp_need4(Ср_время)
$Body
 Кто
  Convert_event
	Запрос	set Есть
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
	Mar.Сост = Выход
 first
 Convert_begin
 	Сост	set Недоступ
 Convert_end	
	Где	set Inc_to4(Mar.Где)
	Сост	set Вход
$End

$Pattern Take:operation
$Parameters
	Av_time:real
$Relevant_resources
	Кого:M1	  	Keep	 	Keep
	Кто: Абонент	NoChange	Keep
$Time = Exp_form(Av_time)
$Body
  Кого
	Choice from
	Кого.Сост = Вход and
	Кого.Занятость = Свободен
 first
 Convert_begin
 	Владелец	set Кого.Где
	Занятость	set Занят
	Кому		set Priv(Кого.Где + Stoi(Inc))
	Вес		set How_many
	Сост		set Недоступ
Convert_end	
	Сост	set Выход
  Кто
	Choice from
	Кто.Номер = Кого.Где and
	Кто.Запрос = Есть
 first
 Convert_end
	Запрос		set Нет
$End
	
$Pattern Out:operation
$Parameters
	Av_time:real
$Relevant_resources
	К1:M1	  Keep		  Keep
$Time = Exp_form(Av_time)
$Body
  К1
Choice from
	К1.Сост = Вход and К1.Занятость = Занят  and
	К1.Владелец = К1.Где and К1.Вес = 0
 first
Convert_begin
	Сост		set Недоступ
Convert_end
	Занятость	set Свободен	
	Сост		set Выход
$End

$Pattern Copy:operation
$Parameters
	Av_time:real
$Relevant_resources
	Кто:M1	  	Keep	 Keep
$Time = Exp_opr(Av_time)
$Body
  Кто
	Choice from
	Кто.Сост = Вход and
	Кто.Занятость = Занят and
	Кто.Кому = Кто.Где and
	Кто.Вес <> 0
 first
 Convert_begin
	Сост		set Недоступ
 Convert_end
	Вес		set Кто.Вес - 1
	Сост		set Выход
$End

$Pattern Put:operation
$Parameters
	Av_time:real
$Relevant_resources
	Кто:M1	  	Keep	Keep 
$Time = Exp_opr(Av_time)
$Body
  Кто
	Choice from
	Кто.Сост = Вход and
	Кто.Занятость = Занят and
	Кто.Владелец = Кто.Где and
	Кто.Вес <> 0
 first
 Convert_begin
	Сост		set Недоступ
Convert_end
	Сост		set Выход
$End

$Pattern Thru:operation trace
$Parameters
	Av_time:real
$Relevant_resources
	Кто:M1	  	Keep    	 Keep
$Time = Av_time
$Body
  Кто
  Choice from
	Кто.Сост = Вход  and
	Кто.Владелец<>Кто.Где and
	Кто.Кому<>Кто.Где 
 first
 Convert_begin
	Сост		set Недоступ
 Convert_end
	Сост	set Выход
$End
