$Pattern System_Impact_For_Up_Saver : operation trace
$Relevant_resources
 Rel_System      : System_Up     Keep      Keep       {upper system only one}
 Rel_Saver_Add   : Savers        Keep      NoChange   {Where to go}
 Rel_Saver_Sub   : S_In          Keep      NoChange   {in saver only "-"}
 Rel_Robocar     : Robocar_Up    NoChange  Keep
$Time = 0.0
$Body
  Rel_System
  Choice from Rel_System.Condition = B_Do and
              Rel_System.Last_Go <> No_Where
  first
   Convert_begin
    Last_Go   set Rel_System.Where_Go
    Condition set Do
   Convert_end
    Where_Go  set Ref_Up(Rel_System.Last_Go,Rel_Saver_Sub.How_Much)
    Condition set E_Do
 Rel_Saver_Add
  Choice from Rel_Saver_Add.Work = Sub and
              Rel_Saver_Add.Number = Get_Saver_Up(Rel_System.Where_Go)
  first
   Convert_begin
    How_Much  set Add_Up(Rel_Saver_Add.How_Much,
                      Rel_System.Where_Go)

 Rel_Saver_Sub
  Choice from Rel_Saver_Sub.Work  = Sub
  first
   Convert_begin
    How_Much  set Sub_Up(Rel_Saver_Sub.How_Much,
                      Rel_System.Where_Go)
 Rel_Robocar
  Choice NoCheck
  first
   Convert_end
    Time_Begin set Time_now
$End
$Pattern System_Impact_For_Down_Saver : operation
$Relevant_resources
 Rel_Saver_Sub1  : Savers          NoChange  NoChange
 Rel_Saver_Sub2  : Savers          NoChange  NoChange
 Rel_Saver_Sub3  : Savers          NoChange  NoChange
 Rel_System      : System_Down     Keep      Keep
 Rel_Saver_Add   : Savers_Down     Keep      NoChange
 Rel_Saver_Sub   : Savers          Keep      NoChange
 Rel_Robocar     : Robocar_Down    NoChange  Keep
$Time = 0.0
$Body
 Rel_Saver_Sub1
  Choice from Rel_Saver_Sub1.Number = 1 and
              Rel_Saver_Sub1.Work = Add
   first
  Rel_Saver_Sub2
  Choice from Rel_Saver_Sub2.Number = 2 and
              Rel_Saver_Sub2.Work = Add
   first
  Rel_Saver_Sub3
  Choice from Rel_Saver_Sub3.Number = 3 and
              Rel_Saver_Sub3.Work = Add
   first
 Rel_System
  Choice from Rel_System.Condition = B_Do and
              Rel_System.Last_Go <> No_Where
  first
   Convert_begin
    Last_Go   set Rel_System.Where_Go
    Condition set Do
   Convert_end
    Where_Go  set Ref_Down(Rel_System.Last_Go,
                           Rel_Saver_Sub1.How_Much * 1000 + Rel_Saver_Sub2.How_Much,
                           Rel_Saver_Sub3.How_Much)
    Condition set E_Do
 Rel_Saver_Add
  Choice from Rel_Saver_Add.Work = Add and
              Rel_Saver_Add.Number = Get_Saver_Add(Rel_System.Where_Go)
  first
   Convert_begin
    How_Much  set Add_Down(Rel_Saver_Add.How_Much,
                      Rel_System.Where_Go)

 Rel_Saver_Sub
  Choice from Rel_Saver_Sub.Work   = Add and
              Rel_Saver_Sub.Number = Get_Saver_Sub(Rel_System.Where_Go)
  first
   Convert_begin
    How_Much  set Sub_Down(Rel_Saver_Sub.How_Much,
                      Rel_System.Where_Go)
 Rel_Robocar
  Choice NoCheck
  first
   Convert_end
    Time_Begin set Time_now
$End
$Pattern System_Impact : operation
$Parameters
 Number : integer[1..3]
$Relevant_resources
 Rel_Saver_Sub   : Savers    NoChange NoChange
 Rel_Saver_Cell  : Savers    NoChange NoChange
 Rel_System      : Systems   Keep     Keep
 Rel_Saver       : Savers    Keep     NoChange
 Rel_Robocar     : Robocars  NoChange Keep
