$Pattern Появление_заказа : irregular_event {trace}
$Relevant_resources
 Сист      : Систем Keep 
$Time= Жребий(1000.0,2000.0) 
$Body
   Сист
      Convert_event
	Кол_изделий     set 0
	Номер_заказа    set Сист.Номер_заказа + Предел(Сист.Номер_заказа)
	Издел_в_заказе  set Номер_издл(1,6) * Предел(Сист.Номер_заказа)
$End

$Pattern Генерация_Заказа : rule {trace}
$Relevant_resources
 Система_р : Система  Keep
 Заказ     : Заказы   Keep 
$Body
   Система_р
    Choice NoCheck
      first
      Convert_rule
	Всего_издел set Система_р.Всего_издел + Система_р.Издел_в_заказе 
   Заказ
    Choice from Заказ.Номер = Система_р.Номер_заказа and Заказ.Состояние = Ожидает
      first
      Convert_rule {trace}
	Состояние   set Обслуживается
	Приоритет   set Номер_издл(1,10)
	Кол_издел   set Система_р.Издел_в_заказе
	Изготовлено set 0
$End

$Pattern Генерация  : rule {trace}
$Relevant_resources
 Система_р : Система  Keep
$Body
   Система_р
    Choice from Система_р.Кол_изделий < Система_р.Издел_в_заказе  and Система_р.Кол_деталей = Система_р.Изд_дет
      first
      Convert_rule
	Кол_изделий  set Система_р.Кол_изделий + 1
	Кол_деталей  set 0
	Ном_изделия  set Номер_издл(1,6)
	Ном_издел    set Система_р.Ном_издел + 1 
	Тип_декора   set Тип_декор(1,3)
        Изд_дет      set Деталей(Система_р.Ном_изделия)
	Очередь      set 1
$End

$Pattern Генерация_изделий : rule {trace}
$Relevant_resources
 Система_2 : Система Keep 
 Деталь    : Детали  Create 
$Body
   Система_2
    Choice from Система_2.Кол_изделий <= Система_2.Издел_в_заказе and Система_2.Кол_деталей < Деталей(Система_2.Ном_изделия) 
      first
      Convert_rule
	Кол_деталей set Система_2.Кол_деталей + 1

   Деталь
      Convert_rule {trace}
	Номер       set 0
	Номер_изд   set Система_2.Ном_изделия
	Ном_издел   set Система_2.Ном_издел {Кол_изделий}
	Номер_станд set Станд_ном(Система_2.Кол_деталей, Система_2.Ном_изделия)
  	Декор       set Система_2.Тип_декора
	Путь        set 2
	Сост        set Ожидание
        Транспорт   set Нет
        Место       set Рольганг2
        Сл_место    set Рольгангвх 
	Рольг       set Рольгангвх  
	Жребий_д    set Жребий(0.0, 1.0)
	Ном_заказа  set Система_2.Номер_заказа
$End

$Pattern Загрузка_партии : rule {trace}
$Relevant_resources
 Деталь    : Детали      Keep
 Роб_1     : Робот_1     NoChange
 Сист      : Система     Keep
$Body
  Деталь
    Choice from Деталь.Сост = Ожидание and Деталь.Место <> Рольгангвх  and Проверка_пути( Деталь.Номер_станд) = 1
      with_min  Деталь.Жребий_д
      Convert_rule 
        Место       set Рольгангвх
  Роб_1
    Choice from Роб_1.Состояние = Свободен
      first 
 Сист
    Choice from Сист.Состояние = Оп_Загрузка
      first
      Convert_rule
	Состояние set Оп_Запуск
$End

$Pattern Запуск_партии : rule {trace}
$Relevant_resources
 Деталь    : Детали      Keep
 Роб_1     : Робот_1     Keep
 Система_2 : Система     Keep
 Рол       : Рольганг    Keep
