{1}
$Pattern Appearance_customer_in_system_ie : irregular_event trace
$Relevant_resources
  Number      : Number_r       Keep
  Goods       : Goods_tt       Create
  Credit_card : Credit_card_tt Create
$Time=Appearance_customer_in_system_s(5,10)
$Body
  Number
    Convert_event
      Number     set Number.Number + 1
      In_system  set Number.In_system+ 1
  Goods
    Convert_event
      Sum    set Goods_Sum_s(20)
      Name   set Goods_Name_s
      Number set Number.Number
      Goods_f_A1  set 0
      Goods_f_A44 set 0
  Credit_card
    Convert_event
      Sum    set Cred_card_Sum_s(30)
      Number set Number.Number
      Number_of_order set Number_of_order_f(Number.Lenghth_of_queue_1, Number.Lenghth_of_queue_2)
      Credit_card_f_A2  set 0
      Credit_card_f_A43 set 0
      Credit_card_f_A42 set 0
$End

{2}
$Pattern Estimate_of_purchase_and_come_in_order_pat : operation trace
$Relevant_resources
  Credit_card : Credit_card_tt Keep     NoChange
  Number2     : Number_pt      Keep     NoChange
  Goods       : Goods_tt       Keep     NoChange
  Price       : Price_tt       NonExist Create
$Time=20
$Body
  Credit_card
    Choice from [Credit_card.Number_of_order = before_first] or
                [Credit_card.Number_of_order = before_second]
    first
    Convert_begin
      Number_of_order set Number_of_order_f1(Credit_card.Number_of_order)
  Number2
    Choice NoCheck
    first
    Convert_begin
      Lenghth_of_queue_1 set Number2.Lenghth_of_queue_1+Lenghth_of_queue_f(Credit_card.Number_of_order, first_)
      Lenghth_of_queue_2 set Number2.Lenghth_of_queue_2+Lenghth_of_queue_f(Credit_card.Number_of_order, second)
  Goods
    Choice from [Goods.Goods_f_A1 = 0]
    first
    Convert_begin
      Goods_f_A1 set 1
  Price
    Convert_end
      Sum set Goods.Sum
      Number set Goods.Number
      Price_f_A3  set 0
      Price_f_A41 set 0
      Price_f_A42 set 0
      Price_f_A43 set 0
$End

{3}
$Pattern Identification_of_customer_pat : operation trace
$Relevant_resources
  Credit_card         : Credit_card_tt         Keep     NoChange
  Credit_card_machine : Credit_card_machine_pt Keep     Keep
  Account             : Account_tt             NonExist Create
  Network1            : Network_lan            Keep     Keep
  Network2            : Network_wan            Keep     Keep
$Time=5
$Body
  Credit_card
    Choice from [Credit_card.Credit_card_f_A2 = 0]
    first
    Convert_begin
      Credit_card_f_A2 set 1
  Credit_card_machine
    Choice from [Credit_card_machine.Busyness = Free] and
                [Credit_card_machine.Number_of_order = Credit_card.Number_of_order]
    first
    Convert_begin
      Busyness set Busy
    Convert_end
      Busyness set Free
  Account
    Convert_end
      Sum set Credit_card.Sum
      Number set Credit_card.Number
      Account_f_A3 set 0
  Network1
    Choice from [Network1.Busyness > 0]
    first
    Convert_begin
      Busyness set Network1.Busyness - 1
    Convert_end
      Busyness set Network1.Busyness + 1
  Network2
    Choice from [Network2.Busyness > 0]
    first
    Convert_begin
      Busyness set Network2.Busyness - 1
    Convert_end
      Busyness set Network2.Busyness + 1
$End

{4}
$Pattern Check_payment_pat : operation trace
$Relevant_resources
  Price   : Price_tt    Keep NoChange
  Account : Account_tt  Keep NoChange
  PC      : PC_pt       Keep Keep
  Network : Network_lan Keep Keep
  Permission_of_payment : Permission_of_payment_tt NonExist Create
$Time=1
$Body
  Price
    Choice from [Price.Price_f_A3 = 0]
    first
    Convert_begin
      Price_f_A3 set 1
  Account
    Choice from [Account.Account_f_A3 = 0] and
                [Account.Number = Price.Number]
    first
    Convert_begin
      Account_f_A3 set 1
  PC
    Choice from [PC.Busyness = Free]
    first
    Convert_begin
      Busyness set Busy
    Convert_end
      Busyness set Free
  Network
    Choice from [Network.Busyness > 0]
    first
    Convert_begin
      Busyness set Network.Busyness - 1
    Convert_end
      Busyness set Network.Busyness + 1
  Permission_of_payment
    Convert_end
      Permission_of_payment_m set Check_payment_f(Account.Sum, Price.Sum)
      Number set Price.Number
      Permission_of_payment_f_A41 set 0
      Permission_of_payment_f_A42 set 0
      Permission_of_payment_f_A44 set 0
      Permission_of_payment_f_A43 set 0
