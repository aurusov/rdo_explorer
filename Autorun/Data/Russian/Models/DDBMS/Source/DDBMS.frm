
$Frame  ����_1
$Back_picture = gnd3
{Show}
Show_if St1.���� = F
text	[180, 1,250,15,transparent,< 0 0 0 >, = '������� ��������']
Show_if St1.���� = P
text	[180, 1,250,15,transparent,< 0 0 0 >, = '������� ������������']
text	[180, 16,250,15,transparent,< 0 0 0 >, = '���������']
Show_if St1.���� = R
text	[180, 1,250,15,transparent,< 0 0 0 >, = '������� ����������']
text	[180, 16,250,15,transparent,< 0 0 0 >, = '���������']
rect	[292,178,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St4.���� = F
text	[180, 320,250,15,transparent,< 0 0 0 >, = '������� ��������']
Show_if St4.���� = P
text	[180, 320,250,15,transparent,< 0 0 0 >, = '������� ������������']
text	[180, 320 + 15,250,15,transparent,< 0 0 0 >, = '���������']
Show_if St4.���� = R
text	[180, 320,250,15,transparent,< 0 0 0 >, = '������� ����������']
text	[180, 320 + 15,250,15,transparent,< 0 0 0 >, = '���������']
rect	[291,276,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St6.���� = F
text	[1, 64,250,15,transparent,< 0 0 0 >, = '������� ��������']
Show_if St6.���� = P
text	[1, 64,250,15,transparent,< 0 0 0 >, = '������� ������������']
text	[1, 64 + 15,250,15,transparent,< 0 0 0 >, = '���������']
Show_if St6.���� = R
text	[1, 64,250,15,transparent,< 0 0 0 >, = '������� ����������']
text	[1, 64 + 15,250,15,transparent,< 0 0 0 >, = '���������']
rect	[205,203,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St2.���� = F
text	[361, 65,250,15,transparent,< 0 0 0 >, = '������� ��������']
Show_if St2.���� = P
text	[361, 65,250,15,transparent,< 0 0 0 >, = '������� ������������']
text	[361, 65 + 15,250,15,transparent,< 0 0 0 >, = '���������']
Show_if St2.���� = R
text	[361, 65,250,15,transparent,< 0 0 0 >, = '������� ����������']
text	[361, 65 + 15,250,15,transparent,< 0 0 0 >, = '���������']
rect	[373,203,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St5.���� = F
text	[1, 238,250,15,transparent,< 0 0 0 >, = '������� ��������']
Show_if St5.���� = P
text	[1, 238,250,15,transparent,< 0 0 0 >, = '������� ������������']
text	[1, 238 + 15,250,15,transparent,< 0 0 0 >, = '���������']
Show_if St5.���� = R
text	[1, 238,250,15,transparent,< 0 0 0 >, = '������� ����������']
text	[1, 238 + 15,250,15,transparent,< 0 0 0 >, = '���������']
rect	[205,247,23,14,< 255 0  0 >,< 0   64  128 >]

{Show}
Show_if St3.���� = F
text	[359, 241,250,15,transparent,< 0 0 0 >, = '������� ��������']
Show_if St3.���� = P
text	[359, 241,250,15,transparent,< 0 0 0 >, = '������� ������������']
text	[359, 241 + 15,250,15,transparent,< 0 0 0 >, = '���������']
Show_if St3.���� = R
text	[359, 241,250,15,transparent,< 0 0 0 >, = '������� ����������']
text	[359, 241 + 15,250,15,transparent,< 0 0 0 >, = '���������']
rect	[375,250,23,14,< 255 0  0 >,< 0   64  128 >]
$End


$Frame  ����_2
$Back_picture = gnd2_r

{�������}

Show_if Sy1.An_f = 2
text	[280, 50,250,20,transparent,< 0 0 0 >, = AT.�����_���������]
text	[280, 85,250,20,transparent,< 0 0 0 >, = AT.���������] 
text	[280, 115,250,20,transparent,< 0 0 0 >, = AT.��������_�������] 
Show_if Sy1.An_f = 2 and AT.��������� = I and AT.�����_������� > 0
text	[280, 150,250,20,transparent,< 0 0 0 >, = '�������� ������� ������������'] 
text	[280, 170,250,20,transparent,< 0 0 0 >, = '���������� �:'] 
text	[280, 170,220,20,transparent,< 0 0 0 >, > AT.�����_�������] 
Show_if Sy1.An_f = 2 and AT.��������� = R and AT.�����_������� > -4
text	[280, 150,250,20,transparent,< 0 0 0 >, = '���������� ������ �� ������'] 
Show_if Sy1.An_f = 2 and AT.��������� = W and AT.�����_������� > -4
text	[280, 150,250,20,transparent,< 0 0 0 >, = '���������� ������ �� ������'] 
Show_if Sy1.An_f = 2 and AT.�����_������� = -6
text	[280, 150,250,20,transparent,< 0 0 0 >, = '������������ �������'] 
text	[280, 170,250,20,transparent,< 0 0 0 >, = ' �� ���������� '] 
Show_if Sy1.An_f = 2 and AT.�����_������� = -7
text	[280, 150,250,20,transparent,< 0 0 0 >, = '��������� �����������'] 

{������� �����}
 
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

{������ �����} 

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

{�������}

Show_if Fi1.������ > 0
bitmap [ 132, 203, out_ar1, out_arm] 
Show_if Fi2.������ > 0
bitmap [ 355, 203, out_ar1, out_arm] 
Show_if Fi3.������ > 0
bitmap [ 582, 203, out_ar1, out_arm] 
Show_if Fi4.������ > 0
bitmap [ 135, 335, out_ar1, out_arm] 
Show_if Fi5.������ > 0
bitmap [ 358, 335, out_ar1, out_arm] 
Show_if Fi6.������ > 0
bitmap [ 585, 335, out_ar1, out_arm]

Show_if Fi1.������ < 0
bitmap [ 132, 203, in_ar1, in_arm] 
Show_if Fi2.������ < 0
bitmap [ 355, 203, in_ar1, in_arm] 
Show_if Fi3.������ < 0
bitmap [ 582, 203, in_ar1, in_arm] 
Show_if Fi4.������ < 0
bitmap [ 135, 335, in_ar1, in_arm]
Show_if Fi5.������ < 0
bitmap [ 358, 335, in_ar1, in_arm] 
Show_if Fi6.������ < 0
bitmap [ 585, 335, in_ar1, in_arm] 
$End

$Frame  ����_3
$Back_picture = gnd4_r

{����� ����� }

Show_if SQ1.���� = EX and AT.�����_������� = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_r, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.�����]
Show_if SQ2.���� = EX and AT.�����_������� = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_r, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.�����]
Show_if SQ3.���� = EX and AT.�����_������� = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_r, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.�����]
Show_if SQ4.���� = EX and AT.�����_������� = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_r, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.�����]
Show_if SQ5.���� = EX and AT.�����_������� = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_r, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.�����]
Show_if SQ6.���� = EX and AT.�����_������� = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_r, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.�����]
Show_if SQ7.���� = EX and AT.�����_������� = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_r, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.�����]
Show_if SQ8.���� = EX and AT.�����_������� = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_r, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.�����]
Show_if SQ9.���� = EX and AT.�����_������� = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_r, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.�����]
Show_if SQ10.���� = EX and AT.�����_������� = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_r, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.�����]

