$Pattern Occurrence_of_order : irregular_event {trace}
$Relevant_resources
 Syst      : Systema Keep 
$Time= Draw(500.0,1500.0) 
$Body
   Syst
      Convert_event
	Quan_products     set 0
	Number_of_order    set Syst.Number_of_order + Limit(Syst.Number_of_order)
	Product_in_order  set Number_of_prod(1,6) * Limit(Syst.Number_of_order)
$End

$Pattern Generation_of_Order : rule trace
$Relevant_resources
 System_w : System  Keep
 Order    : Orders   Keep 
$Body
   System_w
    Choice from System_w.Quan_products = System_w.Product_in_order  and System_w.Quan_detail = System_w.Det_in_product and System_w.Number_of_order < 6
      first
      Convert_rule
	Quan_products     set 0
	Product_in_order  set Number_of_prod(1,6) 
	Only_of_product     set System_w.Only_of_product + System_w.Product_in_order 
	Number_of_order    set System_w.Number_of_order + 1
   Order
    Choice from Order.Number = System_w.Number_of_order and Order.Condition = Expect
      first
      Convert_rule 
	Condition   set Serve
	Priority   set Number_of_prod(1,10)
	Quantity_goods   set System_w.Product_in_order
	Manufactured set 0
        Time_in  set Time_now
        Time_plan  set Plan(Min_term, Max_term)
$End

$Pattern Generation  : rule trace
$Relevant_resources
 System_w : System  Keep
$Body
   System_w
    Choice from System_w.Quan_products < System_w.Product_in_order  and System_w.Quan_detail = System_w.Det_in_product
      first
      Convert_rule
	Quan_products  set System_w.Quan_products + 1
	Quan_detail  set 0
	Number_product  set Number_of_prod(1,6)
	Num_article    set System_w.Num_article + 1 
	Type_color   set Type_of_color(1,3)
        Det_in_product      set Details_in_prod(System_w.Number_product)
	Queue      set 1
	Quan_of_preparations    set Preparations(30,60)
$End

$Pattern Generation_of_products : rule {trace}
$Relevant_resources
 System_2 : System Keep 
 Detail    : Details  Create 
$Body
   System_2
    Choice from System_2.Quan_products <= System_2.Product_in_order and System_2.Quan_detail < Details_in_prod(System_2.Number_product) 
      first
      Convert_rule
	Quan_detail set System_2.Quan_detail + 1
   Detail
      Convert_rule trace
	Number       set 0
	Number_article   set System_2.Number_product  		{стандартный Number изделия}
	Num_article   set System_2.Num_article 		{уникальный Number изделия}
	Number_stand set Stand_num(System_2.Quan_detail, System_2.Number_product)
  	Color       set System_2.Type_color
	Way        set 2
	Cond        set Expectation
        Transport   set No
        Place       set Rolgang2
        Next_place    set Rolgangin 
	Rolg       set Rolgangin  
	Priority_of_det    set 0   {Draw(0.0, 1.0)}
	Num_of_order  set System_2.Number_of_order - 1
	Size      set System_2.Quan_of_preparations
$End

$Pattern Purpose_of_priority : rule {trace}
$Relevant_resources
 System_2 : System NoChange
 Detail    : Details  Keep
 Order    : Orders  NoChange 
$Body
   System_2
    Choice from System_2.Condition = Op_Load
      first
   Detail
    Choice from Detail.Priority_of_det = 0 
      first
      Convert_rule 
	Priority_of_det set 
			( Max_term - (Order.Time_plan / Order.Quantity_goods) ) / Max_term 		{Dsp_opn}
			{Draw(0.0, 1.0) 						Dsp_rnd}
			{( 61 - Detail.Size ) / 30.0 					Dsp_lpt}
			{Detail.Color / 3.0 						Dsp_dek}
			{( Detail.Size - 29 ) / 30.0 					Dsp_spt}
			{Detail.Number_stand / 22.0  					Dsp_det}
			{( Order.Time_plan - Min_term ) / ( Max_term - Min_term )  	Dsp_dda}
   Order
    Choice from Order.Condition = Serve and Order.Number = Detail.Num_of_order
      first