$End

{5}
$Pattern Coppies_of_accounts_pat : operation trace
$Relevant_resources
  Credit_card           : Credit_card_tt           NoChange NoChange
  Price                 : Price_tt                 Keep     NoChange
  Cash_equipment        : Cash_equipment_pt        Keep     Keep
  Permission_of_payment : Permission_of_payment_tt Keep     NoChange
  Cheque                : Cheque_tt                NonExist Create
$Time=5
$Body
  Credit_card
    Choice NoCheck
    first
  Price
    Choice from [Price.Price_f_A41 = 0]
    first
    Convert_begin
      Price_f_A41 set 1
  Cash_equipment
    Choice from [Cash_equipment.Busyness = Free] and
                [Cash_equipment.Number_of_order = Credit_card.Number_of_order]
    first
    Convert_begin
      Busyness set Busy
    Convert_end
      Busyness set Free
  Permission_of_payment
    Choice from [Permission_of_payment.Permission_of_payment_m = 1] and
                [Permission_of_payment.Permission_of_payment_f_A41 = 0] and
                [Permission_of_payment.Number = Price.Number]
    first
    Convert_begin
      Permission_of_payment_f_A41 set 1
  Cheque
    Convert_end
      Sum set Price.Sum
      Number set Price.Number
$End

{6}
$Pattern Update_of_customer_file_pat : operation trace
$Relevant_resources
  Credit_card             : Credit_card_tt Keep NoChange
  Price                   : Price_tt    Keep NoChange
  PC                      : PC_pt       Keep Keep
  Network                 : Network_wan Keep Keep
  Permission_of_payment   : Permission_of_payment_tt   Keep     NoChange
  New_data_about_customer : New_data_about_customer_tt NonExist Create
$Time=3
$Body
  Credit_card
    Choice from [Credit_card.Credit_card_f_A42 = 0] and
                [[Credit_card.Number_of_order = first_] or
                 [Credit_card.Number_of_order = second]]
    first
    Convert_begin
      Credit_card_f_A42 set 1
  Price
    Choice from [Price.Price_f_A42 = 0] and
                [Price.Number = Credit_card.Number]
    first
    Convert_begin
      Price_f_A42 set 1
  PC
    Choice from [PC.Busyness = Free]
    first
    Convert_begin
      Busyness set Busy
    Convert_end
      Busyness set Free
  Network
    Choice from [Network.Busyness > 0]
    first
    Convert_begin
      Busyness set Network.Busyness - 1
    Convert_end
      Busyness set Network.Busyness + 1
  Permission_of_payment
    Choice from [Permission_of_payment.Permission_of_payment_m = 1] and
                [Permission_of_payment.Permission_of_payment_f_A42 = 0] and
                [Permission_of_payment.Number = Credit_card.Number]
    first
    Convert_begin
      Permission_of_payment_f_A42 set 1
  New_data_about_customer
    Convert_end
      Sum set Credit_card.Sum
      Number set Credit_card.Number
$End

{7}
$Pattern Writing_in_credit_card_pat : operation trace
$Relevant_resources
  Credit_card           : Credit_card_tt            Keep     NoChange
  Price                 : Price_tt                  Keep     NoChange
  Credit_card_machine   : Credit_card_machine_pt    Keep     Keep
  Permission_of_payment : Permission_of_payment_tt  Keep     NoChange
  Credit_card1          : Credit_card1_tt           NonExist Create
$Time=2
$Body
  Credit_card
    Choice from [Credit_card.Credit_card_f_A43 = 0]
    first
    Convert_begin
      Credit_card_f_A43 set 1
  Price
    Choice from [Price.Price_f_A43 = 0] and
                [Price.Number = Credit_card.Number]
    first
    Convert_begin
      Price_f_A43 set 1
  Credit_card_machine
    Choice from [Credit_card_machine.Busyness = Free] and
                [Credit_card_machine.Number_of_order = Credit_card.Number_of_order]
    first
    Convert_begin
      Busyness set Busy
    Convert_end
      Busyness set Free
  Permission_of_payment
    Choice from [Permission_of_payment.Permission_of_payment_m = 1] and
                [Permission_of_payment.Permission_of_payment_f_A43 = 0] and
                [Permission_of_payment.Number = Credit_card.Number]
    first
    Convert_begin
      Permission_of_payment_f_A43 set 1
  Credit_card1
    Convert_end
      Sum set Credit_card.Sum
      Number set Credit_card.Number
$End

{8}
$Pattern Forming_of_order_pat : operation trace
$Relevant_resources
  Goods                 : Goods_tt    Keep     NoChange
  PC                    : PC_pt       Keep     Keep
  Network               : Network_wan Keep     Keep
  Order                 : Order_tt    NonExist Create
  Permission_of_payment : Permission_of_payment_tt Keep NoChange
