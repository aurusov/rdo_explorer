$Constant
 Quantity_of_products : integer = 10
 Min_term : real = 4000.0
 Max_term : real = 9000.0
 a	  : real = 0.1
 b	  : real = 1.0
$End

$Sequence  Draw: real
$Type = uniform  7475094
$End

$Sequence  Plan : real
$Type = uniform  55667645
$End

$Sequence  Number_of_prod : integer
$Type = uniform  24657675
$End

$Sequence  Preparations : integer
$Type = uniform  124578469
$End

$Sequence  Type_of_color : integer
$Type = uniform  12345683
$End

$Function Details_in_prod : integer
$Type = table
$Parameters
 Number  : integer [1..6]
$Body
 9 8 4 6 6 6
$End

$Function Translation : integer
$Type = table
$Parameters
 Number  : such_as Robot.Where
$Body
 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 
$End

$Function Ret_translation : such_as Robot.Where 
$Type = table
$Parameters
 Number  : integer[1..16]
$Body
 {1 	2 	3 	4 	5 	   6 		7 	8 	  9 	    10	      11         12        13 	     14        	15 	16 }
Line1 Line2 Line31 Line32 Rolgangin Rolgang1 Rolgang2 Rolgang3 Rolgang4 Rolgang5 Rolgang6 Rolgang7 Rolgang8 Rolgang9 Rolgang10 Exit_prod
$End


$Function Stand_num : integer
$Type = table
$Parameters
 Кол    : integer [1..9]
 Number  : integer [1..6]
$Body
   1  2  3  4  5  6  6  7  7
   8  8  9  10 11 11 12 12 0
   8  8  12 12 0  0  0  0  0
   13 14 15 16 16 8  0  0  0
   17 18 19 20 21 22 0  0  0
   17 18 19 20 21 22 0  0  0
$End

$Function Tech_way : integer[1..6]
$Type = algorithmic
$Parameters
 Num_st_det  : integer [1..22]
$Body
 Calculate_if Num_st_det = 2 and Line_1.Condition = Free 
			Tech_way = 5
 Calculate_if Num_st_det = 2 and Line_2.Condition = Free 
			Tech_way = 6
 Calculate_if Num_st_det <> 2 and Line_1.Condition = Free and Line_31.Condition = Free 
			Tech_way = 1
 Calculate_if Num_st_det <> 2 and Line_1.Condition = Free and Line_32.Condition = Free 
			Tech_way = 2
 Calculate_if Num_st_det <> 2 and Line_2.Condition = Free and Line_31.Condition = Free 
			Tech_way = 3
 Calculate_if Num_st_det <> 2 and Line_2.Condition = Free and Line_32.Condition = Free 
			Tech_way = 4
$End

$Function Check_ways : integer[0..1] {such_as System.Lin_1}
$Type = algorithmic
$Parameters
 Stand_numb : integer [1..22]
$Body
 Calculate_if Stand_numb <> 2 and [Line_1.Condition = Free or Line_2.Condition = Free] and [Line_31.Condition = Free or Line_32.Condition = Free] 
              Check_ways = 1
 Calculate_if Stand_numb = 2 and [Line_1.Condition = Free or Line_2.Condition = Free] and Line_31.Condition = Free and Line_32.Condition = Free
              Check_ways = 1
 Calculate_if Stand_numb <> 2 and [Line_1.Condition <> Free and Line_2.Condition <> Free or Line_31.Condition <> Free and Line_32.Condition <> Free] 
              Check_ways = 0
 Calculate_if Stand_numb = 2 and Line_1.Condition <> Free and Line_2.Condition <> Free 
              Check_ways = 0
 Calculate_if Stand_numb = 2 and [Line_31.Condition <> Free or Line_32.Condition <> Free]
              Check_ways = 0
$End

$Function There_are_in_ways : integer 
$Type = algorithmic
$Parameters
 Ways   : integer [1..6]
 Number  : integer [1..4]
