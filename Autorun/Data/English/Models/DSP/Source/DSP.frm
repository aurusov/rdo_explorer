$Frame Movement
$Back_picture = uch_f3_e
Show_if Robot_1.Condition = Free or Robot_1.Condition = Movement_fr or Robot_1.Condition = Is_loaded
 bitmap [Robot_1.X_coor, Robot_1.Y_coor, rob, rob_m]
Show_if Robot_1.Condition = Is_load or Robot_1.Condition = Movement_load or Robot_1.Condition = Unloads
 bitmap [Robot_1.X_coor, Robot_1.Y_coor, robdsp, rob_m]

Show_if Robot_2.Condition = Free or Robot_2.Condition = Movement_fr or Robot_2.Condition = Is_loaded
 bitmap [Robot_2.X_coor, Robot_2.Y_coor, rob, rob_m]
Show_if Robot_2.Condition = Is_load or Robot_2.Condition = Movement_load or Robot_2.Condition = Unloads
 bitmap [Robot_2.X_coor, Robot_2.Y_coor, robdsp, rob_m]

Show_if Robot_3.Condition = Free or Robot_3.Condition = Movement_fr or Robot_3.Condition = Is_loaded
 bitmap [Robot_3.X_coor, Robot_3.Y_coor, rob, rob_m]
Show_if Robot_3.Condition = Is_load or Robot_3.Condition = Movement_load or Robot_3.Condition = Unloads
 bitmap [Robot_3.X_coor, Robot_3.Y_coor, robdsp, rob_m]

Show
 bitmap [90, 100, line1, line1_m]

Show_if Conveyor.Condition = Is_load or Conveyor.Condition = Movement_load or Conveyor.Condition = Unloads
 bitmap [Conveyor.X_coor, Conveyor.Y_coor, p_dsp, p_dsp_m]

Show
 bitmap [130, 279, line1, line1_m]
 text	[155,79,100,29,transparent,< 255 255 255 >, = Line_1.Condition]
 text	[155,69,100,29,transparent,< 255 255 255 >, = Line_1.Quan_storages]

 text	[205,253,100,29,transparent,< 255 255 255 >, = Line_2.Condition]
 text	[205,243,100,29,transparent,< 255 255 255 >, = Line_2.Quan_storages]

 text	[360,405,100,29,transparent,< 255 255 255 >, = Line_31.Condition]
 text	[360,395,100,29,transparent,< 255 255 255 >, = Line_31.Quan_storages]

 text	[177,405,100,29,transparent,< 255 255 255 >, = Line_32.Condition]
 text	[177,395,100,29,transparent,< 255 255 255 >, = Line_32.Quan_storages]


 text	[100,79,50,29,transparent,< 0 0 255 >, < Line_1.Number_det]
 text	[155,253,50,29,transparent,< 0 0 255 >, < Line_2.Number_det]
 text	[285,405,50,29,transparent,< 0 0 255 >, < Line_31.Number_det]
 text	[82,405,50,29,transparent,< 0 0 255 >, < Line_32.Number_det]

 text	[130,79,50,29,transparent,< 0 0 0 >, < Line_1.Number_article]
 text	[185,253,50,29,transparent,< 0 0 0 >, < Line_2.Number_article]

 text	[540,Rolgang_1.Y_coor + 25,100,29,transparent,< 255 255 255 >, < 9 - Rolgang_1.Freely]
 text	[570,Rolgang_1.Y_coor + 25,100,29,transparent,< 0 0 0 >, < Rolgang_1.Number_article]
 text	[590,Rolgang_1.Y_coor + 25,100,29,transparent,< 255 255 255 >, < Rolgang_1.Stand_number_of_product]
 text	[540,Rolgang_3.Y_coor + 25,100,29,transparent,< 255 255 255 >, < 9 - Rolgang_3.Freely]
 text	[570,Rolgang_3.Y_coor + 25,100,29,transparent,< 0 0 0 >, < Rolgang_3.Number_article]
 text	[590,Rolgang_3.Y_coor + 25,100,29,transparent,< 255 255 255 >, < Rolgang_3.Stand_number_of_product]
 text	[540,Rolgang_4.Y_coor + 25,100,29,transparent,< 255 255 255 >, < 9 - Rolgang_4.Freely]
 text	[570,Rolgang_4.Y_coor + 25,100,29,transparent,< 0 0 0 >, < Rolgang_4.Number_article]
 text	[590,Rolgang_4.Y_coor + 25,100,29,transparent,< 255 255 255 >, < Rolgang_4.Stand_number_of_product]
 text	[540,Rolgang_5.Y_coor + 25,100,29,transparent,< 255 255 255 >, < 9 - Rolgang_5.Freely]
 text	[570,Rolgang_5.Y_coor + 25,100,29,transparent,< 0 0 0 >, < Rolgang_5.Number_article]
 text	[590,Rolgang_5.Y_coor + 25,100,29,transparent,< 255 255 255 >, < Rolgang_5.Stand_number_of_product]
 text	[540,Rolgang_7.Y_coor + 25,100,29,transparent,< 255 255 255 >, < 9 - Rolgang_7.Freely]
 text	[570,Rolgang_7.Y_coor + 25,100,29,transparent,< 0 0 0 >, < Rolgang_7.Number_article]
 text	[590,Rolgang_7.Y_coor + 25,100,29,transparent,< 255 255 255 >, < Rolgang_7.Stand_number_of_product]
 text	[540,Rolgang_8.Y_coor + 25,100,29,transparent,< 255 255 255 >, < 9 - Rolgang_8.Freely]
 text	[570,Rolgang_8.Y_coor + 25,100,29,transparent,< 0 0 0 >, < Rolgang_8.Number_article]
 text	[590,Rolgang_8.Y_coor + 25,100,29,transparent,< 255 255 255 >, < Rolgang_8.Stand_number_of_product]
 text	[540,Rolgang_9.Y_coor + 25,100,29,transparent,< 255 255 255 >, < 9 - Rolgang_9.Freely]
 text	[570,Rolgang_9.Y_coor + 25,100,29,transparent,< 0 0 0 >, < Rolgang_9.Number_article]
 text	[590,Rolgang_9.Y_coor + 25,100,29,transparent,< 255 255 255 >, < Rolgang_9.Stand_number_of_product]
 text	[540,Rolgang_10.Y_coor + 25,100,29,transparent,< 255 255 255 >, < 9 - Rolgang_10.Freely]
 text	[570,Rolgang_10.Y_coor + 25,100,29,transparent,< 0 0 0 >, < Rolgang_10.Number_article]
 text	[590,Rolgang_10.Y_coor + 25,100,29,transparent,< 255 255 255 >, < Rolgang_10.Stand_number_of_product]


