
$Pattern  Transition_firing_1  : operation   trace

$Relevant_resources
  Input_1     : Place_1       Keep     NoChange
  Input_2     : Place_7       Keep     NoChange
  Input_3     : Place_5       Keep     NoChange
  Transition  : Transition_1  Keep     Keep
  Output_1    : Place_2       NoChange Keep
  Output_2    : Place_5       NoChange Keep

$Time = Random_number_generator_1 (m1, d1)

$Body
  Input_1
    Choice from Input_1.Size > 0
                first
    Convert_begin
      Size   set Input_1.Size - 1
      Pic    set Input_1.Pic  - 1
  Input_2
    Choice from Input_2.Size > 0
                first
    Convert_begin
      Size   set Input_2.Size - 1
      Pic    set Input_2.Pic  - 1
  Input_3
    Choice from Input_3.Size > 0
                first
    Convert_begin
      Size   set Input_3.Size - 1
      Pic    set Input_3.Pic  - 1
  Transition
    Choice from Transition.Being_busy = Free
                first
    Convert_begin
      Being_busy  set Busy
    Convert_end
      Being_busy  set Free
  Output_1
    Choice NoCheck 
                first
    Convert_end
      Shade  set Output_1.Shade + 1
      Pic    set Output_1.Pic   + 1
  Output_2
    Choice NoCheck 
                first
    Convert_end
      Shade  set Output_2.Shade + 1
      Pic    set Output_2.Pic   + 1
$End

$Pattern  Transition_firing_2  : operation   trace

$Relevant_resources
  Input_1     : Place_2       Keep     NoChange
  Input_2     : Place_5       Keep     NoChange
  Input_3     : Place_6       Keep     NoChange
  Transition  : Transition_2  Keep     Keep
  Output_1    : Place_3       NoChange Keep
  Output_2    : Place_5       NoChange Keep
  Output_3    : Place_7       NoChange Keep

$Time = Random_number_generator_2 (m2, d2)

$Body
  Input_1
    Choice from Input_1.Size > 0
                first
    Convert_begin
      Size   set Input_1.Size - 1
      Pic    set Input_1.Pic  - 1
  Input_2
    Choice from Input_2.Size > 0
                first
    Convert_begin
      Size   set Input_2.Size - 1
      Pic    set Input_2.Pic  - 1
  Input_3
    Choice from Input_3.Size > 0
                first
    Convert_begin
      Size   set Input_3.Size - 1
      Pic    set Input_3.Pic  - 1
  Transition
    Choice from Transition.Being_busy = Free 
                first
    Convert_begin
      Being_busy  set Busy
    Convert_end
      Being_busy  set Free
  Output_1
    Choice NoCheck 
                first
    Convert_end
      Shade  set Output_1.Shade + 1
      Pic    set Output_1.Pic   + 1
  Output_2
    Choice NoCheck 
                first
    Convert_end
      Shade  set Output_2.Shade + 1
      Pic    set Output_2.Pic   + 1
  Output_3
    Choice NoCheck 
                first
    Convert_end
      Shade  set Output_3.Shade + 1
      Pic    set Output_3.Pic   + 1
$End

$Pattern  Transition_firing_3  : operation   trace

$Relevant_resources
  Input_1     : Place_3       Keep      NoChange
  Input_2     : Place_5       Keep      NoChange
  Transition  : Transition_3  Keep      Keep
  Output_1    : Place_4       NoChange  Keep
  Output_2    : Place_5       NoChange  Keep
  Output_3    : Place_6       NoChange  Keep

$Time = Random_number_generator_3 (m3, d3)

$Body
  Input_1
    Choice from Input_1.Size > 0
                first
    Convert_begin
      Size   set Input_1.Size - 1
      Pic    set Input_1.Pic  - 1
  Input_2
    Choice from Input_2.Size > 0
                first
    Convert_begin
      Size   set Input_2.Size - 1
      Pic    set Input_2.Pic  - 1
  Transition
    Choice from Transition.Being_busy = Free 
                first
    Convert_begin
      Being_busy  set Busy
    Convert_end
      Being_busy  set Free
  Output_1
    Choice NoCheck 
                first
    Convert_end
      Shade  set Output_1.Shade + 1
      Pic    set Output_1.Pic   + 1
  Output_2
    Choice NoCheck 
                first
    Convert_end
      Shade  set Output_2.Shade + 1
      Pic    set Output_2.Pic   + 1
  Output_3
    Choice NoCheck first
    Convert_end
      Shade  set Output_3.Shade + 1
      Pic    set Output_3.Pic   + 1
$End

$Pattern  Delay_in_Place  : operation   trace

$Parameters
  Number_place    : integer [0..20]
  Oper_time       : real
  Coeff           : integer
$Relevant_resources
  Place    : Places     Keep  Keep

$Time =Coeff * Random_number_generator_4(m4, d4) + Oper_time


$Body
  Place
    Choice from  Place.Number=Number_place and
                 Place.Shade > 0
                 first
    Convert_begin
      Shade   set  Place.Shade - 1
    Convert_end
      Size    set  Place.Size  + 1

$End