$End

$Pattern Load_parties : rule {trace}
$Relevant_resources
 Detail    : Details      Keep
 Rob_1     : Robot_1     NoChange
 Syst      : System     Keep
$Body
  Detail
    Choice from Detail.Cond = Expectation and Detail.Place <> Rolgangin  and Check_ways( Detail.Number_stand) = 1
      with_max  Detail.Priority_of_det - Draw(0.0, 0.005)  
      Convert_rule 
        Place       set Rolgangin
  Rob_1
    Choice from Rob_1.Condition = Free
      first 
 Syst
    Choice from Syst.Condition = Op_Load
      first
      Convert_rule
	Condition set Op_Start
$End

$Pattern Start_parties : rule {trace}
$Relevant_resources
 Detail    : Details      Keep
 Rob_1     : Robot_1     Keep
 System_2 : System     Keep
 Rol       : Rolgang    Keep
$Body
  Detail
    Choice from Detail.Cond = Expectation and Detail.Place = Rolgangin and Check_ways( Detail.Number_stand) = 1
      first 
      Convert_rule 
        Number     set System_2.Number_detail
	Way      set Tech_way(Detail.Number_stand)
        Cond      set Processing
	Next_place  set Where_to_pass(Detail.Place, Detail.Way)
        Rolg     set Ret_translation(Rol.Number_rolgang)
  Rob_1
    Choice from Rob_1.Condition = Free
      first
      Convert_rule 
	Condition set Call
	Where      set Detail.Place
  System_2
    Choice from System_2.Condition = Op_Start
      first
      Convert_rule
	Condition    set Op_Load
        Number_detail set System_2.Number_detail + 1
        Number_stand  set Detail.Number_stand 
        Only_of_detail  set System_2.Only_of_detail + Detail.Size 
   Rol
    Choice from [Rol.Number_article = Detail.Num_article or Rol.Number_article = 0] and Rol.Number_rolgang >= 6 and Rol.Complete_set <> Ready
      with_min Detail.Num_article - Rol.Number_article  {Rol.Freely}
      Convert_rule
	Number_article    set Detail.Num_article
	 Stand_number_of_product       set Detail.Number_article
$End

$Pattern Delay_parties : rule {trace}
$Relevant_resources
 Detail    : Details      Keep
 Syst      : System     Keep
$Body
  Detail
    Choice from Detail.Cond = Expectation and Detail.Place = Rolgangin  and Detail.Number = 0 {and Check_ways( Detail.Number_stand) = 1}
      with_max Detail.Priority_of_det
      Convert_rule 
        Place       set Rolgang2
	Priority_of_det    set Detail.Priority_of_det - 0.05
 Syst
    Choice NoCheck
      first
      Convert_rule
	Condition set Op_Load
$End

$Pattern Movement_1 : operation {trace}
$Relevant_resources
 Detail : Details    NoChange Keep
 Rob_1  : Robot_1   Keep     Keep
$Time= Time_of_way(Rob_1.Position, Rob_1.Where, Rob_1.Number_robot) / 50 
$Body
  Detail
    Choice from Detail.Cond = Processing and Detail.Place = Rob_1.Where and Detail.Number <> 0
     first
    Convert_end 
	Transport set No
  Rob_1
    Choice from Rob_1.Condition = Call  
     first
     Convert_begin
       Condition set Movement_fr
     Convert_end
       Condition set Load 
       Position   set Rob_1.Where
       Where      set Detail.Next_place 
$End

$Pattern Load_rob : operation {trace}
$Relevant_resources
 Rob  : Robot   Keep     Keep			{100}
$Time= 0.5
$Body
  Rob
    Choice from Rob.Condition = Load
     first
     Convert_begin
       Condition set Is_loaded
     Convert_end
       Condition set Is_load 
$End

$Pattern Transportation : operation trace
$Relevant_resources
 Rob_1  : Robot    Keep     Keep
 Detail : Details   Keep     Keep
 Lin    : Line    NoChange Keep