$Time = 0.0
$Body
 Rel_Saver_Sub
  Choice from Rel_Saver_Sub.Number = Number and
              Rel_Saver_Sub.Work = Sub
  first
 Rel_Saver_Cell
  Choice from Rel_Saver_Cell.Number = Number and
              Rel_Saver_Cell.Work = Cell
  first
 Rel_System
  Choice from Rel_System.Condition = B_Do and
              Rel_System.Number = Number and
              Rel_System.Last_Go <> No_Where
  first
   Convert_begin
    Last_Go   set Rel_System.Where_Go
    Condition set Do
   Convert_end
    Where_Go  set Ref(Rel_System.Last_Go,Rel_Saver_Sub.How_Much,
                      Rel_Saver_Cell.How_Much)
    Condition set E_Do
 Rel_Saver
  Choice from Rel_Saver.Number = Number and
              Rel_Saver.Work   = Get_Saver(Rel_System.Where_Go)
  first
   Convert_begin
    How_Much  set Add_Sub(Rel_Saver.How_Much,
                          Rel_Saver.Work,
                          Rel_System.Where_Go)
 Rel_Robocar
  Choice from Rel_Robocar.Number = Number
  first
   Convert_end
    Time_Begin    set Time_now
$End
$Pattern Set_Target : rule
$Parameters
 Number : integer[1..3]
$Relevant_resources
  Rel_System  : Systems  NoChange
  Rel_Robocar : Robocars Keep
$Body
  Rel_System
   Choice from Rel_System.Number = Number
   first
  Rel_Robocar
   Choice from  Rel_Robocar.Number = Number                  and
                Rel_Robocar.arb = 1 and Rel_Robocar.arb1 = 0 and
                Rel_Robocar.arb2 = 0 and
                Rel_Robocar.Current_X = Rel_Robocar.Target_X and
                Rel_Robocar.Current_Y = Rel_Robocar.Target_Y and
                Rel_System.Condition = E_Do
    first
     Convert_rule
      Target_X set Get_X (Rel_System.Where_Go,Rel_Robocar.Number,
                          Rel_System.Last_Go)
      Target_Y set Get_Y (Rel_System.Where_Go,Rel_System.Last_Go)
      Usage    set Get_Usage(Rel_System.Where_Go,Rel_System.Last_Go)
arb set 0
arb2 set 1
$End
$Pattern Set_Target_Up : rule
$Relevant_resources
  Rel_System  : System_Up   NoChange
  Rel_Robocar : Robocar_Up  Keep
$Body
  Rel_System
   Choice NoCheck
   first
  Rel_Robocar
   Choice from  Rel_Robocar.arb = 1 and Rel_Robocar.arb1 = 0 and
                Rel_Robocar.arb2 = 0 and
                Rel_Robocar.Current_X = Rel_Robocar.Target_X and
                Rel_System.Condition = E_Do
    first
     Convert_rule
      Target_X set Get_X_Up (Rel_System.Where_Go,Rel_System.Last_Go)
      Usage    set Get_Usage_Up(Rel_System.Where_Go,Rel_System.Last_Go)
arb set 0
arb2 set 1
$End
$Pattern Set_Target_Down : rule
$Relevant_resources
  Rel_System  : System_Down   NoChange
  Rel_Robocar : Robocar_Down  Keep
$Body
  Rel_System
   Choice NoCheck
   first
  Rel_Robocar
   Choice from  Rel_Robocar.arb = 1 and Rel_Robocar.arb1 = 0 and
                Rel_Robocar.arb2 = 0 and
                Rel_Robocar.Current_X = Rel_Robocar.Target_X and
                Rel_System.Condition = E_Do
    first
     Convert_rule
      Target_X set Get_X_Down (Rel_System.Where_Go,Rel_System.Last_Go)
      Usage    set Get_Usage_Down(Rel_System.Where_Go,Rel_System.Last_Go)
arb set 0
arb2 set 1
$End
$Pattern Set_yuzel : operation
$Parameters
 Time_oper : real
 Number : integer[1..3]
$Relevant_resources
  Rel_Robocar : Robocars Keep Keep
$Time = Time_oper
$Body
  Rel_Robocar
   Choice from  Rel_Robocar.Number = Number and
                Rel_Robocar.arb = 0 and Rel_Robocar.arb1 = 0 and
                Rel_Robocar.Current_Y <> 402 and
                Rel_Robocar.Current_Y <> 78  and
                Rel_Robocar.Current_X <> Rel_Robocar.Target_X
  first
 Convert_begin
