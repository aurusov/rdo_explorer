$Pattern  Patient_s_state_is_changing : irregular_event trace 
$Relevant_resources 
  Patient_s_state_ð : Patient_s_state   Keep 
$Time = Patient_s_state_changing_time(60) 
$Body 
  Patient_s_state_ð 
    Convert_event 
      Rythm         set Rythm_changing(20,200) 
      Pressure      set Pressure_changing(20,300) 
      Temperature   set Temperature_changing(340,420) 
      Resistanse    set Resistance_changing(10,300) 
$End 
 
$Pattern Heart_rythm_definition : operation trace 
$Relevant_resources 
  Initializing_pulse_ð   : Initializing_pulse   Keep     NoChange 
  Gauges_busy_ð          : Gauges_busy          Keep     Keep 
  Gauge_of_heart_rythm_ð : Gauge_of_heart_rythm NoChange Keep 
$Time = Gauges_working_time 
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse = Has_place]
                 and [Initializing_pulse_ð.A11 = 0] 
    first 
    Convert_begin 
      A11            set   1 
  Gauges_busy_ð 
    Choice from  [Gauges_busy_ð.Heart > 0] 
    first 
    Convert_begin 
      Heart set   Gauges_busy_ð.Heart - 1 
    Convert_end 
      Heart set   Gauges_busy_ð.Heart + 1 
  Gauge_of_heart_rythm_ð 
    Choice NoCheck 
    first 
    Convert_end 
      Value          set   Patient_s_state.Rythm 
      Fulfilment     set   1 
$End 
 
$Pattern Pressure_definition : operation   trace 
$Relevant_resources 
  Initializing_pulse_ð : Initializing_pulse   Keep     NoChange 
  Gauges_busy_ð        : Gauges_busy          Keep     Keep 
  Gauge_of_pressure_ð  : Gauge_of_pressure    NoChange Keep 
$Time = Gauges_working_time
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse = Has_place]
                 and [Initializing_pulse_ð.A12 = 0] 
    first 
    Convert_begin 
      A12              set   1 
  Gauges_busy_ð 
    Choice from  [Gauges_busy_ð.Pressure > 0] 
    first 
    Convert_begin 
      Pressure set   Gauges_busy_ð.Pressure - 1 
    Convert_end 
      Pressure set   Gauges_busy_ð.Pressure + 1 
  Gauge_of_pressure_ð 
    Choice NoCheck 
    first 
    Convert_end 
      Value            set   Patient_s_state.Pressure 
      Fulfilment       set   1 
$End 
 
$Pattern Temperature_definition : operation    trace 
$Relevant_resources 
  Initializing_pulse_ð   : Initializing_pulse   Keep     NoChange 
  Gauges_busy_ð          : Gauges_busy Keep     Keep 
  Gauge_of_temperature_ð : Gauge_of_temperature NoChange Keep 
$Time = Gauges_working_time
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse = Has_place]
                 and [Initializing_pulse_ð.A13 = 0] 
    first 
    Convert_begin 
      A13                 set   1 
  Gauges_busy_ð 
    Choice from  [Gauges_busy_ð.Temperature > 0] 
    first 
    Convert_begin 
      Temperature set   Gauges_busy_ð.Temperature - 1 
    Convert_end 
      Temperature set   Gauges_busy_ð.Temperature + 1 
  Gauge_of_temperature_ð 
    Choice NoCheck 
    first 
    Convert_end 
      Value              set   Patient_s_state.Temperature 
      Fulfilment         set   1 
$End 
 
$Pattern Skin_resistance_definition : operation  trace 
$Relevant_resources 
  Initializing_pulse_ð       : Initializing_pulse       Keep     NoChange 
  Gauges_busy_ð              : Gauges_busy              Keep     Keep 
  Gauge_of_skin_resistance_ð : Gauge_of_skin_resistance NoChange Keep 
$Time = Gauges_working_time 
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse = Has_place]
                 and [Initializing_pulse_ð.A14 = 0] 
    first 
    Convert_begin 
      A14          set   1 
  Gauges_busy_ð 
    Choice from  [Gauges_busy_ð.Skin > 0] 
    first 
    Convert_begin 
      Skin set   Gauges_busy_ð.Skin - 1 
    Convert_end 
      Skin set   Gauges_busy_ð.Skin + 1 
  Gauge_of_skin_resistance_ð 
    Choice NoCheck 
    first 
    Convert_end 
      Value        set   Patient_s_state.Resistanse 
      Fulfilment   set   1 
$End 
 
$Pattern Heart_rythm_comparison : operation   trace 
$Relevant_resources 
  Initializing_pulse_ð   : Initializing_pulse   Keep     NoChange 
 Computer_r              :Computer              Keep     Keep 
  Gauge_of_heart_rythm_ð : Gauge_of_heart_rythm Keep     NoChange 
  Nurse_ð                : Nurse                Keep     Keep 