$Time= Time_of_way(Rob_1.Position, Rob_1.Where, Rob_1.Number_robot) / 50  
$Body
  Rob_1
    Choice from Rob_1.Condition = Is_load  
     first
     Convert_begin
       Condition set Movement_load
     Convert_end
       Condition set Unloading
       Position   set Rob_1.Where
  Detail
    Choice from Detail.Cond = Processing and Detail.Next_place = Rob_1.Where and Detail.Transport = No and Detail.Place = Rob_1.Position
     first
     Convert_begin
       Transport  set Robot1
     Convert_end
       Transport  set No
       Place      set Detail.Next_place
       Next_place   set Where_to_pass(Detail.Place, Detail.Way)
  Lin
    Choice from Lin.Number_line = Translation(Detail.Next_place) and Lin.Condition <> Busy 
      first
      Convert_end
        Number_det set Detail.Number
        Color     set Detail.Color
	Have_det  set Yes
$End

$Pattern Unloading_rob : operation {trace}
$Relevant_resources
 Rob  : Robot   Keep     Keep
$Time= 0.5
$Body
  Rob
    Choice from Rob.Condition = Unloading
     first
     Convert_begin
       Condition set Unloads
     Convert_end
       Condition set Free 
$End

$Pattern Rearrange_l : operation {trace}
$Relevant_resources
 Detail : Details    NoChange NoChange 
 Lin    : Line     Keep     Keep 
$Time= Time_rearranges(Detail.Color, Lin.Color, Lin.Number_detail_stand)  
$Body
  Detail
    Choice from Detail.Cond = Processing and  Detail.Place = Rolgangin and Detail.Number <> 0
     first
  Lin
    Choice from There_are_in_ways(Detail.Way, Lin.Number_line) = 1 and Lin.Condition = Free 
      first
      Convert_begin
        Number_det set Detail.Number
	Condition set Arrange
	Number_article set Detail.Num_article
	Color     set Detail.Color
     Convert_end
        Condition set Ready
	Number_detail_stand  set Detail.Number_stand
$End

$Pattern Operation_1_2 : operation trace
$Relevant_resources
 Lin    : Line         Keep     Keep 
 Detail : Details        NoChange Keep 
{ Rob_2  : Robot_2       NoChange Keep }
$Time= Time_processings(Lin.Number_line, Lin.Exit, Lin.Have_det) + Detail.Size * 0.3
$Body
  Lin
    Choice from Lin.Condition = Ready and Lin.Have_det = Yes and [Lin.Number_line = 1 or Lin.Number_line = 2] and Lin.Exit = Passage
      first
      Convert_begin
	Condition set Busy
	Counter   set 0
	Quan_storages   set Detail.Size
     Convert_end
	Condition set Ready
        Exit     set Change(Lin.Exit)
	Have_det  set No
  Detail
    Choice from Detail.Cond = Processing and Translation(Detail.Place) = Lin.Number_line
     first
     Convert_end
	Transport  set What_tr(Lin.Number_line, Lin.Exit)
        Next_place   set Where_to_pass(Detail.Place, Detail.Way)
{  Rob_2	
    Choice NoCheck
     first
     Convert_end
	Condition  set To_cause(Lin.Exit, Lin.Number_line, Rob_2.Condition)
	Where       set Detail.Place}
$End

$Pattern Call_of_robot_2 : rule {trace}
$Relevant_resources
 Detail    : Details        NoChange
 Rob_1     : Robot_2       Keep
 Lin       : Line         Keep
$Body
  Detail
    Choice from Detail.Transport = Robot2 and Detail.Place = Line2 
      first
  Rob_1
    Choice from Rob_1.Condition = Free
      first
      Convert_rule 
	Condition  set Call 
	Where       set Detail.Place
  Lin
    Choice from Lin.Number_line = Translation(Detail.Place) and Lin.Have_det = No
      first
      Convert_rule
	Condition set Ready
$End


$Pattern Call_of_conveyor: rule trace
$Relevant_resources
 Detail    : Details        NoChange
 Rob_1     : Conveyor   Keep
 Lin       : Line         Keep
