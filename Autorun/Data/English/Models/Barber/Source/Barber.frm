$Frame  Frame_1
{Show_if Time_now > 0.4 and Time_now <= 0.5}
$Back_picture = <255 255 0> {780  505} coiff_b
Show
  bitmap [ 420, 140, palma, palmam]
  bitmap [560, 50, kartina, kartinam]    
  bitmap [512, 164, chair, chairm]
Show_if BarberShop.Busyness_of_hairdresser = Free
  bitmap [671,  40, barb1, barb1m]
Show_if BarberShop.Busyness_of_hairdresser = Busy
  bitmap [580,  40, barb2s, barb2m]

Show_if Client_1.Status = in_a_queue
  bitmap [420-Client_1.Position_in_a_queue*70, 160, man1, man1m]
Show_if Client_2.Status = in_a_queue
  bitmap [420-Client_2.Position_in_a_queue*70, 177, man2s, man2m]
Show_if Client_3.Status = in_a_queue
  bitmap [420-Client_3.Position_in_a_queue*70, 172, man3s, man3m]
Show_if Client_4.Status = in_a_queue
  bitmap [420-Client_4.Position_in_a_queue*70, 170, man4, man4m]
Show_if Client_5.Status = in_a_queue
  bitmap [420-Client_5.Position_in_a_queue*70, 122, man5s, man5m]
Show_if Client_6.Status = in_a_queue
  bitmap [420-Client_6.Position_in_a_queue*70, 156, man6, man6m]

Show_if Client_1.Status = haircutting
  bitmap [575, 95, man1_1, man1_1m]
Show_if Client_2.Status = haircutting
  bitmap [567, 110, man2_2, man2_2m]
Show_if Client_3.Status = haircutting
  bitmap [580, 110, man3_3, man3_3m]
Show_if Client_4.Status = haircutting
  bitmap [565, 107, man4_4, man4_4m]
Show_if Client_5.Status = haircutting
  bitmap [570, 30, man5_5s, man5_5m]
Show_if Client_6.Status = haircutting
  bitmap [560, 85, man6_6, man6_6m]

$End

