$Frame  Shot_1
$Back_picture = <0 255 255> petri_e
Show
  text   [430, 105, 150, 18, transparent, <0 0 0>, = 'Model: PETRI NET']
  text   [90,  5, 50, 22, transparent, <0 0 0>, > 'Time =']
  text   [150,  5, 80, 22, transparent, <0 0 0>,  <Time_now]
  text   [29, 143, 20, 10, <0 255 0>, <0 0 0>,  Place_1.Pic]
  text   [130, 143, 10, 10, <0 255 0>, <0 0 0>, Place_2.Pic]
  text   [230, 143, 10, 10, <0 255 0>, <0 0 0>, Place_3.Pic]
  text   [327, 141, 20, 10, <0 255 0>, <0 0 0>, Place_4.Pic]
  text   [177, 56, 10, 10, <0 255 0>, <0 0 0>,  Place_5.Pic]
  text   [227, 198, 10, 10, <0 255 0>, <0 0 0>, Place_6.Pic]
  text   [131, 200, 10, 10, <0 255 0>, <0 0 0>, Place_7.Pic]

  Show_if  Place_2.Pic = 0
  text   [549, 214, 80, 18, <0 255 0>, <0 0 0>, ='Free']
Show_if Place_2.Pic <> 0
  text   [549, 214, 80, 18, <0 255 0>, <0 0 0>, ='Busy']
  bitmap [574, 315, zag, zagm]
Show_if  Place_3.Pic = 0
  text   [281, 350, 80, 18, <0 255 0>, <0 0 0>, ='Free']
Show_if  Place_3.Pic <> 0
  text   [281, 350, 80, 18, <0 255 0>, <0 0 0>, ='Busy']
  bitmap [384, 350, zag, zagm]

Show_if  Place_1.Size> 0
   bitmap [490, 235, zag, zagm]
Show_if  Place_1.Size> 1
   bitmap [475, 235, zag, zagm]
Show_if  Place_1.Size> 2
   bitmap [460, 235, zag, zagm]
Show_if  Place_1.Size> 3
   bitmap [445, 235, zag, zagm]
Show_if  Place_1.Size> 4
   bitmap [430, 235, zag, zagm]
Show_if  Place_1.Size> 5
   bitmap [415, 235, zag, zagm]
Show_if  Place_1.Size> 6
   bitmap [400, 235, zag, zagm]
Show_if  Place_1.Size> 7
   bitmap [385, 235, zag, zagm]
Show_if  Place_1.Size> 8
   bitmap [370, 235, zag, zagm]
Show_if  Place_1.Size> 9
   bitmap [355, 235, zag, zagm]

Show_if  Place_4.Size> 0
   bitmap [470, 412, zag, dm]
Show_if  Place_4.Size> 1
   bitmap [485, 412, zag, dm]
Show_if  Place_4.Size> 2
   bitmap [500, 412, zag, dm]
Show_if  Place_4.Size> 3
   bitmap [515, 412, zag, dm]
Show_if  Place_4.Size> 4
   bitmap [530, 412, zag, dm]
Show_if  Place_4.Size> 5
   bitmap [545, 412, zag, dm]
Show_if  Place_4.Size> 6
   bitmap [560, 412, zag, dm]
Show_if  Place_4.Size> 7
   bitmap [575, 412, zag, dm]
Show_if  Place_4.Size> 8
   bitmap [590, 412, zag, dm]
Show_if  Place_4.Size> 9
   bitmap [605, 412, zag, dm]
Show_if  Transition_1.Being_busy=Free and 
         Transition_2.Being_busy=Free and
         Transition_3.Being_busy=Free
   bitmap [475, 278, re, rem]
Show_if  Transition_1.Being_busy=Busy
   bitmap [474, 332, rs1, rs1m]
Show_if  Transition_2.Being_busy=Busy
   bitmap [368, 332, rs2, rs2m]
Show_if  Transition_3.Being_busy=Busy
   bitmap [463, 320, rd, rdm]

Show_if   Transition_1.Being_busy = Free
  bitmap [79, 129, pb, pbm]
Show_if   Transition_1.Being_busy = Busy
  bitmap [79, 129, pr, pbm]
Show_if   Transition_2.Being_busy = Free
  bitmap [179, 128, pb, pbm]
Show_if   Transition_2.Being_busy = Busy
  bitmap [179, 128, pr, pbm]
Show_if   Transition_3.Being_busy = Free
  bitmap [277, 126, pb, pbm]
Show_if   Transition_3.Being_busy = Busy
  bitmap [277, 126, pr, pbm]
$End

