$Frame Оборудование
$Back_picture = < 0 128 128 > 580 600
Show
  text [350,40,180,20,transparent,< 0 0 0 >, = 'Обработано всего деталей']
  text [500,40,100,20,transparent,< 255 255 255 >, = Систем.Обраб_деталей]
  text [350,60,130,20,transparent,< 0 0 0 >, = 'Поступило деталей']
  text [500,60,100,20,transparent,< 255 255 255 >, = Систем.Всего_детал]
  text [0  ,5 ,580,20,transparent,< 255 255 0 >, =' Состояние оборудования участка ']

  line [5  ,50,325,50, < 0 0 0 >]
  text [10 ,29,65 ,20,transparent,< 0 0 0 >, < 'ОТО']
  text [110,29,100,20,transparent,< 0 0 0 >, = 'Состояние']
  text [220,29,100,20,transparent,< 0 0 0 >, = 'Номер партии']
  rect [5  ,25,321,90,transparent,< 0 0 0 >]
  rect [6  ,26,319,88,transparent,< 0 0 0 >]
  rect [105,25,110,90,transparent,< 0 0 0 >]

  text [10 ,52,94 ,15,transparent,< 0 0 0 >, < '16К20Ф3']
  text [110,52,100,15,transparent,< 255 255 255 >, = ОТО_1.Состояние]
  text [220,52,100,15,transparent,< 255 255 255 >, = ОТО_1.Номер_дет]

  text [10 ,67,94 ,15,transparent,< 0 0 0 >, < '16К20Ф3']
  text [110,67,100,15,transparent,< 255 255 255 >, = ОТО_2.Состояние]
  text [220,67,100,15,transparent,< 255 255 255 >, = ОТО_2.Номер_дет]

  text [10 ,82,94 ,15,transparent,< 0 0 0 >, < 'ЛА155Ф30']
  text [110,82,100,15,transparent,< 255 255 255 >, = ОТО_3.Состояние]
  text [220,82,100,15,transparent,< 255 255 255 >, = ОТО_3.Номер_дет]

  text [10 ,97,94 ,15,transparent,< 0 0 0 >, < '21105Н7Ф4']
  text [110,97,100,15,transparent,< 255 255 255 >, = ОТО_4.Состояние]
  text [220,97,100,15,transparent,< 255 255 255 >, = ОТО_4.Номер_дет]

  rect [5  ,122,430,45,transparent,< 0 0 0 >]
  rect [6  ,123,428,43,transparent,< 0 0 0 >]
  rect [105,122,110,45,transparent,< 0 0 0 >]
  rect [325,122,110,45,transparent,< 0 0 0 >]
  line [5  ,147,435,147,< 0 0 0 >]
  text [10 ,126,100,20,transparent,< 0 0 0 >, < 'Транспорт']
  text [110,126,100,20,transparent,< 0 0 0 >, = 'Состояние']
  text [220,126,100,20,transparent,< 0 0 0 >, = 'Позиция']
  text [330,126,100,20,transparent,< 0 0 0 >, = 'Куда перейти']

  text [10 ,149,94 ,15,transparent,< 0 0 0 >, < 'ТУ1']
  text [110,149,100,15,transparent,< 255 255 255 >, = ТУ_1.Состояние]
  text [220,149,100,15,transparent,< 255 255 255 >, = ТУ_1.Позиция]
  text [330,149,100,15,transparent,< 255 255 255 >, = ТУ_1.Куда]

  rect [5  ,174,321,90,transparent,< 0 0 0 >]
  rect [6  ,175,319,88,transparent,< 0 0 0 >]
  rect [105,174,110,90,transparent,< 0 0 0 >]
  line [5  ,199,325,199,< 0 0 0 >]
  text [10 ,177,100,20,transparent,< 0 0 0 >, < 'Накопители']
  text [110,177,100,20,transparent,< 0 0 0 >, = 'Свободно']
  text [220,177,100,20,transparent,< 0 0 0 >, = 'Емкость']

  text [10 ,201,94 ,15,transparent,< 0 0 0 >, < 'Накопитель 1']
  text [110,201,100,15,transparent,< 255 255 255 >, = Накопитель_1.Свободно]
  text [220,201,100,15,transparent,< 255 255 255 >, = Накопитель_1.Емкость]

  text [10 ,216,94 ,15,transparent,< 0 0 0 >, < 'Накопитель 2']
  text [110,216,100,15,transparent,< 255 255 255 >, = Накопитель_2.Свободно]
  text [220,216,100,15,transparent,< 255 255 255 >, = Накопитель_2.Емкость]

  text [10 ,231,94 ,15,transparent,< 0 0 0 >, < 'Накопитель 3']
  text [110,231,100,15,transparent,< 255 255 255 >, = Накопитель_3.Свободно]
  text [220,231,100,15,transparent,< 255 255 255 >, = Накопитель_3.Емкость]

  text [10 ,246,94 ,15,transparent,< 0 0 0 >, < 'Накопитель 4']
  text [110,246,100,15,transparent,< 255 255 255 >, = Накопитель_4.Свободно]
  text [220,246,100,15,transparent,< 255 255 255 >, = Накопитель_4.Емкость]