{������� ����� }

Show_if SQ1.���� = PN and AT.�����_�������= -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_n, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.�����]
Show_if SQ2.���� = PN and AT.�����_������� = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_n, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.�����]
Show_if SQ3.���� = PN and AT.�����_������� = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_n, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.�����]
Show_if SQ4.���� = PN and AT.�����_������� = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_n, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.�����]
Show_if SQ5.���� = PN and AT.�����_������� = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_n, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.�����]
Show_if SQ6.���� = PN and AT.�����_������� = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_n, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.�����]
Show_if SQ7.���� = PN and AT.�����_������� = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_n, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.�����]
Show_if SQ8.���� = PN and AT.�����_������� = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_n, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.�����]
Show_if SQ9.���� = PN and AT.�����_������� = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_n, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.�����]
Show_if SQ10.���� = PN and AT.�����_������� = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_n, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.�����]

{������� ����� }

Show_if SQ1.���� = PS and AT.�����_������� = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_g, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.�����]
Show_if SQ2.���� = PS and AT.�����_������� = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_g, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.�����]
Show_if SQ3.���� = PS and AT.�����_������� = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_g, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.�����]
Show_if SQ4.���� = PS and AT.�����_������� = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_g, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.�����]
Show_if SQ5.���� = PS and AT.�����_������� = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_g, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.�����]
Show_if SQ6.���� = PS and AT.�����_������� = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_g, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.�����]
Show_if SQ7.���� = PS and AT.�����_������� = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_g, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.�����]
Show_if SQ8.���� = PS and AT.�����_������� = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_g, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.�����]
Show_if SQ9.���� = PS and AT.�����_������� = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_g, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.�����]
Show_if SQ10.���� = PS and AT.�����_������� = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_g, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.�����]

