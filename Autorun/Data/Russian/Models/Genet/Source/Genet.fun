$Constant
  Количество_поколений                 : integer = 2
  Количество_байтов_в_строке           : integer = 4
  Количество_битов_в_последнем_байте   : integer = 8
  Сколько_поколений_хранить            : integer = 1
$End

$Sequence  Равномерно  : integer [0..255]
$Type =  uniform
$End

$Function  Биты_строки  : integer
$Type = table
$Parameters
  Номер_бита   : integer  [1..9]
$Body
  256   128   64   32   16    8    4    2    1
$End

$Function  Извлечь  : integer [0..255]
$Type = algorithmic
$Parameters
  Откуда        : integer [0..255]
  С_какого_бита : integer [1..8]
  Сколько_битов : integer [1..8]
$Body
  Calculate_if  0 = 0
    Извлечь = (Откуда - Откуда / Биты_строки(С_какого_бита) * Биты_строки(С_какого_бита)) /
              Биты_строки(С_какого_бита + Сколько_битов)
$End

$Function  RMin  : real
$Type = algorithmic
$Parameters
  Параметр_1  : real
  Параметр_2  : real
$Body
  Calculate_if Параметр_1 <  Параметр_2 RMin = Параметр_1
  Calculate_if Параметр_1 >= Параметр_2 RMin = Параметр_2
$End

$Function  RMax  : real
$Type = algorithmic
$Parameters
  Параметр_1  : real
  Параметр_2  : real
$Body
  Calculate_if Параметр_1 >  Параметр_2 RMax = Параметр_1
  Calculate_if Параметр_1 <= Параметр_2 RMax = Параметр_2
$End

$Function  Параметр_гибрида : integer [0..255]
$Type = algorithmic
$Parameters
  Номер       : integer
  Параметр_1  : integer [0..255]
  Параметр_2  : integer [0..255]
$Body
  Calculate_if Номер < Система.Скрещивание_байт Параметр_гибрида = Параметр_1
  Calculate_if Номер > Система.Скрещивание_байт Параметр_гибрида = Параметр_2
  Calculate_if Номер = Система.Скрещивание_байт and
               Система.Скрещивание_бит = 8      Параметр_гибрида = Параметр_1
  Calculate_if Номер = Система.Скрещивание_байт and
               Система.Скрещивание_бит < 8
               Параметр_гибрида = Извлечь(Параметр_1, 1, Система.Скрещивание_бит) *
                                  Биты_строки(Система.Скрещивание_бит + 1) +
                                  Извлечь(Параметр_2, Система.Скрещивание_бит + 1, 8 - Система.Скрещивание_бит)
$End

$Sequence  Розыгрыш_родителя  : real
$Type =  uniform
$End

$Sequence  Выбор_байта  : integer
$Type =  uniform
$End

$Sequence  Выбор_бита  : integer
$Type =  uniform
$End

$Function  Предел_разрезания  : integer [1..8]
$Type = algorithmic
$Parameters
  Параметр  : integer
$Body
  Calculate_if Параметр < Количество_байтов_в_строке Предел_разрезания = 8
  Calculate_if Параметр = Количество_байтов_в_строке
    Предел_разрезания = Количество_битов_в_последнем_байте - 1
$End

$Sequence  Розыгрыш_скрещивания  : real
$Type =  uniform
$End

$Sequence  Розыгрыш_мутации  : real
$Type =  uniform
$End

$Function  Предел_мутации  : integer [1..8]
$Type = algorithmic
$Parameters
  Параметр  : integer
$Body
  Calculate_if Параметр < Количество_байтов_в_строке Предел_мутации = 8
  Calculate_if Параметр = Количество_байтов_в_строке
    Предел_мутации = Количество_битов_в_последнем_байте
$End

$Function  Если_мутация  : integer
$Type = algorithmic
$Parameters
  Параметр_1  : integer
  Параметр_2  : integer
$Body
  Calculate_if Система.Число <= Система.Вероятность_мутации Если_мутация = Параметр_1
  Calculate_if Система.Число >  Система.Вероятность_мутации Если_мутация = Параметр_2
$End

$Function  Параметр_мутанта : integer [0..255]
$Type = algorithmic
$Parameters
  Номер       : integer
  Параметр    : integer [0..255]
$Body
  Calculate_if Номер <> Система.Мутация_байт Параметр_мутанта = Параметр
  Calculate_if Номер =  Система.Мутация_байт and Извлечь(Параметр, Система.Мутация_бит, 1) = 1
               Параметр_мутанта = Параметр - Биты_строки(Система.Мутация_бит + 1)
  Calculate_if Номер =  Система.Мутация_байт and Извлечь(Параметр, Система.Мутация_бит, 1) = 0
               Параметр_мутанта = Параметр + Биты_строки(Система.Мутация_бит + 1)
$End

$Function  Вычисление_ФП  : real [0.0..1.0]
$Type = algorithmic
$Parameters
  Параметр_1  : real [0.0..1.0]
  Параметр_2  : real [0.0..1.0]
$Body
  Calculate_if  0 = 0
  Вычисление_ФП = {(1 - (Параметр_1 * 2 - 1) * (Параметр_1 * 2 - 1)) / 2.0 +
                  (1 - (Параметр_2 * 2 - 1) * (Параметр_2 * 2 - 1)) / 2.0}
						(Параметр_1 * Параметр_1 + Параметр_2 * Параметр_2) / 2.0
						{(Параметр_1 - Параметр_2) * (Параметр_1 - Параметр_2) }
$End

$Function  I_IfEQZero : integer
$Type = algorithmic
$Parameters
  База      : integer
  Если_да   : integer
  Если_нет  : integer
$Body
  Calculate_if База =  0  I_IfEQZero = Если_да
  Calculate_if База <> 0  I_IfEQZero = Если_нет
$End
