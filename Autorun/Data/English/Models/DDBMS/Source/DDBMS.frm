
$Frame  Shot_1
$Back_picture = gnd3
{Show}
Show_if St1.Con = F
text	[180, 1,250,15,transparent,< 0 0 0 >, = 'Station is free']
Show_if St1.Con = P
text	[180, 1,250,15,transparent,< 0 0 0 >, = 'Station computes']
text	[180, 16,250,15,transparent,< 0 0 0 >, = 'subdemand']
Show_if St1.Con = R
text	[180, 1,250,15,transparent,< 0 0 0 >, = 'Station broadcasts']
text	[180, 16,250,15,transparent,< 0 0 0 >, = 'subdemand']
rect	[292,178,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St4.Con = F
text	[180, 320,250,15,transparent,< 0 0 0 >, = 'Station is free']
Show_if St4.Con = P
text	[180, 320,250,15,transparent,< 0 0 0 >, = 'Station computes']
text	[180, 320 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
Show_if St4.Con = R
text	[180, 320,250,15,transparent,< 0 0 0 >, = 'Station broadcasts']
text	[180, 320 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
rect	[291,276,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St6.Con = F
text	[1, 64,250,15,transparent,< 0 0 0 >, = 'Station is free']
Show_if St6.Con = P
text	[1, 64,250,15,transparent,< 0 0 0 >, = 'Station computes']
text	[1, 64 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
Show_if St6.Con = R
text	[1, 64,250,15,transparent,< 0 0 0 >, = 'Station broadcasts']
text	[1, 64 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
rect	[205,203,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St2.Con = F
text	[361, 65,250,15,transparent,< 0 0 0 >, = 'Station is free']
Show_if St2.Con = P
text	[361, 65,250,15,transparent,< 0 0 0 >, = 'Station computes']
text	[361, 65 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
Show_if St2.Con = R
text	[361, 65,250,15,transparent,< 0 0 0 >, = 'Station broadcasts']
text	[361, 65 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
rect	[373,203,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St5.Con = F
text	[1, 238,250,15,transparent,< 0 0 0 >, = 'Station is free']
Show_if St5.Con = P
text	[1, 238,250,15,transparent,< 0 0 0 >, = 'Station computes']
text	[1, 238 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
Show_if St5.Con = R
text	[1, 238,250,15,transparent,< 0 0 0 >, = 'Station broadcasts']
text	[1, 238 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
rect	[205,247,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St3.Con = F
text	[359, 241,250,15,transparent,< 0 0 0 >, = 'Station is free']
Show_if St3.Con = P
text	[359, 241,250,15,transparent,< 0 0 0 >, = 'Station computes']
text	[359, 241 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
Show_if St3.Con = R
text	[359, 241,250,15,transparent,< 0 0 0 >, = 'Station broadcasts']
text	[359, 241 + 15,250,15,transparent,< 0 0 0 >, = 'subdemand']
rect	[375,250,23,14,< 255 0  0 >,< 0   64  128 >]
$End


$Frame  Shot_2
$Back_picture = gnd2_e

{Таблица}

Show_if Sy1.An_f = 2
text	[280, 50,250,20,transparent,< 0 0 0 >, = AT.Cr_time]
text	[280, 85,250,20,transparent,< 0 0 0 >, = AT.Pr] 
text	[280, 115,250,20,transparent,< 0 0 0 >, = AT.Soc] 
Show_if Sy1.An_f = 2 and AT.Act = I and AT.Qu > 0
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'waiting of servise queue'] 
text	[280, 170,250,20,transparent,< 0 0 0 >, = 'order  №:'] 
text	[280, 170,220,20,transparent,< 0 0 0 >, > AT.Qu] 
Show_if Sy1.An_f = 2 and AT.Act = R and AT.Qu > -4
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'blocking of files to read'] 
Show_if Sy1.An_f = 2 and AT.Act = W and AT.Qu > -4
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'blocking of files to write'] 
Show_if Sy1.An_f = 2 and AT.Qu = -6
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'decomposition of demand'] 
text	[280, 170,250,20,transparent,< 0 0 0 >, = ' on subdemands '] 
Show_if Sy1.An_f = 2 and AT.Qu = -7
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'servise of subdemands'] 

{Red elements}
 
Show_if Fi1.Red = On
bitmap [ 118, 221, hdd_r1, hdd_rm]
Show_if Fi2.Red = On
bitmap [ 352, 221, hdd_r1, hdd_rm]
Show_if Fi3.Red = On
bitmap [ 572, 221, hdd_r1, hdd_rm]
Show_if Fi4.Red = On
bitmap [ 118, 352, hdd_r1, hdd_rm]
Show_if Fi5.Red = On
bitmap [ 352, 352, hdd_r1, hdd_rm]
Show_if Fi6.Red = On
bitmap [ 572, 352, hdd_r1, hdd_rm]

{Green elements} 

Show_if Fi1.Green = On
bitmap [ 118, 221, hdd_g1, hdd_rm]
Show_if Fi2.Green = On
bitmap [ 352, 221, hdd_g1, hdd_rm]
Show_if Fi3.Green = On
bitmap [ 572, 221, hdd_g1, hdd_rm]
Show_if Fi4.Green = On
bitmap [ 118, 352, hdd_g1, hdd_rm]
Show_if Fi5.Green = On
bitmap [ 352, 352, hdd_g1, hdd_rm]
Show_if Fi6.Green = On
bitmap [ 572, 352, hdd_g1, hdd_rm]

{Arrows}

Show_if Fi1.AccV > 0
bitmap [ 132, 203, out_ar1, out_arm] 
Show_if Fi2.AccV > 0
bitmap [ 355, 203, out_ar1, out_arm] 
Show_if Fi3.AccV > 0
bitmap [ 582, 203, out_ar1, out_arm] 
Show_if Fi4.AccV > 0
bitmap [ 135, 335, out_ar1, out_arm] 
Show_if Fi5.AccV > 0
bitmap [ 358, 335, out_ar1, out_arm] 
Show_if Fi6.AccV > 0
bitmap [ 585, 335, out_ar1, out_arm]

Show_if Fi1.AccV < 0
bitmap [ 132, 203, in_ar1, in_arm] 
Show_if Fi2.AccV < 0
bitmap [ 355, 203, in_ar1, in_arm] 
Show_if Fi3.AccV < 0
bitmap [ 582, 203, in_ar1, in_arm] 
Show_if Fi4.AccV < 0
bitmap [ 135, 335, in_ar1, in_arm]
Show_if Fi5.AccV < 0
bitmap [ 358, 335, in_ar1, in_arm] 
Show_if Fi6.AccV < 0
bitmap [ 585, 335, in_ar1, in_arm]  
$End

$Frame  Shot_3
$Back_picture = gnd4_e

{Grey circles }

Show_if SQ1.Con = EX and AT.Qu = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_r, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.Num]
Show_if SQ2.Con = EX and AT.Qu = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_r, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.Num]
Show_if SQ3.Con = EX and AT.Qu = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_r, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.Num]
Show_if SQ4.Con = EX and AT.Qu = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_r, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.Num]
Show_if SQ5.Con = EX and AT.Qu = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_r, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.Num]
Show_if SQ6.Con = EX and AT.Qu = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_r, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.Num]
Show_if SQ7.Con = EX and AT.Qu = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_r, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.Num]
Show_if SQ8.Con = EX and AT.Qu = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_r, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.Num]
Show_if SQ9.Con = EX and AT.Qu = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_r, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.Num]
Show_if SQ10.Con = EX and AT.Qu = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_r, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.Num]

