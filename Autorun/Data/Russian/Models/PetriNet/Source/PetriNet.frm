$Frame  ����_1
$Back_picture = <0 255 255> petri_r
Show
  text   [430, 105, 150, 18, transparent, <0 0 0>, = '������: PETRI NET']
  text   [90,  5, 50, 22, transparent, <0 0 0>, > 'Time =']
  text   [150,  5, 80, 22, transparent, <0 0 0>,  <Time_now]
  text   [29, 143, 20, 10, <0 255 0>, <0 0 0>,  �����_1.Pic]
  text   [130, 143, 10, 10, <0 255 0>, <0 0 0>, �����_2.Pic]
  text   [230, 143, 10, 10, <0 255 0>, <0 0 0>, �����_3.Pic]
  text   [327, 141, 20, 10, <0 255 0>, <0 0 0>, �����_4.Pic]
  text   [177, 56, 10, 10, <0 255 0>, <0 0 0>,  �����_5.Pic]
  text   [227, 198, 10, 10, <0 255 0>, <0 0 0>, �����_6.Pic]
  text   [131, 200, 10, 10, <0 255 0>, <0 0 0>, �����_7.Pic]

  Show_if  �����_2.Pic = 0
  text   [549, 214, 80, 18, <0 255 0>, <0 0 0>, ='��������']
Show_if  �����_2.Pic <> 0
  text   [549, 214, 80, 18, <0 255 0>, <0 0 0>, ='�����']
  bitmap [574, 315, zag, zagm]
Show_if  �����_3.Pic = 0
  text   [281, 350, 80, 18, <0 255 0>, <0 0 0>, ='��������']
Show_if  �����_3.Pic <> 0
  text   [281, 350, 80, 18, <0 255 0>, <0 0 0>, ='�����']
  bitmap [384, 350, zag, zagm]

Show_if  �����_1.�������> 0
   bitmap [490, 235, zag, zagm]
Show_if  �����_1.�������> 1
   bitmap [475, 235, zag, zagm]
Show_if  �����_1.�������> 2
   bitmap [460, 235, zag, zagm]
Show_if  �����_1.�������> 3
   bitmap [445, 235, zag, zagm]
Show_if  �����_1.�������> 4
   bitmap [430, 235, zag, zagm]
Show_if  �����_1.�������> 5
   bitmap [415, 235, zag, zagm]
Show_if  �����_1.�������> 6
   bitmap [400, 235, zag, zagm]
Show_if  �����_1.�������> 7
   bitmap [385, 235, zag, zagm]
Show_if  �����_1.�������> 8
   bitmap [370, 235, zag, zagm]
Show_if  �����_1.�������> 9
   bitmap [355, 235, zag, zagm]

Show_if  �����_4.�������> 0
   bitmap [470, 412, zag, dm]
Show_if  �����_4.�������> 1
   bitmap [485, 412, zag, dm]
Show_if  �����_4.�������> 2
   bitmap [500, 412, zag, dm]
Show_if  �����_4.�������> 3
   bitmap [515, 412, zag, dm]
Show_if  �����_4.�������> 4
   bitmap [530, 412, zag, dm]
Show_if  �����_4.�������> 5
   bitmap [545, 412, zag, dm]
Show_if  �����_4.�������> 6
   bitmap [560, 412, zag, dm]
Show_if  �����_4.�������> 7
   bitmap [575, 412, zag, dm]
Show_if  �����_4.�������> 8
   bitmap [590, 412, zag, dm]
Show_if  �����_4.�������> 9
   bitmap [605, 412, zag, dm]
Show_if  �������_1.���������=�������� and �������_2.���������=��������
         and �������_3.���������=��������
   bitmap [475, 278, re, rem]
Show_if  �������_1.���������=�����
   bitmap [474, 332, rs1, rs1m]
Show_if  �������_2.���������=�����
   bitmap [368, 332, rs2, rs2m]
Show_if  �������_3.���������=�����
   bitmap [463, 320, rd, rdm]

Show_if   �������_1.��������� = ��������
  bitmap [79, 129, pb, pbm]
Show_if   �������_1.��������� = �����
  bitmap [79, 129, pr, pbm]
Show_if   �������_2.��������� = ��������
  bitmap [179, 128, pb, pbm]
Show_if   �������_2.��������� = �����
  bitmap [179, 128, pr, pbm]
Show_if   �������_3.��������� = ��������
  bitmap [277, 126, pb, pbm]
Show_if   �������_3.��������� = �����
  bitmap [277, 126, pr, pbm]
$End

