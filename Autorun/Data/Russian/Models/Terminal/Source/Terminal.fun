$Function Yuzel : integer[78..402]
$Type = algorithmic
$Parameters
    x_now  : integer [-652..652]
    y_now  : integer [78..402]
    y_tar  : integer [78..402]
$Body
  Calculate_if x_now <> 0 and y_now + y_tar >= 480  Yuzel = y_now + 1
  Calculate_if x_now <> 0 and y_now + y_tar < 480   Yuzel = y_now - 1
$End
$Function Xuzel : integer[50..652]
$Type = algorithmic
$Parameters
    x_now1 : integer[50..652]
    x_tar1 : integer[50..652]
$Body
 Calculate_if x_tar1 > x_now1 Xuzel = x_now1 + 1
 Calculate_if x_tar1 < x_now1 Xuzel = x_now1 - 1
$End
$Function X_Up : integer[128..686]
$Type = algorithmic
$Parameters
    x_now1 : integer[128..686]
    x_tar1 : integer[128..686]
$Body
 Calculate_if x_tar1 > x_now1 X_Up = x_now1 + 1
 Calculate_if x_tar1 < x_now1 X_Up = x_now1 - 1
$End
$Function Ytarget : integer [78..416]
$Type = algorithmic
$Parameters
    y_now2 : integer
    y_tar2 : integer
$Body
 Calculate_if y_tar2 > y_now2 Ytarget = y_now2 + 1
 Calculate_if y_tar2 < y_now2 Ytarget = y_now2 - 1
$End
$Sequence KoorY : integer[93..394]
$Type = uniform
$End
$Sequence KoorX : integer[50..245]
$Type = uniform
$End                                                     {51 cell}
$Function Okrugl_Y : integer [93..394]
$Type = algorithmic
$Parameters
    yt_okr : integer[93..394]
