
$Frame  Кадр_1
$Back_picture = gnd3
{Show}
Show_if St1.Сост = F
text	[180, 1,250,15,transparent,< 0 0 0 >, = 'Станция свободна']
Show_if St1.Сост = P
text	[180, 1,250,15,transparent,< 0 0 0 >, = 'Станция обрабатывает']
text	[180, 16,250,15,transparent,< 0 0 0 >, = 'подзапрос']
Show_if St1.Сост = R
text	[180, 1,250,15,transparent,< 0 0 0 >, = 'Станция пересылает']
text	[180, 16,250,15,transparent,< 0 0 0 >, = 'подзапрос']
rect	[292,178,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St4.Сост = F
text	[180, 320,250,15,transparent,< 0 0 0 >, = 'Станция свободна']
Show_if St4.Сост = P
text	[180, 320,250,15,transparent,< 0 0 0 >, = 'Станция обрабатывает']
text	[180, 320 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
Show_if St4.Сост = R
text	[180, 320,250,15,transparent,< 0 0 0 >, = 'Станция пересылает']
text	[180, 320 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
rect	[291,276,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St6.Сост = F
text	[1, 64,250,15,transparent,< 0 0 0 >, = 'Станция свободна']
Show_if St6.Сост = P
text	[1, 64,250,15,transparent,< 0 0 0 >, = 'Станция обрабатывает']
text	[1, 64 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
Show_if St6.Сост = R
text	[1, 64,250,15,transparent,< 0 0 0 >, = 'Станция пересылает']
text	[1, 64 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
rect	[205,203,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St2.Сост = F
text	[361, 65,250,15,transparent,< 0 0 0 >, = 'Станция свободна']
Show_if St2.Сост = P
text	[361, 65,250,15,transparent,< 0 0 0 >, = 'Станция обрабатывает']
text	[361, 65 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
Show_if St2.Сост = R
text	[361, 65,250,15,transparent,< 0 0 0 >, = 'Станция пересылает']
text	[361, 65 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
rect	[373,203,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St5.Сост = F
text	[1, 238,250,15,transparent,< 0 0 0 >, = 'Станция свободна']
Show_if St5.Сост = P
text	[1, 238,250,15,transparent,< 0 0 0 >, = 'Станция обрабатывает']
text	[1, 238 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
Show_if St5.Сост = R
text	[1, 238,250,15,transparent,< 0 0 0 >, = 'Станция пересылает']
text	[1, 238 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
rect	[205,247,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St3.Сост = F
text	[359, 241,250,15,transparent,< 0 0 0 >, = 'Станция свободна']
Show_if St3.Сост = P
text	[359, 241,250,15,transparent,< 0 0 0 >, = 'Станция обрабатывает']
text	[359, 241 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
Show_if St3.Сост = R
text	[359, 241,250,15,transparent,< 0 0 0 >, = 'Станция пересылает']
text	[359, 241 + 15,250,15,transparent,< 0 0 0 >, = 'подзапрос']
rect	[375,250,23,14,< 255 0  0 >,< 0   64  128 >]
$End


$Frame  Кадр_2
$Back_picture = gnd2_r

{Таблица}

Show_if Sy1.An_f = 2
text	[280, 50,250,20,transparent,< 0 0 0 >, = AT.Время_появления]
text	[280, 85,250,20,transparent,< 0 0 0 >, = AT.Приоритет] 
text	[280, 115,250,20,transparent,< 0 0 0 >, = AT.Источник_запроса] 
Show_if Sy1.An_f = 2 and AT.Состояние = I and AT.Номер_очереди > 0
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'ожидание очереди обслуживания'] 
text	[280, 170,250,20,transparent,< 0 0 0 >, = 'порядковый №:'] 
text	[280, 170,220,20,transparent,< 0 0 0 >, > AT.Номер_очереди] 
Show_if Sy1.An_f = 2 and AT.Состояние = R and AT.Номер_очереди > -4
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'блокировки файлов на чтение'] 
Show_if Sy1.An_f = 2 and AT.Состояние = W and AT.Номер_очереди > -4
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'блокировки файлов на запись'] 
Show_if Sy1.An_f = 2 and AT.Номер_очереди = -6
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'декомпозиции запроса'] 
text	[280, 170,250,20,transparent,< 0 0 0 >, = ' на подзапросы '] 
Show_if Sy1.An_f = 2 and AT.Номер_очереди = -7
text	[280, 150,250,20,transparent,< 0 0 0 >, = 'обработки подзапросов'] 

{Красные бочки}
 
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

{Зелёные бочки} 

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

{Стрелки}

Show_if Fi1.Доступ > 0
bitmap [ 132, 203, out_ar1, out_arm] 
Show_if Fi2.Доступ > 0
bitmap [ 355, 203, out_ar1, out_arm] 
Show_if Fi3.Доступ > 0
bitmap [ 582, 203, out_ar1, out_arm] 
Show_if Fi4.Доступ > 0
bitmap [ 135, 335, out_ar1, out_arm] 
Show_if Fi5.Доступ > 0
bitmap [ 358, 335, out_ar1, out_arm] 
Show_if Fi6.Доступ > 0
bitmap [ 585, 335, out_ar1, out_arm]

Show_if Fi1.Доступ < 0
bitmap [ 132, 203, in_ar1, in_arm] 
Show_if Fi2.Доступ < 0
bitmap [ 355, 203, in_ar1, in_arm] 
Show_if Fi3.Доступ < 0
bitmap [ 582, 203, in_ar1, in_arm] 
Show_if Fi4.Доступ < 0
bitmap [ 135, 335, in_ar1, in_arm]
Show_if Fi5.Доступ < 0
bitmap [ 358, 335, in_ar1, in_arm] 
Show_if Fi6.Доступ < 0
bitmap [ 585, 335, in_ar1, in_arm] 
$End

$Frame  Кадр_3
$Back_picture = gnd4_r

{Серые круги }

Show_if SQ1.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_r, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.Номер]
Show_if SQ2.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_r, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.Номер]
Show_if SQ3.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_r, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.Номер]
Show_if SQ4.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_r, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.Номер]
Show_if SQ5.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_r, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.Номер]
Show_if SQ6.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_r, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.Номер]
Show_if SQ7.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_r, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.Номер]
Show_if SQ8.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_r, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.Номер]
Show_if SQ9.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_r, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.Номер]
Show_if SQ10.Сост = EX and AT.Номер_очереди = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_r, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.Номер]