$Body
  Деталь
    Choice from Деталь.Сост = Ожидание and Деталь.Место = Рольгангвх and Проверка_пути( Деталь.Номер_станд) = 1
      first 
      Convert_rule 
        Номер     set Система_2.Номер_детали
	Путь      set Тех_путь(Деталь.Номер_станд)
        Сост      set Обработка
	Сл_место  set Куда_переходить(Деталь.Место, Деталь.Путь)
        Рольг     set Обр_перевод(Рол.Пор_ном_р)
  Роб_1
    Choice from Роб_1.Состояние = Свободен
      first
      Convert_rule 
	Состояние set Вызов
	Куда      set Деталь.Место
  Система_2
    Choice from Система_2.Состояние = Оп_Запуск
      first
      Convert_rule
	Состояние    set Оп_Загрузка
        Номер_детали set Система_2.Номер_детали + 1
        Номер_станд  set Деталь.Номер_станд 
   Рол
    Choice from [Рол.Номер_изд = Деталь.Ном_издел or Рол.Номер_изд = 0] and Рол.Пор_ном_р >= 6 and Рол.Комплект <> Готов
      with_min Деталь.Ном_издел - Рол.Номер_изд  {Рол.Свободно}
      Convert_rule
	Номер_изд    set Деталь.Ном_издел
	Ном_ст_изд   set Деталь.Номер_изд
$End

$Pattern Задержка_партии : rule {trace}
$Relevant_resources
 Деталь    : Детали      Keep
 Сист      : Система     Keep
$Body
  Деталь
    Choice from Деталь.Сост = Ожидание and Деталь.Место = Рольгангвх  and Деталь.Номер = 0 {and Проверка_пути( Деталь.Номер_станд) = 1}
      with_min Деталь.Жребий_д
      Convert_rule 
        Место       set Рольганг2
	Жребий_д    set Деталь.Жребий_д + 0.05
 Сист
    Choice NoCheck
      first
      Convert_rule
	Состояние set Оп_Загрузка
$End

$Pattern Передвижение_1 : operation {trace}
$Relevant_resources
 Деталь : Детали    NoChange Keep
 Роб_1  : Робот_1   Keep     Keep
$Time= Время_пути(Роб_1.Позиция, Роб_1.Куда, Роб_1.Номер_р) / 50 
$Body
  Деталь
    Choice from Деталь.Сост = Обработка and Деталь.Место = Роб_1.Куда and Деталь.Номер <> 0
     first
    Convert_end 
	Транспорт set Нет
  Роб_1
    Choice from Роб_1.Состояние = Вызов  
     first
     Convert_begin
       Состояние set Движение_св
     Convert_end
       Позиция   set Роб_1.Куда
       Состояние set Загрузка 
       Куда      set Деталь.Сл_место 
$End

$Pattern Загрузка_роб : operation {trace}
$Relevant_resources
 Роб  : Робот   Keep     Keep			{100}
$Time= 0.5
$Body
  Роб
    Choice from Роб.Состояние = Загрузка
     first
     Convert_begin
       Состояние set Загружается
     Convert_end
       Состояние set Загружен 
$End

$Pattern Транспортировка : operation {trace}
$Relevant_resources
 Роб_1  : Робот    Keep     Keep
 Деталь : Детали   Keep     Keep
 Лин    : Линия    NoChange Keep
$Time= Время_пути(Роб_1.Позиция, Роб_1.Куда, Роб_1.Номер_р) / 50  
$Body
  Роб_1
    Choice from Роб_1.Состояние = Загружен  
     first
     Convert_begin
       Состояние set Движение_заг
     Convert_end
       Позиция   set Роб_1.Куда
       Состояние set Разгрузка
  Деталь
    Choice from Деталь.Сост = Обработка and Деталь.Сл_место = Роб_1.Куда and Деталь.Транспорт = Нет and Деталь.Место = Роб_1.Позиция
     first
     Convert_begin
       Транспорт  set Робот1
     Convert_end
       Транспорт  set Нет
       Место      set Деталь.Сл_место
       Сл_место   set Куда_переходить(Деталь.Место, Деталь.Путь)
  Лин
    Choice from Лин.Пор_ном_л = Перевод(Деталь.Сл_место) and Лин.Состояние <> Занята 
      first
      Convert_end
        Номер_дет set Деталь.Номер
        Декор     set Деталь.Декор
	Есть_дет  set Да