{Red circles }

Show_if SQ1.Con = PN and AT.Qu = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_n, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.Num]
Show_if SQ2.Con = PN and AT.Qu = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_n, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.Num]
Show_if SQ3.Con = PN and AT.Qu = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_n, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.Num]
Show_if SQ4.Con = PN and AT.Qu = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_n, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.Num]
Show_if SQ5.Con = PN and AT.Qu = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_n, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.Num]
Show_if SQ6.Con = PN and AT.Qu = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_n, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.Num]
Show_if SQ7.Con = PN and AT.Qu = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_n, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.Num]
Show_if SQ8.Con = PN and AT.Qu = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_n, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.Num]
Show_if SQ9.Con = PN and AT.Qu = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_n, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.Num]
Show_if SQ10.Con = PN and AT.Qu = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_n, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.Num]

{Green circles}

Show_if SQ1.Con = PS and AT.Qu = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_g, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.Num]
Show_if SQ2.Con = PS and AT.Qu = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_g, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.Num]
Show_if SQ3.Con = PS and AT.Qu = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_g, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.Num]
Show_if SQ4.Con = PS and AT.Qu = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_g, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.Num]
Show_if SQ5.Con = PS and AT.Qu = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_g, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.Num]
Show_if SQ6.Con = PS and AT.Qu = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_g, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.Num]
Show_if SQ7.Con = PS and AT.Qu = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_g, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.Num]
Show_if SQ8.Con = PS and AT.Qu = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_g, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.Num]
Show_if SQ9.Con = PS and AT.Qu = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_g, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.Num]
Show_if SQ10.Con = PS and AT.Qu = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_g, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.Num]