$Time = Computer_processing_time 
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse = Has_place]
                 and [Initializing_pulse_ð.A21 = 0] 
    first 
    Convert_begin 
      A21           set   1 
 Computer_r 
    Choice from  [Computer_r.Busy > 0] 
    first 
    Convert_begin 
      Busy          set Computer_r.Busy - 1 
    Convert_end 
      Busy          set Computer_r.Busy + 1 
  Gauge_of_heart_rythm_ð 
    Choice from [ [Gauge_of_heart_rythm_ð.Value > Range_of_rythm.Maximum] 
                or [Gauge_of_heart_rythm_ð.Value < Range_of_rythm.Minimum] ]
                and [Gauge_of_heart_rythm_ð.Fulfilment = 1] 
    first
    Convert_begin 
      Fulfilment    set   0  
  Nurse_ð
    Choice from [Nurse_ð.Step_No <> 1]
    first 
    Convert_begin 
      Step_No       set  1
      Step          set  Doing
    Convert_end
       Step         set  Done
       Coordinate_X set Nurse_coordinate_X (Nurse_ð.Step_No, Nurse_ð.Coordinate_X)
       Coordinate_Y set Nurse_coordinate_Y (Nurse_ð.Step_No, Nurse_ð.Coordinate_Y) 
$End 
 
$Pattern Pressure_comparison : operation   trace 
$Relevant_resources 
  Initializing_pulse_ð : Initializing_pulse  Keep     NoChange 
 Computer_r            :Computer             Keep     Keep 
  Gauge_of_pressure_ð  : Gauge_of_pressure   Keep     NoChange 
  Nurse_ð              : Nurse               Keep     Keep 
$Time = Computer_processing_time 
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse = Has_place]
                 and [Initializing_pulse_ð.A22 = 0] 
    first 
    Convert_begin 
      A22           set   1 
 Computer_r 
    Choice from  [Computer_r.Busy > 0] 
    first 
    Convert_begin 
      Busy          set Computer_r.Busy - 1 
    Convert_end 
      Busy          set Computer_r.Busy + 1 
  Gauge_of_pressure_ð 
    Choice from [ [Gauge_of_pressure_ð.Value > Range_of_pressure.Maximum] 
                or [Gauge_of_pressure_ð.Value < Range_of_pressure.Minimum] ]
                and [Gauge_of_pressure_ð.Fulfilment = 1] 
    first
    Convert_begin 
      Fulfilment    set   0  
  Nurse_ð 
    Choice from [Nurse_ð.Step_No <> 1] 
    first 
    Convert_begin 
      Step_No       set  1
      Step          set  Doing
    Convert_end
       Step         set  Done
       Coordinate_X set Nurse_coordinate_X (Nurse_ð.Step_No, Nurse_ð.Coordinate_X)
       Coordinate_Y set Nurse_coordinate_Y (Nurse_ð.Step_No, Nurse_ð.Coordinate_Y) 
$End 
 
$Pattern  Temperature_comparison : operation    trace 
$Relevant_resources 
  Initializing_pulse_ð   : Initializing_pulse   Keep     NoChange 
 Computer_r              :Computer              Keep     Keep 
  Gauge_of_temperature_ð : Gauge_of_temperature Keep     NoChange 
  Nurse_ð                : Nurse                Keep     Keep 
$Time = Computer_processing_time 
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse = Has_place]
                 and [Initializing_pulse_ð.A23 = 0] 
    first 
    Convert_begin 
      A23           set   1 
 Computer_r 
    Choice from  [Computer_r.Busy > 0] 
    first 
    Convert_begin 
      Busy          set Computer_r.Busy - 1 
    Convert_end 
      Busy          set Computer_r.Busy + 1 
  Gauge_of_temperature_ð 
    Choice from [ [Gauge_of_temperature_ð.Value > Range_of_temperature.Maximum] 
                or [Gauge_of_temperature_ð.Value < Range_of_temperature.Minimum] ]
                and [Gauge_of_temperature_ð.Fulfilment = 1] 
    first
    Convert_begin 
      Fulfilment    set   0  
  Nurse_ð 
    Choice from [Nurse_ð.Step_No <> 1] 
    first 
    Convert_begin 
      Step_No       set  1
      Step          set  Doing
    Convert_end
       Step         set  Done
       Coordinate_X set Nurse_coordinate_X (Nurse_ð.Step_No, Nurse_ð.Coordinate_X)
       Coordinate_Y set Nurse_coordinate_Y (Nurse_ð.Step_No, Nurse_ð.Coordinate_Y) 
$End 
 