$End

$Pattern Разгрузка_роб : operation {trace}
$Relevant_resources
 Роб  : Робот   Keep     Keep
$Time= 0.5
$Body
  Роб
    Choice from Роб.Состояние = Разгрузка
     first
     Convert_begin
       Состояние set Разгружается
     Convert_end
       Состояние set Свободен 
$End

$Pattern Переналадка_л : operation {trace}
$Relevant_resources
 Деталь : Детали    NoChange NoChange 
 Лин    : Линия     Keep     Keep 
$Time= Время_переналадки(Деталь.Декор, Лин.Декор, Лин.Номер_дет)  
$Body
  Деталь
    Choice from Деталь.Сост = Обработка and  Деталь.Место = Рольгангвх and Деталь.Номер <> 0
     first
  Лин
    Choice from Есть_в_пути(Деталь.Путь, Лин.Пор_ном_л) = 1 and Лин.Состояние = Свободна 
      first
      Convert_begin
        Номер_дет set Деталь.Номер
	Декор     set Деталь.Декор
	Состояние set Переналадка
	Номер_изд set Деталь.Ном_издел
     Convert_end
        Состояние set Готова
$End

$Pattern Операция_1_2 : operation {trace}
$Relevant_resources
 Лин    : Линия         Keep     Keep 
 Деталь : Детали        NoChange Keep 
 Роб_2  : Робот_2       NoChange Keep 
 Трансп : Транспортер   NoChange Keep
$Time= Время_обработки(Лин.Пор_ном_л, Лин.Выход, Лин.Есть_дет)
$Body
  Лин
    Choice from Лин.Состояние = Готова and Лин.Есть_дет = Да and [Лин.Пор_ном_л = 1 or Лин.Пор_ном_л = 2] and Лин.Выход = Переход
      first
      Convert_begin
	Состояние set Занята
	Счетчик   set 0
     Convert_end
        Выход     set Смена(Лин.Выход)
	Есть_дет  set Нет
	Состояние set Готова
  Деталь
    Choice from Деталь.Сост = Обработка and Перевод(Деталь.Место) = Лин.Пор_ном_л
     first
     Convert_end
	Транспорт  set Какой_тр(Лин.Пор_ном_л, Лин.Выход)
        Сл_место   set Куда_переходить(Деталь.Место, Деталь.Путь)
  Роб_2	
    Choice NoCheck
     first
     Convert_end
	Состояние  set Вызвать(Лин.Выход, Лин.Пор_ном_л, Роб_2.Состояние)
	Куда       set Деталь.Место
  Трансп
    Choice NoCheck 
     first
     Convert_end
	Позиция    set Деталь.Место
	Состояние  set Загрузить_тр(Лин.Выход, Лин.Пор_ном_л, Трансп.Состояние)
	Куда       set Деталь.Сл_место
	Х_коор     set 450
	У_коор     set 200
$End

$Pattern Операция_31 : operation {trace}
$Relevant_resources
 Сист   : Система       Keep     NoChange
 Лин1   : Линия_31      Keep     Keep
 Лин2   : Линия_32      Keep     Keep
 Деталь : Детали        NoChange Keep 
 Роб_1  : Робот_1       NoChange Keep 
$Time= 48.0 {Время_обработки(Лин1.Пор_ном_л, Лин1.Выход, Лин1.Есть_дет)}
$Body
  Сист
    Choice NoCheck
      first
      Convert_begin
	Лин_32_з  set Лин2.Состояние
  Лин1
    Choice from [Лин1.Состояние = Готова or Лин1.Состояние = Свободна] and Лин1.Есть_дет = Да
      first
      Convert_begin
	Состояние set Занята
	Счетчик   set 0
     Convert_end
	Есть_дет  set Нет
	Состояние set Свободна
  Лин2
    Choice from Лин2.Состояние = Готова or Лин2.Состояние = Свободна
      first
      Convert_begin
	Состояние set Занята
     Convert_end
	Состояние set Сист.Лин_32_з
  Деталь
    Choice from Деталь.Сост = Обработка and Перевод(Деталь.Место) = 3 and Деталь.Номер_станд <> 2
     first
     Convert_end
	Транспорт  set Робот1 
        Сл_место   set Куда_переходить(Деталь.Место, Деталь.Путь)
  Роб_1
    Choice NoCheck 
      first
      Convert_end
	Состояние set Вызов
	Куда      set Деталь.Место 
