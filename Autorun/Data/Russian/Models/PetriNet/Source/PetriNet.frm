$Frame  Кадр_1
$Back_picture = <0 255 255> petri_r
Show
  text   [430, 105, 150, 18, transparent, <0 0 0>, = 'Модель: PETRI NET']
  text   [90,  5, 50, 22, transparent, <0 0 0>, > 'Time =']
  text   [150,  5, 80, 22, transparent, <0 0 0>,  <Time_now]
  text   [29, 143, 20, 10, <0 255 0>, <0 0 0>,  Место_1.Pic]
  text   [130, 143, 10, 10, <0 255 0>, <0 0 0>, Место_2.Pic]
  text   [230, 143, 10, 10, <0 255 0>, <0 0 0>, Место_3.Pic]
  text   [327, 141, 20, 10, <0 255 0>, <0 0 0>, Место_4.Pic]
  text   [177, 56, 10, 10, <0 255 0>, <0 0 0>,  Место_5.Pic]
  text   [227, 198, 10, 10, <0 255 0>, <0 0 0>, Место_6.Pic]
  text   [131, 200, 10, 10, <0 255 0>, <0 0 0>, Место_7.Pic]

  Show_if  Место_2.Pic = 0
  text   [549, 214, 80, 18, <0 255 0>, <0 0 0>, ='Свободен']
Show_if  Место_2.Pic <> 0
  text   [549, 214, 80, 18, <0 255 0>, <0 0 0>, ='Занят']
  bitmap [574, 315, zag, zagm]
Show_if  Место_3.Pic = 0
  text   [281, 350, 80, 18, <0 255 0>, <0 0 0>, ='Свободен']
Show_if  Место_3.Pic <> 0
  text   [281, 350, 80, 18, <0 255 0>, <0 0 0>, ='Занят']
  bitmap [384, 350, zag, zagm]

Show_if  Место_1.Емкость> 0
   bitmap [490, 235, zag, zagm]
Show_if  Место_1.Емкость> 1
   bitmap [475, 235, zag, zagm]
Show_if  Место_1.Емкость> 2
   bitmap [460, 235, zag, zagm]
Show_if  Место_1.Емкость> 3
   bitmap [445, 235, zag, zagm]
Show_if  Место_1.Емкость> 4
   bitmap [430, 235, zag, zagm]
Show_if  Место_1.Емкость> 5
   bitmap [415, 235, zag, zagm]
Show_if  Место_1.Емкость> 6
   bitmap [400, 235, zag, zagm]
Show_if  Место_1.Емкость> 7
   bitmap [385, 235, zag, zagm]
Show_if  Место_1.Емкость> 8
   bitmap [370, 235, zag, zagm]
Show_if  Место_1.Емкость> 9
   bitmap [355, 235, zag, zagm]

Show_if  Место_4.Емкость> 0
   bitmap [470, 412, zag, dm]
Show_if  Место_4.Емкость> 1
   bitmap [485, 412, zag, dm]
Show_if  Место_4.Емкость> 2
   bitmap [500, 412, zag, dm]
Show_if  Место_4.Емкость> 3
   bitmap [515, 412, zag, dm]
Show_if  Место_4.Емкость> 4
   bitmap [530, 412, zag, dm]
Show_if  Место_4.Емкость> 5
   bitmap [545, 412, zag, dm]
Show_if  Место_4.Емкость> 6
   bitmap [560, 412, zag, dm]
Show_if  Место_4.Емкость> 7
   bitmap [575, 412, zag, dm]
Show_if  Место_4.Емкость> 8
   bitmap [590, 412, zag, dm]
Show_if  Место_4.Емкость> 9
   bitmap [605, 412, zag, dm]
Show_if  Переход_1.Занятость=Свободен and Переход_2.Занятость=Свободен
         and Переход_3.Занятость=Свободен
   bitmap [475, 278, re, rem]
Show_if  Переход_1.Занятость=Занят
   bitmap [474, 332, rs1, rs1m]
Show_if  Переход_2.Занятость=Занят
   bitmap [368, 332, rs2, rs2m]
Show_if  Переход_3.Занятость=Занят
   bitmap [463, 320, rd, rdm]

Show_if   Переход_1.Занятость = Свободен
  bitmap [79, 129, pb, pbm]
Show_if   Переход_1.Занятость = Занят
  bitmap [79, 129, pr, pbm]
Show_if   Переход_2.Занятость = Свободен
  bitmap [179, 128, pb, pbm]
Show_if   Переход_2.Занятость = Занят
  bitmap [179, 128, pr, pbm]
Show_if   Переход_3.Занятость = Свободен
  bitmap [277, 126, pb, pbm]
Show_if   Переход_3.Занятость = Занят
  bitmap [277, 126, pr, pbm]
$End