{Blue circles }

Show_if SQ1.Con = PE and AT.Qu = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_f, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.Num]
Show_if SQ2.Con = PE and AT.Qu = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_f, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.Num]
Show_if SQ3.Con = PE and AT.Qu = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_f, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.Num]
Show_if SQ4.Con = PE and AT.Qu = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_f, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.Num]
Show_if SQ5.Con = PE and AT.Qu = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_f, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.Num]
Show_if SQ6.Con = PE and AT.Qu = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_f, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.Num]
Show_if SQ7.Con = PE and AT.Qu = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_f, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.Num]
Show_if SQ8.Con = PE and AT.Qu = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_f, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.Num]
Show_if SQ9.Con = PE and AT.Qu = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_f, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.Num]
Show_if SQ10.Con = PE and AT.Qu = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_f, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.Num]

{ Arrows }

Show_if SQ1.Con <> Off and Gr_table(SQ1.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_ar, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.Num, AT.Kin)]

Show_if SQ2.Con <> Off and Gr_table(SQ2.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_ar, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.Num, AT.Kin)]

Show_if SQ3.Con <> Off and Gr_table( SQ3.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_ar, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.Num, AT.Kin)]

Show_if SQ4.Con <> Off and Gr_table( SQ4.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_ar, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.Num, AT.Kin)]

Show_if SQ5.Con <> Off and Gr_table( SQ5.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_ar, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.Num, AT.Kin)]

Show_if SQ6.Con <> Off and Gr_table( SQ6.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_ar, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.Num, AT.Kin)]

Show_if SQ7.Con <> Off and Gr_table( SQ7.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_ar, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.Num, AT.Kin)]

Show_if SQ8.Con <> Off and Gr_table( SQ8.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_ar, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.Num, AT.Kin)]

Show_if SQ9.Con <> Off and Gr_table( SQ9.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_ar, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.Num, AT.Kin)]

Show_if SQ10.Con <> Off and Gr_table( SQ10.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_ar, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.Num, AT.Kin)]

{ Computers }

