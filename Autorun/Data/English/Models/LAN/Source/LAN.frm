$Frame  Кадр_1
$Back_picture=lan
Show
  text [400,  25, 200, 15, transparent, <0 0 0>, ='Model: LAN']
  text [50,  25, 50, 22, transparent, <0 0 0>, > 'Time =']
  text [100,  25, 80, 22, transparent, <0 0 0>,  <Time_now]
  text [500,  250, 130, 25, transparent, <0 0 0>,  <'Number of package'] 
  text [500,  272, 120, 22, transparent, <0 0 0>,  <'in message ='] 
  text [610,  272, 80, 22, transparent, <0 0 0>,  <M1.Weight] 

Show_if M1.Where = 1
  ellipse [300,181, 10,10, <200 0 0>, <0 0 150>]
Show_if M1.Where = 2
  ellipse [382,206, 10,10, <200 0 0>, <0 0 150>] 
Show_if M1.Where = 3
  ellipse [299,279, 10,10, <200 0 0>, <0 0 150>] 
Show_if M1.Where = 4
  ellipse [214,206, 10,10, <200 0 0>, <0 0 150>]
Show_if M1.Holder = 1
  text [344,51,90,15,transparent, <250 0 0>, <'Sender']
Show_if M1.Holder = 2
  text [521,118,90,15,transparent, <250 0 0>, <'Sender']
Show_if M1.Holder = 3
  text [344,372,90,15,transparent, <250 0 0>, <'Sender'] 
Show_if M1.Holder = 4
  text [159,118,90,15,transparent, <250 0 0>, <'Sender']
Show_if M1.Whom = 1
  text [344,51,90,15,transparent, <250 0 0>, <'Receiver']
Show_if M1.Whom = 2
  text [521,118,90,15,transparent, <250 0 0>, <'Receiver']
Show_if M1.Whom = 3
  text [344,372,90,15,transparent, <250 0 0>, <'Receiver']
Show_if M1.Whom = 4
  text [159,118,90,15,transparent, <250 0 0>, <'Receiver']
Show_if M1.Holder = 1 and M1.Holder = M1.Where and M1.Weight <> 0
  bitmap [240,130, W1]
Show_if M1.Holder = 2 and M1.Holder = M1.Where and M1.Weight <> 0
  bitmap [407, 177, W2]
Show_if M1.Holder = 3 and M1.Holder = M1.Where and M1.Weight <> 0
  bitmap [270, 300, W3]
Show_if M1.Holder = 4 and M1.Holder = M1.Where and M1.Weight <> 0
  bitmap [165, 160, W4]
Show_if M1.Whom = 1 and M1.Whom = M1.Where and M1.Weight <> 0
  bitmap [240, 130, R1]
Show_if M1.Whom = 2 and M1.Whom = M1.Where and M1.Weight <> 0
 bitmap [407, 177, R2]
Show_if M1.Whom = 3 and M1.Whom = M1.Where and M1.Weight <> 0
 bitmap [270, 300, R3]
Show_if M1.Whom = 4 and M1.Whom = M1.Where and M1.Weight <> 0
 bitmap [165, 160, R4]

Show_if S1.Inquiry = Be
 text [344,36,110,20,transparent, <0 0 0>, <'Is message']
Show_if S2.Inquiry = Be
 text [521,103,110,20,transparent, <0 0 0>, <'Is message']
Show_if S3.Inquiry = Be
 text [344,357,110,20,transparent, <0 0 0>, <'Is message']
Show_if S4.Inquiry = Be
 text [159,103,110,20,transparent, <0 0 0>, <'Is message']
  

$End