{����� ����� }

Show_if SQ1.���� = PE and AT.�����_������� = -7
bitmap [SQ1.X_c,SQ1.Y_c, pz_f, pz_m]
text [SQ1.X_c + 37,SQ1.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ1.�����]
Show_if SQ2.���� = PE and AT.�����_������� = -7
bitmap [SQ2.X_c,SQ2.Y_c, pz_f, pz_m]
text [SQ2.X_c + 37,SQ2.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ2.�����]
Show_if SQ3.���� = PE and AT.�����_������� = -7
bitmap [SQ3.X_c,SQ3.Y_c, pz_f, pz_m]
text [SQ3.X_c + 37,SQ3.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ3.�����]
Show_if SQ4.���� = PE and AT.�����_������� = -7
bitmap [SQ4.X_c,SQ4.Y_c, pz_f, pz_m]
text [SQ4.X_c + 37,SQ4.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ4.�����]
Show_if SQ5.���� = PE and AT.�����_������� = -7
bitmap [SQ5.X_c,SQ5.Y_c, pz_f, pz_m]
text [SQ5.X_c + 37,SQ5.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ5.�����]
Show_if SQ6.���� = PE and AT.�����_������� = -7
bitmap [SQ6.X_c,SQ6.Y_c, pz_f, pz_m]
text [SQ6.X_c + 37,SQ6.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ6.�����]
Show_if SQ7.���� = PE and AT.�����_������� = -7
bitmap [SQ7.X_c,SQ7.Y_c, pz_f, pz_m]
text [SQ7.X_c + 37,SQ7.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ7.�����]
Show_if SQ8.���� = PE and AT.�����_������� = -7
bitmap [SQ8.X_c,SQ8.Y_c, pz_f, pz_m]
text [SQ8.X_c + 37,SQ8.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ8.�����]
Show_if SQ9.���� = PE and AT.�����_������� = -7
bitmap [SQ9.X_c,SQ9.Y_c, pz_f, pz_m]
text [SQ9.X_c + 37,SQ9.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ9.�����]
Show_if SQ10.���� = PE and AT.�����_������� = -7
bitmap [SQ10.X_c,SQ10.Y_c, pz_f, pz_m]
text [SQ10.X_c + 37,SQ10.Y_c + 20, 30, 20, transparent,< 0 0 0 >,= SQ10.�����]

{ ������� }

Show_if SQ1.���� <> Off and Gr_table(SQ1.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_ar, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.�����, AT.���)]