$Time=3
$Body
  Goods
    Choice from [Goods.Goods_f_A44 = 0]
    first
    Convert_begin
      Goods_f_A44 set 1
  PC
    Choice from [PC.Busyness = Free]
    first
    Convert_begin
      Busyness set Busy
    Convert_end
      Busyness set Free
  Network
    Choice from [Network.Busyness > 0]
    first
    Convert_begin
      Busyness set Network.Busyness - 1
    Convert_end
      Busyness set Network.Busyness + 1
  Order
    Convert_end
      Sum set Goods.Sum
      Number set Goods.Number
  Permission_of_payment
    Choice from [Permission_of_payment.Permission_of_payment_m = 1] and
                [Permission_of_payment.Permission_of_payment_f_A44 = 0] and
                [Permission_of_payment.Number = Goods.Number]
    first
    Convert_begin
      Permission_of_payment_f_A44 set 1
$End

{9}
$Pattern Ending_of_work_rul : rule trace
$Relevant_resources
  Number2                 : Number_pt       Keep
  Goods                   : Goods_tt        Erase
  Credit_card             : Credit_card_tt  Erase
  Credit_card1            : Credit_card1_tt Erase
  Order                   : Order_tt        Erase
  Cheque                  : Cheque_tt       Erase
  Permission_of_payment   : Permission_of_payment_tt Erase
  Price                   : Price_tt     Erase
  Account                 : Account_tt   Erase
  New_data_about_customer : New_data_about_customer_tt Erase
$Body
  Number2
    Choice NoCheck
    first
    Convert_rule
      Come_out   set Number2.Come_out + 1
      In_system  set Number2.In_system - 1
      Lenghth_of_queue_1 set Number2.Lenghth_of_queue_1-Lenghth_of_queue_f(Credit_card.Number_of_order, first_)
      Lenghth_of_queue_2 set Number2.Lenghth_of_queue_2-Lenghth_of_queue_f(Credit_card.Number_of_order, second)
  Goods
    Choice from [Goods.Goods_f_A1 = 1] and
                [Goods.Goods_f_A44 = 1]
    first
  Credit_card
    Choice from [Credit_card.Credit_card_f_A2 = 1] and
                [Credit_card.Credit_card_f_A43 = 1] and
                [Credit_card.Credit_card_f_A42 = 1] and
                [Credit_card.Number = Goods.Number] and
                [[Credit_card.Number_of_order = first_] or
                 [Credit_card.Number_of_order = second]]
    first
  Credit_card1
    Choice from [Credit_card1.Number = Goods.Number]
    first
  Order
    Choice from [Order.Number = Goods.Number]
    first
  Cheque
    Choice from [Cheque.Number = Goods.Number]
    first
  Permission_of_payment
    Choice from [Permission_of_payment.Permission_of_payment_f_A41 = 1] and
                [Permission_of_payment.Permission_of_payment_f_A42 = 1] and
                [Permission_of_payment.Permission_of_payment_f_A44 = 1] and
                [Permission_of_payment.Permission_of_payment_f_A43 = 1] and
                [Permission_of_payment.Number = Goods.Number]
    first
  Price
    Choice from [Price.Price_f_A3 = 1] and
                [Price.Price_f_A41 = 1] and
                [Price.Price_f_A42 = 1] and
                [Price.Price_f_A43 = 1] and
                [Price.Number = Goods.Number]
    first
  Account
    Choice from [Account.Account_f_A3 = 1] and
                [Account.Number = Goods.Number]
    first
  New_data_about_customer
    Choice from [New_data_about_customer.Number = Goods.Number]
    first
$End

{10}
$Pattern Permission_is_absent_rul : rule trace
$Relevant_resources
  Number2                : Number_pt                Keep
  Permission_of_payment  : Permission_of_payment_tt Erase
  Goods                  : Goods_tt       Erase
  Credit_card            : Credit_card_tt Erase
  Price                  : Price_tt       Erase
  Account                : Account_tt     Erase
$Body
  Number2
    Choice NoCheck
    first
    Convert_rule
      Come_out   set Number2.Come_out  + 1
      In_system  set Number2.In_system - 1
      Lenghth_of_queue_1 set Number2.Lenghth_of_queue_1-Lenghth_of_queue_f(Credit_card.Number_of_order, first_)
      Lenghth_of_queue_2 set Number2.Lenghth_of_queue_2-Lenghth_of_queue_f(Credit_card.Number_of_order, second)
  Permission_of_payment
    Choice from [Permission_of_payment.Permission_of_payment_m = 0]
    first
  Goods
    Choice from [Goods.Number = Permission_of_payment.Number]
    first
  Credit_card
    Choice from [Credit_card.Number = Permission_of_payment.Number] and
                [[Credit_card.Number_of_order = first_] or
                 [Credit_card.Number_of_order = second]]
    first
  Price
    Choice from [Price.Number = Permission_of_payment.Number]
    first
  Account
    Choice from [Account.Number = Permission_of_payment.Number]
    first
$End