arb1 set 1
 Convert_end
Current_Y set Yuzel(Rel_Robocar.Current_X - Rel_Robocar.Target_X,
                    Rel_Robocar.Current_Y, Rel_Robocar.Target_Y)
arb1 set 0
$End

$Pattern Set_xtarget : operation
$Parameters
 Time_oper : real
 Number    : integer[1..3]
$Relevant_resources
  Rel_Robocar : Robocars Keep Keep
$Time = Time_oper
$Body
  Rel_Robocar
   Choice from  Rel_Robocar.Number = Number and
                Rel_Robocar.arb = 0 and Rel_Robocar.arb1 = 0   and
                Rel_Robocar.Current_X <> Rel_Robocar.Target_X  and
                [Rel_Robocar.Current_Y = 402 or Rel_Robocar.Current_Y = 78]
  first
 Convert_begin
arb1 set 1
 Convert_end
Current_X set Xuzel(Rel_Robocar.Current_X, Rel_Robocar.Target_X)
arb1 set 0
$End
$Pattern Set_XTarget_Up : operation
$Parameters
 Time_oper : real
$Relevant_resources
  Rel_Robocar : Robocar_Up Keep Keep
$Time = Time_oper
$Body
  Rel_Robocar
   Choice from  Rel_Robocar.arb = 0 and Rel_Robocar.arb1 = 0   and
                Rel_Robocar.Current_X <> Rel_Robocar.Target_X
  first
 Convert_begin
  arb1 set 1
 Convert_end
  Current_X set X_Up(Rel_Robocar.Current_X, Rel_Robocar.Target_X)
  arb1 set 0
$End
$Pattern Set_XTarget_Down : operation
$Parameters
 Time_oper : real
$Relevant_resources
  Rel_Robocar : Robocar_Down Keep Keep
$Time = Time_oper
$Body
  Rel_Robocar
   Choice from  Rel_Robocar.arb = 0 and Rel_Robocar.arb1 = 0   and
                Rel_Robocar.Current_X <> Rel_Robocar.Target_X
  first
 Convert_begin
  arb1 set 1
 Convert_end
  Current_X set X_Up(Rel_Robocar.Current_X, Rel_Robocar.Target_X)
  arb1 set 0
$End
$Pattern Set_ytarget : operation
$Parameters
 Time_oper : real
 Number    : integer[1..3]
$Relevant_resources
  Rel_Robocar : Robocars Keep Keep
$Time = Time_oper
$Body
  Rel_Robocar
   Choice from  Rel_Robocar.Number = Number and
                Rel_Robocar.arb = 0 and Rel_Robocar.arb1 = 0 and
                Rel_Robocar.Current_X = Rel_Robocar.Target_X and
                Rel_Robocar.Current_Y <> Rel_Robocar.Target_Y
  first
 Convert_begin
arb1 set 1
 Convert_end
Current_Y set Ytarget(Rel_Robocar.Current_Y, Rel_Robocar.Target_Y)
arb1 set 0
$End

$Pattern Set_arb : rule
$Parameters
 Number   : integer[1..3]
$Relevant_resources
  Rel_Robocar : Robocars  Keep
  Rel_System  : Systems   Keep
$Body
 Rel_Robocar
  Choice from  Rel_Robocar.Number = Number and
               Rel_Robocar.arb = 0 and Rel_Robocar.arb1 = 0 and
               Rel_Robocar.Current_X = Rel_Robocar.Target_X and
               Rel_Robocar.Current_Y = Rel_Robocar.Target_Y
  first
   Convert_rule
    Time_End set Time_now
    Effect_Time set Rel_Robocar.Effect_Time + Rel_Robocar.Time_End
                    - Rel_Robocar.Time_Begin
    arb         set 1
    arb1        set 0
    arb2        set 0
 Rel_System
  Choice from Rel_System.Number = Rel_Robocar.Number
  first
   Convert_rule
    Condition set B_Do
$End
$Pattern Set_arb_Up : rule
$Relevant_resources
  Rel_Robocar : Robocar_Up  Keep
  Rel_System  : System_Up   Keep