$End

$Pattern Операция_32 : operation {trace}
$Relevant_resources
 Сист   : Система       Keep     NoChange
 Лин1   : Линия_32      Keep     Keep 
 Лин2   : Линия_31      Keep     Keep 
 Деталь : Детали        NoChange Keep 
 Роб_1  : Робот_1       NoChange Keep 
$Time= 48.0 {Время_обработки(Лин.Пор_ном_л, Лин.Выход, Лин.Есть_дет)}
$Body
  Сист
    Choice NoCheck
      first
      Convert_begin
	Лин_31_з  set Лин2.Состояние
  Лин1
    Choice from [Лин1.Состояние = Готова or Лин1.Состояние = Свободна] and Лин1.Есть_дет = Да
      first
      Convert_begin
	Состояние set Занята
	Счетчик   set 0
     Convert_end
	Есть_дет  set Нет
	Состояние set Свободна
  Лин2
    Choice from Лин2.Состояние = Готова or Лин2.Состояние = Свободна
      first
      Convert_begin
	Состояние set Занята
     Convert_end
	Состояние set Сист.Лин_31_з
  Деталь
    Choice from Деталь.Сост = Обработка and Перевод(Деталь.Место) = 4 and Деталь.Номер_станд <> 2
     first
     Convert_end
	Транспорт  set Робот1 
        Сл_место   set Куда_переходить(Деталь.Место, Деталь.Путь)
  Роб_1
    Choice NoCheck
      first
      Convert_end
	Состояние set Вызов
	Куда      set Деталь.Место 
$End

$Pattern Операция_3 : operation {trace}
$Relevant_resources
 Лин1   : Линия_32      Keep     Keep 
 Лин2   : Линия_31      Keep     Keep 
 Деталь : Детали        NoChange Keep 
 Роб_1  : Робот_1       NoChange Keep 
$Time= 86.0 {Время_обработки(Лин.Пор_ном_л, Лин.Выход, Лин.Есть_дет)}
$Body
  Лин1
    Choice from Лин1.Состояние = Готова 
      first
      Convert_begin
	Есть_дет  set Да
	Состояние set Занята
	Счетчик   set 0
     Convert_end
	Есть_дет  set Нет
	Состояние set Свободна
  Лин2
    Choice from Лин2.Состояние = Готова 
      first
      Convert_begin
	Состояние set Занята
	Счетчик   set 0
     Convert_end
	Есть_дет  set Нет
	Состояние set Свободна
  Деталь
    Choice from Деталь.Сост = Обработка and [Перевод(Деталь.Место) = 3 or Перевод(Деталь.Место) = 4] and Деталь.Номер_станд = 2
     first
     Convert_end
	Транспорт  set Робот1
	Место      set Линия32 
        Сл_место   set Куда_переходить(Деталь.Место, Деталь.Путь)
  Роб_1
    Choice NoCheck
      first
      Convert_end
	Состояние set Вызов
	Куда      set Деталь.Место 
$End

$Pattern Операция_1_2_вых : operation {trace}
$Relevant_resources
 Лин    : Линия         Keep     Keep 
 Деталь : Детали        Keep     Keep 
 Рол    : Рольганг      NoChange NoChange
 Роб_3  : Робот_3       NoChange Keep