$Body
  Calculate_if yt_okr >= 93 and yt_okr < 100  Okrugl_Y = 93
  Calculate_if yt_okr >= 100 and yt_okr < 106  Okrugl_Y = 100
  Calculate_if yt_okr >= 106 and yt_okr < 112  Okrugl_Y = 106
  Calculate_if yt_okr >= 112 and yt_okr < 118  Okrugl_Y = 112
  Calculate_if yt_okr >= 118 and yt_okr < 124  Okrugl_Y = 118

  Calculate_if yt_okr >= 124 and yt_okr < 130  Okrugl_Y = 124


  Calculate_if yt_okr >= 130 and yt_okr < 136  Okrugl_Y = 130
  Calculate_if yt_okr >= 136 and yt_okr < 142  Okrugl_Y = 136
  Calculate_if yt_okr >= 142 and yt_okr < 148  Okrugl_Y = 142
  Calculate_if yt_okr >= 148 and yt_okr < 154 Okrugl_Y = 148
  Calculate_if yt_okr >= 154 and yt_okr < 160 Okrugl_Y = 154
  Calculate_if yt_okr >= 160 and yt_okr < 166 Okrugl_Y = 160
  Calculate_if yt_okr >= 166 and yt_okr < 172 Okrugl_Y = 166
  Calculate_if yt_okr >= 172 and yt_okr < 178 Okrugl_Y = 172
  Calculate_if yt_okr >= 178 and yt_okr < 184 Okrugl_Y = 178
  Calculate_if yt_okr >= 184 and yt_okr < 190 Okrugl_Y = 184

  Calculate_if yt_okr >= 190 and yt_okr < 196 Okrugl_Y = 190
  Calculate_if yt_okr >= 196 and yt_okr < 202 Okrugl_Y = 196
  Calculate_if yt_okr >= 202 and yt_okr < 208 Okrugl_Y = 202
  Calculate_if yt_okr >= 208 and yt_okr < 214 Okrugl_Y = 208
  Calculate_if yt_okr >= 214 and yt_okr < 220 Okrugl_Y = 214
  Calculate_if yt_okr >= 220 and yt_okr < 226 Okrugl_Y = 220
  Calculate_if yt_okr >= 226 and yt_okr < 232 Okrugl_Y = 226
  Calculate_if yt_okr >= 232 and yt_okr < 238 Okrugl_Y = 232



  Calculate_if yt_okr >= 238 and yt_okr < 244 Okrugl_Y = 238
  Calculate_if yt_okr >= 244 and yt_okr < 250 Okrugl_Y = 244

  Calculate_if yt_okr >= 250 and yt_okr < 256 Okrugl_Y = 250
  Calculate_if yt_okr >= 256 and yt_okr < 262 Okrugl_Y = 256
  Calculate_if yt_okr >= 262 and yt_okr < 268 Okrugl_Y = 262
  Calculate_if yt_okr >= 268 and yt_okr < 274 Okrugl_Y = 268
  Calculate_if yt_okr >= 274 and yt_okr < 280 Okrugl_Y = 274
  Calculate_if yt_okr >= 280 and yt_okr < 286 Okrugl_Y = 280
  Calculate_if yt_okr >= 286 and yt_okr < 292 Okrugl_Y = 286
  Calculate_if yt_okr >= 292 and yt_okr < 298 Okrugl_Y = 292
  Calculate_if yt_okr >= 298 and yt_okr < 304 Okrugl_Y = 298
  Calculate_if yt_okr >= 304 and yt_okr < 310 Okrugl_Y = 304
  Calculate_if yt_okr >= 310 and yt_okr < 316 Okrugl_Y = 310
  Calculate_if yt_okr >= 316 and yt_okr < 322 Okrugl_Y = 316
  Calculate_if yt_okr >= 322 and yt_okr < 328 Okrugl_Y = 322
  Calculate_if yt_okr >= 328 and yt_okr < 334 Okrugl_Y = 328
  Calculate_if yt_okr >= 334 and yt_okr < 340 Okrugl_Y = 334
  Calculate_if yt_okr >= 340 and yt_okr < 346 Okrugl_Y = 340
  Calculate_if yt_okr >= 346 and yt_okr < 352 Okrugl_Y = 346
  Calculate_if yt_okr >= 352 and yt_okr < 358 Okrugl_Y = 352
  Calculate_if yt_okr >= 358 and yt_okr < 364 Okrugl_Y = 358
  Calculate_if yt_okr >= 364 and yt_okr < 370 Okrugl_Y = 364
  Calculate_if yt_okr >= 370 and yt_okr < 376 Okrugl_Y = 370
  Calculate_if yt_okr >= 376 and yt_okr < 382 Okrugl_Y = 376
  Calculate_if yt_okr >= 382 and yt_okr < 386 Okrugl_Y = 382
  Calculate_if yt_okr >= 386 and yt_okr < 390 Okrugl_Y = 388
  Calculate_if yt_okr >= 390 and yt_okr <= 394 Okrugl_Y = 394
$End
$Function Okrugl_X : integer[50..652]
$Type = algorithmic
$Parameters
  xt_okr : integer[50..245]
  num    : integer[1..3]
$Body
{1}
  Calculate_if xt_okr >= 50 and xt_okr < 89 and num = 1  Okrugl_X = 50
  Calculate_if xt_okr >= 89 and xt_okr < 128 and num = 1 Okrugl_X = 89
  Calculate_if xt_okr >= 128 and xt_okr < 167 and num = 1 Okrugl_X = 128
  Calculate_if xt_okr >= 167 and xt_okr < 206 and num = 1  Okrugl_X = 167
  Calculate_if xt_okr >= 206 and xt_okr <= 245 and num = 1 Okrugl_X = 206
{2}
  Calculate_if xt_okr >= 50 and xt_okr < 89 and num = 2  Okrugl_X = 273
  Calculate_if xt_okr >= 89 and xt_okr < 128 and num = 2 Okrugl_X = 312
  Calculate_if xt_okr >= 128 and xt_okr < 167 and num = 2 Okrugl_X = 351
  Calculate_if xt_okr >= 167 and xt_okr < 206 and num = 2  Okrugl_X = 390
  Calculate_if xt_okr >= 206 and xt_okr <= 245 and num = 2 Okrugl_X = 429
{3}
  Calculate_if xt_okr >= 50 and xt_okr < 89 and num = 3  Okrugl_X = 496
  Calculate_if xt_okr >= 89 and xt_okr < 128 and num = 3 Okrugl_X = 535
  Calculate_if xt_okr >= 128 and xt_okr < 167 and num = 3 Okrugl_X = 574
  Calculate_if xt_okr >= 167 and xt_okr < 206 and num = 3  Okrugl_X = 613
  Calculate_if xt_okr >= 206 and xt_okr <= 245 and num = 3 Okrugl_X = 652
