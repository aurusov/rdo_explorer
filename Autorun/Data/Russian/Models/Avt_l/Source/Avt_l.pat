$Pattern Результат_действия_1 : rule { trace }
$Relevant_resources
  Автомат_   :  Автомат   Keep

$Body
  Автомат_
    Choice from
       Автомат_.Статус             =  Действие and
       Автомат_.Состояние_Лепесток =  1
     first
    Convert_rule
          Статус     set   Переход
          Среда      set   Среда_действие_1
          Счетчик_1  set   Автомат.Счетчик_1 + 1
$End

$Pattern Результат_действия_2 : rule { trace }
$Relevant_resources
  Автомат_   :  Автомат   Keep

$Body
  Автомат_
    Choice from
       Автомат_.Статус    =  Действие and
       Автомат_.Состояние_Лепесток  =  2
     first
    Convert_rule
          Статус     set   Переход
          Среда      set   Среда_действие_2
          Счетчик_2  set   Автомат.Счетчик_2 + 1
$End

$Pattern Результат_действия_3 : rule { trace }
$Relevant_resources
  Автомат_   :  Автомат   Keep

$Body
  Автомат_
    Choice from
       Автомат_.Статус    =  Действие and
       Автомат_.Состояние_Лепесток  =  3
     first
    Convert_rule
          Статус     set   Переход
          Среда      set   Среда_действие_3
          Счетчик_3  set   Автомат.Счетчик_3 + 1
$End

$Pattern  Срабатывание_Автомата_Штраф : rule   { trace }
$Parameters
   Лепесток       :  integer
   Позиция        :  integer
   Лепесток_н_ш   :  integer
   Позиция_н_ш    :  integer
$Relevant_resources
  Автомат_  : Автомат  Keep 
 
$Body
  Автомат_
    Choice from Автомат_.Статус = Переход  and
                Автомат_.Среда  = Штраф    and
                Автомат_.Состояние_Лепесток = Лепесток and
                Автомат_.Состояние_Позиция  = Позиция
          first
    Convert_rule
                Состояние_Лепесток  set  Лепесток_н_ш
                Состояние_Позиция   set  Позиция_н_ш
                Статус              set  Действие
                Счетчик             set  Автомат_.Счетчик + 1
$End
   

$Pattern  Срабатывание_Автомата_Поощрение : rule  { trace }
$Parameters
   Лепесток       :  integer
   Позиция        :  integer
   Позиция_н_п    :  integer
$Relevant_resources
  Автомат_  : Автомат  Keep 
 
$Body
  Автомат_
    Choice from Автомат_.Статус = Переход  and
                Автомат_.Среда  = Поощрение and
                Автомат_.Состояние_Лепесток = Лепесток and
                Автомат_.Состояние_Позиция  = Позиция 
          first
    Convert_rule
                Состояние_Позиция   set  Позиция_н_п
                Статус              set  Действие
                Счетчик             set  Автомат_.Счетчик + 1
$End
   