$Pattern  Образец_Прибытие_танкера : irregular_event  trace
$Relevant_resources
  _порт        : Порт     Keep
$Time = Интервал_прибытия_танкеров(4, 18)
$Body
  _порт
	 Convert_event
		Прибыл_танкер  set да
$End

$Pattern  Образец_создание_танкера : rule  trace
$Relevant_resources
  _порт        : Порт                Keep
  Новый_танкер : Танкеры             Create
  ТДП          : Танкеры_для_показа  Keep
$Body
  _порт
	 Choice from _порт.Прибыл_танкер = да first
	 Convert_rule
		Прибыл_танкер   set нет
		Счетчик         set _порт.Счетчик + 1
		Тип_прибывшего  set Розыгрыш_типа_танкера
  Новый_танкер
	 Convert_rule  trace
		Номер            set _порт.Счетчик
		Тип              set _порт.Тип_прибывшего
		Состояние        set прибыл
		Время_прибытия   set Time_now
		Время_на_рейде   set 0.0
		Время_заполнения set 0.0
  ТДП
	 Choice from ТДП.Номер_танкера = 0  first
	 Convert_rule
		Номер_танкера   set _порт.Счетчик
		Тип             set _порт.Тип_прибывшего
		Состояние       set прибыл
$End

$Pattern  Образец_Швартовка_буксиром : operation  trace
$Relevant_resources
  _порт   : Порт                Keep  NoChange
  _причал : Причалы             Keep  NoChange
  _танкер : Танкеры             Keep  Keep
  _буксир : Буксир              Keep  Keep
  ТДП     : Танкеры_для_показа  Keep  Keep
$Time = 1.0
$Body
  _порт
	 Choice from _порт.Количество_свободных_причалов > 0 and
					 _порт.Погода = не_штормит
	 first
	 Convert_begin
		Количество_свободных_причалов  set _порт.Количество_свободных_причалов - 1
  _причал
	 Choice from _причал.Занятость = свободен
	 first
	 Convert_begin
		Занятость        set занят
  _танкер
	 Choice from _танкер.Состояние = прибыл
	 first
	 Convert_begin
		Состояние        set швартуется
		Время_на_рейде   set Time_now - _танкер.Время_прибытия
	 Convert_end
		Состояние        set пришвартован
  _буксир
	 Choice from _буксир.Занятость = свободен
	 first
	 Convert_begin
		Занятость        set занят
	 Convert_end
		Занятость        set свободен
      ББ               set 0          
  ТДП
	 Choice from ТДП.Номер_танкера = _танкер.Номер  first
	 Convert_begin
		Состояние        set швартуется
		Причал           set _причал.Номер
	 Convert_end
		Состояние        set пришвартован
$End

 $Pattern Образец_Диа : operation
 $Relevant_resources
    _буксир : Буксир  Keep Keep
 $Time = 0.01
 $Body
   _буксир
	  Choice from _буксир.Занятость = занят and _буксир.Шаг = нет
			 first
		  Convert_begin
				 ББ  set _буксир.ББ + 1
				 Шаг set да
		  Convert_end
				 Шаг set нет
 $End



$Pattern  Образец_Заполнение_танкера : operation  trace
$Relevant_resources
  _танкер : Танкеры   Keep  Keep
$Time = Длительность_заполнения(_танкер.Тип)
$Body
  _танкер
    Choice from _танкер.Состояние = пришвартован
    first
    Convert_begin
      Состояние        set заполняется
      Время_заполнения set Time_now
    Convert_end
      Состояние        set заполнен
      Время_заполнения set Time_now - _танкер.Время_заполнения
$End

$Pattern  Образец_Отправка_буксиром : operation  trace
$Relevant_resources
  _порт        : Порт                Keep      NoChange
  _танкер      : Танкеры             Keep      Erase
  ТДП_старый   : Танкеры_для_показа  Keep      Keep
  _причал      : Причалы             Keep      NoChange
  _буксир      : Буксир              Keep      Keep