Show_if Robot_1.Where = Rolgangin {or Robot_1.Condition = Is_loaded }
 bitmap [13,220, p_dsp, p_dsp_m]

Show_if Line_1.Have_det = Yes and Line_1.Condition = Arrange 
 bitmap [88,105, p_dsp, p_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Arrange 
 bitmap [88,285, p_dsp, p_dsp_m]

Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 1 and Line_1.Counter <= 120 ]
 bitmap [90,105, p_dsp, p_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and Line_2.Counter < 120 
 bitmap [88,285, p_dsp, p_dsp_m]

Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and Line_1.Counter > 14 and Line_1.Exit = Passage
 bitmap [450,175, p_dsp, p_dsp_m]
Show_if Line_2.Condition = Busy and Line_2.Counter > 14 and [Line_2.Have_det = Yes or Robot_2.Condition = Movement_fr] and Line_2.Exit = Passage
 bitmap [493,355, p_dsp, p_dsp_m]


Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 2 and Line_1.Counter <= Line_1.Quan_storages * 2 + 1 and (Line_1.Counter / 2) * 2 <> Line_1.Counter]
 bitmap [120,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 3 and Line_1.Counter <= Line_1.Quan_storages * 2 + 2 and (Line_1.Counter / 2) * 2 = Line_1.Counter]
 bitmap [150,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 4 and Line_1.Counter <= Line_1.Quan_storages * 2 + 3 and (Line_1.Counter / 2) * 2 <> Line_1.Counter]
 bitmap [180,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 5 and Line_1.Counter <= Line_1.Quan_storages * 2 + 4 and (Line_1.Counter / 2) * 2 = Line_1.Counter]
 bitmap [210,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 6 and Line_1.Counter <= Line_1.Quan_storages * 2 + 5 and (Line_1.Counter / 2) * 2 <> Line_1.Counter]
 bitmap [240,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 7 and Line_1.Counter <= Line_1.Quan_storages * 2 + 6 and (Line_1.Counter / 2) * 2 = Line_1.Counter]
 bitmap [270,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 8 and Line_1.Counter <= Line_1.Quan_storages * 2 + 7 and (Line_1.Counter / 2) * 2 <> Line_1.Counter]
 bitmap [300,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 9 and Line_1.Counter <= Line_1.Quan_storages * 2 + 8 and (Line_1.Counter / 2) * 2 = Line_1.Counter]
 bitmap [330,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 10 and Line_1.Counter <= Line_1.Quan_storages * 2 + 9 and (Line_1.Counter / 2) * 2 <> Line_1.Counter]
 bitmap [360,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 11 and Line_1.Counter <= Line_1.Quan_storages * 2 + 10 and (Line_1.Counter / 2) * 2 = Line_1.Counter]
 bitmap [390,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 12 and Line_1.Counter <= Line_1.Quan_storages * 2 + 11 and (Line_1.Counter / 2) * 2 <> Line_1.Counter]
 bitmap [420,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and [Line_1.Counter >= 13 and Line_1.Counter <= Line_1.Quan_storages * 2 + 12 and (Line_1.Counter / 2) * 2 = Line_1.Counter]
 bitmap [450,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and Line_1.Exit = Passage and [Line_1.Counter >= 14 and Line_1.Counter <= Line_1.Quan_storages * 2 + 13 and (Line_1.Counter / 2) * 2 <> Line_1.Counter]
 bitmap [450,140, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and Line_1.Exit = Endd and [Line_1.Counter >= 14 and Line_1.Counter <= Line_1.Quan_storages * 2 + 13 and (Line_1.Counter / 2) * 2 <> Line_1.Counter]
 bitmap [480,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and Line_1.Exit = Endd and [Line_1.Counter >= 15 and Line_1.Counter <= Line_1.Quan_storages * 2 + 14 and (Line_1.Counter / 2) * 2 = Line_1.Counter]
 bitmap [510,105, o_dsp, o_dsp_m]
Show_if Line_1.Have_det = Yes and Line_1.Condition = Busy and Line_1.Exit = Endd and [Line_1.Counter >= 16 and Line_1.Counter <= Line_1.Quan_storages * 2 + 15 and (Line_1.Counter / 2) * 2 <> Line_1.Counter]
 bitmap [540,105, o_dsp, o_dsp_m]

Show_if Line_1.Condition = Busy and Line_1.Counter >= 17 and [Line_1.Have_det = Yes or Robot_3.Condition = Movement_fr] and Line_1.Exit = Endd or Robot_3.Where = Rolgang2
 bitmap [590,105, p_dsp, p_dsp_m]

Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 1 and Line_2.Counter <= Line_2.Quan_storages * 2  and (Line_2.Counter / 2) * 2 = Line_2.Counter]
 bitmap [130,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 2 and Line_2.Counter <= Line_2.Quan_storages * 2 + 1 and (Line_2.Counter / 2) * 2 <> Line_2.Counter]
 bitmap [160,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 3 and Line_2.Counter <= Line_2.Quan_storages * 2 + 2 and (Line_2.Counter / 2) * 2 = Line_2.Counter]
 bitmap [190,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 4 and Line_2.Counter <= Line_2.Quan_storages * 2 + 3 and (Line_2.Counter / 2) * 2 <> Line_2.Counter]
 bitmap [220,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 5 and Line_2.Counter <= Line_2.Quan_storages * 2 + 4 and (Line_2.Counter / 2) * 2 = Line_2.Counter]
 bitmap [250,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 6 and Line_2.Counter <= Line_2.Quan_storages * 2 + 5 and (Line_2.Counter / 2) * 2 <> Line_2.Counter]
 bitmap [280,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 7 and Line_2.Counter <= Line_2.Quan_storages * 2 + 6 and (Line_2.Counter / 2) * 2 = Line_2.Counter]
 bitmap [310,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 8 and Line_2.Counter <= Line_2.Quan_storages * 2 + 7 and (Line_2.Counter / 2) * 2 <> Line_2.Counter]
 bitmap [340,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 9 and Line_2.Counter <= Line_2.Quan_storages * 2 + 8 and (Line_2.Counter / 2) * 2 = Line_2.Counter]
 bitmap [370,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 10 and Line_2.Counter <= Line_2.Quan_storages * 2 + 9 and (Line_2.Counter / 2) * 2 <> Line_2.Counter]
 bitmap [400,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 11 and Line_2.Counter <= Line_2.Quan_storages * 2 + 10 and (Line_2.Counter / 2) * 2 = Line_2.Counter]
 bitmap [430,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 12 and Line_2.Counter <= Line_2.Quan_storages * 2 + 11 and (Line_2.Counter / 2) * 2 <> Line_2.Counter]
 bitmap [460,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and [Line_2.Counter >= 13 and Line_2.Counter <= Line_2.Quan_storages * 2 + 12 and (Line_2.Counter / 2) * 2 = Line_2.Counter]
 bitmap [490,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and Line_2.Exit = Passage and [Line_2.Counter >= 14 and Line_2.Counter <= Line_2.Quan_storages * 2 + 13 and (Line_2.Counter / 2) * 2 <> Line_2.Counter]
 bitmap [490,320, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and Line_2.Exit = Endd and [Line_2.Counter >= 14 and Line_2.Counter <= Line_2.Quan_storages * 2 + 13 and (Line_2.Counter / 2) * 2 <> Line_2.Counter]
 bitmap [520,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and Line_2.Exit = Endd and [Line_2.Counter >= 15 and Line_2.Counter <= Line_2.Quan_storages * 2 + 14 and (Line_2.Counter / 2) * 2 = Line_2.Counter]
 bitmap [550,285, o_dsp, o_dsp_m]
Show_if Line_2.Have_det = Yes and Line_2.Condition = Busy and Line_2.Exit = Endd and [Line_2.Counter >= 16 and Line_2.Counter <= Line_2.Quan_storages * 2 + 15 and (Line_2.Counter / 2) * 2 <> Line_2.Counter]
 bitmap [580,285, o_dsp, o_dsp_m]

Show_if Line_2.Condition = Busy and Line_2.Counter >= 17 and [Line_2.Have_det = Yes or Robot_2.Condition = Movement_fr] and Line_2.Exit = Endd or Robot_3.Where = Rolgang6
 bitmap [630,285, p_dsp, p_dsp_m]


Show_if [Line_31.Have_det = Yes or Line_32.Have_det = Yes] and [Line_31.Condition = Arrange or Line_32.Condition = Arrange]
 bitmap [450,435, p_dsp, p_dsp_m]

Show_if Line_31.Have_det = Yes and Line_31.Condition = Busy and Line_31.Counter < Line_31.Quan_storages * 2 - 2 {15}
 bitmap [400,435, p_dsp, p_dsp_m]

Show_if Line_31.Have_det = Yes and Line_31.Condition = Busy and Line_31.Counter < Line_31.Quan_storages * 2 + 1 {133} and Line_31.Counter > 1 and (Line_31.Counter / 2) * 2 <> Line_31.Counter
 bitmap [360,435, o_dsp, o_dsp_m]
Show_if Line_31.Have_det = Yes and Line_31.Condition = Busy and Line_31.Counter < Line_31.Quan_storages * 2 {133} and Line_31.Counter > 2 and (Line_31.Counter / 2) * 2 = Line_31.Counter
 bitmap [320,435, o_dsp, o_dsp_m]
Show_if Line_31.Have_det = Yes and Line_31.Condition = Busy and Line_31.Counter < Line_31.Quan_storages * 2 + 1 {133} and Line_31.Counter > 3 and (Line_31.Counter / 2) * 2 <> Line_31.Counter
 bitmap [280,435, o_dsp, o_dsp_m]

Show_if Line_31.Have_det = Yes and Line_31.Condition = Busy and Line_31.Counter < Line_31.Quan_storages * 2 + 4 {133} and Line_31.Counter > 4 {15}
 bitmap [235,415, p_dsp, p_dsp_m]
Show_if Line_31.Have_det = Yes and Line_31.Condition = Busy and Line_31.Counter > Line_31.Quan_storages * 2 + 4 and Line_31.Counter < Line_31.Quan_storages * 2 + 11
 bitmap [130,415, p_dsp, p_dsp_m]

Show_if Line_31.Condition = Busy and Line_31.Counter >= Line_31.Quan_storages * 2 + 13 and Line_31.Have_det = Yes
 bitmap [75,415, p_dsp, p_dsp_m]
Show_if Robot_1.Condition = Movement_fr and Robot_1.Where = Line31
 bitmap [75,415, p_dsp, p_dsp_m]

Show_if Line_32.Have_det = Yes and Line_32.Condition = Busy and Line_32.Counter < 5
 bitmap [400,415, p_dsp, p_dsp_m]
Show_if Line_32.Have_det = Yes and Line_32.Condition = Busy and Line_32.Counter < 15
 bitmap [320,415, p_dsp, p_dsp_m]
Show_if Line_32.Have_det = Yes and Line_32.Condition = Busy and Line_32.Counter < Line_32.Quan_storages * 2 + 13 and Line_32.Counter > 15
 bitmap [210,435, p_dsp, p_dsp_m]

Show_if Line_32.Have_det = Yes and Line_32.Condition = Busy and Line_32.Counter < Line_32.Quan_storages * 2 + 14 and Line_32.Counter > 16 and (Line_32.Counter / 2) * 2 <> Line_32.Counter
 bitmap [170,435, o_dsp, o_dsp_m]
Show_if Line_32.Have_det = Yes and Line_32.Condition = Busy and Line_32.Counter < Line_32.Quan_storages * 2 + 15 and Line_32.Counter > 17 and (Line_32.Counter / 2) * 2 = Line_32.Counter
 bitmap [130,435, o_dsp, o_dsp_m]
Show_if Line_32.Have_det = Yes and Line_32.Condition = Busy and Line_32.Counter < Line_32.Quan_storages * 2 + 16 and Line_32.Counter > 18 and (Line_32.Counter / 2) * 2 <> Line_32.Counter
 bitmap [100,435, o_dsp, o_dsp_m]

Show_if Line_32.Condition = Busy and Line_32.Counter >= 19 and Line_32.Have_det = Yes
 bitmap [75,435, p_dsp, p_dsp_m]

Show_if Robot_1.Condition = Movement_fr and Robot_1.Where = Line32
 bitmap [75,435, p_dsp, p_dsp_m] 




Show_if Rolgang_1.Freely < 9
 bitmap [530, Rolgang_1.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_1.Freely < 8
 bitmap [551, Rolgang_1.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_1.Freely < 7
 bitmap [572, Rolgang_1.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_1.Freely < 6
 bitmap [593, Rolgang_1.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_1.Freely < 5
 bitmap [614, Rolgang_1.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_1.Freely < 4
 bitmap [635, Rolgang_1.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_1.Freely < 3
 bitmap [656, Rolgang_1.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_1.Freely < 2
 bitmap [677, Rolgang_1.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_1.Freely < 1
 bitmap [698, Rolgang_1.Y_coor, p_dsp, p_dsp_m] 

Show_if Rolgang_3.Freely < 9
 bitmap [530, Rolgang_3.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_3.Freely < 8
 bitmap [551, Rolgang_3.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_3.Freely < 7
 bitmap [572, Rolgang_3.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_3.Freely < 6
 bitmap [593, Rolgang_3.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_3.Freely < 5
 bitmap [614, Rolgang_3.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_3.Freely < 4
 bitmap [635, Rolgang_3.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_3.Freely < 3
 bitmap [656, Rolgang_3.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_3.Freely < 2
 bitmap [677, Rolgang_3.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_3.Freely < 1
 bitmap [698, Rolgang_3.Y_coor, p_dsp, p_dsp_m] 

Show_if Rolgang_4.Freely < 9
 bitmap [530, Rolgang_4.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_4.Freely < 8
 bitmap [551, Rolgang_4.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_4.Freely < 7
 bitmap [572, Rolgang_4.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_4.Freely < 6
 bitmap [593, Rolgang_4.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_4.Freely < 5
 bitmap [614, Rolgang_4.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_4.Freely < 4
 bitmap [635, Rolgang_4.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_4.Freely < 3
 bitmap [656, Rolgang_4.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_4.Freely < 2
 bitmap [677, Rolgang_4.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_4.Freely < 1
 bitmap [698, Rolgang_4.Y_coor, p_dsp, p_dsp_m] 

Show_if Rolgang_5.Freely < 9
 bitmap [530, Rolgang_5.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_5.Freely < 8
 bitmap [551, Rolgang_5.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_5.Freely < 7
 bitmap [572, Rolgang_5.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_5.Freely < 6
 bitmap [593, Rolgang_5.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_5.Freely < 5
 bitmap [614, Rolgang_5.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_5.Freely < 4
 bitmap [635, Rolgang_5.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_5.Freely < 3
 bitmap [656, Rolgang_5.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_5.Freely < 2
 bitmap [677, Rolgang_5.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_5.Freely < 1
 bitmap [698, Rolgang_5.Y_coor, p_dsp, p_dsp_m] 

Show_if Rolgang_7.Freely < 9
 bitmap [530, Rolgang_7.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_7.Freely < 8
 bitmap [551, Rolgang_7.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_7.Freely < 7
 bitmap [572, Rolgang_7.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_7.Freely < 6
 bitmap [593, Rolgang_7.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_7.Freely < 5
 bitmap [614, Rolgang_7.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_7.Freely < 4
 bitmap [635, Rolgang_7.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_7.Freely < 3
 bitmap [656, Rolgang_7.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_7.Freely < 2
 bitmap [677, Rolgang_7.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_7.Freely < 1
 bitmap [698, Rolgang_7.Y_coor, p_dsp, p_dsp_m] 

Show_if Rolgang_8.Freely < 9
 bitmap [530, Rolgang_8.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_8.Freely < 8
 bitmap [551, Rolgang_8.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_8.Freely < 7
 bitmap [572, Rolgang_8.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_8.Freely < 6
 bitmap [593, Rolgang_8.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_8.Freely < 5
 bitmap [614, Rolgang_8.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_8.Freely < 4
 bitmap [635, Rolgang_8.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_8.Freely < 3
 bitmap [656, Rolgang_8.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_8.Freely < 2
 bitmap [677, Rolgang_8.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_8.Freely < 1
 bitmap [698, Rolgang_8.Y_coor, p_dsp, p_dsp_m] 

Show_if Rolgang_9.Freely < 9
 bitmap [530, Rolgang_9.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_9.Freely < 8
 bitmap [551, Rolgang_9.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_9.Freely < 7
 bitmap [572, Rolgang_9.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_9.Freely < 6
 bitmap [593, Rolgang_9.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_9.Freely < 5
 bitmap [614, Rolgang_9.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_9.Freely < 4
 bitmap [635, Rolgang_9.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_9.Freely < 3
 bitmap [656, Rolgang_9.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_9.Freely < 2
 bitmap [677, Rolgang_9.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_9.Freely < 1
 bitmap [698, Rolgang_9.Y_coor, p_dsp, p_dsp_m] 

Show_if Rolgang_10.Freely < 9
 bitmap [530, Rolgang_10.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_10.Freely < 8
 bitmap [551, Rolgang_10.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_10.Freely < 7
 bitmap [572, Rolgang_10.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_10.Freely < 6
 bitmap [593, Rolgang_10.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_10.Freely < 5
 bitmap [614, Rolgang_10.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_10.Freely < 4
 bitmap [635, Rolgang_10.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_10.Freely < 3
 bitmap [656, Rolgang_10.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_10.Freely < 2
 bitmap [677, Rolgang_10.Y_coor, p_dsp, p_dsp_m] 
Show_if Rolgang_10.Freely < 1
 bitmap [698, Rolgang_10.Y_coor, p_dsp, p_dsp_m] 




$End

$Frame Equipment
$Back_picture = < 127 127 127 > 780 500
 Show
 text	[0,5,640,20,transparent,< 255 255 0 >, =' Condition of the equipment of a sell ']

 rect	[5,25,595,95,transparent,< 0 0 0 >]
 rect	[6,26,593,93,transparent,< 0 0 0 >]
 rect	[75,25,98,95,transparent,< 0 0 0 >]
 rect	[258,25,103,95,transparent,< 0 0 0 >]
 rect	[473,25,58,95,transparent,< 0 0 0 >]
 line	[5,50,600,50,< 0 0 0 >]

 text	[10,30,65,20,transparent,< 0 0 0 >, < 'Line']
 text	[10,50,65,20,transparent,< 0 0 0 >, < 'Line_1']
 text	[10,65,65,20,transparent,< 0 0 0 >, < 'Line_2']
 text	[10,80,65,20,transparent,< 0 0 0 >, < 'Line_31']
 text	[10,95,65,20,transparent,< 0 0 0 >, < 'Line_32']

 text	[80,30,90,20,transparent,< 0 0 0 >, = 'Condition']
 text	[80,50,90,20,transparent,< 255 255 255 >, = Line_1.Condition]
 text	[80,65,90,20,transparent,< 255 255 255 >, = Line_2.Condition]
 text	[80,80,90,20,transparent,< 255 255 255 >, = Line_31.Condition]
 text	[80,95,90,20,transparent,< 255 255 255 >, = Line_32.Condition]

 text	[175,30,80,20,transparent,< 0 0 0 >, = 'Have detail']
 text	[175,50,80,20,transparent,< 255 255 255 >, = Line_1.Have_det]
 text	[175,65,80,20,transparent,< 255 255 255 >, = Line_2.Have_det]
 text	[175,80,80,20,transparent,< 255 255 255 >, = Line_31.Have_det]
 text	[175,95,80,20,transparent,< 255 255 255 >, = Line_32.Have_det]


 text	[260,30,100,20,transparent,< 0 0 0 >, = 'N of detail']
 text	[260,50,100,20,transparent,< 255 255 255 >, = Line_1.Number_det]
 text	[260,65,100,20,transparent,< 255 255 255 >, = Line_2.Number_det]
 text	[260,80,100,20,transparent,< 255 255 255 >, = Line_31.Number_det]
 text	[260,95,100,20,transparent,< 255 255 255 >, = Line_32.Number_det]

 text	[365,30,105,20,transparent,< 0 0 0 >, = 'N of product']
 text	[365,50,105,20,transparent,< 255 255 255 >, = Line_1.Number_article]
 text	[365,65,105,20,transparent,< 255 255 255 >, = Line_2.Number_article]
 text	[365,80,105,20,transparent,< 255 255 255 >, = Line_31.Number_article]
 text	[365,95,105,20,transparent,< 255 255 255 >, = Line_32.Number_article]

 text	[470,30,60,20,transparent,< 0 0 0 >, = 'Color']
 text	[470,50,60,20,transparent,< 255 255 255 >, = Line_1.Color]
 text	[470,65,60,20,transparent,< 255 255 255 >, = Line_2.Color]
 text	[470,80,60,20,transparent,< 255 255 255 >, = Line_31.Color]
 text	[470,95,60,20,transparent,< 255 255 255 >, = Line_32.Color]

 text	[535,30,60,20,transparent,< 0 0 0 >, = 'Exit']
 text	[535,50,60,20,transparent,< 255 255 255 >, = Line_1.Exit]
 text	[535,65,60,20,transparent,< 255 255 255 >, = Line_2.Exit]
 text	[535,80,60,20,transparent,< 255 255 255 >, = Line_31.Exit]
 text	[535,95,60,20,transparent,< 255 255 255 >, = Line_32.Exit]

{Robots}
 rect	[5,125,430,95,transparent,< 0 0 0 >]
 rect	[6,126,428,93,transparent,< 0 0 0 >]
 rect	[105,125,110,95,transparent,< 0 0 0 >]
 rect	[325,125,110,95,transparent,< 0 0 0 >]
 line	[5,150,435,150,< 0 0 0 >]

 text	[10,130,100,20,transparent,< 0 0 0 >, < 'Robot']
 text	[10,150,100,20,transparent,< 0 0 0 >, < 'Robot_1']
 text	[10,165,100,20,transparent,< 0 0 0 >, < 'Robot_2']
 text	[10,180,100,20,transparent,< 0 0 0 >, < 'Robot_3']
 text	[10,195,100,20,transparent,< 0 0 0 >, < 'Conveyor']

 text	[110,130,100,20,transparent,< 0 0 0 >, = 'Condition']
 text	[110,150,100,20,transparent,< 255 255 255 >, = Robot_1.Condition]
 text	[110,165,100,20,transparent,< 255 255 255 >, = Robot_2.Condition]
 text	[110,180,100,20,transparent,< 255 255 255 >, = Robot_3.Condition]
 text	[110,195,100,20,transparent,< 255 255 255 >, = Conveyor.Condition]

 text	[220,130,100,20,transparent,< 0 0 0 >, = 'Position']
 text	[220,150,100,20,transparent,< 255 255 255 >, = Robot_1.Position]
 text	[220,165,100,20,transparent,< 255 255 255 >, = Robot_2.Position]
 text	[220,180,100,20,transparent,< 255 255 255 >, = Robot_3.Position]
 text	[220,195,100,20,transparent,< 255 255 255 >, = '-----'] 

 text	[330,130,100,20,transparent,< 0 0 0 >, = 'Where to pass']
 text	[330,150,100,20,transparent,< 255 255 255 >, = Robot_1.Where]
 text	[330,165,100,20,transparent,< 255 255 255 >, = Robot_2.Where]
 text	[330,180,100,20,transparent,< 255 255 255 >, = Robot_3.Where]
 text	[330,195,100,20,transparent,< 255 255 255 >, = '-----']

{Rolgangs}
 rect	[5,225,535,155,transparent,< 0 0 0 >]
 rect	[6,226,533,153,transparent,< 0 0 0 >]
 rect	[105,225,110,155,transparent,< 0 0 0 >]
 rect	[330,225,113,155,transparent,< 0 0 0 >]
 line	[5,250,540,250,< 0 0 0 >]

 text	[10,230,100,20,transparent,< 0 0 0 >, < 'Rolgang']
 text	[10,250,100,20,transparent,< 0 0 0 >, < 'Rolgang_1']
 text	[10,265,100,20,transparent,< 0 0 0 >, < 'Rolgang_3']
 text	[10,280,100,20,transparent,< 0 0 0 >, < 'Rolgang_4']
 text	[10,295,100,20,transparent,< 0 0 0 >, < 'Rolgang_5']
 text	[10,310,100,20,transparent,< 0 0 0 >, < 'Rolgang_7']
 text	[10,325,100,20,transparent,< 0 0 0 >, < 'Rolgang_8']
 text	[10,340,100,20,transparent,< 0 0 0 >, < 'Rolgang_9']
 text	[10,355,100,20,transparent,< 0 0 0 >, < 'Rolgang_10']

 text	[110,230,100,20,transparent,< 0 0 0 >, = 'N product']
 text	[110,250,100,20,transparent,< 255 255 255 >, = Rolgang_1.Number_article]
 text	[110,265,100,20,transparent,< 255 255 255 >, = Rolgang_3.Number_article]
 text	[110,280,100,20,transparent,< 255 255 255 >, = Rolgang_4.Number_article]
 text	[110,295,100,20,transparent,< 255 255 255 >, = Rolgang_5.Number_article]
 text	[110,310,100,20,transparent,< 255 255 255 >, = Rolgang_7.Number_article]
 text	[110,325,100,20,transparent,< 255 255 255 >, = Rolgang_8.Number_article]
 text	[110,340,100,20,transparent,< 255 255 255 >, = Rolgang_9.Number_article]
 text	[110,355,100,20,transparent,< 255 255 255 >, = Rolgang_10.Number_article]

 text	[220,230,105,20,transparent,< 0 0 0 >, = 'N under stand']
 text	[220,250,105,20,transparent,< 255 255 255 >, = Rolgang_1.Stand_number_of_product]
 text	[220,265,105,20,transparent,< 255 255 255 >, = Rolgang_3.Stand_number_of_product]
 text	[220,280,105,20,transparent,< 255 255 255 >, = Rolgang_4.Stand_number_of_product]
 text	[220,295,105,20,transparent,< 255 255 255 >, = Rolgang_5.Stand_number_of_product]
 text	[220,310,105,20,transparent,< 255 255 255 >, = Rolgang_7.Stand_number_of_product]
 text	[220,325,105,20,transparent,< 255 255 255 >, = Rolgang_8.Stand_number_of_product]
 text	[220,340,105,20,transparent,< 255 255 255 >, = Rolgang_9.Stand_number_of_product]
 text	[220,355,105,20,transparent,< 255 255 255 >, = Rolgang_10.Stand_number_of_product]

 text	[335,230,105,20,transparent,< 0 0 0 >, = 'Ready of details']
 text	[335,250,105,20,transparent,< 255 255 255 >, = 9 - Rolgang_1.Freely]
 text	[335,265,105,20,transparent,< 255 255 255 >, = 9 - Rolgang_3.Freely]
 text	[335,280,105,20,transparent,< 255 255 255 >, = 9 - Rolgang_4.Freely]
 text	[335,295,105,20,transparent,< 255 255 255 >, = 9 - Rolgang_5.Freely]
 text	[335,310,105,20,transparent,< 255 255 255 >, = 9 - Rolgang_7.Freely]
 text	[335,325,105,20,transparent,< 255 255 255 >, = 9 - Rolgang_8.Freely]
 text	[335,340,105,20,transparent,< 255 255 255 >, = 9 - Rolgang_9.Freely]
 text	[335,355,105,20,transparent,< 255 255 255 >, = 9 - Rolgang_10.Freely]

 text	[440,230,100,20,transparent,< 0 0 0 >, = 'Complete_set']
 text	[440,250,100,20,transparent,< 255 255 255 >, = Rolgang_1.Complete_set]
 text	[440,265,100,20,transparent,< 255 255 255 >, = Rolgang_3.Complete_set]
 text	[440,280,100,20,transparent,< 255 255 255 >, = Rolgang_4.Complete_set]
 text	[440,295,100,20,transparent,< 255 255 255 >, = Rolgang_5.Complete_set]
 text	[440,310,100,20,transparent,< 255 255 255 >, = Rolgang_7.Complete_set]
 text	[440,325,100,20,transparent,< 255 255 255 >, = Rolgang_8.Complete_set]
 text	[440,340,100,20,transparent,< 255 255 255 >, = Rolgang_9.Complete_set]
 text	[440,355,100,20,transparent,< 255 255 255 >, = Rolgang_10.Complete_set]

$End

$Frame View_orders
$Back_picture = < 127 127 127 > 780 500
 Show
 text	[0,5,640,20,transparent,< 255 255 0 >, =' The information by the orders ']
 text	[10,30,100,20,transparent,< 0 0 0 >, = 'Order']
 text	[110,30,100,20,transparent,< 0 0 0 >, = 'Condition']
 text	[220,30,120,20,transparent,< 0 0 0 >, = 'Quntity of products']
 text	[340,30,100,20,transparent,< 0 0 0 >, = 'Manufactured']
 text	[450,30,110,20,transparent,< 0 0 0 >, = 'Planing time']


 text	[10,50,100,20,transparent,< 255 255 255 >, = 'Order_1']
 text	[110,50,100,20,transparent,< 255 255 255 >, = Order_1.Condition]
 text	[220,50,110,20,transparent,< 255 255 255 >, = Order_1.Quantity_goods]
 text	[340,50,100,20,transparent,< 255 255 255 >, = Order_1.Manufactured]
 text	[450,50,100,20,transparent,< 255 255 255 >, = Order_1.Time_plan]


Show_if Order_2.Condition <> Expect
 text	[10,65,100,20,transparent,< 255 255 255 >, = 'Order_2']
 text	[110,65,100,20,transparent,< 255 255 255 >, = Order_2.Condition]
 text	[220,65,110,20,transparent,< 255 255 255 >, = Order_2.Quantity_goods]
 text	[340,65,100,20,transparent,< 255 255 255 >, = Order_2.Manufactured]
 text	[450,65,100,20,transparent,< 255 255 255 >, = Order_2.Time_plan]

Show_if Order_3.Condition <> Expect
 text	[10,80,100,20,transparent,< 255 255 255 >, = 'Order_3']
 text	[110,80,100,20,transparent,< 255 255 255 >, = Order_3.Condition]
 text	[220,80,110,20,transparent,< 255 255 255 >, = Order_3.Quantity_goods]
 text	[340,80,100,20,transparent,< 255 255 255 >, = Order_3.Manufactured]
 text	[450,80,100,20,transparent,< 255 255 255 >, = Order_3.Time_plan]

Show_if Order_4.Condition <> Expect
 text	[10,95,100,20,transparent,< 255 255 255 >, = 'Order_4']
 text	[110,95,100,20,transparent,< 255 255 255 >, = Order_4.Condition]
 text	[220,95,110,20,transparent,< 255 255 255 >, = Order_4.Quantity_goods]
 text	[340,95,100,20,transparent,< 255 255 255 >, = Order_4.Manufactured]
 text	[450,95,100,20,transparent,< 255 255 255 >, = Order_4.Time_plan]

Show_if Order_5.Condition <> Expect
 text	[10,110,100,20,transparent,< 255 255 255 >, = 'Order_5']
 text	[110,110,100,20,transparent,< 255 255 255 >, = Order_5.Condition]
 text	[220,110,110,20,transparent,< 255 255 255 >, = Order_5.Quantity_goods]
 text	[340,110,100,20,transparent,< 255 255 255 >, = Order_5.Manufactured]
 text	[450,110,100,20,transparent,< 255 255 255 >, = Order_5.Time_plan]

Show_if Order_6.Condition <> Expect
 text	[10,125,100,20,transparent,< 255 255 255 >, = 'Order_6']
 text	[110,125,100,20,transparent,< 255 255 255 >, = Order_6.Condition]
 text	[220,125,110,20,transparent,< 255 255 255 >, = Order_6.Quantity_goods]
 text	[340,125,100,20,transparent,< 255 255 255 >, = Order_6.Manufactured]
 text	[450,125,100,20,transparent,< 255 255 255 >, = Order_6.Time_plan]

Show_if Order_7.Condition <> Expect
 text	[10,140,100,20,transparent,< 255 255 255 >, = 'Order_7']
 text	[110,140,100,20,transparent,< 255 255 255 >, = Order_7.Condition]
 text	[220,140,110,20,transparent,< 255 255 255 >, = Order_7.Quantity_goods]
 text	[340,140,100,20,transparent,< 255 255 255 >, = Order_7.Manufactured]
 text	[450,140,100,20,transparent,< 255 255 255 >, = Order_7.Time_plan]

Show_if Order_8.Condition <> Expect
 text	[10,155,100,20,transparent,< 255 255 255 >, = 'Order_8']
 text	[110,155,100,20,transparent,< 255 255 255 >, = Order_8.Condition]
 text	[220,155,110,20,transparent,< 255 255 255 >, = Order_8.Quantity_goods]
 text	[340,155,100,20,transparent,< 255 255 255 >, = Order_8.Manufactured]
 text	[450,155,100,20,transparent,< 255 255 255 >, = Order_8.Time_plan]

Show_if Order_9.Condition <> Expect
 text	[10,170,100,20,transparent,< 255 255 255 >, = 'Order_9']
 text	[110,170,100,20,transparent,< 255 255 255 >, = Order_9.Condition]
 text	[220,170,110,20,transparent,< 255 255 255 >, = Order_9.Quantity_goods]
 text	[340,170,100,20,transparent,< 255 255 255 >, = Order_9.Manufactured]
 text	[450,170,100,20,transparent,< 255 255 255 >, = Order_9.Time_plan]

Show_if Order_10.Condition <> Expect
 text	[10,185,100,20,transparent,< 255 255 255 >, = 'Order_10']
 text	[110,185,100,20,transparent,< 255 255 255 >, = Order_10.Condition]
 text	[220,185,110,20,transparent,< 255 255 255 >, = Order_10.Quantity_goods]
 text	[340,185,100,20,transparent,< 255 255 255 >, = Order_10.Manufactured]
 text	[450,185,100,20,transparent,< 255 255 255 >, = Order_10.Time_plan]

$End

