
$Pattern  Срабатывание_перехода_1  : operation   trace

$Relevant_resources
  Вход_1   : Место_1    Keep  NoChange
  Вход_2   : Место_7    Keep  NoChange
  Вход_3   : Место_5    Keep  NoChange
  Переход  : Переход_1  Keep  Keep
  Выход_1  : Место_2    NoChange  Keep
  Выход_2  : Место_5    NoChange  Keep

$Time = Случайный_датчик_1 (m1, d1)

$Body
  Вход_1
    Choice from Вход_1.Емкость > 0
                first
    Convert_begin
      Емкость   set Вход_1.Емкость - 1
      Pic       set Вход_1.Pic - 1
  Вход_2
    Choice from Вход_2.Емкость > 0
                first
    Convert_begin
      Емкость   set Вход_2.Емкость - 1
      Pic       set Вход_2.Pic - 1
  Вход_3
    Choice from Вход_3.Емкость > 0
                first
    Convert_begin
      Емкость   set Вход_3.Емкость - 1
      Pic       set Вход_3.Pic - 1
  Переход
    Choice from Переход.Занятость = Свободен
                first
    Convert_begin
      Занятость  set Занят
    Convert_end
      Занятость  set Свободен
  Выход_1
    Choice NoCheck 
                first
    Convert_end
      Тень  set Выход_1.Тень + 1
      Pic   set Выход_1.Pic + 1
  Выход_2
    Choice NoCheck 
                first
    Convert_end
      Тень  set Выход_2.Тень + 1
      Pic   set Выход_2.Pic + 1
$End

$Pattern  Срабатывание_перехода_2  : operation   trace

$Relevant_resources
  Вход_1   : Место_2    Keep  NoChange
  Вход_2   : Место_5    Keep  NoChange
  Вход_3   : Место_6    Keep  NoChange
  Переход  : Переход_2  Keep  Keep
  Выход_1  : Место_3    NoChange  Keep
  Выход_2  : Место_5    NoChange  Keep
  Выход_3  : Место_7    NoChange  Keep

$Time = Случайный_датчик_2 (m2, d2)

$Body
  Вход_1
    Choice from Вход_1.Емкость > 0
                first
    Convert_begin
      Емкость   set Вход_1.Емкость - 1
      Pic       set Вход_1.Pic - 1
  Вход_2
    Choice from Вход_2.Емкость > 0
                first
    Convert_begin
      Емкость   set Вход_2.Емкость - 1
      Pic       set Вход_2.Pic - 1
  Вход_3
    Choice from Вход_3.Емкость > 0
                first
    Convert_begin
      Емкость   set Вход_3.Емкость - 1
      Pic       set Вход_3.Pic - 1
  Переход
    Choice from Переход.Занятость = Свободен
                first
    Convert_begin
      Занятость  set Занят
    Convert_end
      Занятость  set Свободен
  Выход_1
    Choice NoCheck 
              first
    Convert_end
      Тень  set Выход_1.Тень + 1
      Pic   set Выход_1.Pic + 1
  Выход_2
    Choice NoCheck 
              first
    Convert_end
      Тень  set Выход_2.Тень + 1
      Pic   set Выход_2.Pic + 1
  Выход_3
    Choice NoCheck 
              first
    Convert_end
      Тень  set Выход_3.Тень + 1
      Pic   set Выход_3.Pic + 1
$End

$Pattern  Срабатывание_перехода_3  : operation   trace

$Relevant_resources
  Вход_1   : Место_3    Keep  NoChange
  Вход_2   : Место_5    Keep  NoChange
  Переход  : Переход_3  Keep  Keep
  Выход_1  : Место_4    NoChange  Keep
  Выход_2  : Место_5    NoChange  Keep
  Выход_3  : Место_6    NoChange  Keep

$Time = Случайный_датчик_3 (m3, d3)

$Body
  Вход_1
    Choice from Вход_1.Емкость > 0
                first
    Convert_begin
      Емкость   set Вход_1.Емкость - 1
      Pic       set Вход_1.Pic - 1
  Вход_2
    Choice from Вход_2.Емкость > 0
                first
    Convert_begin
      Емкость   set Вход_2.Емкость - 1
      Pic       set Вход_2.Pic - 1
  Переход
    Choice from Переход.Занятость = Свободен
                first
    Convert_begin
      Занятость  set Занят
    Convert_end
      Занятость  set Свободен
  Выход_1
    Choice NoCheck 
                first
    Convert_end
      Тень  set Выход_1.Тень + 1
      Pic   set Выход_1.Pic + 1
  Выход_2
    Choice NoCheck 
                first
    Convert_end
      Тень  set Выход_2.Тень + 1
      Pic   set Выход_2.Pic + 1
  Выход_3
    Choice NoCheck first
    Convert_end
      Тень  set Выход_3.Тень + 1
      Pic   set Выход_3.Pic + 1
$End

$Pattern  Задержка_в_позиции  : operation   trace

$Parameters
  Номер_места     : integer [0..20]
  Время_операции  : real
  Коэф            : integer
$Relevant_resources
  Место    : Места      Keep  Keep

$Time =Коэф * Случайный_датчик_4(m4, d4) + Время_операции


$Body
  Место
    Choice from  Место.Номер=Номер_места and
                 Место.Тень > 0
                 first
    Convert_begin
      Тень    set  Место.Тень - 1
    Convert_end
      Емкость set  Место.Емкость + 1

$End