$Body
  Detail
    Choice from Detail.Transport = No and Detail.Place = Line1 
      first
  Rob_1
    Choice from Rob_1.Condition = Free
      first
      Convert_rule 
	Position    set Detail.Place
	Condition  set Load 
	Where       set Detail.Next_place
	X_coor     set 450
	Y_coor     set 200
  Lin
    Choice from Lin.Number_line = Translation(Detail.Place) and Lin.Have_det = No
      first
      Convert_rule
	Condition set Ready
$End

$Pattern Operation_31 : operation {trace}
$Relevant_resources
 Syst   : System       Keep     NoChange
 Lin1   : Line_31      Keep     Keep
 Detail : Details        NoChange Keep 
$Time= Time_processings(Lin1.Number_line, Lin1.Exit, Lin1.Have_det) + Detail.Size * 0.7
$Body
  Syst
    Choice NoCheck
      first
      Convert_begin
	Lin_32_l  set Lin1.Condition
  Lin1
    Choice from Lin1.Condition = Ready {or Lin1.Condition = Free] } and Lin1.Have_det = Yes
      first
      Convert_begin
	Condition set Busy
	Counter   set 0
	Quan_storages   set Detail.Size
     Convert_end
	Have_det  set No
  Detail
    Choice from Detail.Cond = Processing and Translation(Detail.Place) = 3 and Detail.Number_stand <> 2
     first
     Convert_end
	Transport  set Robot1 
        Next_place   set Where_to_pass(Detail.Place, Detail.Way)
$End

$Pattern Operation_32 : operation {trace}
$Relevant_resources
 Syst   : System       Keep     NoChange
 Lin1   : Line_32      Keep     Keep 
 Detail : Details        NoChange Keep 
$Time= Time_processings(Lin1.Number_line, Lin1.Exit, Lin1.Have_det) + Detail.Size * 0.7
$Body
  Syst
    Choice NoCheck
      first
      Convert_begin
	Lin_31_l  set Lin1.Condition
  Lin1
    Choice from Lin1.Condition = Ready {or Lin1.Condition = Free] } and Lin1.Have_det = Yes
      first
      Convert_begin
	Condition set Busy
	Counter   set 0
	Quan_storages   set Detail.Size
     Convert_end
	Have_det  set No

  Detail
    Choice from Detail.Cond = Processing and Translation(Detail.Place) = 4 and Detail.Number_stand <> 2
     first
     Convert_end
	Transport  set Robot1 
        Next_place   set Where_to_pass(Detail.Place, Detail.Way)

$End

$Pattern Operation_3 : operation {trace}
$Relevant_resources
 Lin1   : Line_32      Keep     Keep 
 Lin2   : Line_31      Keep     Keep 
 Detail : Details        NoChange Keep 
$Time= 2 * (Time_processings(Lin1.Number_line, Lin1.Exit, Lin1.Have_det) + Detail.Size * 0.7)
$Body
  Lin1
    Choice from Lin1.Condition = Ready 
      first
      Convert_begin
	Condition set Busy
	Have_det  set Yes
	Counter   set 0
	Quan_storages   set Detail.Size
     Convert_end
	{Condition set Free}
	Have_det  set No
  Lin2
    Choice from Lin2.Condition = Ready 
      first
      Convert_begin
	Condition set Busy
	Counter   set 0
	Quan_storages   set Detail.Size
     Convert_end
	Condition set Free
	Have_det  set No
  Detail
    Choice from Detail.Cond = Processing and [Translation(Detail.Place) = 3 or Translation(Detail.Place) = 4] and Detail.Number_stand = 2
     first
     Convert_end
	Transport  set Robot1
	Place      set Line32 
        Next_place   set Where_to_pass(Detail.Place, Detail.Way)
$End

$Pattern Call_of_robot: rule {trace}
$Relevant_resources
 Detail    : Details      NoChange
 Rob_1     : Robot_1     Keep
 Lin       : Line       Keep
$Body
  Detail
    Choice from Detail.Transport = Robot1 and Detail.Place = Line31 or Detail.Transport = Robot1 and Detail.Place = Line32 
      first

  Rob_1
    Choice from Rob_1.Condition = Free
      first
      Convert_rule 
	Condition set Call
	Where      set Detail.Place
  Lin
    Choice from Lin.Number_line = Translation(Detail.Place) 
      first
      Convert_rule
	Condition set Free
