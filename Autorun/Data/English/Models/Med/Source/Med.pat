$Pattern  Patient_s_state_is_changing : irregular_event trace 
$Relevant_resources 
  Patient_s_state_� : Patient_s_state   Keep 
$Time = Patient_s_state_changing_time(60) 
$Body 
  Patient_s_state_� 
    Convert_event 
      Rythm         set Rythm_changing(20,200) 
      Pressure      set Pressure_changing(20,300) 
      Temperature   set Temperature_changing(340,420) 
      Resistanse    set Resistance_changing(10,300) 
$End 
 
$Pattern Heart_rythm_definition : operation trace 
$Relevant_resources 
  Initializing_pulse_�   : Initializing_pulse   Keep     NoChange 
  Gauges_busy_�          : Gauges_busy          Keep     Keep 
  Gauge_of_heart_rythm_� : Gauge_of_heart_rythm NoChange Keep 
$Time = Gauges_working_time 
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse = Has_place]
                 and [Initializing_pulse_�.A11 = 0] 
    first 
    Convert_begin 
      A11            set   1 
  Gauges_busy_� 
    Choice from  [Gauges_busy_�.Heart > 0] 
    first 
    Convert_begin 
      Heart set   Gauges_busy_�.Heart - 1 
    Convert_end 
      Heart set   Gauges_busy_�.Heart + 1 
  Gauge_of_heart_rythm_� 
    Choice NoCheck 
    first 
    Convert_end 
      Value          set   Patient_s_state.Rythm 
      Fulfilment     set   1 
$End 
 
$Pattern Pressure_definition : operation   trace 
$Relevant_resources 
  Initializing_pulse_� : Initializing_pulse   Keep     NoChange 
  Gauges_busy_�        : Gauges_busy          Keep     Keep 
  Gauge_of_pressure_�  : Gauge_of_pressure    NoChange Keep 
$Time = Gauges_working_time
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse = Has_place]
                 and [Initializing_pulse_�.A12 = 0] 
    first 
    Convert_begin 
      A12              set   1 
  Gauges_busy_� 
    Choice from  [Gauges_busy_�.Pressure > 0] 
    first 
    Convert_begin 
      Pressure set   Gauges_busy_�.Pressure - 1 
    Convert_end 
      Pressure set   Gauges_busy_�.Pressure + 1 
  Gauge_of_pressure_� 
    Choice NoCheck 
    first 
    Convert_end 
      Value            set   Patient_s_state.Pressure 
      Fulfilment       set   1 
$End 
 
$Pattern Temperature_definition : operation    trace 
$Relevant_resources 
  Initializing_pulse_�   : Initializing_pulse   Keep     NoChange 
  Gauges_busy_�          : Gauges_busy Keep     Keep 
  Gauge_of_temperature_� : Gauge_of_temperature NoChange Keep 
$Time = Gauges_working_time
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse = Has_place]
                 and [Initializing_pulse_�.A13 = 0] 
    first 
    Convert_begin 
      A13                 set   1 
  Gauges_busy_� 
    Choice from  [Gauges_busy_�.Temperature > 0] 
    first 
    Convert_begin 
      Temperature set   Gauges_busy_�.Temperature - 1 
    Convert_end 
      Temperature set   Gauges_busy_�.Temperature + 1 
  Gauge_of_temperature_� 
    Choice NoCheck 
    first 
    Convert_end 
      Value              set   Patient_s_state.Temperature 
      Fulfilment         set   1 
$End 
 
$Pattern Skin_resistance_definition : operation  trace 
$Relevant_resources 
  Initializing_pulse_�       : Initializing_pulse       Keep     NoChange 
  Gauges_busy_�              : Gauges_busy              Keep     Keep 
  Gauge_of_skin_resistance_� : Gauge_of_skin_resistance NoChange Keep 
$Time = Gauges_working_time 
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse = Has_place]
                 and [Initializing_pulse_�.A14 = 0] 
    first 
    Convert_begin 
      A14          set   1 
  Gauges_busy_� 
    Choice from  [Gauges_busy_�.Skin > 0] 
    first 
    Convert_begin 
      Skin set   Gauges_busy_�.Skin - 1 
    Convert_end 
      Skin set   Gauges_busy_�.Skin + 1 
  Gauge_of_skin_resistance_� 
    Choice NoCheck 
    first 
    Convert_end 
      Value        set   Patient_s_state.Resistanse 
      Fulfilment   set   1 