{Красные круги }

Show_if SQ1.Сост = PN and AT.Номер_очереди= -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_n, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.Номер]
Show_if SQ2.Сост = PN and AT.Номер_очереди = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_n, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.Номер]
Show_if SQ3.Сост = PN and AT.Номер_очереди = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_n, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.Номер]
Show_if SQ4.Сост = PN and AT.Номер_очереди = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_n, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.Номер]
Show_if SQ5.Сост = PN and AT.Номер_очереди = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_n, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.Номер]
Show_if SQ6.Сост = PN and AT.Номер_очереди = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_n, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.Номер]
Show_if SQ7.Сост = PN and AT.Номер_очереди = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_n, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.Номер]
Show_if SQ8.Сост = PN and AT.Номер_очереди = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_n, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.Номер]
Show_if SQ9.Сост = PN and AT.Номер_очереди = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_n, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.Номер]
Show_if SQ10.Сост = PN and AT.Номер_очереди = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_n, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.Номер]

{Зеленые круги }

Show_if SQ1.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_g, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.Номер]
Show_if SQ2.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_g, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.Номер]
Show_if SQ3.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_g, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.Номер]
Show_if SQ4.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_g, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.Номер]
Show_if SQ5.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_g, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.Номер]
Show_if SQ6.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_g, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.Номер]
Show_if SQ7.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_g, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.Номер]
Show_if SQ8.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_g, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.Номер]
Show_if SQ9.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_g, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.Номер]
Show_if SQ10.Сост = PS and AT.Номер_очереди = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_g, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.Номер]