Show_if SQ1.Con <> Off and Sq_table(SQ1.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ1.X_c + 100,SQ1.Y_c - 10, comp1, comp1m]
Show_if SQ2.Con <> Off and Sq_table(SQ2.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ2.X_c + 100,SQ2.Y_c - 10, comp1, comp1m]
text [SQ2.X_c + 105,SQ2.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ2.Num, AT.Kin)]
Show_if SQ3.Con <> Off and Sq_table(SQ3.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ3.X_c + 100,SQ3.Y_c - 10, comp1, comp1m]
text [SQ3.X_c + 105,SQ3.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ3.Num, AT.Kin)]
Show_if SQ4.Con <> Off and Sq_table(SQ4.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ4.X_c + 100,SQ4.Y_c - 10, comp1, comp1m]
text [SQ4.X_c + 105,SQ4.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ4.Num, AT.Kin)]
Show_if SQ5.Con <> Off and Sq_table(SQ5.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ5.X_c + 100,SQ5.Y_c - 10, comp1, comp1m]
text [SQ5.X_c + 105,SQ5.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ5.Num, AT.Kin)]
Show_if SQ6.Con <> Off and Sq_table(SQ6.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ6.X_c + 100,SQ6.Y_c - 10, comp1, comp1m]
text [SQ6.X_c + 105,SQ6.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ6.Num, AT.Kin)]
Show_if SQ7.Con <> Off and Sq_table(SQ7.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ7.X_c + 100,SQ7.Y_c - 10, comp1, comp1m]
text [SQ7.X_c + 105,SQ7.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ7.Num, AT.Kin)]
Show_if SQ8.Con <> Off and Sq_table(SQ8.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ8.X_c + 100,SQ8.Y_c - 10, comp1, comp1m]
text [SQ8.X_c + 105,SQ8.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ8.Num, AT.Kin)]
Show_if SQ9.Con <> Off and Sq_table(SQ9.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ9.X_c + 100,SQ9.Y_c - 10, comp1, comp1m]
text [SQ9.X_c + 105,SQ9.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ9.Num, AT.Kin)]
Show_if SQ10.Con <> Off and Sq_table(SQ10.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ10.X_c + 100,SQ10.Y_c - 10, comp1, comp1m]
text [SQ10.X_c + 105,SQ10.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ10.Num, AT.Kin)]

{........}

Show_if SQ1.Con <> Off and Sq_table(SQ1.Num, AT.Kin) = -1 and AT.Qu = -7
bitmap [SQ1.X_c + 100,SQ1.Y_c - 10, comp2, comp2m]
text [SQ1.X_c + 105,SQ1.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ1.Num, AT.Kin))]
text [SQ1.X_c + 105,SQ1.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ1.Num, AT.Kin)]

Show_if SQ2.Con <> Off and Sq_table(SQ2.Num, AT.Kin) = -1 and AT.Qu = -7
bitmap [SQ2.X_c + 100,SQ2.Y_c - 10, comp2, comp2m]
text [SQ2.X_c + 105,SQ2.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ2.Num, AT.Kin))]
text [SQ2.X_c + 105,SQ2.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ2.Num, AT.Kin)]

Show_if SQ3.Con <> Off and Sq_table(SQ3.Num, AT.Kin) = -1 and AT.Qu = -7
bitmap [SQ3.X_c + 100,SQ3.Y_c - 10, comp2, comp2m]
text [SQ3.X_c + 105,SQ3.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ3.Num, AT.Kin))]
text [SQ3.X_c + 105,SQ3.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ3.Num, AT.Kin)]

Show_if SQ4.Con <> Off and Sq_table(SQ4.Num, AT.Kin) = -1 and AT.Qu = -7
bitmap [SQ4.X_c + 100,SQ4.Y_c - 10, comp2, comp2m]
text [SQ4.X_c + 105,SQ4.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ4.Num, AT.Kin))]
text [SQ4.X_c + 105,SQ4.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ4.Num, AT.Kin)]

Show_if SQ5.Con <> Off and Sq_table(SQ5.Num, AT.Kin) = -1 and AT.Qu = -7
bitmap [SQ5.X_c + 100,SQ5.Y_c - 10, comp2, comp2m]
text [SQ5.X_c + 105,SQ5.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ5.Num, AT.Kin))]
text [SQ5.X_c + 105,SQ5.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ5.Num, AT.Kin)]

Show_if SQ6.Con <> Off and Sq_table(SQ6.Num, AT.Kin) = -1 and AT.Qu = -7
bitmap [SQ6.X_c + 100,SQ6.Y_c - 10, comp2, comp2m]
text [SQ6.X_c + 105,SQ6.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ6.Num, AT.Kin))]
text [SQ6.X_c + 105,SQ6.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ6.Num, AT.Kin)]

Show_if SQ7.Con <> Off and Sq_table(SQ7.Num, AT.Kin) = -1 and AT.Qu = -7
bitmap [SQ7.X_c + 100,SQ7.Y_c - 10, comp2, comp2m]
text [SQ7.X_c + 105,SQ7.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ7.Num, AT.Kin))]
text [SQ7.X_c + 105,SQ7.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ7.Num, AT.Kin)]