$End 
 
$Pattern Heart_rythm_comparison : operation   trace 
$Relevant_resources 
  Initializing_pulse_�   : Initializing_pulse   Keep     NoChange 
 Computer_r              :Computer              Keep     Keep 
  Gauge_of_heart_rythm_� : Gauge_of_heart_rythm Keep     NoChange 
  Nurse_�                : Nurse                Keep     Keep 
$Time = Computer_processing_time 
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse = Has_place]
                 and [Initializing_pulse_�.A21 = 0] 
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
  Gauge_of_heart_rythm_� 
    Choice from [ [Gauge_of_heart_rythm_�.Value > Range_of_rythm.Maximum] 
                or [Gauge_of_heart_rythm_�.Value < Range_of_rythm.Minimum] ]
                and [Gauge_of_heart_rythm_�.Fulfilment = 1] 
    first
    Convert_begin 
      Fulfilment    set   0  
  Nurse_�
    Choice from [Nurse_�.Step_No <> 1]
    first 
    Convert_begin 
      Step_No       set  1
      Step          set  Doing
    Convert_end
       Step         set  Done
       Coordinate_X set Nurse_coordinate_X (Nurse_�.Step_No, Nurse_�.Coordinate_X)
       Coordinate_Y set Nurse_coordinate_Y (Nurse_�.Step_No, Nurse_�.Coordinate_Y) 
$End 
 
$Pattern Pressure_comparison : operation   trace 
$Relevant_resources 
  Initializing_pulse_� : Initializing_pulse  Keep     NoChange 
 Computer_r            :Computer             Keep     Keep 
  Gauge_of_pressure_�  : Gauge_of_pressure   Keep     NoChange 
  Nurse_�              : Nurse               Keep     Keep 
$Time = Computer_processing_time 
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse = Has_place]
                 and [Initializing_pulse_�.A22 = 0] 
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
  Gauge_of_pressure_� 
    Choice from [ [Gauge_of_pressure_�.Value > Range_of_pressure.Maximum] 
                or [Gauge_of_pressure_�.Value < Range_of_pressure.Minimum] ]
                and [Gauge_of_pressure_�.Fulfilment = 1] 
    first
    Convert_begin 
      Fulfilment    set   0  
  Nurse_� 
    Choice from [Nurse_�.Step_No <> 1] 
    first 
    Convert_begin 
      Step_No       set  1
      Step          set  Doing
    Convert_end
       Step         set  Done
       Coordinate_X set Nurse_coordinate_X (Nurse_�.Step_No, Nurse_�.Coordinate_X)
       Coordinate_Y set Nurse_coordinate_Y (Nurse_�.Step_No, Nurse_�.Coordinate_Y) 
$End 
 
$Pattern  Temperature_comparison : operation    trace 
$Relevant_resources 
  Initializing_pulse_�   : Initializing_pulse   Keep     NoChange 
 Computer_r              :Computer              Keep     Keep 
  Gauge_of_temperature_� : Gauge_of_temperature Keep     NoChange 
  Nurse_�                : Nurse                Keep     Keep 
$Time = Computer_processing_time 
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse = Has_place]
                 and [Initializing_pulse_�.A23 = 0] 
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
  Gauge_of_temperature_� 
    Choice from [ [Gauge_of_temperature_�.Value > Range_of_temperature.Maximum] 
                or [Gauge_of_temperature_�.Value < Range_of_temperature.Minimum] ]
                and [Gauge_of_temperature_�.Fulfilment = 1] 
    first
    Convert_begin 
      Fulfilment    set   0  
  Nurse_� 
    Choice from [Nurse_�.Step_No <> 1] 
    first 
    Convert_begin 
      Step_No       set  1
      Step          set  Doing
    Convert_end
       Step         set  Done
       Coordinate_X set Nurse_coordinate_X (Nurse_�.Step_No, Nurse_�.Coordinate_X)
       Coordinate_Y set Nurse_coordinate_Y (Nurse_�.Step_No, Nurse_�.Coordinate_Y) 