{Синие круги }

Show_if SQ1.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_f, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.Номер]
Show_if SQ2.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_f, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.Номер]
Show_if SQ3.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_f, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.Номер]
Show_if SQ4.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_f, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.Номер]
Show_if SQ5.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_f, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.Номер]
Show_if SQ6.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_f, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.Номер]
Show_if SQ7.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_f, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.Номер]
Show_if SQ8.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_f, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.Номер]
Show_if SQ9.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_f, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.Номер]
Show_if SQ10.Сост = PE and AT.Номер_очереди = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_f, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.Номер]

{ Стрелки }

Show_if SQ1.Сост <> Off and Gr_table(SQ1.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_ar, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.Номер, AT.Тип)]

Show_if SQ2.Сост <> Off and Gr_table(SQ2.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_ar, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.Номер, AT.Тип)]

Show_if SQ3.Сост <> Off and Gr_table( SQ3.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_ar, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.Номер, AT.Тип)]

Show_if SQ4.Сост <> Off and Gr_table( SQ4.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_ar, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.Номер, AT.Тип)]

Show_if SQ5.Сост <> Off and Gr_table( SQ5.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_ar, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.Номер, AT.Тип)]

Show_if SQ6.Сост <> Off and Gr_table( SQ6.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_ar, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.Номер, AT.Тип)]

Show_if SQ7.Сост <> Off and Gr_table( SQ7.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_ar, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.Номер, AT.Тип)]

Show_if SQ8.Сост <> Off and Gr_table( SQ8.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_ar, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.Номер, AT.Тип)]

Show_if SQ9.Сост <> Off and Gr_table( SQ9.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_ar, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.Номер, AT.Тип)]

Show_if SQ10.Сост <> Off and Gr_table( SQ10.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_ar, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.Номер, AT.Тип)]

{ Компьютеры}

Show_if SQ1.Сост <> Off and Sq_table(SQ1.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ1.X_c + 100,SQ1.Y_c - 10, comp1, comp1m]
Show_if SQ2.Сост <> Off and Sq_table(SQ2.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ2.X_c + 100,SQ2.Y_c - 10, comp1, comp1m]
text [SQ2.X_c + 105,SQ2.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ2.Номер, AT.Тип)]
Show_if SQ3.Сост <> Off and Sq_table(SQ3.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ3.X_c + 100,SQ3.Y_c - 10, comp1, comp1m]
text [SQ3.X_c + 105,SQ3.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ3.Номер, AT.Тип)]
Show_if SQ4.Сост <> Off and Sq_table(SQ4.Номер, AT.Тип) <> -1 and AT.Номер_очереди= -7
bitmap [SQ4.X_c + 100,SQ4.Y_c - 10, comp1, comp1m]
text [SQ4.X_c + 105,SQ4.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ4.Номер, AT.Тип)]
Show_if SQ5.Сост <> Off and Sq_table(SQ5.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ5.X_c + 100,SQ5.Y_c - 10, comp1, comp1m]
text [SQ5.X_c + 105,SQ5.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ5.Номер, AT.Тип)]
Show_if SQ6.Сост <> Off and Sq_table(SQ6.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ6.X_c + 100,SQ6.Y_c - 10, comp1, comp1m]
text [SQ6.X_c + 105,SQ6.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ6.Номер, AT.Тип)]
Show_if SQ7.Сост <> Off and Sq_table(SQ7.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ7.X_c + 100,SQ7.Y_c - 10, comp1, comp1m]
text [SQ7.X_c + 105,SQ7.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ7.Номер, AT.Тип)]
Show_if SQ8.Сост <> Off and Sq_table(SQ8.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ8.X_c + 100,SQ8.Y_c - 10, comp1, comp1m]
text [SQ8.X_c + 105,SQ8.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ8.Номер, AT.Тип)]
Show_if SQ9.Сост <> Off and Sq_table(SQ9.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ9.X_c + 100,SQ9.Y_c - 10, comp1, comp1m]
text [SQ9.X_c + 105,SQ9.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ9.Номер, AT.Тип)]
Show_if SQ10.Сост <> Off and Sq_table(SQ10.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ10.X_c + 100,SQ10.Y_c - 10, comp1, comp1m]
text [SQ10.X_c + 105,SQ10.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ10.Номер, AT.Тип)]