$End

$Pattern Operation_1_2_out : operation {trace}
$Relevant_resources
 Lin    : Line         Keep     Keep 
 Detail : Details        Keep     Keep 
 Rol    : Rolgang      NoChange NoChange
$Time= Time_processings(Lin.Number_line, Lin.Exit, Lin.Have_det) + Detail.Size * 0.3
$Body
  Lin
    Choice from Lin.Condition = Ready and Lin.Have_det = Yes and [Lin.Number_line = 1 or Lin.Number_line = 2] and Lin.Exit = Endd
      first
      Convert_begin
	Condition set Busy
	Counter   set 0
      Convert_end
        Exit     set Change(Lin.Exit)
	Have_det  set No
  Detail
    Choice from Detail.Cond = Processing and Translation(Detail.Place) = Lin.Number_line
     first
     Convert_begin
        Next_place   set Detail.Rolg
     Convert_end
	Transport  set Robot3 
	Place      set Ret_translation(Rol.Number_rolgang)
  Rol						
    Choice from Rol.Number_rolgang = Out_rolgang(Lin.Number_line)
     first
$End

$Pattern Call_of_robot_3: rule {trace}
$Relevant_resources
 Detail    : Details      NoChange
 Rob_3     : Robot_3     Keep
 Rol       : Rolgang    NoChange
 Lin       : Line       Keep
$Body
  Detail
    Choice from Detail.Transport = Robot3 
      first
  Rob_3
    Choice from Rob_3.Condition = Free
      first
      Convert_rule 
	Condition set Call
	Where      set Detail.Place
  Rol						
    Choice from Rol.Number_rolgang = Translation(Detail.Place) 
     first
  Lin
    Choice from Out_rolgang(Lin.Number_line) = Rol.Number_rolgang  
      first
      Convert_rule
	Condition set Free
$End


$Pattern Movement_2 : operation {trace}
$Relevant_resources
 Detail : Details    NoChange Keep
 Rob_2  : Robot_2   Keep     Keep
$Time= Time_of_way(Rob_2.Position, Rob_2.Where, Rob_2.Number_robot) / 50 
$Body
  Detail
    Choice from Detail.Cond = Processing and Detail.Transport = Robot2 and Detail.Place = Rob_2.Where
     first
    Convert_end
	Transport set No
  Rob_2
    Choice from Rob_2.Condition = Call  
     first
     Convert_begin
       Condition set Movement_fr
     Convert_end
       Condition set Load 
       Position   set Rob_2.Where
       Where      set Detail.Next_place 
$End

$Pattern Movement_3 : operation {trace}
$Relevant_resources
 Detail : Details    NoChange Keep
 Rob_3  : Robot_3   Keep     Keep
 Rol    : Rolgang  NoChange Keep
$Time= Time_s(Rob_3.Y_coor, Rol.Y_coor) / 250  
$Body
  Detail
    Choice from Detail.Cond = Processing and Detail.Transport = Robot3 and Detail.Place = Rob_3.Where
     first
    Convert_end
	Transport set No
  Rob_3
    Choice from Rob_3.Condition = Call  
     first
     Convert_begin
       Condition set Movement_fr
     Convert_end
       Condition set Load 
       Position   set Rob_3.Where
       Where      set Detail.Next_place 
  Rol
    Choice from Rol.Number_rolgang = Translation(Rob_3.Where)
     first
     Convert_end
	Freely      set Rol.Freely + To_take(Rol.Number_rolgang)
$End

$Pattern Start_on_an_exit : rule trace
$Relevant_resources
 Rol       : Rolgang    NoChange
 Detail    : Details      Keep
 Rob_3     : Robot_3     Keep
$Body
   Rol
    Choice from Rol.Complete_set = Ready and Rol.Number_rolgang >= 6 and Rol.Number_rolgang <> 16 and Rol.Freely < 9
      with_min Rol.Num_in_turn
  Detail
    Choice from Detail.Place = Ret_translation(Rol.Number_rolgang)
      first
      Convert_rule 
	Transport set Robot3
	Next_place  set Where_to_pass(Detail.Place, Detail.Way)
  Rob_3
    Choice from Rob_3.Condition = Free
      first
      Convert_rule 
	Condition set Call
	Where      set Detail.Place