$Time = 1.0
$Body
  _порт
    Choice from _порт.Погода = не_штормит
    first
    Convert_begin
      Количество_свободных_причалов  set _порт.Количество_свободных_причалов + 1
  _танкер
    Choice from _танкер.Состояние = заполнен and
                _танкер.Тип <> тип_4
    first
    Convert_begin
      Состояние   set отправляется
  ТДП_старый
	 Choice from ТДП_старый.Номер_танкера = _танкер.Номер  first
	 Convert_begin
      Состояние       set отправляется
	 Convert_end
		Номер_танкера   set 0
		Причал          set 0
  _причал
	 Choice from _причал.Номер = ТДП_старый.Причал
	 first
	 Convert_begin
		Занятость        set свободен
  _буксир
    Choice from _буксир.Занятость = свободен
    first
    Convert_begin
      Занятость   set занят
    Convert_end
      Занятость   set свободен
		ББ          set 0
$End

$Pattern  Образец_Начало_шторма : irregular_event  trace
$Relevant_resources
  _порт   : Порт  Keep
$Time = Интервал_между_штормами(48)
$Body
  _порт
    Convert_event
      Погода      set начало_шторма
$End

$Pattern  Образец_Шторм : operation  trace
$Relevant_resources
  _порт   : Порт  Keep  Keep
$Time = Длительность_шторма(2, 6)
$Body
  _порт
    Choice from _порт.Погода = начало_шторма
    first
    Convert_begin
      Погода      set штормит
    Convert_end
      Погода      set не_штормит
$End

$Pattern  Образец_Отправка_буксиром_тип_4 : operation  trace
$Relevant_resources
  _порт        : Порт                Keep  NoChange
  _танкер      : Танкеры             Keep  Keep
  ТДП_старый   : Танкеры_для_показа  Keep  Keep
  _причал      : Причалы             Keep  NoChange
  _буксир      : Буксир              Keep  Keep
$Time = 1.0
$Body
  _порт
	 Choice from _порт.Погода = не_штормит
	 first
    Convert_begin
      Количество_свободных_причалов  set _порт.Количество_свободных_причалов + 1
  _танкер
    Choice from _танкер.Состояние = заполнен and
                _танкер.Тип = тип_4
    first
    Convert_begin
		Состояние   set отправляется
	 Convert_end
		Состояние   set отправлен
  ТДП_старый
	 Choice from ТДП_старый.Номер_танкера = _танкер.Номер  first
	 Convert_begin
		Состояние       set отправляется
	 Convert_end
		Состояние       set отправлен
		Номер_танкера   set 0
      Причал          set 0
  _причал
	 Choice from _причал.Номер = ТДП_старый.Причал
	 first
	 Convert_begin
		Занятость        set свободен
  _буксир
    Choice from _буксир.Занятость = свободен
    first
    Convert_begin
      Занятость   set занят
    Convert_end
      Занятость   set свободен
      ББ          set 0
$End

$Pattern  Образец_Плавание_танкера : operation  trace
$Relevant_resources
  _танкер      : Танкеры             Erase     NonExist
  ТДП_старый   : Танкеры_для_показа  Keep      NoChange
  _порт        : Порты               NoChange  Keep
  новый_танкер : Танкеры             NonExist  Create
  ТДП          : Танкеры_для_показа  Keep      Keep
$Time = Время_плавания(216, 264)
$Body
  _танкер
	 Choice from _танкер.Состояние = отправлен and
					 _танкер.Тип = тип_4
	 first
  ТДП_старый
	 Choice from ТДП_старый.Номер_танкера = _танкер.Номер  first
	 Convert_begin
		Номер_танкера   set 0
  _порт
	 Choice NoCheck first
	 Convert_end
		Счетчик         set _порт.Счетчик + 1
  новый_танкер
	 Convert_end
		Номер            set _порт.Счетчик
		Тип              set тип_4
		Состояние        set прибыл
		Время_прибытия   set Time_now
		Время_на_рейде   set 0.0
		Время_заполнения set 0.0
  ТДП
	 Choice from ТДП.Номер_танкера = 0  first
	 Convert_begin
		Номер_танкера   set -1
	 Convert_end
		Номер_танкера   set _порт.Счетчик
		Тип             set тип_4
		Состояние       set прибыл
$End