{Фикция}

Show_if SQ1.Сост <> Off and Sq_table(SQ1.Номер, AT.Тип) = -1 and AT.Номер_очереди = -7
bitmap [SQ1.X_c + 100,SQ1.Y_c - 10, comp2, comp2m]
text [SQ1.X_c + 105,SQ1.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ1.Номер, AT.Тип))]
text [SQ1.X_c + 105,SQ1.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ1.Номер, AT.Тип)]

Show_if SQ2.Сост <> Off and Sq_table(SQ2.Номер, AT.Тип) = -1 and AT.Номер_очереди = -7
bitmap [SQ2.X_c + 100,SQ2.Y_c - 10, comp2, comp2m]
text [SQ2.X_c + 105,SQ2.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ2.Номер, AT.Тип))]
text [SQ2.X_c + 105,SQ2.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ2.Номер, AT.Тип)]

Show_if SQ3.Сост <> Off and Sq_table(SQ3.Номер, AT.Тип) = -1 and AT.Номер_очереди = -7
bitmap [SQ3.X_c + 100,SQ3.Y_c - 10, comp2, comp2m]
text [SQ3.X_c + 105,SQ3.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ3.Номер, AT.Тип))]
text [SQ3.X_c + 105,SQ3.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ3.Номер, AT.Тип)]

Show_if SQ4.Сост <> Off and Sq_table(SQ4.Номер, AT.Тип) = -1 and AT.Номер_очереди = -7
bitmap [SQ4.X_c + 100,SQ4.Y_c - 10, comp2, comp2m]
text [SQ4.X_c + 105,SQ4.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ4.Номер, AT.Тип))]
text [SQ4.X_c + 105,SQ4.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ4.Номер, AT.Тип)]

Show_if SQ5.Сост <> Off and Sq_table(SQ5.Номер, AT.Тип) = -1 and AT.Номер_очереди = -7
bitmap [SQ5.X_c + 100,SQ5.Y_c - 10, comp2, comp2m]
text [SQ5.X_c + 105,SQ5.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ5.Номер, AT.Тип))]
text [SQ5.X_c + 105,SQ5.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ5.Номер, AT.Тип)]

Show_if SQ6.Сост <> Off and Sq_table(SQ6.Номер, AT.Тип) = -1 and AT.Номер_очереди = -7
bitmap [SQ6.X_c + 100,SQ6.Y_c - 10, comp2, comp2m]
text [SQ6.X_c + 105,SQ6.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ6.Номер, AT.Тип))]
text [SQ6.X_c + 105,SQ6.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ6.Номер, AT.Тип)]

Show_if SQ7.Сост <> Off and Sq_table(SQ7.Номер, AT.Тип) = -1 and AT.Номер_очереди = -7
bitmap [SQ7.X_c + 100,SQ7.Y_c - 10, comp2, comp2m]
text [SQ7.X_c + 105,SQ7.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ7.Номер, AT.Тип))]
text [SQ7.X_c + 105,SQ7.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ7.Номер, AT.Тип)]

Show_if SQ8.Сост <> Off and Sq_table(SQ8.Номер, AT.Тип) = -1 and AT.Номер_очереди = -7
bitmap [SQ8.X_c + 100,SQ8.Y_c - 10, comp2, comp2m]
text [SQ8.X_c + 105,SQ8.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ8.Номер, AT.Тип))]
text [SQ8.X_c + 105,SQ8.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ8.Номер, AT.Тип)]