$End

$Pattern Transportation_3 : operation trace
$Relevant_resources
 Rob_3  : Robot_3    Keep     Keep
 Detail : Details     Keep     Keep
 Rol    : Rolgang   NoChange Keep
$Time= Time_s(Rob_3.Y_coor, Rol.Y_coor) / 250   
$Body
  Rob_3
    Choice from Rob_3.Condition = Is_load  
     first
     Convert_begin
       Condition set Movement_load
     Convert_end
       Condition set Unloading
       Position   set Rob_3.Where
  Detail
    Choice from Detail.Cond = Processing and Detail.Place = Rob_3.Position and Detail.Transport = No and Detail.Place <> Detail.Next_place 
     first
     Convert_begin
       Transport  set Robot3
     Convert_end
       Transport  set No
       Place      set Detail.Next_place
  Rol
    Choice from Rol.Number_rolgang = Translation(Detail.Next_place) 
      first
      Convert_end
	Freely  set Rol.Freely - 1
$End

$Pattern Readiness  : rule trace
$Relevant_resources
 Rol       : Rolgang  Keep
 Detail    : Details    NoChange
 System_2 : System     Keep
 Order    : Orders      Keep
$Body
   Rol
    Choice from Rol.Number_rolgang >= 6 and Rol.Freely = 9 - Details_in_prod(Rol.Stand_number_of_product) and Rol.Complete_set = Not_ready
      first
      Convert_rule
	Complete_set      set Ready
	Num_in_turn set System_2.Queue
   Detail
    Choice from Detail.Cond = Processing and Detail.Place = Ret_translation(Rol.Number_rolgang)
      first
   System_2
    Choice NoCheck 
      first
      Convert_rule
	Queue      set System_2.Queue + 1
  Order
    Choice from Order.Condition = Serve and Order.Number = Detail.Num_of_order
      first
      Convert_rule 
	Manufactured set Order.Manufactured + 1
$End

$Pattern Readiness_of_order  : rule {trace}
$Relevant_resources
 Order     : Orders      Keep
$Body
  Order
    Choice from Order.Condition = Serve and Order.Quantity_goods = Order.Manufactured
      first
      Convert_rule 
	Condition   set Ready
	Manufactured set 0
	Time_out   set Time_now - Order.Time_plan 
$End

$Pattern To_release_out  : rule trace
$Relevant_resources
 Rol    : Rolgang  Keep
 Detail : Details    Erase
$Body
   Rol
    Choice from Rol.Number_rolgang = 16 and Rol.Freely <> 9 
      first
      Convert_rule
	Freely  set Rol.Freely + 1
   Detail
    Choice from Detail.Place = Exit_prod
      first
$End

$Pattern To_release  : rule trace
$Relevant_resources
 Rol  : Rolgang  Keep
 Syst : System   Keep
$Body
   Rol
    Choice from Rol.Number_rolgang >= 6 and Rol.Freely = 9 and Rol.Number_article <> 0 and Rol.Complete_set = Ready
      first
      Convert_rule
	Number_article      set 0
	Complete_set       set Not_ready
	Num_in_turn  set 0
   Syst
    Choice NoCheck
      first
      Convert_rule
	Only_of_product    set Syst.Only_of_product - 1
$End

$Pattern Movement_rob_1 : operation {trace}
$Relevant_resources
 Syst   : Systema    Keep     Keep  
 Rob_1  : Robot_1   Keep     NoChange
$Time= 0.02
$Body
  Syst
    Choice from Syst.R_1 = Stop
     first
     Convert_begin
       R_1 set Still
     Convert_end
       R_1 set Stop
  Rob_1
    Choice from Rob_1.Condition = Movement_fr or Rob_1.Condition = Movement_load{and Rob_1.Where <> Line1}
     first
     Convert_begin
       Y_coor set Rob_1.Y_coor + 5 * Length_ways(Rob_1.Position, Rob_1.Where)  
$End

$Pattern Movement_rob_2 : operation {trace}
$Relevant_resources
 Syst   : Systema    Keep     Keep  
 Rob_1  : Robot_2   Keep     NoChange