$Pattern Skin_resistance_comparison : operation  trace 
$Relevant_resources 
  Initializing_pulse_ð       : Initializing_pulse       Keep     NoChange 
  Computer_r                 : Computer                 Keep     Keep 
  Gauge_of_skin_resistance_ð : Gauge_of_skin_resistance Keep     NoChange 
  Nurse_ð                    : Nurse                    Keep     Keep 
$Time = Computer_processing_time 
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse = Has_place]
                 and [Initializing_pulse_ð.A24 = 0] 
    first 
    Convert_begin 
      A24           set   1 
 Computer_r 
    Choice from  [ Computer_r.Busy > 0] 
    first 
    Convert_begin 
      Busy          set Computer_r.Busy - 1 
    Convert_end 
      Busy          set Computer_r.Busy + 1 
  Gauge_of_skin_resistance_ð 
    Choice from [ [Gauge_of_skin_resistance_ð.Value > Range_of_skin_resistance.Maximum] 
                or [Gauge_of_skin_resistance_ð.Value < Range_of_skin_resistance.Minimum] ]
                and [Gauge_of_skin_resistance_ð.Fulfilment = 1] 
    first
    Convert_begin 
      Fulfilment    set   0  
  Nurse_ð 
    Choice from [Nurse_ð.Step_No <> 1] 
    first 
    Convert_begin 
      Step_No       set  1
      Step          set  Doing
    Convert_end
       Step         set  Done
       Coordinate_X set Nurse_coordinate_X (Nurse_ð.Step_No, Nurse_ð.Coordinate_X)
       Coordinate_Y set Nurse_coordinate_Y (Nurse_ð.Step_No, Nurse_ð.Coordinate_Y)
$End 
 
$Pattern Rendering_assistance : operation  trace 
$Relevant_resources 
  Nurse_ð        : Nurse   Keep     Keep 
$Time = Help_time/46 
$Body 
  Nurse_ð 
    Choice from [[Nurse_ð.Step_No > 0] and [Nurse.Step = Done]]
    first 
    Convert_begin 
      Step_No      set Next_step(Nurse_ð.Step_No)
      Step         set Doing
    Convert_end
      Step         set Done
      Coordinate_X set Nurse_coordinate_X (Nurse_ð.Step_No, Nurse_ð.Coordinate_X)
      Coordinate_Y set Nurse_coordinate_Y (Nurse_ð.Step_No, Nurse_ð.Coordinate_Y)      
$End 

$Pattern Alarm_is_blinking : operation  trace
$Parameters
  Action_to_begin : such_as Screen_view.Alarm
  Action          : such_as Screen_view.Alarm
  Action_to_end   : such_as Screen_view.Alarm 
$Relevant_resources 
  View_ð	  : View Keep Keep 
$Time = (Help_time/46)*2 
$Body 
  View_ð 
    Choice from [Nurse.Step_No <> 0] and [View_ð.Alarm = Action_to_begin]
    first 
    Convert_begin 
      Alarm      set Action
    Convert_end
      Alarm      set Action_to_end
$End 

$Pattern Data_inputing_in_DB_by_doctor : operation   trace 
$Relevant_resources 
  Computer_r                : Computer                 Keep     Keep 
  Doctor_ð                  : Doctor                   NoChange Keep 
  Drug_s_data_ð             : Drug_s_data              Keep     NoChange 
  Treating_doctors_s_data_ð : Treating_doctors_s_data  Keep     NoChange 
$Time = Data_inputing_by_doctor_time 
$Body 
 Computer_r 
    Choice from  [Computer_r.Busy > 0]  
    first 
    Convert_begin 
      Busy         set Computer_r.Busy - 1 
    Convert_end 
      Busy         set Computer_r.Busy + 1 
 Doctor_ð 
    Choice from  [Doctor_ð.Wants_to = Has_place] and [Doctor_ð.Step_No = 21]
    first
    Convert_end
      Step_No      set  22
      Step         set  Done
      Coordinate_X set Doctor_coordinate_X(Doctor_ð.Step_No,Doctor_ð.Coordinate_X)
      Coordinate_Y set Doctor_coordinate_Y(Doctor_ð.Step_No, Doctor_ð.Coordinate_Y) 
  Drug_s_data_ð 
    Choice from  [Drug_s_data_ð.Data = 0] 
    first 
    Convert_begin 
      Data         set   1 
  Treating_doctors_s_data_ð 
    Choice from [Treating_doctors_s_data_ð.Data = 0] 
    first 
    Convert_begin 
      Data         set   1 
$End 
 
$Pattern Running_automatically_a_history_of_illness : operation    trace 
$Relevant_resources 
  Initializing_pulse_ð : Initializing_pulse  Keep     NoChange 
  Computer_r           : Computer            Keep     Keep 
  Doctor_ð             : Doctor              NoChange NoChange 
  History_of_illness_ð : History_of_illness  NoChange Keep 