$Body
 Rel_Robocar
  Choice from  Rel_Robocar.arb = 0 and Rel_Robocar.arb1 = 0 and
               Rel_Robocar.Current_X = Rel_Robocar.Target_X
  first
   Convert_rule
    Time_End set Time_now
    Effect_Time set Rel_Robocar.Effect_Time + Rel_Robocar.Time_End
                    - Rel_Robocar.Time_Begin
    arb  set 1
    arb1 set 0
    arb2 set 0
 Rel_System
  Choice NoCheck
  first
   Convert_rule
    Condition set B_Do
$End
$Pattern Set_arb_Down : rule
$Relevant_resources
  Rel_Robocar : Robocar_Down  Keep
  Rel_System  : System_Down   Keep
$Body
 Rel_Robocar
  Choice from  Rel_Robocar.arb = 0 and Rel_Robocar.arb1 = 0 and
               Rel_Robocar.Current_X = Rel_Robocar.Target_X
  first
   Convert_rule
    Time_End set Time_now
    Effect_Time set Rel_Robocar.Effect_Time + Rel_Robocar.Time_End
                    - Rel_Robocar.Time_Begin
    arb  set 1
    arb1 set 0
    arb2 set 0
 Rel_System
  Choice NoCheck
  first
   Convert_rule
    Condition set B_Do
$End
$Pattern Key : keyboard
$Parameters
 Number : integer[1..3]
$Relevant_resources
 Rel_Saver : Savers  Keep NoChange
$Time = 0.0
$Body
 Rel_Saver
  Choice from Rel_Saver.Number = Number and
              Rel_Saver.Work   = Add
   first
    Convert_begin
     How_Much  set  Rel_Saver.How_Much + 1
$End
$Pattern Rescue : operation
$Parameters
 Number : integer[1..3]
$Relevant_resources
 Rel_Saver   : Savers   NoChange NoChange
 Rel_System  : Systems  Keep     NoChange
$Time = 0
$Body
 Rel_Saver
  Choice from Rel_Saver.Number = Number and
              Rel_Saver.Work = Sub
  first
 Rel_System
  Choice from Rel_System.Number = Number and
              Rel_System.Condition = B_Do and
              Rel_System.Last_Go = No_Where and
              Rel_Saver.How_Much > 0
   first
    Convert_begin
     Where_Go set  Saver_Up_Free
     Last_Go  set  Cell_Buzy
$End
$Pattern Rescue_Up : rule
$Relevant_resources
 Rel_Saver  : Savers_U_D   NoChange
 Rel_System : System_In    Keep
$Body
 Rel_Saver
  Choice NoCheck
  first
 Rel_System
  Choice from Rel_System.Condition = B_Do and
              Rel_System.Where_Go = No_Where and
              Rel_Saver.How_Much > 0
   first
    Convert_rule
     Where_Go set  Custom
     Last_Go  set  Saver2
$End
$Pattern Rescue_Down : rule
$Relevant_resources
 Rel_Saver_Sub1  : Savers        NoChange
 Rel_Saver_Sub2  : Savers        NoChange
 Rel_Saver_Sub3  : Savers        NoChange
 Rel_System      : System_Down   Keep
$Body
 Rel_Saver_Sub1
  Choice from Rel_Saver_Sub1.Number = 1 and
              Rel_Saver_Sub1.Work = Add
  first
Rel_Saver_Sub2
  Choice from Rel_Saver_Sub2.Number = 2 and
              Rel_Saver_Sub2.Work = Add
  first
Rel_Saver_Sub3
  Choice from Rel_Saver_Sub3.Number = 3 and
              Rel_Saver_Sub3.Work = Add
  first
 Rel_System
  Choice from Rel_System.Condition = B_Do and
              Rel_System.Last_Go = No_Where and
              Rel_Saver_Sub3.How_Much > 0
   first
    Convert_rule
     Where_Go set  Saver3
     Last_Go  set  Saver1_Out
$End
$Pattern Fly_In : operation
$Relevant_resources
 Rel_Saver  : Savers_U_D   Keep Keep
$Time = Fly_Time (0.29,0.31)
$Body
 Rel_Saver
  Choice from Rel_Saver.Ready = On
  first
   Convert_begin
    How_Much set Rel_Saver.How_Much + Fly_How_Much
    Ready set Off
  Convert_end
    Ready set On
$End