$Frame  Кадр_1
{Show_if Time_now > 0.4 and Time_now <= 0.5}
$Back_picture = <255 255 0> {780  505} coiff_b
Show
  bitmap [ 420, 140, palma, palmam]
  bitmap [560, 50, kartina, kartinam]
  bitmap [512, 164, chair, chairm]
Show_if Парикмахерская.Занятость_парикмахера = Свободен
  bitmap [671,  40, barb1, barb1m]
Show_if Парикмахерская.Занятость_парикмахера = Занят
  bitmap [580,  40, barb2s, barb2m]

Show_if Клиент_1.Статус = в_очереди
  bitmap [420-Клиент_1.Позиция_в_очереди*70, 160, man1, man1m]
Show_if Клиент_2.Статус = в_очереди
  bitmap [420-Клиент_2.Позиция_в_очереди*70, 177, man2s, man2m]
Show_if Клиент_3.Статус = в_очереди
  bitmap [420-Клиент_3.Позиция_в_очереди*70, 172, man3s, man3m]
Show_if Клиент_4.Статус = в_очереди
  bitmap [420-Клиент_4.Позиция_в_очереди*70, 170, man4, man4m]
Show_if Клиент_5.Статус = в_очереди
  bitmap [420-Клиент_5.Позиция_в_очереди*70, 122, man5s, man5m]
Show_if Клиент_6.Статус = в_очереди
  bitmap [420-Клиент_6.Позиция_в_очереди*70, 156, man6, man6m]

Show_if Клиент_1.Статус = в_стрижке
  bitmap [575, 95, man1_1, man1_1m]
Show_if Клиент_2.Статус = в_стрижке
  bitmap [567, 110, man2_2, man2_2m]
Show_if Клиент_3.Статус = в_стрижке
  bitmap [580, 110, man3_3, man3_3m]
Show_if Клиент_4.Статус = в_стрижке
  bitmap [565, 107, man4_4, man4_4m]
Show_if Клиент_5.Статус = в_стрижке
  bitmap [570, 30, man5_5s, man5_5m]
Show_if Клиент_6.Статус = в_стрижке
  bitmap [560, 85, man6_6, man6_6m]

$End