$Body
 Calculate_if Number = 1 and Ways = 1 There_are_in_ways = 1 
 Calculate_if Number = 2 and Ways = 1 There_are_in_ways = 0 
 Calculate_if Number = 3 and Ways = 1 There_are_in_ways = 1 
 Calculate_if Number = 4 and Ways = 1 There_are_in_ways = 0 
 Calculate_if Number = 1 and Ways = 2 There_are_in_ways = 1 
 Calculate_if Number = 2 and Ways = 2 There_are_in_ways = 0 
 Calculate_if Number = 3 and Ways = 2 There_are_in_ways = 0 
 Calculate_if Number = 4 and Ways = 2 There_are_in_ways = 1 
 Calculate_if Number = 1 and Ways = 3 There_are_in_ways = 0 
 Calculate_if Number = 2 and Ways = 3 There_are_in_ways = 1 
 Calculate_if Number = 3 and Ways = 3 There_are_in_ways = 1 
 Calculate_if Number = 4 and Ways = 3 There_are_in_ways = 0 
 Calculate_if Number = 1 and Ways = 4 There_are_in_ways = 0 
 Calculate_if Number = 2 and Ways = 4 There_are_in_ways = 1 
 Calculate_if Number = 3 and Ways = 4 There_are_in_ways = 0 
 Calculate_if Number = 4 and Ways = 4 There_are_in_ways = 1 
 Calculate_if Number = 1 and Ways = 5 There_are_in_ways = 1 
 Calculate_if Number = 2 and Ways = 5 There_are_in_ways = 0 
 Calculate_if Number = 3 and Ways = 5 There_are_in_ways = 1 
 Calculate_if Number = 4 and Ways = 5 There_are_in_ways = 1 
 Calculate_if Number = 1 and Ways = 6 There_are_in_ways = 0 
 Calculate_if Number = 2 and Ways = 6 There_are_in_ways = 1 
 Calculate_if Number = 3 and Ways = 6 There_are_in_ways = 1 
 Calculate_if Number = 4 and Ways = 6 There_are_in_ways = 1 
$End

$Function Where_to_pass : such_as Details.Next_place
$Type = table
$Parameters
 Place     : such_as Details.Place
 Way_of_det    : integer [1..6]
$Body
 {L1      L2      L31     L32     Rin    Rg1      Rg2        Rg3       Rg4       Rg5       Rg6       Rg7       Rg8       Rg9       Rg10      Exit}
  Line31 Line2  Line1  Line32 Line1 Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod 
  Line32 Line2  Line31 Line1  Line1 Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod 
  Line1  Line31 Line2  Line32 Line2 Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod 
  Line1  Line32 Line31 Line2  Line2 Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod 
  Line31 Line2  Line32 Line1  Line1 Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod 
  Line1  Line31 Line32 Line2  Line2 Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod Exit_prod 
$End
 
$Function Time_of_way : integer
$Type = table
$Parameters
 Whence_d    : such_as Robot.Position
 Where_d      : such_as Robot.Position
 Num         : such_as Robot.Number_robot
$Body
{1 robots}
	{L1 L2 L31 L32 Rin Rg1 Rg2 Rg3 Rg4 Rg5 Rg6 Rg7 Rg8 Rg9 Rg10 Exit}
{L1}	 0  0  65  65  22  9   0   9   18  27  36  45  54  63  72   9
{L2}	 0  0  27  27  13  45  36  27  18  9   0   9   18  27  36   45
{L31}	 65 27 0   0   0   0   0   0   0   0   0   0   0   0   0    0
{L32}	 65 27 12  0   43  0   0   0   0   0   0   0   0   0   0    0
{Rin}	 22 13 0   42  0   0   0   0   0   0   0   0   0   0   0    0 
{Rg1}	 9  45 0   0   0   0   9   18  27  36  45  54  63  72  81   0
{Rg2}	 0  36 0   0   0   9   0   9   18  27  36  45  54  63  72   9
{Rg3}	 9  27 0   0   0   18  9   0   9   18  27  36  45  54  63   18
{Rg4}	 18 18 0   0   0   27  18  9   0   9   18  27  36  45  54   27
{Rg5}	 27 9  0   0   0   36  27  18  9   0   9   18  27  36  45   36
{Rg6}	 36 0  0   0   0   45  36  27  18  9   0   9   18  27  36   45
{Rg7}	 45 9  0   0   0   54  45  36  27  18  9   0   9   18  27   54
{Rg8}	 54 18 0   0   0   63  54  45  36  27  18  9   0   9   18   63
{Rg9}	 63 27 0   0   0   72  63  54  45  36  27  18  9   0   9    72
{Rg10}	 72 36 0   0   0   81  72  63  54  45  36  27  18  9   0    81
{Exit}	 9  45 0   0   0   0   9   18  27  36  45  54  63  72  81   0
{2,3 robots}
	{L1 L2 L31 L32 Rin Rg1 Rg2 Rg3 Rg4 Rg5 Rg6 Rg7 Rg8 Rg9 Rg10 Exit}
{L1}	 0  0  63  66  22  9   0   9   18  27  36  45  54  63  72   9
{L2}	 0  0  10  10  13  45  36  27  18  9   0   9   18  27  36   45
{L31}	 45 10 0   0   0   0   0   0   0   0   0   0   0   0   0    0
{L32}	 45 10 12  0   43  0   0   0   0   0   0   0   0   0   0    0 
{Rin}	 22 13 0   42  0   0   0   0   0   0   0   0   0   0   0    0 
{Rg1}	 9  45 0   0   0   0   8   17  26  35  44  53  62  71  80   0
{Rg2}	 0  36 0   0   0   9   0   8   17  26  35  44  53  62  71   9
{Rg3}	 9  27 0   0   0   18  9   0   8   17  26  35  44  53  62   18
{Rg4}	 18 18 0   0   0   27  18  9   0   8   17  26  35  44  53   27
{Rg5}	 27 9  0   0   0   36  27  18  9   0   8   17  26  35  44   36
{Rg6}	 36 0  0   0   0   45  36  27  18  9   0   8   17  26  35   45
{Rg7}	 45 9  0   0   0   54  45  36  27  18  9   0   8   17  26   54
{Rg8}	 54 18 0   0   0   63  54  45  36  27  18  9   0   8   17   63
{Rg9}	 63 27 0   0   0   72  63  54  45  36  27  18  9   0   8    72
{Rg10} 72 36 0   0   0   81  72  63  54  45  36  27  18  9   0    81
{Exit}	 9  45 0   0   0   0   8   17  26  35  44  53  62  71  80   0
$End