$Time= Время_обработки(Лин.Пор_ном_л, Лин.Выход, Лин.Есть_дет)
$Body
  Лин
    Choice from Лин.Состояние = Готова and Лин.Есть_дет = Да and [Лин.Пор_ном_л = 1 or Лин.Пор_ном_л = 2] and Лин.Выход = Конец
      first
      Convert_begin
	Состояние set Занята
	Счетчик   set 0
      Convert_end
        Выход     set Смена(Лин.Выход)
	Есть_дет  set Нет
	Состояние set Свободна
  Деталь
    Choice from Деталь.Сост = Обработка and Перевод(Деталь.Место) = Лин.Пор_ном_л
     first
     Convert_begin
        Сл_место   set Деталь.Рольг
     Convert_end
	Транспорт  set Робот3 
	Место      set Обр_перевод(Рол.Пор_ном_р)
  Рол						
    Choice from Рол.Пор_ном_р = Вых_рольганг(Лин.Пор_ном_л)
     first
  Роб_3
    Choice NoCheck
     first
     Convert_end
	Состояние  set Вызов
	Куда       set Обр_перевод(Рол.Пор_ном_р)
$End



$Pattern Передвижение_2 : operation {trace}
$Relevant_resources
 Деталь : Детали    NoChange Keep
 Роб_2  : Робот_2   Keep     Keep
$Time= Время_пути(Роб_2.Позиция, Роб_2.Куда, Роб_2.Номер_р) / 50 
$Body
  Деталь
    Choice from Деталь.Сост = Обработка and Деталь.Транспорт = Робот2 and Деталь.Место = Роб_2.Куда
     first
    Convert_end
	Транспорт set Нет
  Роб_2
    Choice from Роб_2.Состояние = Вызов  
     first
     Convert_begin
       Состояние set Движение_св
     Convert_end
       Позиция   set Роб_2.Куда
       Состояние set Загрузка 
       Куда      set Деталь.Сл_место 
$End

$Pattern Передвижение_3 : operation {trace}
$Relevant_resources
 Деталь : Детали    NoChange Keep
 Роб_3  : Робот_3   Keep     Keep
 Рол    : Рольганг  NoChange Keep
$Time= Время_3(Роб_3.У_коор, Рол.У_коор) / 250  
$Body
  Деталь
    Choice from Деталь.Сост = Обработка and Деталь.Транспорт = Робот3 and Деталь.Место = Роб_3.Куда
     first
    Convert_end
	Транспорт set Нет
  Роб_3
    Choice from Роб_3.Состояние = Вызов  
     first
     Convert_begin
       Состояние set Движение_св
     Convert_end
       Позиция   set Роб_3.Куда
       Состояние set Загрузка 
       Куда      set Деталь.Сл_место 
  Рол
    Choice from Рол.Пор_ном_р = Перевод(Роб_3.Куда)
     first
     Convert_end
	Свободно      set Рол.Свободно + Взять(Рол.Пор_ном_р)
$End

$Pattern Запуск_на_выход : rule {trace}
$Relevant_resources
 Рол       : Рольганг    NoChange
 Деталь    : Детали      Keep
 Роб_3     : Робот_3     Keep
$Body
   Рол
    Choice from Рол.Комплект = Готов and Рол.Пор_ном_р >= 6 and Рол.Пор_ном_р <> 16 and Рол.Свободно < 9
      with_min Рол.Ном_в_очереди
  Деталь
    Choice from Деталь.Место = Обр_перевод(Рол.Пор_ном_р)
      first
      Convert_rule 
	Транспорт set Робот3
	Сл_место  set Куда_переходить(Деталь.Место, Деталь.Путь)
  Роб_3
    Choice from Роб_3.Состояние = Свободен
      first
      Convert_rule 
	Состояние set Вызов
	Куда      set Деталь.Место
$End

$Pattern Транспортировка_3 : operation {trace}
$Relevant_resources
 Роб_3  : Робот_3    Keep     Keep
 Деталь : Детали     Keep     Keep
 Рол    : Рольганг   NoChange Keep