$End
$Sequence C_U_F : such_as Systems.Where_Go
$Type = by_hist
$Body
 Cell_Free      0.1
 Saver_Up_Free  0.9
$End
$Sequence C_D_B : such_as Systems.Where_Go
$Type = by_hist
$Body
 Cell_Buzy        0.9
 Saver_Down_Buzy  0.1
$End
$Function Ref : such_as Systems.Where_Go
$Type = algorithmic
$Parameters
 Last_Go  : such_as Systems.Where_Go
 How_Sub  : integer[0..250]
 How_Cell : integer[0..250]
$Body
 Calculate_if Last_Go = No_Where  Ref = No_Where
 Calculate_if How_Sub = 0 and How_Cell = 0
              and Last_Go = Saver_Down_Buzy  Ref = No_Where
 Calculate_if How_Sub = 0 and How_Cell = 0
              and Last_Go = Saver_Up_Free    Ref = Cell_Buzy
 Calculate_if Last_Go = Cell_Free            Ref = Saver_Down_Buzy
 {Calculate_if Last_Go = Cell_Buzy and
              How_Sub > 0                    Ref = C_U_F{Saver_Up_Free}

 Calculate_if Last_Go = Saver_Down_Buzy and
              How_Sub > 0               and
              How_Cell > 0                   Ref = C_U_F
 Calculate_if Last_Go = Saver_Down_Buzy and
              How_Sub > 0               and
              How_Cell <= 0                  Ref = Saver_Up_Free
 Calculate_if Last_Go = Saver_Down_Buzy and
              How_Sub <= 0               and
              How_Cell > 0                   Ref = Cell_Free

 Calculate_if Last_Go = Saver_Up_Free        Ref = C_D_B
$End
$Function Get_Usage : such_as Robocars.Usage
$Type = algorithmic
$Parameters
 Where_Go : such_as Systems.Where_Go
 Last_Go : such_as Systems.Where_Go
$Body
 Calculate_if Where_Go = No_Where and Last_Go = No_Where Get_Usage = Empty
 Calculate_if Where_Go = No_Where Get_Usage = Empty
 Calculate_if Where_Go = Cell_Free or
              Where_Go = Saver_Up_Free Get_Usage = Empty
 Calculate_if Where_Go = Cell_Buzy or
              Where_Go = Saver_Down_Buzy Get_Usage = Load
$End
$Function Get_Usage_Up : such_as Robocar_Up.Usage
$Type = algorithmic
$Parameters
 Where_Go : such_as System_Up.Where_Go
 Last_Go : such_as System_Up.Where_Go
$Body
 Calculate_if Where_Go = No_Where and Last_Go = No_Where Get_Usage_Up = Empty
 Calculate_if Where_Go = No_Where Get_Usage_Up = Empty
 Calculate_if Where_Go = Saver1 or Where_Go = Saver2
              or Where_Go = Saver3     Get_Usage_Up = Load
 Calculate_if Where_Go = Custom Get_Usage_Up = Empty
$End
$Function Get_Usage_Down : such_as Robocar_Down.Usage
$Type = algorithmic
$Parameters
 Where_Go : such_as System_Down.Where_Go
 Last_Go : such_as System_Down.Where_Go
$Body
 Calculate_if Where_Go = No_Where and Last_Go = No_Where Get_Usage_Down = Empty
 Calculate_if Where_Go = No_Where Get_Usage_Down = Empty
 Calculate_if Where_Go = Saver1 or
              Where_Go = Saver2 or
              Where_Go = Saver3         Get_Usage_Down = Empty
 Calculate_if Where_Go = Saver1_Out or
              Where_Go = Saver2_Out or
              Where_Go = Saver3_Out     Get_Usage_Down = Load
$End
$Function Get_X : integer[50..652]
$Type = algorithmic
$Parameters
 Where_Go : such_as Systems.Where_Go
 Number   : integer[1..3]
 Last_Go  : such_as Systems.Where_Go
$Body
 Calculate_if Last_Go = No_Where and Number = 1 Get_X = 128
 Calculate_if Last_Go = No_Where and Number = 2 Get_X = 351
 Calculate_if Last_Go = No_Where and Number = 3 Get_X = 574

 Calculate_if [Where_Go = Cell_Free or Where_Go = Cell_Buzy] and
               Number = 1 Get_X = Okrugl_X(KoorX(50,245),1)

 Calculate_if [Where_Go = Cell_Free or Where_Go = Cell_Buzy] and
               Number = 2 Get_X = Okrugl_X(KoorX(50,245),2)

 Calculate_if [Where_Go = Cell_Free or Where_Go = Cell_Buzy] and
               Number = 3 Get_X = Okrugl_X(KoorX(50,245),3)

 Calculate_if [Where_Go = Saver_Up_Free or Where_Go = Saver_Down_Buzy or
               Where_Go = No_Where]
              and Number = 1   Get_X = 128
 Calculate_if [Where_Go = Saver_Up_Free or Where_Go = Saver_Down_Buzy or
               Where_Go = No_Where]
              and Number = 2   Get_X = 351
Calculate_if [Where_Go = Saver_Up_Free or Where_Go = Saver_Down_Buzy or
               Where_Go = No_Where]
              and Number = 3   Get_X = 574
$End
$Function Get_X_Up : integer[128..686]
$Type = algorithmic
$Parameters
 Where_Go : such_as System_Up.Where_Go
 Last_Go  : such_as System_Up.Where_Go
$Body
 Calculate_if Last_Go = No_Where or Where_Go = No_Where   Get_X_Up = 686
 Calculate_if  Where_Go = Saver1  Get_X_Up = 128
 Calculate_if  Where_Go = Saver2  Get_X_Up = 351
 Calculate_if  Where_Go = Saver3  Get_X_Up = 574
 Calculate_if  Where_Go = Custom  Get_X_Up = 686
$End
$Function Get_X_Down : integer[128..574]
$Type = algorithmic
$Parameters
 Where_Go : such_as System_Down.Where_Go
 Last_Go  : such_as System_Down.Where_Go
$Body
 Calculate_if  Last_Go = No_Where or Where_Go = No_Where  Get_X_Down = 574
 Calculate_if  Where_Go = Saver1     Get_X_Down = 128
 Calculate_if  Where_Go = Saver2     Get_X_Down = 351
 Calculate_if  Where_Go = Saver3     Get_X_Down = 574
 Calculate_if  Where_Go = Saver1_Out Get_X_Down = 259
 Calculate_if  Where_Go = Saver2_Out Get_X_Down = 351
 Calculate_if  Where_Go = Saver3_Out Get_X_Down = 442
$End
$Function Get_Y : integer[78..416]
$Type = algorithmic
$Parameters
 Where_Go : such_as Systems.Where_Go
 Last_Go  : such_as Systems.Where_Go
$Body
 Calculate_if Where_Go = Cell_Free or Where_Go = Cell_Buzy Get_Y = Okrugl_Y(KoorY(93,394))
 Calculate_if Where_Go = Saver_Up_Free Get_Y = 78
 Calculate_if Where_Go = Saver_Down_Buzy  Get_Y = 402
 Calculate_if Last_Go  = No_Where or Where_Go = No_Where Get_Y = 78
$End
$Function Add_Sub : integer[0..250]
$Type = algorithmic
$Parameters
 How      : integer[0..250]
 Work     : such_as Savers.Work
 Last_Go : such_as Systems.Where_Go
$Body
  Calculate_if   Last_Go = No_Where  Add_Sub = How
  Calculate_if   Work = Sub  Add_Sub = How - 1
  Calculate_if   Work = Add  Add_Sub = How + 1
  Calculate_if   Work = Cell and Last_Go = Cell_Buzy Add_Sub = How + 1
  Calculate_if   Work = Cell and Last_Go = Cell_Free Add_Sub = How - 1
$End
$Function Sub_Up : integer[0..250]
$Type = algorithmic
$Parameters
 How      : integer[0..250]
 Where_Go : such_as System_Up.Where_Go
$Body
  Calculate_if   Where_Go = Custom  Sub_Up = How - 1
  Calculate_if   Where_Go <> Custom  Sub_Up = How
$End
$Function Add_Up : integer[0..250]
$Type = algorithmic
$Parameters
 How      : integer[0..250]
 Where_Go : such_as System_Up.Where_Go
$Body
  Calculate_if   Where_Go = Saver1 or
                 Where_Go = Saver2 or
                 Where_Go = Saver3  Add_Up = How + 1
  Calculate_if   Where_Go = Custom  Add_Up = How
$End
$Function Add_Down : integer[0..250]
$Type = algorithmic
$Parameters
 How      : integer[0..250]
 Where_Go : such_as System_Down.Where_Go
$Body
  Calculate_if   Where_Go = Saver1_Out or
                 Where_Go = Saver2_Out or
                 Where_Go = Saver3_Out  Add_Down = How + 1
  Calculate_if 1 = 1 Add_Down = How
$End
$Function Sub_Down : integer[0..250]
$Type = algorithmic
$Parameters
 How      : integer[0..250]
 Where_Go : such_as System_Down.Where_Go
$Body
  Calculate_if   Where_Go = Saver1 or
                 Where_Go = Saver2 or
                 Where_Go = Saver3  Sub_Down = How - 1
  Calculate_if 1 = 1 Sub_Down = How
$End
$Function Get_Saver : such_as Savers.Work
$Type = algorithmic
$Parameters
 Where_Go  : such_as Systems.Where_Go
$Body
 Calculate_if Where_Go = Saver_Up_Free    Get_Saver = Sub
 Calculate_if Where_Go = Saver_Down_Buzy  Get_Saver = Add
 Calculate_if Where_Go = Cell_Buzy        Get_Saver = Cell
 Calculate_if Where_Go = Cell_Free        Get_Saver = Cell
$End
$Function Get_Saver_Up : integer[1..3]
$Type = algorithmic
$Parameters
 Where_Go : such_as System_Up.Where_Go
$Body
 Calculate_if Where_Go = Saver1   Get_Saver_Up = 1
 Calculate_if Where_Go = Saver2   Get_Saver_Up = 2
 Calculate_if Where_Go = Saver3   Get_Saver_Up = 3
 Calculate_if Where_Go = Custom   Get_Saver_Up = 3
$End
$Function Get_Saver_Add : integer[1..3]
$Type = algorithmic
$Parameters
 Where_Go : such_as System_Down.Where_Go
$Body
 Calculate_if Where_Go = Saver1_Out   Get_Saver_Add = 1
 Calculate_if Where_Go = Saver2_Out   Get_Saver_Add = 2
 Calculate_if Where_Go = Saver3_Out   Get_Saver_Add = 3
 Calculate_if 1 = 1 Get_Saver_Add = 3
$End
$Function Get_Saver_Sub : integer[1..3]
$Type = algorithmic
$Parameters
 Where_Go : such_as System_Down.Where_Go
$Body
 Calculate_if Where_Go = Saver1   Get_Saver_Sub = 1
 Calculate_if Where_Go = Saver2   Get_Saver_Sub = 2
 Calculate_if Where_Go = Saver3   Get_Saver_Sub = 3
 Calculate_if 1 = 1 Get_Saver_Sub = 3
$End
$Sequence Which_Saver : such_as System_Up.Where_Go
$Type = by_hist
$Body
 Saver1  0.333
 Saver2  0.333
 Saver3  0.333
$End
$Function Ref_Up : such_as System_Up.Where_Go
$Type = algorithmic
$Parameters
 Last_Go  : such_as System_Up.Where_Go
 How_Sub  : integer[0..250]
$Body
 Calculate_if Last_Go = No_Where   Ref_Up = No_Where
 Calculate_if [Last_Go = Saver1 or
              Last_Go = Saver2 or
              Last_Go = Saver3] and
              How_Sub = 0          Ref_Up = No_Where
 Calculate_if Last_Go = Saver1 or
              Last_Go = Saver2 or
              Last_Go = Saver3     Ref_Up = Custom
 Calculate_if Last_Go = Custom     Ref_Up = Which_Saver

$End
$Sequence Saver_Out : such_as System_Down.Where_Go
$Type = by_hist
$Body
 Saver1_Out  0.333
 Saver2_Out  0.333
 Saver3_Out  0.333
$End
$Sequence Saver_In_Down : such_as System_Down.Where_Go
$Type = by_hist
$Body
 Saver1  0.333
 Saver2  0.333
 Saver3  0.333
$End
$Sequence Saver_In_Down1 : such_as System_Down.Where_Go
$Type = by_hist
$Body
 Saver2  0.5
 Saver3  0.5
$End
$Sequence Saver_In_Down2 : such_as System_Down.Where_Go
$Type = by_hist
$Body
 Saver1  0.5
 Saver3  0.5
$End
$Sequence Saver_In_Down3 : such_as System_Down.Where_Go
$Type = by_hist
$Body
 Saver1  0.5
 Saver2  0.5
$End
$Function Ref_Down : such_as System_Down.Where_Go
$Type = algorithmic
$Parameters
 Last_Go   : such_as System_Down.Where_Go
 Multi_Sub : integer{[0..250250]}
 How_Sub3  : integer[0..250]
$Body
 Calculate_if Last_Go = Saver1 or
              Last_Go = Saver2 or
              Last_Go = Saver3          Ref_Down = Saver_Out
{First Saver = 0 only}
 Calculate_if Multi_Sub / 1000 = 0 and
              Multi_Sub - Multi_Sub / 1000 * 1000 > 0 and
              How_Sub3 > 0 and
              [Last_Go = Saver1_Out or
               Last_Go = Saver2_Out or
               Last_Go = Saver3_Out]     Ref_Down = Saver_In_Down1
{Second Saver = 0 only}
 Calculate_if Multi_Sub - Multi_Sub / 1000 * 1000 = 0 and
              Multi_Sub / 1000 > 0 and
              How_Sub3 > 0 and
              [Last_Go = Saver1_Out or
               Last_Go = Saver2_Out or
               Last_Go = Saver3_Out]     Ref_Down = Saver_In_Down2
{Third Saver = 0 only}
 Calculate_if Multi_Sub - Multi_Sub / 1000 * 1000 > 0 and
              Multi_Sub / 1000 > 0 and
              How_Sub3 = 0 and
              [Last_Go = Saver1_Out or
               Last_Go = Saver2_Out or
               Last_Go = Saver3_Out]     Ref_Down = Saver_In_Down3
{First = 0 @ Second = 0}
Calculate_if Multi_Sub - Multi_Sub / 1000 * 1000 = 0 and
              Multi_Sub / 1000 = 0 and
              How_Sub3 > 0 and
              [Last_Go = Saver1_Out or
               Last_Go = Saver2_Out or
               Last_Go = Saver3_Out]     Ref_Down = Saver3
{First = 0 @ Third = 0}
 Calculate_if Multi_Sub - Multi_Sub / 1000 * 1000 > 0 and
              Multi_Sub / 1000 = 0 and
              How_Sub3 = 0 and
              [Last_Go = Saver1_Out or
               Last_Go = Saver2_Out or
               Last_Go = Saver3_Out]     Ref_Down = Saver2
{Second = 0 @ Third = 0}
Calculate_if Multi_Sub - Multi_Sub / 1000 * 1000 = 0 and
              Multi_Sub / 1000 > 0 and
              How_Sub3 = 0 and
              [Last_Go = Saver1_Out or
               Last_Go = Saver2_Out or
               Last_Go = Saver3_Out]     Ref_Down = Saver1
{NoOne <> 0}
Calculate_if Multi_Sub - Multi_Sub / 1000 * 1000 > 0 and
              Multi_Sub / 1000 > 0 and
              How_Sub3 > 0 and
              [Last_Go = Saver1_Out or
               Last_Go = Saver2_Out or
               Last_Go = Saver3_Out]     Ref_Down = Saver_In_Down
Calculate_if 1 = 1 Ref_Down = No_Where
$End
$Sequence Fly_Time : real
$Type = uniform
$End
$Sequence Fly_How_Much : integer[10..14]
$Type = by_hist
$Body
 10 11  0.25
 11 12  0.25
 12 13  0.25
 13 14  0.25
$End