$End

$Frame Окно_Анимация
$Back_picture = < 0 128 128 > 800 500
Show

  active Масштаб_увеличить [43, 11, 25, 24]
  active Масштаб_уменьшить [16, 11, 25, 24]
  active Прокрутка_Вправо  [72, 62, 20, 20]
  active Прокрутка_Влево   [28, 62, 20, 20]
  active Прокрутка_Вверх   [50, 46, 20, 20]
  active Прокрутка_Вниз    [50, 68, 20, 20]
  active Сброс_прокрутки   [11, 44, 32, 12]

  line [Координаты_узлов(Х,1) * Const.Scale + Const.dX, Координаты_узлов(У,1) * Const.Scale + Const.dY, Координаты_узлов(Х,2) * Const.Scale + Const.dX, Координаты_узлов(У,2) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,2) * Const.Scale + Const.dX, Координаты_узлов(У,2) * Const.Scale + Const.dY, Координаты_узлов(Х,3) * Const.Scale + Const.dX, Координаты_узлов(У,3) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,2) * Const.Scale + Const.dX, Координаты_узлов(У,2) * Const.Scale + Const.dY, Координаты_узлов(Х,11) * Const.Scale + Const.dX, Координаты_узлов(У,11) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,3) * Const.Scale + Const.dX, Координаты_узлов(У,3) * Const.Scale + Const.dY, Координаты_узлов(Х,4) * Const.Scale + Const.dX, Координаты_узлов(У,4) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,3) * Const.Scale + Const.dX, Координаты_узлов(У,3) * Const.Scale + Const.dY, Координаты_узлов(Х,5) * Const.Scale + Const.dX, Координаты_узлов(У,5) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,5) * Const.Scale + Const.dX, Координаты_узлов(У,5) * Const.Scale + Const.dY, Координаты_узлов(Х,6) * Const.Scale + Const.dX, Координаты_узлов(У,6) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,5) * Const.Scale + Const.dX, Координаты_узлов(У,5) * Const.Scale + Const.dY, Координаты_узлов(Х,8) * Const.Scale + Const.dX, Координаты_узлов(У,8) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,7) * Const.Scale + Const.dX, Координаты_узлов(У,7) * Const.Scale + Const.dY, Координаты_узлов(Х,8) * Const.Scale + Const.dX, Координаты_узлов(У,8) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,8) * Const.Scale + Const.dX, Координаты_узлов(У,8) * Const.Scale + Const.dY, Координаты_узлов(Х,10) * Const.Scale + Const.dX, Координаты_узлов(У,10) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,9) * Const.Scale + Const.dX, Координаты_узлов(У,9) * Const.Scale + Const.dY, Координаты_узлов(Х,10) * Const.Scale + Const.dX, Координаты_узлов(У,10) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,10) * Const.Scale + Const.dX, Координаты_узлов(У,10) * Const.Scale + Const.dY, Координаты_узлов(Х,11) * Const.Scale + Const.dX, Координаты_узлов(У,11) * Const.Scale + Const.dY, <0 0 0>]
  line [Координаты_узлов(Х,11) * Const.Scale + Const.dX, Координаты_узлов(У,11) * Const.Scale + Const.dY, Координаты_узлов(Х,12) * Const.Scale + Const.dX, Координаты_узлов(У,12) * Const.Scale + Const.dY, <0 0 0>]

Show_if ТУ_1.Состояние = Движение_св or ТУ_1.Состояние = Загружается or ТУ_1.Состояние = Свободен or ТУ_1.Состояние = Проверка_узла or ТУ_1.Состояние = Узел_стоп
  rect [(ТУ_1.Х_коор - 0.95) * Const.Scale + Const.dX, (ТУ_1.У_коор - 0.495) * Const.Scale + Const.dY, 1.9 * Const.Scale, 0.99 * Const.Scale, <0 128 0>,<255 255 0>]