$Time= Время_3(Роб_3.У_коор, Рол.У_коор) / 250   
$Body
  Роб_3
    Choice from Роб_3.Состояние = Загружен  
     first
     Convert_begin
       Состояние set Движение_заг
     Convert_end
       Позиция   set Роб_3.Куда
       Состояние set Разгрузка
  Деталь
    Choice from Деталь.Сост = Обработка and Деталь.Сл_место = Роб_3.Куда and Деталь.Транспорт = Нет and Деталь.Место <> Деталь.Сл_место 
     first
     Convert_begin
       Транспорт  set Робот3
     Convert_end
       Транспорт  set Нет
       Место      set Деталь.Сл_место
  Рол
    Choice from Рол.Пор_ном_р = Перевод(Деталь.Сл_место) 
      first
      Convert_end
	Свободно  set Рол.Свободно - 1
$End

$Pattern Готовность  : rule {trace}
$Relevant_resources
 Рол       : Рольганг  Keep
 Деталь    : Детали    NoChange
 Система_2 : Система     Keep
 Заказ     : Заказы      Keep
$Body
   Рол
    Choice from Рол.Пор_ном_р >= 6 and Рол.Свободно = 9 - Деталей(Рол.Ном_ст_изд) and Рол.Комплект = Не_готов
      first
      Convert_rule
	Комплект      set Готов
	Ном_в_очереди set Система_2.Очередь
   Деталь
    Choice from Деталь.Сост = Обработка and Деталь.Место = Обр_перевод(Рол.Пор_ном_р)
      first
   Система_2
    Choice NoCheck 
      first
      Convert_rule
	Очередь      set Система_2.Очередь + 1
  Заказ
    Choice from Заказ.Состояние = Обслуживается and Заказ.Номер = Деталь.Ном_заказа
      first
      Convert_rule 
	Изготовлено set Заказ.Изготовлено + 1
$End

$Pattern Готовность_заказа  : rule {trace}
$Relevant_resources
 Заказ     : Заказы      Keep
$Body
  Заказ
    Choice from Заказ.Состояние = Обслуживается and Заказ.Кол_издел = Заказ.Изготовлено
      first
      Convert_rule 
	Состояние   set Готов
	Изготовлено set 0
$End

$Pattern Освободить_вых  : rule {trace}
$Relevant_resources
 Рол    : Рольганг  Keep
 Деталь : Детали    Erase
$Body
   Рол
    Choice from Рол.Пор_ном_р = 16 and Рол.Свободно <> 9 
      first
      Convert_rule
	Свободно  set Рол.Свободно + 1
   Деталь
    Choice from Деталь.Место = Выход_изд
      first
$End

$Pattern Освободить  : rule {trace}
$Relevant_resources
 Рол  : Рольганг  Keep
 Сист : Система   Keep
$Body
   Рол
    Choice from Рол.Пор_ном_р >= 6 and Рол.Свободно = 9 and Рол.Номер_изд <> 0 and Рол.Комплект = Готов
      first
      Convert_rule
	Номер_изд      set 0
	Комплект       set Не_готов
	Ном_в_очереди  set 0
   Сист
    Choice NoCheck
      first
      Convert_rule
	Всего_издел    set Сист.Всего_издел - 1
$End

$Pattern Движение_роб_1 : operation {trace}
$Relevant_resources
 Сист   : Систем    Keep     Keep  
 Роб_1  : Робот_1   Keep     NoChange
$Time= 0.02
$Body
  Сист
    Choice from Сист.Р_1 = Стоп
     first
     Convert_begin
       Р_1 set Кадр
     Convert_end
       Р_1 set Стоп
  Роб_1
    Choice from Роб_1.Состояние = Движение_св or Роб_1.Состояние = Движение_заг{and Роб_1.Куда <> Линия1}
     first
     Convert_begin
       У_коор set Роб_1.У_коор + 5 * Длина_пути(Роб_1.Позиция, Роб_1.Куда)  
$End

$Pattern Движение_роб_2 : operation {trace}
$Relevant_resources
 Сист   : Систем    Keep     Keep  
 Роб_1  : Робот_2   Keep     NoChange
$Time= 0.02
$Body
  Сист
    Choice from Сист.Р_2 = Стоп
     first
     Convert_begin
       Р_2 set Кадр
     Convert_end
       Р_2 set Стоп
  Роб_1
    Choice from Роб_1.Состояние = Движение_св or Роб_1.Состояние = Движение_заг{and Роб_1.Куда <> Линия1}
     first
     Convert_begin
       У_коор set Роб_1.У_коор + 5 * Длина_пути(Роб_1.Позиция, Роб_1.Куда)  