Show_if SQ2.���� <> Off and Gr_table(SQ2.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_ar, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.�����, AT.���)]

Show_if SQ3.���� <> Off and Gr_table( SQ3.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_ar, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.�����, AT.���)]

Show_if SQ4.���� <> Off and Gr_table( SQ4.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_ar, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.�����, AT.���)]

Show_if SQ5.���� <> Off and Gr_table( SQ5.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_ar, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.�����, AT.���)]

Show_if SQ6.���� <> Off and Gr_table( SQ6.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_ar, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.�����, AT.���)]

Show_if SQ7.���� <> Off and Gr_table( SQ7.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_ar, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.�����, AT.���)]

Show_if SQ8.���� <> Off and Gr_table( SQ8.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_ar, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.�����, AT.���)]

Show_if SQ9.���� <> Off and Gr_table( SQ9.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_ar, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.�����, AT.���)]

Show_if SQ10.���� <> Off and Gr_table( SQ10.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_ar, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.�����, AT.���)]

{ ����������}

Show_if SQ1.���� <> Off and Sq_table(SQ1.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ1.X_c + 100,SQ1.Y_c - 10, comp1, comp1m]
Show_if SQ2.���� <> Off and Sq_table(SQ2.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ2.X_c + 100,SQ2.Y_c - 10, comp1, comp1m]
text [SQ2.X_c + 105,SQ2.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ2.�����, AT.���)]
Show_if SQ3.���� <> Off and Sq_table(SQ3.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ3.X_c + 100,SQ3.Y_c - 10, comp1, comp1m]
text [SQ3.X_c + 105,SQ3.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ3.�����, AT.���)]
Show_if SQ4.���� <> Off and Sq_table(SQ4.�����, AT.���) <> -1 and AT.�����_�������= -7
bitmap [SQ4.X_c + 100,SQ4.Y_c - 10, comp1, comp1m]
text [SQ4.X_c + 105,SQ4.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ4.�����, AT.���)]
Show_if SQ5.���� <> Off and Sq_table(SQ5.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ5.X_c + 100,SQ5.Y_c - 10, comp1, comp1m]
text [SQ5.X_c + 105,SQ5.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ5.�����, AT.���)]
Show_if SQ6.���� <> Off and Sq_table(SQ6.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ6.X_c + 100,SQ6.Y_c - 10, comp1, comp1m]
text [SQ6.X_c + 105,SQ6.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ6.�����, AT.���)]
Show_if SQ7.���� <> Off and Sq_table(SQ7.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ7.X_c + 100,SQ7.Y_c - 10, comp1, comp1m]
text [SQ7.X_c + 105,SQ7.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ7.�����, AT.���)]
Show_if SQ8.���� <> Off and Sq_table(SQ8.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ8.X_c + 100,SQ8.Y_c - 10, comp1, comp1m]
text [SQ8.X_c + 105,SQ8.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ8.�����, AT.���)]
Show_if SQ9.���� <> Off and Sq_table(SQ9.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ9.X_c + 100,SQ9.Y_c - 10, comp1, comp1m]
text [SQ9.X_c + 105,SQ9.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ9.�����, AT.���)]
Show_if SQ10.���� <> Off and Sq_table(SQ10.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ10.X_c + 100,SQ10.Y_c - 10, comp1, comp1m]
text [SQ10.X_c + 105,SQ10.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= Sq_table(SQ10.�����, AT.���)]

{������}

Show_if SQ1.���� <> Off and Sq_table(SQ1.�����, AT.���) = -1 and AT.�����_������� = -7
bitmap [SQ1.X_c + 100,SQ1.Y_c - 10, comp2, comp2m]
text [SQ1.X_c + 105,SQ1.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ1.�����, AT.���))]
text [SQ1.X_c + 105,SQ1.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ1.�����, AT.���)]

