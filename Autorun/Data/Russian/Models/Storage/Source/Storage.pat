$Pattern  Поставка_на_склад  : operation   trace
$Relevant_resources
  Склад  :  Склад_1  Keep  Keep
$Time = Время_поставки(Lmin, Lmax)*24.0
$Body
  Склад
    Choice from Склад.Количество <= X_2 and
                Склад.Состояние = Норма
    first
    Convert_begin
      Состояние         set Ожидание_поставки
    Convert_end
      Количество        set Склад.Количество + X_1
      Состояние         set Норма
      Плата_за_поставки set Склад.Плата_за_поставки + C_2
$End

$Pattern  Потребление  : operation   trace
$Relevant_resources
  Склад  :  Склад_1       Keep  Keep
$Time = 24.0
$Body
  Склад
    Choice from Склад.Заказ_на_день = 0
    first
    Convert_begin
      Заказ_на_день       set Покупка(Dmin,Dmax)
      Плата_за_хранение   set Склад.Плата_за_хранение +
                              Склад.Количество * C_1
      Плата_за_непродажи  set Склад.Плата_за_непродажи +
                              Плата_за_дефицит(Склад.Заказ_на_день)
    Convert_end
      Количество          set Остаток(Склад.Заказ_на_день)
      Заказ_на_день       set 0
$End