$Function Length_ways : integer
$Type = table
$Parameters
 Whence_d    : such_as Robot.Position
 Where_d      : such_as Robot.Position
$Body
  0  0 -1 -1 -1  1  0 -1 -1 -1 -1 -1 -1 -1 -1  1
  0  0 -1 -1  1  1  1  1  1  1  0 -1 -1 -1 -1  1
  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0
  1  1 -1  0  1  0  0  0  0  0  0  0  0  0  0  0
  1 -1  0 -1  0  0  0  0  0  0  0  0  0  0  0  0 
 -1 -1  0  0  0  0 -1 -1 -1 -1 -1 -1 -1 -1 -1  0
  0 -1  0  0  0  1  0 -1 -1 -1 -1 -1 -1 -1 -1  1
  1 -1  0  0  0  1  1  0 -1 -1 -1 -1 -1 -1 -1  1
  1 -1  0  0  0  1  1  1  0 -1 -1 -1 -1 -1 -1  1
  1 -1  0  0  0  1  1  1  1  0 -1 -1 -1 -1 -1  1
  1  0  0  0  0  1  1  1  1  1  0 -1 -1 -1 -1  1
  1  1  0  0  0  1  1  1  1  1  1  0 -1 -1 -1  1
  1  1  0  0  0  1  1  1  1  1  1  1  0 -1 -1  1
  1  1  0  0  0  1  1  1  1  1  1  1  1  0 -1  1
  1  1  0  0  0  1  1  1  1  1  1  1  1  1  0  1
 -1 -1  0  0  0  0 -1 -1 -1 -1 -1 -1 -1 -1 -1  0
$End

$Function Time_rearranges : real
$Type = algorithmic
$Parameters
 Is    : integer
 Will_be   : integer
 New_number : integer {such_as Systema.Number_stand}
$Body
 Calculate_if Is <> Will_be and New_number <> Systema.Number_stand
			Time_rearranges = 120.0
 Calculate_if Is <> Will_be and New_number = Systema.Number_stand
			Time_rearranges = 60.0
 Calculate_if Is = Will_be and New_number <> Systema.Number_stand
			Time_rearranges = 30.0
 Calculate_if Is = Will_be and New_number = Systema.Number_stand
			Time_rearranges = 0.1
 Calculate_if Is = Will_be and New_number = 3 and New_number = Systema.Number_stand - 1
			Time_rearranges = 0.1
 Calculate_if Is = Will_be and New_number = 4 and New_number = Systema.Number_stand + 1
			Time_rearranges = 0.1
 Calculate_if Is = Will_be and New_number = 9 and New_number = Systema.Number_stand - 1 
			Time_rearranges = 0.1
 Calculate_if Is = Will_be and New_number = 10 and New_number = Systema.Number_stand + 1 
			Time_rearranges = 0.1
 Calculate_if Is = Will_be and New_number = 13 and New_number = Systema.Number_stand - 1 
			Time_rearranges = 0.1
 Calculate_if Is = Will_be and New_number = 14 and New_number = Systema.Number_stand + 1 
			Time_rearranges = 0.1
 Calculate_if Is = Will_be and New_number = 1 and New_number = Systema.Number_stand - 1
			Time_rearranges = 15
 Calculate_if Is = Will_be and New_number = 2 and New_number = Systema.Number_stand + 1
			Time_rearranges = 0.1