$Time= 0.02
$Body
  Syst
    Choice from Syst.R_2 = Stop
     first
     Convert_begin
       R_2 set Still
     Convert_end
       R_2 set Stop
  Rob_1
    Choice from Rob_1.Condition = Movement_fr or Rob_1.Condition = Movement_load{and Rob_1.Where <> Line1}
     first
     Convert_begin
       Y_coor set Rob_1.Y_coor + 5 * Length_ways(Rob_1.Position, Rob_1.Where)  
$End

$Pattern Movement_rob_3 : operation {trace}
$Relevant_resources
 Syst   : Systema    Keep     Keep  
 Rob_1  : Robot_3   Keep     NoChange
$Time= 0.02
$Body
  Syst
    Choice from Syst.R_3 = Stop
     first
     Convert_begin
       R_3 set Still
     Convert_end
       R_3 set Stop
  Rob_1
    Choice from Rob_1.Condition = Movement_fr or Rob_1.Condition = Movement_load {and Rob_1.Where <> Line1}
     first
     Convert_begin
       Y_coor set Rob_1.Y_coor + 5 * Length_ways(Rob_1.Position, Rob_1.Where)  
$End

$Pattern Movement_tr : operation {trace}
$Relevant_resources
 Syst    : Systema        Keep     Keep  
 Transp  : Conveyor   Keep     NoChange
$Time= 0.02
$Body
  Syst
    Choice from Syst.Tr = Stop
     first
     Convert_begin
       Tr set Still
     Convert_end
       Tr set Stop
  Transp
    Choice from Transp.Condition = Movement_fr or Transp.Condition = Movement_load
     first
     Convert_begin
       Y_coor set Transp.Y_coor + 5 * Length_ways(Transp.Position, Transp.Where)  
$End

$Pattern Movement_dsp_1 : operation {trace}
$Relevant_resources
 Syst   : Systema    Keep     Keep  
 Lin    : Line     Keep     NoChange
$Time= 0.15
$Body
  Syst
    Choice from Syst.M_dsp_1 = Stop
     first
     Convert_begin
       M_dsp_1 set Still
     Convert_end
       M_dsp_1 set Stop
  Lin
    Choice from Lin.Condition = Busy and Lin.Have_det = Yes and Lin.Number_line = 1 
      first
     Convert_begin
       Counter set Lin.Counter + 1 
$End

$Pattern Movement_dsp_2 : operation {trace}
$Relevant_resources
 Syst   : Systema    Keep     Keep  
 Lin    : Line     Keep     NoChange
$Time= 0.15
$Body
  Syst
    Choice from Syst.M_dsp_2 = Stop
     first
     Convert_begin
       M_dsp_2 set Still
     Convert_end
       M_dsp_2 set Stop
  Lin
    Choice from Lin.Condition = Busy and Lin.Have_det = Yes and  Lin.Number_line = 2
      first
     Convert_begin
       Counter set Lin.Counter + 1 
$End

$Pattern Movement_dsp_31 : operation {trace}
$Relevant_resources
 Syst   : Systema       Keep     Keep  
 Lin    : Line_31     Keep     NoChange
$Time= 0.35
$Body
  Syst
    Choice from Syst.M_dsp_31 = Stop
     first
     Convert_begin
       M_dsp_31 set Still
     Convert_end
       M_dsp_31 set Stop
  Lin
    Choice from Lin.Condition = Busy and Lin.Have_det = Yes
      first
     Convert_begin
       Counter set Lin.Counter + 1 
$End

$Pattern Movement_dsp_32 : operation {trace}
$Relevant_resources
 Syst   : Systema       Keep     Keep  
 Lin    : Line_32     Keep     NoChange
$Time= 0.35
$Body
  Syst
    Choice from Syst.M_dsp_32 = Stop
     first
     Convert_begin
       M_dsp_32 set Still
     Convert_end
       M_dsp_32 set Stop
  Lin
    Choice from Lin.Condition = Busy and Lin.Have_det = Yes 
      first
     Convert_begin
       Counter set Lin.Counter + 1 
$End

