$Frame Custom
$Back_picture = <255 255 255> custom
{Show rect [Robocar1.Target_X,Robocar1.Target_Y,9,4,<0 255 0>,<0 0 0>]

Show rect [Robocar2.Target_X,Robocar2.Target_Y,9,4,<0 255 0>,<0 0 0>]
Show rect [Robocar3.Target_X,Robocar3.Target_Y,9,4,<0 255 0>,<0 0 0>]}

Show_if   Robocar1.Usage = Empty
           bitmap [Robocar1.Current_X,Robocar1.Current_Y,
             r_e,r_l_mk]
Show_if   Robocar1.Usage = Load
           bitmap [Robocar1.Current_X,Robocar1.Current_Y,
              r_l,r_l_mk]
Show_if   Robocar2.Usage = Empty
           bitmap [Robocar2.Current_X,Robocar2.Current_Y,
             r_e,r_l_mk]
Show_if   Robocar2.Usage = Load
           bitmap [Robocar2.Current_X,Robocar2.Current_Y,
              r_l,r_l_mk]
Show_if   Robocar3.Usage = Empty
           bitmap [Robocar3.Current_X,Robocar3.Current_Y,
             r_e,r_l_mk]
Show_if   Robocar3.Usage = Load
           bitmap [Robocar3.Current_X,Robocar3.Current_Y,
              r_l,r_l_mk]
Show_if   Robocar_Upper.Usage = Empty
           bitmap [Robocar_Upper.Current_X,36,
             r_e,r_l_mk]
Show_if   Robocar_Upper.Usage = Load
           bitmap [Robocar_Upper.Current_X,36,
              r_l,r_l_mk]
Show_if   Robocar_Downer.Usage = Empty
           bitmap [Robocar_Downer.Current_X,452,
             r_e,r_l_mk]
Show_if   Robocar_Downer.Usage = Load
           bitmap [Robocar_Downer.Current_X,452,
              r_l,r_l_mk]
Show
text [715,35,50,20,<192 192 192>,<0 0 0>,S_In.How_Much]
text [80,420,50,20,<192 192 192>,<0 0 0>,Saver1_Add.How_Much]
text [300,420,50,20,<192 192 192>,<0 0 0>,Saver2_Add.How_Much]
text [526,420,50,20,<192 192 192>,<0 0 0>,Saver3_Add.How_Much]

text [259,475,50,20,<192 192 192>,<0 0 0>,S_Out_1.How_Much]
text [351,475,50,20,<192 192 192>,<0 0 0>,S_Out_2.How_Much]
text [442,475,50,20,<192 192 192>,<0 0 0>,S_Out_3.How_Much]

text [80,56,50,20,<192 192 192>,<0 0 0>,Saver1_Sub.How_Much]
text [300,56,50,20,<192 192 192>,<0 0 0>,Saver2_Sub.How_Much]
text [526,56,50,20,<192 192 192>,<0 0 0>,Saver3_Sub.How_Much]

text [16,220,50,20,<192 192 192>,<0 0 0>,S_1_A.How_Much]
text [240,220,50,20,<192 192 192>,<0 0 0>,S_2_A.How_Much]
text [465,220,50,20,<192 192 192>,<0 0 0>,S_3_A.How_Much]
$End
