$Constant
  Масштаб_времени   : real = 1.0
  Дискрета_движения : real = 0.5
  Объем_выпуска     : integer = 80
  Количество_узлов  : integer = 12
$End

$Sequence Нормальный_Закон : real
$Type = normal
$End

$Sequence Равномерный_Закон : real
$Type = uniform
$End

$Sequence Экспоненциальный_Закон : real
$Type = exponential
$End

$Function Нормальный_Закон_Abs : real
$Type = algorithmic
$Parameters
  Результат : real
$Body
  Calculate_if Результат > 0 Нормальный_Закон_Abs = Результат
  Calculate_if Результат < 0 Нормальный_Закон_Abs = -1 * Результат
  Calculate_if Результат = 0 Нормальный_Закон_Abs = 1/60
$End

$Function Генератор_заказов : real
$Type = algorithmic
$Parameters
  _тип    : such_as Система.Тип
  Число_1 : real
  Число_2 : real
$Body
  Calculate_if _тип = тип1 Генератор_заказов = Равномерный_Закон(Число_1, Число_2)
  Calculate_if _тип = тип2 Генератор_заказов = Равномерный_Закон(Число_1, Число_2)
$End

$Function Генератор_аварий : real
$Type = algorithmic
$Parameters
  Номер   : such_as ОТО.Пор_ном_ОТО
  Число_1 : real
  Число_2 : real
$Body
  Calculate_if Номер = 1 Генератор_аварий = Нормальный_Закон_Abs(Нормальный_Закон(Число_1, Число_2))
  Calculate_if Номер = 2 Генератор_аварий = Нормальный_Закон_Abs(Нормальный_Закон(Число_1, Число_2))
  Calculate_if Номер = 3 Генератор_аварий = Нормальный_Закон_Abs(Нормальный_Закон(Число_1, Число_2))
  Calculate_if Номер = 4 Генератор_аварий = Нормальный_Закон_Abs(Нормальный_Закон(Число_1, Число_2))
$End

$Function Нак_Узлы : integer
$Type = table
$Parameters
  Номер : such_as ТУ.Куда
$Body
  4 1 12 6 7 9
$End

$Function Тех_путь : such_as ТУ.Позиция
$Type = table
$Parameters
  Номер_оп : such_as Пер_партии.Номер_операции
  Тип      : such_as Пер_партии.Тип
$Body
  ОТО1 ОТО3 ОТО4 ОТО3 Складвых
  ОТО2 ОТО4 ОТО3 ОТО4 Складвых
$End

$Function Времена : real
$Type = table
$Parameters
  Номер_оп : integer[1..4]
  Тип      : such_as Пер_партии.Тип
$Body
  30 5 10 15
  20 10 8 10
$End

$Function Расстояние : real
$Type = table
$Parameters
  Узлы_откуда : such_as ТУ.Пред_узел
  Узлы_куда   : such_as ТУ.Пред_узел
$Body
  0 2.8 0 0 0 0 0 0 0 0 0 0
  2.8 0 4 0 0 0 0 0 0 0 9 0
  0 4 0 6.85 4 0 0 0 0 0 0 0
  0 0 6.85 0 0 0 0 0 0 0 0 0
  0 0 4 0 0 5 0 9 0 0 0 0
  0 0 0 0 5 0 0 0 0 0 0 0
  0 0 0 0 0 0 0 2.6 0 0 0 0
  0 0 0 0 9 0 2.6 0 0 4 0 0
  0 0 0 0 0 0 0 0 0 7.15 0 0
  0 0 0 0 0 0 0 4 7.15 0 4 0
  0 9 0 0 0 0 0 0 0 4 0 2.8
  0 0 0 0 0 0 0 0 0 0 2.8 0
$End

$Function Координаты_узлов : real
$Type = table
$Parameters
  Х_У  : (Х, У) = Х
  Узлы : such_as ТУ.Пред_узел
$Body
  13.85 5
  13.85 7.8
  13.85 11.8
  7 11.8
  13.85 15.8
  13.85 20.8
  22.85 18.4
  22.85 15.8
  30 11.8
  22.85 11.8
  22.85 7.8
  22.85 5
$End

$Function Загрузить : integer
$Type = algorithmic
$Parameters
  Количество : integer
  Объем_вып  : integer
  Партия_    : integer
$Body
  Calculate_if Количество <  Объем_вып - Партия_  Загрузить = Партия_
  Calculate_if Количество >= Объем_вып - Партия_  Загрузить = Объем_вып - Количество
$End

$Function Вызов_со_склада : such_as Пер_партии.Сост
$Type = algorithmic
$Parameters
  Позиция : such_as ТУ.Позиция
$Body
  Calculate_if Позиция  = Складвх  Вызов_со_склада = Перевезти
  Calculate_if Позиция <> Складвх  Вызов_со_склада = Ожидание
$End

$Function _Сравнить_узлы : integer
$Type = algorithmic
$Parameters
  _число1 : real
  _число2 : real
$Body
  Calculate_if _число1  < _число2  _Сравнить_узлы = 1
  Calculate_if _число1 >= _число2  _Сравнить_узлы = 0
$End

$Function Возврат : real
$Type = algorithmic
$Parameters
  _узел1  : such_as ТУ.Пред_узел
  _узел2  : such_as ТУ.Пред_узел
  _узел3  : such_as ТУ.Пред_узел
$Body
  Calculate_if _узел1  = _узел3  Возврат = 0.0001
  Calculate_if _узел2 <> _узел3  Возврат = Равномерный_Закон(0.0, 1.0)
  Calculate_if _узел2  = _узел3  Возврат = 1
  Calculate_if _узел1 <> _узел3  Возврат = Равномерный_Закон(0.0, 1.0)
$End

$Function Нак_ТУ : integer [0..1]
$Type = algorithmic
$Parameters
  Номер    : such_as ТУ.Куда
  Номер_ТУ : integer
$Body
  Calculate_if 0 = 0 Нак_ТУ = 1
$End