{ Красные стрелки }

Show_if SQ1.Arr = MN and Gr_table(SQ1.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_arr, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.Номер, AT.Тип)]

Show_if SQ2.Arr = MN and Gr_table(SQ2.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_arr, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.Номер, AT.Тип)]

Show_if SQ3.Arr = MN and Gr_table( SQ3.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_arr, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.Номер, AT.Тип)]

Show_if SQ4.Arr = MN and Gr_table( SQ4.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_arr, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.Номер, AT.Тип)]

Show_if SQ5.Arr = MN and Gr_table( SQ5.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_arr, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.Номер
, AT.Тип)]

Show_if SQ6.Arr = MN and Gr_table( SQ6.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_arr, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.Номер, AT.Тип)]

Show_if SQ7.Arr = MN and Gr_table( SQ7.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_arr, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.Номер, AT.Тип)]

Show_if SQ8.Arr = MN and Gr_table( SQ8.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_arr, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.Номер, AT.Тип)]

Show_if SQ9.Arr = MN and Gr_table( SQ9.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_arr, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.Номер, AT.Тип)]

Show_if SQ10.Arr = MN and Gr_table( SQ10.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_arr, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.Номер, AT.Тип)]

{ Зеленые стрелки }

Show_if SQ1.Arr = MS and Gr_table(SQ1.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_arg, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.Номер, AT.Тип)]

Show_if SQ2.Arr = MS and Gr_table(SQ2.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_arg, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.Номер, AT.Тип)]

Show_if SQ3.Arr = MS and Gr_table( SQ3.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_arg, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.Номер, AT.Тип)]

Show_if SQ4.Arr = MS and Gr_table( SQ4.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_arg, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.Номер, AT.Тип)]

Show_if SQ5.Arr = MS and Gr_table( SQ5.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_arg, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.Номер, AT.Тип)]

Show_if SQ6.Arr = MS and Gr_table( SQ6.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_arg, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.Номер, AT.Тип)]

Show_if SQ7.Arr = MS and Gr_table( SQ7.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_arg, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.Номер, AT.Тип)]

Show_if SQ8.Arr = MS and Gr_table( SQ8.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_arg, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.Номер, AT.Тип)]

Show_if SQ9.Arr = MS and Gr_table( SQ9.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_arg, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.Номер, AT.Тип)]

Show_if SQ10.Arr = MS and Gr_table( SQ10.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_arg, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.Номер, AT.Тип)]

{ Синие стрелки }

Show_if SQ1.Arr = ME and Gr_table(SQ1.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_arb, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.Номер, AT.Тип)]

Show_if SQ2.Arr = ME and Gr_table(SQ2.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_arb, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.Номер, AT.Тип)]

Show_if SQ3.Arr = ME and Gr_table( SQ3.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_arb, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.Номер, AT.Тип)]

Show_if SQ4.Arr = ME and Gr_table( SQ4.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_arb, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.Номер, AT.Тип)]

Show_if SQ5.Arr = ME and Gr_table( SQ5.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_arb, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.Номер, AT.Тип)]

Show_if SQ6.Arr = ME and Gr_table( SQ6.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_arb, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.Номер, AT.Тип)]

Show_if SQ7.Arr = ME and Gr_table( SQ7.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_arb, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.Номер, AT.Тип)]

Show_if SQ8.Arr = ME and Gr_table( SQ8.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_arb, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.Номер, AT.Тип)]

Show_if SQ9.Arr = ME and Gr_table( SQ9.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_arb, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.Номер, AT.Тип)]

Show_if SQ10.Arr = ME and Gr_table( SQ10.Номер, AT.Тип) <> -1 and AT.Номер_очереди = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_arb, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.Номер, AT.Тип)]
$End
