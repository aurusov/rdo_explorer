{1}
$Sequence Goods_Sum_s : integer
$Type = exponential 123456789
$End

{2}
$Sequence Goods_Name_s : such_as Goods_tt.Name
$Type = by_hist 123456789
$Body
trousers 0.40
shirt 0.50
sport_shirt 0.10
$End

{3}
$Sequence Cred_card_Sum_s : integer
$Type = exponential 123456789
$End

{4}
$Function Check_payment_f : such_as Permission_of_payment_tt.Permission_of_payment_m
$Type = algorithmic
$Parameters
P1 : such_as Account_tt.Sum
P2 : such_as Price_tt.Sum
$Body
Calculate_if P1-P2 < 0 Check_payment_f=0
Calculate_if P1-P2 >= 0 Check_payment_f=1
$End

{5}
$Sequence Appearance_customer_in_system_s : integer
$Type = uniform 864096812
$End

{6}
$Function Number_of_order_f : such_as Credit_card_tt.Number_of_order
$Type = algorithmic
$Parameters
P1 : integer
P2 : integer
$Body
Calculate_if P1-P2 <= 0 Number_of_order_f=before_first
Calculate_if P1-P2 > 0 Number_of_order_f=before_second
$End

{7}
$Function Number_of_order_f1 : such_as Credit_card_tt.Number_of_order
$Type = algorithmic
$Parameters
P1 : such_as Credit_card_tt.Number_of_order
$Body
Calculate_if P1 = before_first Number_of_order_f1=first_
Calculate_if P1 = before_second Number_of_order_f1=second
$End

{8}
$Function Lenghth_of_queue_f : integer
$Type = algorithmic
$Parameters
P1 : such_as Credit_card_tt.Number_of_order
P2 : such_as Credit_card_tt.Number_of_order
$Body
Calculate_if P1 =  P2 Lenghth_of_queue_f=1
Calculate_if P1 <> P2 Lenghth_of_queue_f=0
$End