$End 
 
$Pattern Skin_resistance_comparison : operation  trace 
$Relevant_resources 
  Initializing_pulse_�       : Initializing_pulse       Keep     NoChange 
  Computer_r                 : Computer                 Keep     Keep 
  Gauge_of_skin_resistance_� : Gauge_of_skin_resistance Keep     NoChange 
  Nurse_�                    : Nurse                    Keep     Keep 
$Time = Computer_processing_time 
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse = Has_place]
                 and [Initializing_pulse_�.A24 = 0] 
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
  Gauge_of_skin_resistance_� 
    Choice from [ [Gauge_of_skin_resistance_�.Value > Range_of_skin_resistance.Maximum] 
                or [Gauge_of_skin_resistance_�.Value < Range_of_skin_resistance.Minimum] ]
                and [Gauge_of_skin_resistance_�.Fulfilment = 1] 
    first
    Convert_begin 
      Fulfilment    set   0  
  Nurse_� 
    Choice from [Nurse_�.Step_No <> 1] 
    first 
    Convert_begin 
      Step_No       set  1
      Step          set  Doing
    Convert_end
       Step         set  Done
       Coordinate_X set Nurse_coordinate_X (Nurse_�.Step_No, Nurse_�.Coordinate_X)
       Coordinate_Y set Nurse_coordinate_Y (Nurse_�.Step_No, Nurse_�.Coordinate_Y)
$End 
 
$Pattern Rendering_assistance : operation  trace 
$Relevant_resources 
  Nurse_�        : Nurse   Keep     Keep 
$Time = Help_time/46 
$Body 
  Nurse_� 
    Choice from [[Nurse_�.Step_No > 0] and [Nurse.Step = Done]]
    first 
    Convert_begin 
      Step_No      set Next_step(Nurse_�.Step_No)
      Step         set Doing
    Convert_end
      Step         set Done
      Coordinate_X set Nurse_coordinate_X (Nurse_�.Step_No, Nurse_�.Coordinate_X)
      Coordinate_Y set Nurse_coordinate_Y (Nurse_�.Step_No, Nurse_�.Coordinate_Y)      
$End 

$Pattern Alarm_is_blinking : operation  trace
$Parameters
  Action_to_begin : such_as Screen_view.Alarm
  Action          : such_as Screen_view.Alarm
  Action_to_end   : such_as Screen_view.Alarm 
$Relevant_resources 
  View_�	  : View Keep Keep 
$Time = (Help_time/46)*2 
$Body 
  View_� 
    Choice from [Nurse.Step_No <> 0] and [View_�.Alarm = Action_to_begin]
    first 
    Convert_begin 
      Alarm      set Action
    Convert_end
      Alarm      set Action_to_end
$End 

$Pattern Data_inputing_in_DB_by_doctor : operation   trace 
$Relevant_resources 
  Computer_r                : Computer                 Keep     Keep 
  Doctor_�                  : Doctor                   NoChange Keep 
  Drug_s_data_�             : Drug_s_data              Keep     NoChange 
  Treating_doctors_s_data_� : Treating_doctors_s_data  Keep     NoChange 
$Time = Data_inputing_by_doctor_time 
$Body 
 Computer_r 
    Choice from  [Computer_r.Busy > 0]  
    first 
    Convert_begin 
      Busy         set Computer_r.Busy - 1 
    Convert_end 
      Busy         set Computer_r.Busy + 1 
 Doctor_� 
    Choice from  [Doctor_�.Wants_to = Has_place] and [Doctor_�.Step_No = 21]
    first
    Convert_end
      Step_No      set  22
      Step         set  Done
      Coordinate_X set Doctor_coordinate_X(Doctor_�.Step_No,Doctor_�.Coordinate_X)
      Coordinate_Y set Doctor_coordinate_Y(Doctor_�.Step_No, Doctor_�.Coordinate_Y) 
  Drug_s_data_� 
    Choice from  [Drug_s_data_�.Data = 0] 
    first 
    Convert_begin 
      Data         set   1 
  Treating_doctors_s_data_� 
    Choice from [Treating_doctors_s_data_�.Data = 0] 
    first 
    Convert_begin 
      Data         set   1 