Show_if SQ2.���� <> Off and Sq_table(SQ2.�����, AT.���) = -1 and AT.�����_������� = -7
bitmap [SQ2.X_c + 100,SQ2.Y_c - 10, comp2, comp2m]
text [SQ2.X_c + 105,SQ2.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ2.�����, AT.���))]
text [SQ2.X_c + 105,SQ2.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ2.�����, AT.���)]

Show_if SQ3.���� <> Off and Sq_table(SQ3.�����, AT.���) = -1 and AT.�����_������� = -7
bitmap [SQ3.X_c + 100,SQ3.Y_c - 10, comp2, comp2m]
text [SQ3.X_c + 105,SQ3.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ3.�����, AT.���))]
text [SQ3.X_c + 105,SQ3.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ3.�����, AT.���)]

Show_if SQ4.���� <> Off and Sq_table(SQ4.�����, AT.���) = -1 and AT.�����_������� = -7
bitmap [SQ4.X_c + 100,SQ4.Y_c - 10, comp2, comp2m]
text [SQ4.X_c + 105,SQ4.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ4.�����, AT.���))]
text [SQ4.X_c + 105,SQ4.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ4.�����, AT.���)]

Show_if SQ5.���� <> Off and Sq_table(SQ5.�����, AT.���) = -1 and AT.�����_������� = -7
bitmap [SQ5.X_c + 100,SQ5.Y_c - 10, comp2, comp2m]
text [SQ5.X_c + 105,SQ5.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ5.�����, AT.���))]
text [SQ5.X_c + 105,SQ5.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ5.�����, AT.���)]

Show_if SQ6.���� <> Off and Sq_table(SQ6.�����, AT.���) = -1 and AT.�����_������� = -7
bitmap [SQ6.X_c + 100,SQ6.Y_c - 10, comp2, comp2m]
text [SQ6.X_c + 105,SQ6.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ6.�����, AT.���))]
text [SQ6.X_c + 105,SQ6.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ6.�����, AT.���)]

Show_if SQ7.���� <> Off and Sq_table(SQ7.�����, AT.���) = -1 and AT.�����_������� = -7
bitmap [SQ7.X_c + 100,SQ7.Y_c - 10, comp2, comp2m]
text [SQ7.X_c + 105,SQ7.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ7.�����, AT.���))]
text [SQ7.X_c + 105,SQ7.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ7.�����, AT.���)]

Show_if SQ8.���� <> Off and Sq_table(SQ8.�����, AT.���) = -1 and AT.�����_������� = -7
bitmap [SQ8.X_c + 100,SQ8.Y_c - 10, comp2, comp2m]
text [SQ8.X_c + 105,SQ8.Y_c - 5, 30, 20, transparent,< 0 0 0 >,= FA_table (FF_table(SQ8.�����, AT.���))]
text [SQ8.X_c + 105,SQ8.Y_c + 28, 30, 20, transparent,< 0 0 0 >,= FF_table(SQ8.�����, AT.���)]

{ ������� ������� }

Show_if SQ1.Arr = MN and Gr_table(SQ1.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_arr, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.�����, AT.���)]

Show_if SQ2.Arr = MN and Gr_table(SQ2.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_arr, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.�����, AT.���)]

Show_if SQ3.Arr = MN and Gr_table( SQ3.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_arr, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.�����, AT.���)]

Show_if SQ4.Arr = MN and Gr_table( SQ4.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_arr, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.�����, AT.���)]

Show_if SQ5.Arr = MN and Gr_table( SQ5.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_arr, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.�����
, AT.���)]

Show_if SQ6.Arr = MN and Gr_table( SQ6.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_arr, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.�����, AT.���)]

Show_if SQ7.Arr = MN and Gr_table( SQ7.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_arr, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.�����, AT.���)]

Show_if SQ8.Arr = MN and Gr_table( SQ8.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_arr, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.�����, AT.���)]

Show_if SQ9.Arr = MN and Gr_table( SQ9.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_arr, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.�����, AT.���)]

