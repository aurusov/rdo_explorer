$Frame  ����_1
$Back_picture=lan
Show
  text [400,  25, 200, 15, transparent, <0 0 0>, ='������: LAN']
  text [50,  25, 50, 22, transparent, <0 0 0>, > 'Time =']
  text [100,  25, 80, 22, transparent, <0 0 0>,  <Time_now]
  text [500,  250, 120, 22, transparent, <0 0 0>,  <'����� �������'] 
  text [500,  272, 120, 22, transparent, <0 0 0>,  <'� ��������� ='] 
  text [610,  272, 80, 22, transparent, <0 0 0>,  <M1.���] 

Show_if M1.��� = 1
  ellipse [300,181, 10,10, <200 0 0>, <0 0 150>]
Show_if M1.��� = 2
  ellipse [382,206, 10,10, <200 0 0>, <0 0 150>] 
Show_if M1.��� = 3
  ellipse [299,279, 10,10, <200 0 0>, <0 0 150>] 
Show_if M1.��� = 4
  ellipse [214,206, 10,10, <200 0 0>, <0 0 150>]
Show_if M1.�������� = 1
  text [344,51,90,15,transparent, <250 0 0>, <'�����������']
Show_if M1.�������� = 2
  text [521,118,90,15,transparent, <250 0 0>, <'�����������']
Show_if M1.�������� = 3
  text [344,372,90,15,transparent, <250 0 0>, <'�����������'] 
Show_if M1.�������� = 4
  text [159,118,90,15,transparent, <250 0 0>, <'�����������']
Show_if M1.���� = 1
  text [344,51,90,15,transparent, <250 0 0>, <'��������']
Show_if M1.���� = 2
  text [521,118,90,15,transparent, <250 0 0>, <'��������']
Show_if M1.���� = 3
  text [344,372,90,15,transparent, <250 0 0>, <'��������']
Show_if M1.���� = 4
  text [159,118,90,15,transparent, <250 0 0>, <'��������']
Show_if M1.�������� = 1 and M1.�������� = M1.��� and M1.��� <> 0
  bitmap [240,130, W1]
Show_if M1.�������� = 2 and M1.�������� = M1.��� and M1.��� <> 0
  bitmap [407, 177, W2]
Show_if M1.�������� = 3 and M1.�������� = M1.��� and M1.��� <> 0
  bitmap [270, 300, W3]
Show_if M1.�������� = 4 and M1.�������� = M1.��� and M1.��� <> 0
  bitmap [165, 160, W4]
Show_if M1.���� = 1 and M1.���� = M1.��� and M1.��� <> 0
  bitmap [240, 130, R1]
Show_if M1.���� = 2 and M1.���� = M1.��� and M1.��� <> 0
 bitmap [407, 177, R2]
Show_if M1.���� = 3 and M1.���� = M1.��� and M1.��� <> 0
 bitmap [270, 300, R3]
Show_if M1.���� = 4 and M1.���� = M1.��� and M1.��� <> 0
 bitmap [165, 160, R4]

Show_if S1.������ = ����
 text [344,36,110,15,transparent, <0 0 0>, <'���� ���������']
Show_if S2.������ = ����
 text [521,103,110,15,transparent, <0 0 0>, <'���� ���������']
Show_if S3.������ = ����
 text [344,357,110,15,transparent, <0 0 0>, <'���� ���������']
Show_if S4.������ = ����
 text [159,103,110,15,transparent, <0 0 0>, <'���� ���������']
  

$End
