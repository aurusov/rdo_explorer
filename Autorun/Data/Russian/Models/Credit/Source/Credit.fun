{1}
$Sequence Товар_Сумма_s : integer
$Type = exponential 123456789
$End

{2}
$Sequence Товар_Наименование_s : such_as Товар_tt.Наименование
$Type = by_hist 123456789
$Body
брюки 0.40
рубашка 0.50
майка 0.10
$End

{3}
$Sequence Кредит_карт_Сумма_s : integer
$Type = exponential 123456789
$End

{4}
$Function Проверка_платеж_f : such_as Разрешение_оплаты_tt.Разрешение_оплаты_m
$Type = algorithmic
$Parameters
P1 : such_as Счет_tt.Сумма
P2 : such_as Цена_tt.Сумма
$Body
Calculate_if P1-P2 < 0 Проверка_платеж_f=0
Calculate_if P1-P2 >= 0 Проверка_платеж_f=1
$End

{5}
$Sequence Появление_клиента_в_системе_s : integer
$Type = uniform 864096812
$End

{6}
$Function Номер_очереди_f : such_as Кредитная__карточка_tt.Номер_очереди
$Type = algorithmic
$Parameters
P1 : integer
P2 : integer
$Body
Calculate_if P1-P2 <= 0 Номер_очереди_f=перед_первой
Calculate_if P1-P2 > 0 Номер_очереди_f=перед_второй
$End

{7}
$Function Номер_очереди_f1 : such_as Кредитная__карточка_tt.Номер_очереди
$Type = algorithmic
$Parameters
P1 : such_as Кредитная__карточка_tt.Номер_очереди
$Body
Calculate_if P1 = перед_первой Номер_очереди_f1=первая
Calculate_if P1 = перед_второй Номер_очереди_f1=вторая
$End

{8}
$Function Длина_очереди_f : integer
$Type = algorithmic
$Parameters
P1 : such_as Кредитная__карточка_tt.Номер_очереди
P2 : such_as Кредитная__карточка_tt.Номер_очереди
$Body
Calculate_if P1 =  P2 Длина_очереди_f=1
Calculate_if P1 <> P2 Длина_очереди_f=0
$End