$End

$Pattern Движение_роб_3 : operation {trace}
$Relevant_resources
 Сист   : Систем    Keep     Keep  
 Роб_1  : Робот_3   Keep     NoChange
$Time= 0.02
$Body
  Сист
    Choice from Сист.Р_3 = Стоп
     first
     Convert_begin
       Р_3 set Кадр
     Convert_end
       Р_3 set Стоп
  Роб_1
    Choice from Роб_1.Состояние = Движение_св or Роб_1.Состояние = Движение_заг {and Роб_1.Куда <> Линия1}
     first
     Convert_begin
       У_коор set Роб_1.У_коор + 5 * Длина_пути(Роб_1.Позиция, Роб_1.Куда)  
$End

$Pattern Движение_тр : operation {trace}
$Relevant_resources
 Сист    : Систем        Keep     Keep  
 Трансп  : Транспортер   Keep     NoChange
$Time= 0.02
$Body
  Сист
    Choice from Сист.Тр = Стоп
     first
     Convert_begin
       Тр set Кадр
     Convert_end
       Тр set Стоп
  Трансп
    Choice from Трансп.Состояние = Движение_св or Трансп.Состояние = Движение_заг
     first
     Convert_begin
       У_коор set Трансп.У_коор + 5 * Длина_пути(Трансп.Позиция, Трансп.Куда)  
$End

$Pattern Движение_дсп_1 : operation {trace}
$Relevant_resources
 Сист   : Систем    Keep     Keep  
 Лин    : Линия     Keep     NoChange
$Time= 0.15
$Body
  Сист
    Choice from Сист.Д_дсп_1 = Стоп
     first
     Convert_begin
       Д_дсп_1 set Кадр
     Convert_end
       Д_дсп_1 set Стоп
  Лин
    Choice from Лин.Состояние = Занята and Лин.Есть_дет = Да and Лин.Пор_ном_л = 1 
      first
     Convert_begin
       Счетчик set Лин.Счетчик + 1 
$End

$Pattern Движение_дсп_2 : operation {trace}
$Relevant_resources
 Сист   : Систем    Keep     Keep  
 Лин    : Линия     Keep     NoChange
$Time= 0.15
$Body
  Сист
    Choice from Сист.Д_дсп_2 = Стоп
     first
     Convert_begin
       Д_дсп_2 set Кадр
     Convert_end
       Д_дсп_2 set Стоп
  Лин
    Choice from Лин.Состояние = Занята and Лин.Есть_дет = Да and  Лин.Пор_ном_л = 2
      first
     Convert_begin
       Счетчик set Лин.Счетчик + 1 
$End

$Pattern Движение_дсп_31 : operation {trace}
$Relevant_resources
 Сист   : Систем       Keep     Keep  
 Лин    : Линия_31     Keep     NoChange
$Time= 0.35
$Body
  Сист
    Choice from Сист.Д_дсп_31 = Стоп
     first
     Convert_begin
       Д_дсп_31 set Кадр
     Convert_end
       Д_дсп_31 set Стоп
  Лин
    Choice from Лин.Состояние = Занята and Лин.Есть_дет = Да
      first
     Convert_begin
       Счетчик set Лин.Счетчик + 1 
$End

$Pattern Движение_дсп_32 : operation {trace}
$Relevant_resources
 Сист   : Систем       Keep     Keep  
 Лин    : Линия_32     Keep     NoChange
$Time= 0.35
$Body
  Сист
    Choice from Сист.Д_дсп_32 = Стоп
     first
     Convert_begin
       Д_дсп_32 set Кадр
     Convert_end
       Д_дсп_32 set Стоп
  Лин
    Choice from Лин.Состояние = Занята and Лин.Есть_дет = Да 
      first
     Convert_begin
       Счетчик set Лин.Счетчик + 1 
$End