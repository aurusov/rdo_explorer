$Constant
  Время_срабатывания_датчиков   : real = 5.0
  Время_компьютерной_обработки  : real = 3.0
  Время_записи_в_БД             : real = 10.0
  Время_ввода_информации_врачом : real = 40.0
  Время_на_помощь               : real = 50.0
  Время_движения_врача          : real = 40.0
$End

$Sequence Изм_сост_пац_Ф : integer 
$Type = exponential 123456787 
$End 
 
$Sequence Врач_Желает_Ф  : real 
$Type = uniform 123456572 
$End 
 
$Sequence Врач_Не_Желает_Ф : real 
$Type = exponential 127569308 
$End 
 
$Sequence Ритм_Ф : integer 
$Type = uniform 10453209 
$End 
 
$Sequence Давление_Ф : integer 
$Type = uniform 18546732 
$End 
 
$Sequence Температура_Ф : integer 
$Type = uniform 430957038 
$End 
 
$Sequence Сопротивление_Ф : integer 
$Type = uniform 135468231 
$End 

$Function Следующий_шаг : such_as Медсестры.Номер_шага
$Type = algorithmic
$Parameters
  Предидущий_шаг : such_as Медсестры.Номер_шага
$Body
  Calculate_if [Предидущий_шаг < 47]
    Следующий_шаг = Предидущий_шаг + 1
  Calculate_if [Предидущий_шаг = 47]
    Следующий_шаг = 0
$End

$Function Следующий_шаг_врача : such_as Врачи.Номер_шага
$Type = algorithmic
$Parameters
  Предидущий_шаг : such_as Врачи.Номер_шага
$Body
  Calculate_if [Предидущий_шаг <> 43]
    Следующий_шаг_врача = Предидущий_шаг + 1
  Calculate_if [Предидущий_шаг = 43]
    Следующий_шаг_врача = 0
$End

$Function Медсестра_коорд_X : integer
$Type = algorithmic
$Parameters
  Шаг : such_as Медсестры.Номер_шага
  Текущие_координаты : such_as Медсестры.Координата_X
$Body
  Calculate_if [Шаг = 0]
    Медсестра_коорд_X = 650
  Calculate_if [Шаг = 1]
    Медсестра_коорд_X = 560
  Calculate_if [[[Шаг > 1] and [Шаг < 8]] or
               [[Шаг > 8] and [Шаг < 24]]]
    Медсестра_коорд_X = Текущие_координаты - 10
  Calculate_if [Шаг = 8]
    Медсестра_коорд_X = 460 
  Calculate_if [Шаг = 41]
    Медсестра_коорд_X = 500 
  Calculate_if [Шаг = 24]
    Медсестра_коорд_X = 285 
  Calculate_if [[[Шаг > 24] and [Шаг < 41]] or
               [[Шаг > 41] and [Шаг <= 47]]]
    Медсестра_коорд_X = Текущие_координаты + 10
$End

$Function Врач_коорд_X : integer
$Type = algorithmic
$Parameters
  Шаг : such_as Врачи.Номер_шага
  Текущие_координаты : such_as Врачи.Координата_X
$Body
  Calculate_if [Шаг = 1]
    Врач_коорд_X = 0
  Calculate_if [Шаг > 1] and [Шаг < 21]
    Врач_коорд_X = Текущие_координаты + 10
  Calculate_if [Шаг = 21]
    Врач_коорд_X = 220
  Calculate_if [Шаг = 22]
    Врач_коорд_X = 200 
  Calculate_if [Шаг > 22] and [Шаг < 43]
    Врач_коорд_X = Текущие_координаты - 10 
$End

$Function Врач_коорд_Y : integer
$Type = algorithmic
$Parameters
  Шаг : such_as Врачи.Номер_шага
  Текущие_координаты : such_as Врачи.Координата_Y
$Body
  Calculate_if [1 = 1]
    Врач_коорд_Y = 55
$End

$Function Медсестра_коорд_Y : integer
$Type = algorithmic
$Parameters
  Шаг : such_as Медсестры.Номер_шага
  Текущие_координаты : such_as Медсестры.Координата_Y
$Body
  Calculate_if [Шаг = 0] or [Шаг = 1]
    Медсестра_коорд_Y = 59
  Calculate_if [[[Шаг > 1] and [Шаг < 8]] or [[Шаг > 8]
               and [Шаг < 13]] or [Шаг = 25] or [Шаг = 26]]
    Медсестра_коорд_Y = Текущие_координаты + 10
  Calculate_if [Шаг = 8]
    Медсестра_коорд_Y = 290 
  Calculate_if [Шаг = 41]
    Медсестра_коорд_Y = 120 
  Calculate_if [[[Шаг >= 13] and [Шаг <= 22]] or
               [[Шаг >= 27] and [Шаг <= 36]]]
    Медсестра_коорд_Y = 330
  Calculate_if [[[Шаг >= 37] and [Шаг <= 40]] or
               [[Шаг >= 42] and [Шаг <= 47]] or [Шаг = 23] or [Шаг = 24]]
     Медсестра_коорд_Y = Текущие_координаты - 10
$End