$End

$Function Time_processings : real
$Type = algorithmic
$Parameters
 Number  : integer [1..4]
 Exit    : such_as Line.Exit
 Det    : such_as Line.Have_det
$Body
 Calculate_if Number = 1 and Exit = Passage  Time_processings = 2.0
 Calculate_if Number = 2 and Exit = Passage  Time_processings = 2.0
 Calculate_if Number = 1 and Exit = Endd    Time_processings = 7.0
 Calculate_if Number = 2 and Exit = Endd    Time_processings = 7.0
 Calculate_if Number = 3 and Det = Yes       Time_processings = 1.0
 Calculate_if Number = 3 and Det = No      Time_processings = 5.0
 Calculate_if Number = 4 and Det = Yes       Time_processings = 1.0
 Calculate_if Number = 4 and Det = No      Time_processings = 5.0
$End

$Function Change : such_as Line.Exit
$Type = algorithmic
$Parameters
 Exit    : such_as Line.Exit
$Body
 Calculate_if  Exit = Passage Change = Endd 
 Calculate_if  Exit = Endd   Change = Passage 
$End 

$Function What_tr : such_as Details.Transport
$Type = algorithmic
$Parameters
 Number  : integer [1..4]
 Exit    : such_as Line.Exit
$Body
 Calculate_if Number = 1 and Exit = Passage  What_tr = Robot3
 Calculate_if Number = 2 and Exit = Passage  What_tr = Robot3
 Calculate_if Number = 1 and Exit = Endd    What_tr = No
 Calculate_if Number = 2 and Exit = Endd    What_tr = Robot2
 Calculate_if Number = 3  		   What_tr = Robot1
 Calculate_if Number = 4  		   What_tr = Robot1
$End

$Function To_cause : such_as Robot.Condition
$Type = algorithmic
$Parameters
 Exit    : such_as Line.Exit 
 Number  : integer [1..4]
 Cond   : such_as Robot.Condition
$Body
 Calculate_if Exit = Passage and Number = 1  To_cause = Cond
 Calculate_if Exit = Passage and Number = 2  To_cause = Cond
 Calculate_if Exit = Endd and Number = 1    To_cause = Cond
 Calculate_if Exit = Endd and Number = 2    To_cause = Call
$End

$Function To_load_tr : such_as Robot.Condition
$Type = algorithmic
$Parameters
 Exit    : such_as Line.Exit 
 Number  : integer [1..4]
 Cond   : such_as Robot.Condition
$Body
 Calculate_if Exit = Passage and Number = 1  To_load_tr = Cond
 Calculate_if Exit = Passage and Number = 2  To_load_tr = Cond
 Calculate_if Exit = Endd and Number = 1    To_load_tr = Load
 Calculate_if Exit = Endd and Number = 2    To_load_tr = Cond
$End


$Function Out_rolgang : integer
$Type = algorithmic
$Parameters
 Number  : integer
$Body
 Calculate_if Number = 1   Out_rolgang = 7
 Calculate_if Number = 2   Out_rolgang = 11
$End

$Function Time_s : integer
$Type = algorithmic
$Parameters
 Y_1    : integer
 Y_2    : integer
$Body
 Calculate_if Y_1 >= Y_2  Time_s = Y_1 - Y_2
 Calculate_if Y_1 < Y_2   Time_s = Y_2 - Y_1
$End

$Function To_take : integer
$Type = algorithmic
$Parameters
 Number  : integer
$Body
 Calculate_if Number = 7  or  Number = 11    To_take = 0
 Calculate_if Number <> 7 and Number <> 11   To_take = 1
$End

$Function Limit : integer
$Type = algorithmic
$Parameters
 Number  : integer
$Body
 Calculate_if Number > 10    Limit = 0
 Calculate_if Number <= 10     Limit = 1
$End

$Function Weight : real
$Type = algorithmic
$Parameters
 Deviation  : real
$Body
 Calculate_if Deviation  > 0    Weight = b * Abs(Deviation)
 Calculate_if Deviation  <= 0     Weight = a * Abs(Deviation)
$End