$End 
 
$Pattern Running_automatically_a_history_of_illness : operation    trace 
$Relevant_resources 
  Initializing_pulse_� : Initializing_pulse  Keep     NoChange 
  Computer_r           : Computer            Keep     Keep 
  Doctor_�             : Doctor              NoChange NoChange 
  History_of_illness_� : History_of_illness  NoChange Keep 
$Time = Data_inputing_time 
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse = Has_place] and [Initializing_pulse_�.A3 = 0]
                 and [Initializing_pulse_�.A11 = 1] and [Initializing_pulse_�.A12 = 1]
                 and [Initializing_pulse_�.A13 = 1] and [Initializing_pulse_�.A14 = 1] 
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
  Doctor_� 
    Choice from  [Doctor_�.Wants_to = Has_no_place] 
    first
  History_of_illness_� 
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
  Doctor_�                  : Doctor                  Keep     Keep 
  Drug_s_data_�             : Drug_s_data             Keep     NoChange 
  Treating_doctors_s_data_� : Treating_doctors_s_data Keep     NoChange 
$Time = Doctor_wants_to(Doctor_s_moving_time, Doctor_s_moving_time + 20) 
$Body 
  Doctor_� 
    Choice from  [ Doctor_�.Wants_to =  Has_no_place_1] 
    first 
    Convert_begin 
      Wants_to      set  Has_place
      Step_No       set  1
      Step          set  Done
      Coordinate_X  set Doctor_coordinate_X(Doctor_�.Step_No, Doctor_�.Coordinate_X)
      Coordinate_Y  set Doctor_coordinate_Y(Doctor_�.Step_No, Doctor_�.Coordinate_Y)
    Convert_end 
      Wants_to      set  Has_place_1 
  Drug_s_data_� 
    Choice NoCheck 
    first 
    Convert_begin 
      Data          set   0 
  Treating_doctors_s_data_� 
    Choice NoCheck 
    first 
    Convert_begin 
      Data          set   0 
$End 

$Pattern Doctor_moves : operation    trace 
$Relevant_resources 
  Doctor_�         : Doctor     Keep     Keep 
$Time = Doctor_s_moving_time/20 
$Body 
  Doctor_� 
    Choice from  [Doctor_�.Step_No <> 0] and [Doctor_�.Step_No <> 21]
                 and [Doctor_�.Step = Done]
    first 
    Convert_begin 
      Step_No       set  Doctor_s_last_step(Doctor_�.Step_No) 
      Step          set  Doing 
    Convert_end
      Step          set  Done
      Coordinate_X  set Doctor_coordinate_X(Doctor_�.Step_No, Doctor_�.Coordinate_X)
      Coordinate_Y  set Doctor_coordinate_Y(Doctor_�.Step_No, Doctor_�.Coordinate_Y)
$End  

$Pattern Doctor_dont_want : operation   trace 
$Relevant_resources 
  Doctor_�         : Doctor     Keep     Keep 
$Time = Doctor_dont_want_to(600) 
$Body 
  Doctor_� 
    Choice from  [ Doctor_�.Wants_to =  Has_place_1] 
    first 
    Convert_begin 
      Wants_to    set  Has_no_place
    Convert_end 
      Wants_to    set  Has_no_place_1 
$End 
 
$Pattern Initializing_pulse_has_place : operation   trace 
$Relevant_resources 
  Initializing_pulse_�        : Initializing_pulse    Keep     Keep
$Time = Gauges_working_time * 4 + Computer_processing_time
        + Data_inputing_time + Data_inputing_by_doctor_time +  Help_time
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse =  Has_no_place_1] 
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
  Initializing_pulse_�        : Initializing_pulse  Keep     Keep 
$Time = 90 
$Body 
  Initializing_pulse_� 
    Choice from  [Initializing_pulse_�.Pulse =  Has_place_1] 
    first 
    Convert_begin 
      Pulse    set  Has_no_place 
    Convert_end 
      Pulse    set  Has_no_place_1 
$End 

