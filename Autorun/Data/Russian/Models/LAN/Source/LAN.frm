$Frame  Кадр_1
$Back_picture=lan
Show
  text [400,  25, 200, 15, transparent, <0 0 0>, ='Модель: LAN']
  text [50,  25, 50, 22, transparent, <0 0 0>, > 'Time =']
  text [100,  25, 80, 22, transparent, <0 0 0>,  <Time_now]
  text [500,  250, 120, 22, transparent, <0 0 0>,  <'Число пакетов'] 
  text [500,  272, 120, 22, transparent, <0 0 0>,  <'в сообщении ='] 
  text [610,  272, 80, 22, transparent, <0 0 0>,  <M1.Вес] 

Show_if M1.Где = 1
  ellipse [300,181, 10,10, <200 0 0>, <0 0 150>]
Show_if M1.Где = 2
  ellipse [382,206, 10,10, <200 0 0>, <0 0 150>] 
Show_if M1.Где = 3
  ellipse [299,279, 10,10, <200 0 0>, <0 0 150>] 
Show_if M1.Где = 4
  ellipse [214,206, 10,10, <200 0 0>, <0 0 150>]
Show_if M1.Владелец = 1
  text [344,51,90,15,transparent, <250 0 0>, <'Отправитель']
Show_if M1.Владелец = 2
  text [521,118,90,15,transparent, <250 0 0>, <'Отправитель']
Show_if M1.Владелец = 3
  text [344,372,90,15,transparent, <250 0 0>, <'Отправитель'] 
Show_if M1.Владелец = 4
  text [159,118,90,15,transparent, <250 0 0>, <'Отправитель']
Show_if M1.Кому = 1
  text [344,51,90,15,transparent, <250 0 0>, <'Приемник']
Show_if M1.Кому = 2
  text [521,118,90,15,transparent, <250 0 0>, <'Приемник']
Show_if M1.Кому = 3
  text [344,372,90,15,transparent, <250 0 0>, <'Приемник']
Show_if M1.Кому = 4
  text [159,118,90,15,transparent, <250 0 0>, <'Приемник']
Show_if M1.Владелец = 1 and M1.Владелец = M1.Где and M1.Вес <> 0
  bitmap [240,130, W1]
Show_if M1.Владелец = 2 and M1.Владелец = M1.Где and M1.Вес <> 0
  bitmap [407, 177, W2]
Show_if M1.Владелец = 3 and M1.Владелец = M1.Где and M1.Вес <> 0
  bitmap [270, 300, W3]
Show_if M1.Владелец = 4 and M1.Владелец = M1.Где and M1.Вес <> 0
  bitmap [165, 160, W4]
Show_if M1.Кому = 1 and M1.Кому = M1.Где and M1.Вес <> 0
  bitmap [240, 130, R1]
Show_if M1.Кому = 2 and M1.Кому = M1.Где and M1.Вес <> 0
 bitmap [407, 177, R2]
Show_if M1.Кому = 3 and M1.Кому = M1.Где and M1.Вес <> 0
 bitmap [270, 300, R3]
Show_if M1.Кому = 4 and M1.Кому = M1.Где and M1.Вес <> 0
 bitmap [165, 160, R4]

Show_if S1.Запрос = Есть
 text [344,36,110,15,transparent, <0 0 0>, <'Есть сообщение']
Show_if S2.Запрос = Есть
 text [521,103,110,15,transparent, <0 0 0>, <'Есть сообщение']
Show_if S3.Запрос = Есть
 text [344,357,110,15,transparent, <0 0 0>, <'Есть сообщение']
Show_if S4.Запрос = Есть
 text [159,103,110,15,transparent, <0 0 0>, <'Есть сообщение']
  

$End