Show_if ТУ_1.Состояние = Движение_заг or ТУ_1.Состояние = Разгружается or ТУ_1.Состояние = Загружен or ТУ_1.Состояние = Проверка_узла1 or ТУ_1.Состояние = Узел_стоп1
  rect [(ТУ_1.Х_коор - 0.95) * Const.Scale + Const.dX, (ТУ_1.У_коор - 0.495) * Const.Scale + Const.dY, 1.9 * Const.Scale, 0.99 * Const.Scale, <0 0 240>,<255 255 0>]
Show text [(ТУ_1.Х_коор - 0.95) * Const.Scale + Const.dX, (ТУ_1.У_коор - 0.495) * Const.Scale + Const.dY, 1.9 * Const.Scale, 0.99 * Const.Scale, transparent,<255 255 255>, ='1']

Show
  rect [(Накопитель_вх.Х_коор) * Const.Scale + Const.dX, (Накопитель_вх.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale, 1 * Const.Scale, <0 128 0>,<255 255 0>]
  text [(Накопитель_вх.Х_коор) * Const.Scale + Const.dX, (Накопитель_вх.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale, 1 * Const.Scale, transparent,<255 255 255>, ='вх']
  rect [(Накопитель_1.Х_коор) * Const.Scale + Const.dX, (Накопитель_1.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale, 1 * Const.Scale, <0 0 240>,<255 255 0>]
  rect [(Накопитель_1.Х_коор) * Const.Scale + Const.dX, (Накопитель_1.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale * Накопитель_1.Свободно / Накопитель_1.Емкость, 1 * Const.Scale, <0 128 0>,<255 255 0>]
  rect [(Накопитель_2.Х_коор) * Const.Scale + Const.dX, (Накопитель_2.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale, 1 * Const.Scale, <0 0 240>,<255 255 0>]
  rect [(Накопитель_2.Х_коор) * Const.Scale + Const.dX, (Накопитель_2.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale * Накопитель_2.Свободно / Накопитель_2.Емкость, 1 * Const.Scale, <0 128 0>,<255 255 0>]
  rect [(Накопитель_3.Х_коор) * Const.Scale + Const.dX, (Накопитель_3.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale, 1 * Const.Scale, <0 0 240>,<255 255 0>]
  rect [(Накопитель_3.Х_коор) * Const.Scale + Const.dX, (Накопитель_3.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale * Накопитель_3.Свободно / Накопитель_3.Емкость, 1 * Const.Scale, <0 128 0>,<255 255 0>]
  rect [(Накопитель_4.Х_коор) * Const.Scale + Const.dX, (Накопитель_4.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale, 1 * Const.Scale, <0 0 240>,<255 255 0>]
  rect [(Накопитель_4.Х_коор) * Const.Scale + Const.dX, (Накопитель_4.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale * Накопитель_4.Свободно / Накопитель_4.Емкость, 1 * Const.Scale, <0 128 0>,<255 255 0>]
  rect [(Накопитель_вых.Х_коор) * Const.Scale + Const.dX, (Накопитель_вых.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale, 1 * Const.Scale, <0 0 240>,<255 255 0>]
  rect [(Накопитель_вых.Х_коор) * Const.Scale + Const.dX, (Накопитель_вых.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale, 1 * Const.Scale * Накопитель_вых.Свободно / Накопитель_вых.Емкость, <0 128 0>,<255 255 0>]
  text [(Накопитель_вых.Х_коор) * Const.Scale + Const.dX, (Накопитель_вых.У_коор) * Const.Scale + Const.dY, 2 * Const.Scale, 1 * Const.Scale, transparent,<255 255 255>, ='вых']

Show_if ОТО_1.Состояние = Свободно
  rect [(ОТО_1.Х_коор) * Const.Scale + Const.dX, (ОТО_1.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1.77 * Const.Scale, <0 128 0>,<255 255 0>]
Show_if ОТО_1.Состояние = Работа
  rect [(ОТО_1.Х_коор) * Const.Scale + Const.dX, (ОТО_1.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1.77 * Const.Scale, <0 0 240>,<255 255 0>]
Show_if ОТО_1.Состояние = Ремонт
  rect [(ОТО_1.Х_коор) * Const.Scale + Const.dX, (ОТО_1.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1.77 * Const.Scale, <255 255 0>,<255 255 0>]
Show
  text [(ОТО_1.Х_коор) * Const.Scale + Const.dX, (ОТО_1.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1.77 * Const.Scale, transparent,<255 255 255>, '16К20Ф3']
  text [(ОТО_1.Х_коор) * Const.Scale + Const.dX, (ОТО_1.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1 * Const.Scale, transparent,<255 255 255>, >'1']

Show_if ОТО_2.Состояние = Свободно
  rect [(ОТО_2.Х_коор) * Const.Scale + Const.dX, (ОТО_2.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1.77 * Const.Scale, <0 128 0>,<255 255 0>]
Show_if ОТО_2.Состояние = Работа
  rect [(ОТО_2.Х_коор) * Const.Scale + Const.dX, (ОТО_2.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1.77 * Const.Scale, <0 0 240>,<255 255 0>]
Show_if ОТО_2.Состояние = Ремонт
  rect [(ОТО_2.Х_коор) * Const.Scale + Const.dX, (ОТО_2.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1.77 * Const.Scale, <255 255 0>,<255 255 0>]
Show
  text [(ОТО_2.Х_коор) * Const.Scale + Const.dX, (ОТО_2.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1.77 * Const.Scale, transparent,<255 255 255>, '16К20Ф3']
  text [(ОТО_2.Х_коор) * Const.Scale + Const.dX, (ОТО_2.У_коор) * Const.Scale + Const.dY, 3.7 * Const.Scale, 1 * Const.Scale, transparent,<255 255 255>, >'2']

Show_if ОТО_3.Состояние = Свободно
  rect [(ОТО_3.Х_коор) * Const.Scale + Const.dX, (ОТО_3.У_коор) * Const.Scale + Const.dY, 5.6 * Const.Scale, 0.9 * Const.Scale, <0 128 0>,<255 255 0>]
Show_if ОТО_3.Состояние = Работа
  rect [(ОТО_3.Х_коор) * Const.Scale + Const.dX, (ОТО_3.У_коор) * Const.Scale + Const.dY, 5.6 * Const.Scale, 0.9 * Const.Scale, <0 0 240>,<255 255 0>]
Show_if ОТО_3.Состояние = Ремонт
  rect [(ОТО_3.Х_коор) * Const.Scale + Const.dX, (ОТО_3.У_коор) * Const.Scale + Const.dY, 5.6 * Const.Scale, 0.9 * Const.Scale, <255 255 0>,<255 255 0>]
Show
  text [(ОТО_3.Х_коор) * Const.Scale + Const.dX, (ОТО_3.У_коор) * Const.Scale + Const.dY, 5.6 * Const.Scale, 0.9 * Const.Scale, transparent,<255 255 255>, 'ЛА155Ф30']
  text [(ОТО_3.Х_коор) * Const.Scale + Const.dX, (ОТО_3.У_коор) * Const.Scale + Const.dY, 5.6 * Const.Scale, 1 * Const.Scale, transparent,<255 255 255>, >'3']

Show_if ОТО_4.Состояние = Свободно
  rect [(ОТО_4.Х_коор) * Const.Scale + Const.dX, (ОТО_4.У_коор) * Const.Scale + Const.dY, 3.64 * Const.Scale, 3.29 * Const.Scale, <0 128 0>,<255 255 0>]
Show_if ОТО_4.Состояние = Работа
  rect [(ОТО_4.Х_коор) * Const.Scale + Const.dX, (ОТО_4.У_коор) * Const.Scale + Const.dY, 3.64 * Const.Scale, 3.29 * Const.Scale, <0 0 240>,<255 255 0>]
Show_if ОТО_4.Состояние = Ремонт
  rect [(ОТО_4.Х_коор) * Const.Scale + Const.dX, (ОТО_4.У_коор) * Const.Scale + Const.dY, 3.64 * Const.Scale, 3.29 * Const.Scale, <255 255 0>,<255 255 0>]
Show
  text [(ОТО_4.Х_коор) * Const.Scale + Const.dX, (ОТО_4.У_коор) * Const.Scale + Const.dY, 3.64 * Const.Scale, 3.29 * Const.Scale, transparent,<255 255 255>, '21105Н7Ф4']
  text [(ОТО_4.Х_коор) * Const.Scale + Const.dX, (ОТО_4.У_коор) * Const.Scale + Const.dY, 3.64 * Const.Scale, 1 * Const.Scale, transparent,<255 255 255>, >'4']

Show bitmap[3, 10, Controlp, Controlm]

$End