Show_if SQ8.Con <> Off and Sq_table(SQ8.Num, AT.Kin) = -1 and AT.Qu = -7
bitmap [SQ8.X_c + 100,SQ8.Y_c - 10, comp2, comp2m]
text [SQ8.X_c + 105,SQ8.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ8.Num, AT.Kin))]
text [SQ8.X_c + 105,SQ8.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ8.Num, AT.Kin)]

{ Red arrows }

Show_if SQ1.Arr = MN and Gr_table(SQ1.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_arr, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.Num, AT.Kin)]

Show_if SQ2.Arr = MN and Gr_table(SQ2.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_arr, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.Num, AT.Kin)]

Show_if SQ3.Arr = MN and Gr_table( SQ3.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_arr, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.Num, AT.Kin)]

Show_if SQ4.Arr = MN and Gr_table( SQ4.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_arr, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.Num, AT.Kin)]

Show_if SQ5.Arr = MN and Gr_table( SQ5.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_arr, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.Num, AT.Kin)]

Show_if SQ6.Arr = MN and Gr_table( SQ6.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_arr, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.Num, AT.Kin)]

Show_if SQ7.Arr = MN and Gr_table( SQ7.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_arr, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.Num, AT.Kin)]

Show_if SQ8.Arr = MN and Gr_table( SQ8.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_arr, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.Num, AT.Kin)]

Show_if SQ9.Arr = MN and Gr_table( SQ9.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_arr, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.Num, AT.Kin)]

Show_if SQ10.Arr = MN and Gr_table( SQ10.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_arr, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.Num, AT.Kin)]

{ Green arrows }

Show_if SQ1.Arr = MS and Gr_table(SQ1.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_arg, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.Num, AT.Kin)]

Show_if SQ2.Arr = MS and Gr_table(SQ2.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_arg, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.Num, AT.Kin)]

Show_if SQ3.Arr = MS and Gr_table( SQ3.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_arg, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.Num, AT.Kin)]

Show_if SQ4.Arr = MS and Gr_table( SQ4.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_arg, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.Num, AT.Kin)]

Show_if SQ5.Arr = MS and Gr_table( SQ5.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_arg, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.Num, AT.Kin)]

Show_if SQ6.Arr = MS and Gr_table( SQ6.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_arg, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.Num, AT.Kin)]

Show_if SQ7.Arr = MS and Gr_table( SQ7.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_arg, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.Num, AT.Kin)]

Show_if SQ8.Arr = MS and Gr_table( SQ8.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_arg, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.Num, AT.Kin)]

Show_if SQ9.Arr = MS and Gr_table( SQ9.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_arg, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.Num, AT.Kin)]

Show_if SQ10.Arr = MS and Gr_table( SQ10.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_arg, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.Num, AT.Kin)]

{ Blue arrows }

Show_if SQ1.Arr = ME and Gr_table(SQ1.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_arb, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.Num, AT.Kin)]

Show_if SQ2.Arr = ME and Gr_table(SQ2.Num, AT.Kin) <> -1 and AT.Qu = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_arb, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.Num, AT.Kin)]

Show_if SQ3.Arr = ME and Gr_table( SQ3.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_arb, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.Num, AT.Kin)]

Show_if SQ4.Arr = ME and Gr_table( SQ4.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_arb, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.Num, AT.Kin)]

Show_if SQ5.Arr = ME and Gr_table( SQ5.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_arb, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.Num, AT.Kin)]

Show_if SQ6.Arr = ME and Gr_table( SQ6.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_arb, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.Num, AT.Kin)]

Show_if SQ7.Arr = ME and Gr_table( SQ7.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_arb, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.Num, AT.Kin)]

Show_if SQ8.Arr = ME and Gr_table( SQ8.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_arb, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.Num, AT.Kin)]

Show_if SQ9.Arr = ME and Gr_table( SQ9.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_arb, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.Num, AT.Kin)]

Show_if SQ10.Arr = ME and Gr_table( SQ10.Num, AT.Kin ) <> -1 and AT.Qu = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_arb, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.Num, AT.Kin)]
$End