$Time = Data_inputing_time 
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse = Has_place] and [Initializing_pulse_ð.A3 = 0]
                 and [Initializing_pulse_ð.A11 = 1] and [Initializing_pulse_ð.A12 = 1]
                 and [Initializing_pulse_ð.A13 = 1] and [Initializing_pulse_ð.A14 = 1] 
    first 
    Convert_begin 
      A3             set   1 
 Computer_r 
    Choice from  [Computer_r.Busy > 0] 
    first 
    Convert_begin 
      Busy           set Computer_r.Busy - 1 
    Convert_end 
      Busy           set Computer_r.Busy + 1 
  Doctor_ð 
    Choice from  [Doctor_ð.Wants_to = Has_no_place] 
    first
  History_of_illness_ð 
    Choice NoCheck 
    first 
    Convert_end 
      Rythm          set   Gauge_of_heart_rythm.Value 
      Pressure       set   Gauge_of_pressure.Value 
      Temperature    set   Gauge_of_temperature.Value 
      Resistanse     set   Gauge_of_skin_resistance.Value 
$End 
 
$Pattern Doctor_wants : operation    trace 
$Relevant_resources 
  Doctor_ð                  : Doctor                  Keep     Keep 
  Drug_s_data_ð             : Drug_s_data             Keep     NoChange 
  Treating_doctors_s_data_ð : Treating_doctors_s_data Keep     NoChange 
$Time = Doctor_wants_to(Doctor_s_moving_time, Doctor_s_moving_time + 20) 
$Body 
  Doctor_ð 
    Choice from  [ Doctor_ð.Wants_to =  Has_no_place_1] 
    first 
    Convert_begin 
      Wants_to      set  Has_place
      Step_No       set  1
      Step          set  Done
      Coordinate_X  set Doctor_coordinate_X(Doctor_ð.Step_No, Doctor_ð.Coordinate_X)
      Coordinate_Y  set Doctor_coordinate_Y(Doctor_ð.Step_No, Doctor_ð.Coordinate_Y)
    Convert_end 
      Wants_to      set  Has_place_1 
  Drug_s_data_ð 
    Choice NoCheck 
    first 
    Convert_begin 
      Data          set   0 
  Treating_doctors_s_data_ð 
    Choice NoCheck 
    first 
    Convert_begin 
      Data          set   0 
$End 

$Pattern Doctor_moves : operation    trace 
$Relevant_resources 
  Doctor_ð         : Doctor     Keep     Keep 
$Time = Doctor_s_moving_time/20 
$Body 
  Doctor_ð 
    Choice from  [Doctor_ð.Step_No <> 0] and [Doctor_ð.Step_No <> 21]
                 and [Doctor_ð.Step = Done]
    first 
    Convert_begin 
      Step_No       set  Doctor_s_last_step(Doctor_ð.Step_No) 
      Step          set  Doing 
    Convert_end
      Step          set  Done
      Coordinate_X  set Doctor_coordinate_X(Doctor_ð.Step_No, Doctor_ð.Coordinate_X)
      Coordinate_Y  set Doctor_coordinate_Y(Doctor_ð.Step_No, Doctor_ð.Coordinate_Y)
$End  

$Pattern Doctor_dont_want : operation   trace 
$Relevant_resources 
  Doctor_ð         : Doctor     Keep     Keep 
$Time = Doctor_dont_want_to(600) 
$Body 
  Doctor_ð 
    Choice from  [ Doctor_ð.Wants_to =  Has_place_1] 
    first 
    Convert_begin 
      Wants_to    set  Has_no_place
    Convert_end 
      Wants_to    set  Has_no_place_1 
$End 
 
$Pattern Initializing_pulse_has_place : operation   trace 
$Relevant_resources 
  Initializing_pulse_ð        : Initializing_pulse    Keep     Keep
$Time = Gauges_working_time * 4 + Computer_processing_time
        + Data_inputing_time + Data_inputing_by_doctor_time +  Help_time
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse =  Has_no_place_1] 
    first 
    Convert_begin 
      Pulse      set  Has_place 
      A11        set  0 
      A12        set  0 
      A13        set  0 
      A14        set  0 
      A21        set  0 
      A22        set  0 
      A23        set  0 
      A24        set  0 
      A3         set  0 
    Convert_end 
      Pulse      set  Has_place_1
$End 
 
$Pattern Initializing_pulse_has_no_place : operation  trace 
$Relevant_resources 
  Initializing_pulse_ð        : Initializing_pulse  Keep     Keep 
$Time = 90 
$Body 
  Initializing_pulse_ð 
    Choice from  [Initializing_pulse_ð.Pulse =  Has_place_1] 
    first 
    Convert_begin 
      Pulse    set  Has_no_place 
    Convert_end 
      Pulse    set  Has_no_place_1 
$End 