Show_if SQ10.Arr = MN and Gr_table( SQ10.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_arr, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.�����, AT.���)]

{ ������� ������� }

Show_if SQ1.Arr = MS and Gr_table(SQ1.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_arg, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.�����, AT.���)]

Show_if SQ2.Arr = MS and Gr_table(SQ2.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_arg, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.�����, AT.���)]

Show_if SQ3.Arr = MS and Gr_table( SQ3.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_arg, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.�����, AT.���)]

Show_if SQ4.Arr = MS and Gr_table( SQ4.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_arg, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.�����, AT.���)]

Show_if SQ5.Arr = MS and Gr_table( SQ5.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_arg, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.�����, AT.���)]

Show_if SQ6.Arr = MS and Gr_table( SQ6.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_arg, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.�����, AT.���)]

Show_if SQ7.Arr = MS and Gr_table( SQ7.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_arg, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.�����, AT.���)]

Show_if SQ8.Arr = MS and Gr_table( SQ8.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_arg, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.�����, AT.���)]

Show_if SQ9.Arr = MS and Gr_table( SQ9.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_arg, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.�����, AT.���)]

Show_if SQ10.Arr = MS and Gr_table( SQ10.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_arg, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.�����, AT.���)]

{ ����� ������� }

Show_if SQ1.Arr = ME and Gr_table(SQ1.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ1.X_c + 34,SQ1.Y_c - 36, pz_arb, pz_arm]
text [SQ1.X_c + 37,SQ1.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table(SQ1.�����, AT.���)]

Show_if SQ2.Arr = ME and Gr_table(SQ2.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ2.X_c + 34,SQ2.Y_c - 36, pz_arb, pz_arm]
text [SQ2.X_c + 37,SQ2.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ2.�����, AT.���)]

Show_if SQ3.Arr = ME and Gr_table( SQ3.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ3.X_c + 34,SQ3.Y_c - 36, pz_arb, pz_arm]
text [SQ3.X_c + 37,SQ3.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ3.�����, AT.���)]

Show_if SQ4.Arr = ME and Gr_table( SQ4.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ4.X_c + 34,SQ4.Y_c - 36, pz_arb, pz_arm]
text [SQ4.X_c + 37,SQ4.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ4.�����, AT.���)]

Show_if SQ5.Arr = ME and Gr_table( SQ5.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ5.X_c + 34,SQ5.Y_c - 36, pz_arb, pz_arm]
text [SQ5.X_c + 37,SQ5.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ5.�����, AT.���)]

Show_if SQ6.Arr = ME and Gr_table( SQ6.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ6.X_c + 34,SQ6.Y_c - 36, pz_arb, pz_arm]
text [SQ6.X_c + 37,SQ6.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ6.�����, AT.���)]

Show_if SQ7.Arr = ME and Gr_table( SQ7.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ7.X_c + 34,SQ7.Y_c - 36, pz_arb, pz_arm]
text [SQ7.X_c + 37,SQ7.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ7.�����, AT.���)]

Show_if SQ8.Arr = ME and Gr_table( SQ8.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ8.X_c + 34,SQ8.Y_c - 36, pz_arb, pz_arm]
text [SQ8.X_c + 37,SQ8.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ8.�����, AT.���)]

Show_if SQ9.Arr = ME and Gr_table( SQ9.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ9.X_c + 34,SQ9.Y_c - 36, pz_arb, pz_arm]
text [SQ9.X_c + 37,SQ9.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ9.�����, AT.���)]

Show_if SQ10.Arr = ME and Gr_table( SQ10.�����, AT.���) <> -1 and AT.�����_������� = -7
bitmap [SQ10.X_c + 34,SQ10.Y_c - 36, pz_arb, pz_arm]
text [SQ10.X_c + 37,SQ10.Y_c - 20, 30, 20, transparent,< 0 0 0 >,= Gr_table( SQ10.�����, AT.���)]
$End
