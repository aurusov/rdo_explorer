$Pattern  A_movement_with_constant_speed : operation
$Parameters
  Time : real = 0.00028
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  NoChange
$Time = Time
$Body
  rel_1_The_automobile
    Choice from rel_1_The_automobile.A_condition = Passively1
    first
    Convert_begin
      A_condition              set Actively
      Movement                 set A_const_speed
    Convert_end
      A_condition              set Passively
  rel_2_The_automobile
    Choice from rel_2_The_automobile.Acceleration <= 0.0001
    first
    Convert_begin
      Passed_way                   set rel_2_The_automobile.Passed_way  +
                                       rel_2_The_automobile.Speed * Time * 0.00028 * 3600
      Passed_after_a_sign          set rel_2_The_automobile.Passed_after_a_sign +
                                       rel_2_The_automobile.Speed * Time * 0.00028 * 3600
      From_a_beginning_of_section  set rel_2_The_automobile.From_a_beginning_of_section +
                                       rel_2_The_automobile.Speed * Time * 0.00028 * 3600
      From_a_beginning_of_turn     set rel_2_The_automobile.From_a_beginning_of_turn +
                                       rel_2_The_automobile.Speed * Time * 0.00028 * 3600
      Distance_before_sign         set rel_2_The_automobile.Distance_before_sign -
                                       rel_2_The_automobile.Speed * Time * 0.00028 * 3600
      Distance_before_turn         set rel_2_The_automobile.Distance_before_turn -
                                       rel_2_The_automobile.Speed * Time * 0.00028 * 3600
      Distance_before_crossing     set rel_2_The_automobile.Distance_before_crossing -
                                       rel_2_The_automobile.Speed * Time * 0.00028 * 3600
      Memory_before_crossing       set rel_2_The_automobile.Memory_before_crossing -
                                       rel_2_The_automobile.Speed * Time * 0.00028 * 3600
      Acceleration                 set 0.0
      Consumption                  set rel_2_The_automobile.Consumption + 0.0000118 *
                                       rel_2_The_automobile.Speed * Time +
                                       0.0000000011 * rel_2_The_automobile.Speed *
                                       rel_2_The_automobile.Speed *
                                       rel_2_The_automobile.Speed * Time
$End

$Pattern  A_movement_with_acceleration : operation
$Parameters
  Time  : real = 0.00028
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  NoChange
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Movement = Is_accelerated and
    rel_1_The_automobile.A_condition = Passively1
  first

  Convert_begin
    A_condition              set Actively

  Convert_end
    A_condition              set Passively

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Acceleration > 0.0
  first

  Convert_begin
    Passed_way        set rel_2_The_automobile.Passed_way +
                           rel_2_The_automobile.Speed * Time * 0.00028 *
                           3600 +
                           0.0005 * Time * Time *
                           3600 * 3600 * rel_2_The_automobile.Acceleration
    Passed_after_a_sign   set rel_2_The_automobile.Passed_after_a_sign +
                           rel_2_The_automobile.Speed * Time *
                           3600 * 0.00028 +
                           0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    From_a_beginning_of_section            set rel_2_The_automobile.From_a_beginning_of_section +
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           + 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    From_a_beginning_of_turn           set rel_2_The_automobile.From_a_beginning_of_turn +
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           + 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Distance_before_sign    set rel_2_The_automobile.Distance_before_sign -
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           - 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Distance_before_turn     set rel_2_The_automobile.Distance_before_turn -
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           - 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Distance_before_crossing  set rel_2_The_automobile.Distance_before_crossing -
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           - 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Memory_before_crossing  set rel_2_The_automobile.Memory_before_crossing -
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           - 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Speed               set rel_2_The_automobile.Speed +
                           rel_2_The_automobile.Acceleration * Time * 3.6 * 3600
    Acceleration              set Ordinate_of_zero -
                           Tangent_of_the_diagram * rel_2_The_automobile.Speed
    Consumption                 set rel_2_The_automobile.Consumption + 0.0000118 *
                            rel_2_The_automobile.Speed * Time +
                            0.0000000011 * rel_2_The_automobile.Speed *
                            rel_2_The_automobile.Speed *
                            rel_2_The_automobile.Speed * Time +
                            0.0000647 * rel_2_The_automobile.Speed *
                            rel_2_The_automobile.Acceleration * Time

$End

$Pattern  Braking : operation
$Parameters
  Time  : real = 0.00028
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  NoChange
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Movement = Is_braked and
    rel_1_The_automobile.A_condition = Passively1
  first

  Convert_begin
    A_condition              set Actively

  Convert_end
    A_condition              set Passively

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Acceleration > 0.0
  first

  Convert_begin
    Passed_way        set rel_2_The_automobile.Passed_way +
                           rel_2_The_automobile.Speed * Time * 0.00028 *
                           3600 -
                           0.0005 * Time * Time * 3600 * 3600 *
                            rel_2_The_automobile.Acceleration
    Passed_after_a_sign   set rel_2_The_automobile.Passed_after_a_sign +
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           - 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    From_a_beginning_of_section            set rel_2_The_automobile.From_a_beginning_of_section +
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           - 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    From_a_beginning_of_turn           set rel_2_The_automobile.From_a_beginning_of_turn +
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           - 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Distance_before_sign    set rel_2_The_automobile.Distance_before_sign -
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           + 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Distance_before_turn     set rel_2_The_automobile.Distance_before_turn -
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           + 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Distance_before_crossing  set rel_2_The_automobile.Distance_before_crossing -
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           + 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Memory_before_crossing  set rel_2_The_automobile.Memory_before_crossing -
                           rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                           + 0.0005 * Time * Time * 3600 * 3600 *
                           rel_2_The_automobile.Acceleration
    Speed               set rel_2_The_automobile.Speed -
                           rel_2_The_automobile.Acceleration * Time * 3.6 * 3600
    Consumption                 set rel_2_The_automobile.Consumption + 0.0000118 *
                            rel_2_The_automobile.Speed * Time
$End

$Pattern  The_sign_is_seen : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_A_sign         : A_sign                     NoChange  Erase
  rel_1_The_automobile : The_automobile_MECHANICAL  Keep      NoChange
  rel_2_The_automobile : The_automobile_ACS         Keep      NoChange
$Time = Time
$Body
rel_3_A_sign
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_3_A_sign.Coordinate - rel_1_The_automobile.Passed_way <=
    rel_3_A_sign.A_zone_of_visibility and
    rel_3_A_sign.Coordinate > rel_1_The_automobile.Passed_way
  first

  Convert_begin
    Distance_before_sign    set rel_3_A_sign.Coordinate -
                               rel_1_The_automobile.Passed_way
rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Vision_of_a_sign <> I_see and
    rel_2_The_automobile.A_condition = Passively
  first

  Convert_begin
    A_condition               set Passively1
    Vision_of_a_sign          set I_see
    A_kind_of_a_sign          set rel_3_A_sign.The_name_of_a_sign
    A_zone_of_action          set rel_3_A_sign.A_zone_of_action
    The_information_on_speed  set rel_3_A_sign.The_high_speed_information
    An_attribute              set rel_3_A_sign.A_sign_an_attribute
$End

$Pattern  The_special_a_section_is_seen : rule
$Parameters
  Time  : real = 0.0
$Relevant_resources
  rel_3_A_section      : A_section                  NoChange
  rel_1_The_automobile : The_automobile_MECHANICAL  Keep
  rel_2_The_automobile : The_automobile_ACS         Keep
$Body
rel_3_A_section
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_3_A_section.Coordinate <= rel_1_The_automobile.Passed_way
  first

  Convert_rule
    From_a_beginning_of_section            set 0.0

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively and
    rel_2_The_automobile.A_section_type = Normal
  first

  Convert_rule
    A_condition         set Passively1
    Vibration           set rel_3_A_section.Value_of_vibration
    Sliding             set rel_3_A_section.Value_of_sliding
    Slope               set rel_3_A_section.Value_of_slope
    A_section_type      set Special

$End

$Pattern  The_special_a_section_is_not_seen : operation
$Parameters
  Time  : real = 0.0
$Relevant_resources
  rel_3_A_section      : A_section                   NoChange   Erase
  rel_1_The_automobile : The_automobile_MECHANICAL1  NoChange   NoChange
  rel_2_The_automobile : The_automobile_ACS1         Keep       NoChange
$Time = Time
$Body
rel_3_A_section
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.From_a_beginning_of_section >= rel_3_A_section.Extent
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively and
    rel_2_The_automobile.A_section_type = Special
  first

  Convert_begin
    A_condition              set Passively1
    Vibration               set 0.0
    Sliding             set 0.0
    Slope                  set 0.0
    A_section_type            set Normal
$End

$Pattern  The_special_a_section_is_not_seen1 : operation
$Parameters
  Time  : real = 0.0
$Relevant_resources
  rel_2_A_section      : A_section            NoChange  Erase
  rel_1_The_automobile : The_automobile_ACS1  Keep      NoChange
$Time = Time
$Body
rel_2_A_section
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal1
  first

  Convert_begin
    A_condition         set Passively1
    Vibration           set 0.0
    Sliding             set 0.0
    Slope               set 0.0
    A_section_type      set Normal
$End

$Pattern  The_turn_is_seen : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Turn           : Turn                       NoChange
  rel_1_The_automobile : The_automobile_MECHANICAL  Keep
  rel_2_The_automobile : The_automobile_ACS         Keep
$Body
rel_3_Turn
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_3_Turn.Coordinate - rel_1_The_automobile.Passed_way <=
    rel_3_Turn.A_zone_of_visibility
  first

  Convert_rule
    Distance_before_turn     set rel_3_Turn.Coordinate -
                               rel_1_The_automobile.Passed_way

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively and
    rel_2_The_automobile.Vision_of_turn = I_do_not_see
  first

  Convert_rule
    A_condition              set Passively1
    Turn_radius        set rel_3_Turn.Radius
    Vision_of_turn       set I_see
    Turn_direction   set rel_3_Turn.A_direction
    A_rudder                   set Is_switched_on

$End

$Pattern  The_turn_is_not_seen : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Turn           : Turn                       NoChange  Erase
  rel_1_The_automobile : The_automobile_MECHANICAL  NoChange  NoChange
  rel_2_The_automobile : The_automobile_ACS         Keep      NoChange
$Time = Time
$Body
rel_3_Turn
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.From_a_beginning_of_turn >= rel_3_Turn.Extent
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively and
    rel_2_The_automobile.A_rudder = Woking and
    [rel_2_The_automobile.Vision_of_turn = Passed_by or
    rel_2_The_automobile.Vision_of_turn = I_do_not_see]
  first

  Convert_begin
    A_condition          set Passively1
    Vision_of_turn       set I_do_not_see
    Turn_direction       set Is_absent
    A_rudder             set Woking1
$End

$Pattern  The_turn_is_not_seen1 : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Turn           : Turn                  NoChange  Erase
  rel_1_The_automobile : The_automobile_ACS    Keep      NoChange
$Time = Time
$Body
rel_2_Turn
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see1
  first

  Convert_begin
    A_condition              set Passively1
    Vision_of_turn       set I_do_not_see
$End

$Pattern  The_end_of_working_of_wheels : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_rudder = Woking1
  first

  Convert_rule
    A_condition              set Passively1
    Turn_direction   set Is_absent
    A_rudder                   set Is_switched_off

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Angle_of_wheels             set 0.0
$End

$Pattern  Simultaneous1 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    [rel_1_The_automobile.An_attribute = Restriction_max or
     rel_1_The_automobile.An_attribute = Recommended] and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) <= rel_1_The_automobile.Turn_radius * 0.1
           or  (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration + 0.91) <=
     rel_1_The_automobile.Turn_radius * 0.1 or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
       + 0.91) <= rel_1_The_automobile.Turn_radius * 0.1 ] and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) <= rel_1_The_automobile.The_information_on_speed
     or  (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration + 0.91) <=
     rel_1_The_automobile.The_information_on_speed or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
     + 0.91) <= rel_1_The_automobile.The_information_on_speed ]
  first

  Convert_rule
    A_condition          set Passively1
    Vision_of_a_sign     set I_do_not_see
    Vision_of_turn       set I_do_not_see1
$End

$Pattern  Simultaneous2 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    [rel_1_The_automobile.An_attribute = Restriction_max or
     rel_1_The_automobile.An_attribute = Recommended] and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) > rel_1_The_automobile.Turn_radius * 0.1
     or  (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) > rel_1_The_automobile.Turn_radius * 0.1 or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
     + 0.91)  > rel_1_The_automobile.Turn_radius * 0.1 ] and
    rel_1_The_automobile.Turn_radius * 0.1
     < rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    A_condition               set Passively1
    Vision_of_a_sign          set I_do_not_see
    A_section_type            set Normal1
$End

$Pattern  Simultaneous3 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    [rel_1_The_automobile.An_attribute = Restriction_max or
     rel_1_The_automobile.An_attribute = Recommended] and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) > rel_1_The_automobile.The_information_on_speed
     or (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) > rel_1_The_automobile.The_information_on_speed or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
      + 0.91) > rel_1_The_automobile.The_information_on_speed ] and
    rel_1_The_automobile.Turn_radius *  0.1
     > rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    A_condition          set Passively1
    A_section_type       set Normal1
    Vision_of_turn       set I_do_not_see1
$End

$Pattern  Simultaneous4 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.An_attribute = Restriction_min and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) >= rel_1_The_automobile.The_information_on_speed
     or  (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) >= rel_1_The_automobile.The_information_on_speed or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
   + 0.91) >= rel_1_The_automobile.The_information_on_speed ] and
    rel_1_The_automobile.The_information_on_speed <
     rel_1_The_automobile.Turn_radius * 0.1   and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) >= rel_1_The_automobile.Turn_radius * 0.1
     or  (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) >= rel_1_The_automobile.Turn_radius * 0.1   or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
      + 0.91) >= rel_1_The_automobile.Turn_radius * 0.1 ]
  first

  Convert_rule
    A_condition               set Passively1
    Vision_of_a_sign          set I_do_not_see
    A_section_type            set Normal1
$End

$Pattern  Simultaneous5 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.An_attribute = Restriction_min and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) > rel_1_The_automobile.The_information_on_speed
     or  (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) > rel_1_The_automobile.The_information_on_speed   or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
   + 0.91)  >  rel_1_The_automobile.The_information_on_speed  ] and
    rel_1_The_automobile.Turn_radius * 0.1 >=
      rel_1_The_automobile.The_information_on_speed and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) <= rel_1_The_automobile.Turn_radius * 0.1
     or (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) <= rel_1_The_automobile.Turn_radius * 0.1   or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
     +   0.91) <= rel_1_The_automobile.Turn_radius * 0.1  ]
  first

  Convert_rule
    A_condition           set Passively1
    Vision_of_a_sign      set I_do_not_see
    Vision_of_turn        set I_do_not_see1
$End

$Pattern  Simultaneous6 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.An_attribute = Restriction_min and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) <= rel_1_The_automobile.The_information_on_speed
      or (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) <= rel_1_The_automobile.The_information_on_speed   or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
      + 0.91) <= rel_1_The_automobile.The_information_on_speed  or
     rel_1_The_automobile.Turn_radius * 0.1 <=
       rel_1_The_automobile.The_information_on_speed ]
  first

  Convert_rule
    A_condition          set Passively1
    An_attribute         set Recommended
    A_section_type       set Normal1
    Vision_of_turn       set I_do_not_see1
$End

$Pattern  Simultaneous7 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.An_attribute = Restriction_min and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) <= rel_1_The_automobile.The_information_on_speed
     or  (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) <= rel_1_The_automobile.The_information_on_speed or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
     +  0.91) <= rel_1_The_automobile.The_information_on_speed ]  and
     rel_1_The_automobile.Turn_radius * 0.1 <=
     rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    A_condition          set Passively1
    An_attribute         set Recommended
    A_section_type       set Normal1
    Vision_of_turn       set I_do_not_see1
$End

$Pattern  Simultaneous8 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.An_attribute = The_information and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see
  first

  Convert_rule
    A_condition              set Passively1
    Vision_of_a_sign         set I_do_not_see
$End

$Pattern  Simultaneous9 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) <= rel_1_The_automobile.Turn_radius * 0.1
     or (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) <= rel_1_The_automobile.Turn_radius * 0.1   or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
     +   0.91) <= rel_1_The_automobile.Turn_radius * 0.1  ]
  first

  Convert_rule
    A_condition          set Passively1
    Vision_of_turn       set I_do_not_see1
$End

$Pattern  Simultaneous10 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) > rel_1_The_automobile.Turn_radius * 0.1
     or  (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) > rel_1_The_automobile.Turn_radius * 0.1   or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
     +   0.91) > rel_1_The_automobile.Turn_radius * 0.1  ]
  first

  Convert_rule
    A_condition              set Passively1
    A_section_type           set Normal1
$End

$Pattern  Simultaneous11 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type <> Normal and
    rel_1_The_automobile.A_condition = Passively and
    [rel_1_The_automobile.An_attribute = Restriction_max or
     rel_1_The_automobile.An_attribute = Recommended] and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) > rel_1_The_automobile.The_information_on_speed
     or (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) > rel_1_The_automobile.The_information_on_speed or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
     + 0.91)  > rel_1_The_automobile.The_information_on_speed ]
  first

  Convert_rule
    A_condition              set Passively1
    A_section_type           set Normal1
$End

$Pattern  Simultaneous12 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type <> Normal and
    rel_1_The_automobile.A_condition = Passively and
    [rel_1_The_automobile.An_attribute = Restriction_max or
     rel_1_The_automobile.An_attribute = Recommended] and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    [ (100.1 - rel_1_The_automobile.Slope) /
    (rel_1_The_automobile.Slope + 0.91) <= rel_1_The_automobile.The_information_on_speed
     or (100.1 - rel_1_The_automobile.Vibration) /
    (rel_1_The_automobile.Vibration +
     0.91) <= rel_1_The_automobile.The_information_on_speed or
     (100.1 - rel_1_The_automobile.Sliding) / (rel_1_The_automobile.Sliding
     + 0.91) <= rel_1_The_automobile.The_information_on_speed ]
  first

  Convert_rule
    A_condition               set Passively1
    Vision_of_a_sign          set I_do_not_see
    A_section_type            set Normal1
$End

$Pattern  Simultaneous13 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.A_condition = Passively and
    [rel_1_The_automobile.An_attribute = Restriction_max or
     rel_1_The_automobile.An_attribute = Recommended] and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    rel_1_The_automobile.Turn_radius *  0.1
     > rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    A_condition              set Passively1
    Vision_of_turn           set I_do_not_see1
$End

$Pattern  Simultaneous14 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.A_condition = Passively and
    [rel_1_The_automobile.An_attribute = Restriction_max or
     rel_1_The_automobile.An_attribute = Recommended] and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    rel_1_The_automobile.Turn_radius *  0.1 <=
      rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    A_condition               set Passively1
    Vision_of_a_sign          set I_do_not_see
$End

$Pattern  Simultaneous15 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Special and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.An_attribute = Restriction_min and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see
  first

  Convert_rule
    A_condition              set Passively1
    Vision_of_a_sign         set I_do_not_see
$End

$Pattern  Simultaneous16 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.An_attribute = Restriction_min and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see
  first

  Convert_rule
    A_condition              set Passively1
    Vision_of_a_sign         set I_do_not_see
$End

$Pattern  A_section_of_vibration : rule
$Parameters
  Time  : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vibration >= rel_1_The_automobile.Slope and
    rel_1_The_automobile.Vibration >= rel_1_The_automobile.Sliding and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Special
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_braked

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed > (100.1 - rel_1_The_automobile.Vibration) /
                                  (rel_1_The_automobile.Vibration + 0.91)
  first

  Convert_rule
    Acceleration           set 0.042 * rel_2_The_automobile.Speed
$End

$Pattern  A_section_of_vibration_is_fulfilled : rule
$Parameters
  Time  : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Movement = Is_braked and
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vibration >= rel_1_The_automobile.Slope and
    rel_1_The_automobile.Vibration >= rel_1_The_automobile.Sliding and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Special
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed <= (100.1 - rel_1_The_automobile.Vibration) /
                                  (rel_1_The_automobile.Vibration + 0.91)
  first

  Convert_rule
    Acceleration           set 0.0
$End

$Pattern  A_section_of_sliding : rule
$Parameters
  Time  : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Sliding >= rel_1_The_automobile.Slope and
    rel_1_The_automobile.Sliding >= rel_1_The_automobile.Vibration and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Special
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_braked

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed > (100.1 - rel_1_The_automobile.Sliding) /
                                  (rel_1_The_automobile.Sliding + 0.91)
  first

  Convert_rule
    Acceleration           set 0.042 * rel_2_The_automobile.Speed
$End

$Pattern  The_section_of_sliding_is_fulfilled : rule
$Parameters
  Time  : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Movement = Is_braked and
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Sliding >= rel_1_The_automobile.Slope and
    rel_1_The_automobile.Sliding >= rel_1_The_automobile.Vibration and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Special
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed <= (100.1 - rel_1_The_automobile.Vibration) /
                                  (rel_1_The_automobile.Vibration + 0.91)
  first

  Convert_rule
    Acceleration           set 0.0
$End

$Pattern  Db_Slope : rule
$Parameters
  Time  : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Slope >= rel_1_The_automobile.Vibration and
    rel_1_The_automobile.Slope >= rel_1_The_automobile.Sliding and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Special
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_braked

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed > (100.1 - rel_1_The_automobile.Slope) /
                                  (rel_1_The_automobile.Slope + 0.91)
  first

  Convert_rule
    Acceleration           set 0.042 * rel_2_The_automobile.Speed
$End

$Pattern  Slope_is_fulfilled : rule
$Parameters
  Time  : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Movement = Is_braked and
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Slope >= rel_1_The_automobile.Sliding and
    rel_1_The_automobile.Slope >= rel_1_The_automobile.Vibration and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Special
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed <= (100.1 - rel_1_The_automobile.Slope) /
                                  (rel_1_The_automobile.Slope + 0.91)
  first

  Convert_rule
    Acceleration           set 0.0
$End

$Pattern  Db_Turn: rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_turn = I_see
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_braked

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed >= 0.1 * rel_1_The_automobile.Turn_radius and
    rel_2_The_automobile.Distance_before_turn > 0.0
  first

  Convert_rule
    Acceleration           set (rel_2_The_automobile.Speed *
                                rel_2_The_automobile.Speed - 0.01 *
                                rel_1_The_automobile.Turn_radius *
                                rel_1_The_automobile.Turn_radius)/2/
                                rel_2_The_automobile.Distance_before_turn/12960
$End

$Pattern Turn_is_fulfilled: rule trace
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see and
    rel_1_The_automobile.Movement = Is_braked
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed <= 0.1 * rel_1_The_automobile.Turn_radius
  first

  Convert_rule
    Acceleration           set 0.0
$End

$Pattern Turn_passed : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_rudder = Is_switched_on and
    rel_1_The_automobile.Vision_of_turn = I_see
  first

  Convert_rule
    A_condition                 set Passively1
    Vision_of_turn              set Passed_by
    A_rudder                    set Woking

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_turn <= 0.0
  first

  Convert_rule
    From_a_beginning_of_turn    set 0.0
    Angle_of_wheels             set Longitudinal_base / rel_1_The_automobile.Turn_radius * 57.3

$End

$Pattern Turn_passed1 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.Vision_of_a_sign = I_see or
    rel_1_The_automobile.A_section_type = Special] and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_rudder = Is_switched_on and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see
  first

  Convert_rule
    A_condition                set Passively1
    A_rudder                   set Woking

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_turn <= 0.0
  first

  Convert_rule
    From_a_beginning_of_turn   set 0.0
    Angle_of_wheels            set Longitudinal_base / rel_1_The_automobile.Turn_radius * 57.3
$End

$Pattern  Db_The_interdiction : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Movement = Is_braked
  first

  Convert_rule
    A_condition              set Passively1

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Acceleration > 6.4
  first

  Convert_rule
    Acceleration              set 6.4
$End

$Pattern  The_end_of_an_operative_range_of_a_sign : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign = Passed_by and
    rel_1_The_automobile.A_condition = Passively
  first

  Convert_rule
    A_condition              set Passively1
    Vision_of_a_sign         set I_do_not_see

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Passed_after_a_sign >=
                rel_1_The_automobile.A_zone_of_action
  first
$End

$Pattern  The_requirement_of_zone : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_condition = Passively
  first

  Convert_rule
    A_condition               set Passively1
    Vision_of_a_sign          set Passed_by

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Passed_after_a_sign <
                rel_1_The_automobile.A_zone_of_action
  first
$End

$Pattern  A_sign_passed : rule trace
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_kind_of_a_sign <> A_highway and
    rel_1_The_automobile.A_kind_of_a_sign <> The_end_of_a_highway and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    rel_1_The_automobile.A_condition = Passively
  first

  Convert_rule
    A_condition               set Passively1
    Vision_of_a_sign          set Passed_by

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign <= 0.0
  first

  Convert_rule
    Passed_after_a_sign       set 0.0
$End

$Pattern  The_action_of_nothing_is_visible : rule trace
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_highway = The_end
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed < 90.0
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero -
                               Tangent_of_the_diagram * rel_2_The_automobile.Speed
$End

$Pattern  Maintenance_of_speed : rule trace
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    [rel_1_The_automobile.A_section_type = Special or
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see] and
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.Movement = A_const_speed
  first

  Convert_rule
    A_condition              set Passively1

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Acceleration = 0.0
  first
$End

$Pattern  Maintenance_of_speed_90 : rule trace
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    [rel_1_The_automobile.An_attribute = The_information or
    rel_1_The_automobile.An_attribute = Restriction_min] and
    rel_1_The_automobile.A_highway = The_end
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign > 0.0 and
    rel_2_The_automobile.Speed >= 90.0
  first

  Convert_rule
    Speed                  set 90.0
    Acceleration           set 0.0
$End

$Pattern  Maintenance_of_speed_90_1 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign <> I_see and
    rel_1_The_automobile.A_highway = The_end
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign <= 0.0 and
    rel_2_The_automobile.Speed >= 90.0
  first

  Convert_rule
    Speed                  set 90.0
    Acceleration           set 0.0
$End

$Pattern  Dispersal_a_highway : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.An_attribute <> Restriction_max and
    rel_1_The_automobile.An_attribute <> Recommended and
    rel_1_The_automobile.A_highway = A_beginning
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Acceleration >= 0.0 and
    rel_2_The_automobile.Speed < 110.0
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero -
                               Tangent_of_the_diagram * rel_2_The_automobile.Speed
$End

$Pattern  Dispersal_a_highway1 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.A_highway = A_beginning
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Acceleration >= 0.0 and
    rel_2_The_automobile.Speed < 110.0
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero -
                               Tangent_of_the_diagram * rel_2_The_automobile.Speed
$End

$Pattern  Db_highway : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    [rel_1_The_automobile.An_attribute = The_information or
    rel_1_The_automobile.An_attribute = Restriction_min] and
    rel_1_The_automobile.A_highway = A_beginning
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign > 0.0 and
    rel_2_The_automobile.Speed >= 110.0
  first

  Convert_rule
    Speed                  set 110.0
    Acceleration           set 0.0
$End

$Pattern  Db_highway1 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign <> I_see and
    rel_1_The_automobile.A_highway = A_beginning
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign <= 0.0 and
    rel_2_The_automobile.Speed >= 110.0
  first

  Convert_rule
    Speed                  set 110.0
    Acceleration           set 0.0
$End

$Pattern  A_highway_a_beginning : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_kind_of_a_sign = A_highway and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    rel_1_The_automobile.A_highway = The_end
  first

  Convert_rule
    A_condition            set Passively1
    Vision_of_a_sign       set Passed_by
    A_highway              set A_beginning

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign <= 0.0
  first

  Convert_rule
    Passed_after_a_sign    set 0.0
$End

$Pattern  A_highway_the_end : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_kind_of_a_sign = The_end_of_a_highway and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    rel_1_The_automobile.A_highway = A_beginning and
    rel_1_The_automobile.An_attribute = Restriction_max and
    rel_1_The_automobile.A_condition = Passively
  first

  Convert_rule
    A_condition            set Passively1
    Vision_of_a_sign       set Passed_by
    A_highway              set The_end

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign <= 0.0
  first

  Convert_rule
    Passed_after_a_sign    set 0.0
$End

$Pattern  Action_on_restriction_of_max_speed : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.An_attribute = Restriction_max
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_braked

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed > rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    Acceleration           set (rel_2_The_automobile.Speed *
                               rel_2_The_automobile.Speed -
                               rel_1_The_automobile.The_information_on_speed *
                               rel_1_The_automobile.The_information_on_speed)/ 2 /
                               rel_2_The_automobile.Distance_before_sign / 12960
$End

$Pattern  Restriction_of_the_max_speed_RECOM : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.An_attribute = Restriction_max
  first

  Convert_rule
    A_condition            set Passively1
    An_attribute           set Recommended

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed <= rel_1_The_automobile.The_information_on_speed
  first
$End

$Pattern  Restriction_of_the_max_speed_is_fulfilled : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_condition = Passively and
    [ rel_1_The_automobile.Movement = Is_braked or
      rel_1_The_automobile.Movement = Is_urgently_braked ]    and
    [rel_1_The_automobile.An_attribute = Restriction_max or
    rel_1_The_automobile.An_attribute = Recommended]
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed <= rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    Speed                  set rel_1_The_automobile.The_information_on_speed
    Acceleration           set 0.0
$End

$Pattern  A_sign_of_the_information : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    rel_1_The_automobile.An_attribute = The_information
  first


  Convert_rule
    A_condition            set Passively1
    Vision_of_a_sign       set I_do_not_see
$End

$Pattern  Restr_of_the_min_speed : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.An_attribute = Restriction_min
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero -
                               Tangent_of_the_diagram * rel_2_The_automobile.Speed
$End

$Pattern  Restriction_of_the_min_speed_is_fulfilled : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.An_attribute = Restriction_min and
    rel_1_The_automobile.A_highway = The_end
  first

  Convert_rule
    A_condition            set Passively1
    Vision_of_a_sign       set Passed_by

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed <= 90.0 and
    rel_2_The_automobile.Speed >= rel_1_The_automobile.The_information_on_speed
  first
$End

$Pattern  Restriction_of_the_min_speed_a_highway : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.An_attribute = Restriction_min and
    rel_1_The_automobile.A_highway = A_beginning
  first

  Convert_rule
    A_condition            set Passively1
    Vision_of_a_sign       set Passed_by

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed <= 110.0 and
    rel_2_The_automobile.Speed >= rel_1_The_automobile.The_information_on_speed
  first
$End

$Pattern  Recommended_speed_is_less : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    rel_1_The_automobile.An_attribute = Recommended
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_braked
    An_attribute           set Restriction_max

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed >= rel_1_The_automobile.The_information_on_speed
  first
$End

$Pattern  Recommended_is_more_a_highway1 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_kind_of_a_sign = A_highway and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    rel_1_The_automobile.An_attribute = Recommended and
    rel_1_The_automobile.A_highway = The_end
  first

  Convert_rule
    A_condition              set Passively1

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign >= 0.0 and
    rel_2_The_automobile.Speed < rel_1_The_automobile.The_information_on_speed
  first
$End

$Pattern  Recommended_is_more_a_highway : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_kind_of_a_sign = A_highway and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = Passed_by and
    rel_1_The_automobile.An_attribute = Recommended
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign <= 0.0 and
    rel_2_The_automobile.Speed < rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero -
                               Tangent_of_the_diagram * rel_2_The_automobile.Speed
$End

$Pattern  Recommended_speed_is_more : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.An_attribute = Recommended
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed < rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero -
                               Tangent_of_the_diagram * rel_2_The_automobile.Speed
$End

$Pattern  Recommended_is_more_passed : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.Movement <> Is_braked and
    rel_1_The_automobile.An_attribute = Recommended
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed
    Vision_of_a_sign       set Passed_by

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed >= rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    Speed                  set rel_1_The_automobile.The_information_on_speed
    Acceleration           set 0.0
$End

$Pattern  Recommended_is_more_in_zone : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = Passed_by and
    rel_1_The_automobile.An_attribute = Recommended
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed >= rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    Speed                  set rel_1_The_automobile.The_information_on_speed
    Acceleration           set 0.0
$End

$Pattern  A_zero : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.A_kind_of_a_sign <> Stop and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.An_attribute = Restriction_max and
    rel_1_The_automobile.The_information_on_speed = 0.0 and
    rel_1_The_automobile.Movement = Is_braked
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed < 0.0
  first

  Convert_rule
    Speed                  set 0.0
    Acceleration           set 0.0
$End

$Pattern  Stop_1  : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.A_kind_of_a_sign = Stop and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.An_attribute = Restriction_max and
    rel_1_The_automobile.The_information_on_speed = 0.0 and
    rel_1_The_automobile.Movement = Is_braked
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated
    Vision_of_a_sign       set I_do_not_see

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed < 0.0
  first

  Convert_rule
    Speed                  set 0.0
    Acceleration           set 5.927
$End

$Pattern  Simultaneous17 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    [rel_1_The_automobile.A_section_type = Special or
    rel_1_The_automobile.Vision_of_turn <> I_do_not_see] and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.An_attribute = The_information
  first

  Convert_rule
    A_condition              set Passively1
    Vision_of_a_sign          set I_do_not_see

$End

{$Pattern  Carry_from_memory : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Memory         : Memory                     NoChange  Erase
  rel_1_The_automobile : The_automobile_MECHANICAL  Keep      NoChange
  rel_2_The_automobile : The_automobile_ACS         Keep      NoChange
$Time = Time
$Body
rel_3_Memory
  Choice NoCheck
  first

rel_1_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Memory_before_crossing  set rel_3_Memory.Distance

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.In_memory = No and
    rel_2_The_automobile.A_condition = Passively
  first

  Convert_begin
    A_condition             set Passively1
    A_direction_required    set rel_3_Memory.A_direction
    In_memory               set Yes
$End

$Pattern  The_crossing_is_visible : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Crossing        : Crossing                   NoChange
  rel_1_The_automobile  : The_automobile_MECHANICAL  Keep
  rel_2_The_automobile  : The_automobile_ACS         Keep
$Body
rel_3_Crossing
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_3_Crossing.Coordinate - rel_1_The_automobile.Passed_way <=
    rel_3_Crossing.A_zone_of_visibility and
    rel_3_Crossing.Coordinate > rel_1_The_automobile.Passed_way
  first

  Convert_rule
    Distance_before_crossing  set rel_3_Crossing.Coordinate - rel_1_The_automobile.Passed_way

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively
  first

  Convert_rule
    A_condition               set Passively2
    A_direction_of_crossing   set rel_3_Crossing.A_direction
$End

$Pattern  Choice_of_crossing : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Crossing        : Crossing                   NoChange Erase
  rel_4_Turn            : Turn                       Create   NoChange
  rel_1_The_automobile  : The_automobile_MECHANICAL  NoChange Keep
  rel_2_The_automobile  : The_automobile_ACS         NoChange Keep
$Time = Time
$Body
rel_3_Crossing
  Choice NoCheck
  first

rel_4_Turn

  Convert_begin
    Coordinate             set rel_3_Crossing.Coordinate
    A_zone_of_visibility   set rel_3_Crossing.A_zone_of_visibility
    Radius                 set rel_3_Crossing.Radius
    Extent                 set rel_3_Crossing.Extent
    A_direction            set rel_3_Crossing.A_direction
    Buffer                 set rel_3_Crossing.Buffer

rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.Distance_before_crossing -
    rel_1_The_automobile.Memory_before_crossing <= An_error_of_crossing or
    rel_1_The_automobile.Memory_before_crossing -
    rel_1_The_automobile.Distance_before_crossing <=
    An_error_of_crossing]
  first

  Convert_end
    Distance_before_turn   set rel_4_Turn.Coordinate - rel_1_The_automobile.Passed_way

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively2 and
    rel_2_The_automobile.A_direction_of_crossing =
    rel_2_The_automobile.A_direction_required
  first

  Convert_end
    A_condition            set Passively1
    Turn_radius            set rel_4_Turn.Radius
    Vision_of_turn         set I_see
    Vision_of_crossing     set Woking
    Turn_direction         set rel_4_Turn.A_direction
    A_rudder               set Is_switched_on
$End

$Pattern  Disregard_of_crossing : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Crossing        : Crossing                   NoChange Erase
  rel_1_The_automobile  : The_automobile_MECHANICAL  NoChange NoChange
  rel_2_The_automobile  : The_automobile_ACS         Keep     NoChange
$Time = Time
$Body
rel_3_Crossing
  Choice NoCheck
  first

rel_1_The_automobile
  Choice NoCheck
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively2 and
    rel_2_The_automobile.A_direction_of_crossing <>
    rel_2_The_automobile.A_direction_required
  first

  Convert_begin
    A_condition            set Passively1
    Vision_of_crossing     set I_do_not_see
$End

$Pattern  Disregard_of_crossing1 : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Crossing        : Crossing                   NoChange Erase
  rel_1_The_automobile  : The_automobile_MECHANICAL  NoChange NoChange
  rel_2_The_automobile  : The_automobile_ACS         Keep     NoChange
$Time = Time
$Body
rel_3_Crossing
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.Distance_before_crossing -
    rel_1_The_automobile.Memory_before_crossing > An_error_of_crossing or
    rel_1_The_automobile.Memory_before_crossing -
    rel_1_The_automobile.Distance_before_crossing >
    An_error_of_crossing ]
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively2
  first

  Convert_begin
    A_condition            set Passively1
    Vision_of_crossing     set I_do_not_see
$End

$Pattern  Crossing_passed : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Turn           : Turn                       NoChange  Erase
  rel_1_The_automobile : The_automobile_MECHANICAL  NoChange  NoChange
  rel_2_The_automobile : The_automobile_ACS         Keep      NoChange
$Time = Time
$Body
rel_3_Turn
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.From_a_beginning_of_turn >= rel_3_Turn.Extent
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively and
    rel_2_The_automobile.A_rudder = Woking and
    [rel_2_The_automobile.Vision_of_turn = Passed_by or
    rel_2_The_automobile.Vision_of_turn = I_do_not_see] and
    rel_2_The_automobile.Vision_of_crossing = Woking and
    rel_2_The_automobile.In_memory = Yes
  first

  Convert_begin
    A_condition            set Passively1
    Vision_of_turn         set I_do_not_see
    A_rudder               set Woking1
    Turn_direction         set Is_absent
    Vision_of_crossing     set I_do_not_see
    In_memory              set No
$End

$Pattern  Road_is_seen : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Road           : Road                       NoChange
  rel_1_The_automobile : The_automobile_MECHANICAL  NoChange
  rel_2_The_automobile : The_automobile_ACS         Keep
$Body
rel_3_Road
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_3_Road.Coordinate - rel_1_The_automobile.Passed_way <=
    rel_3_Road.Visibility_prior_to_the_beginning and
    rel_3_Road.Coordinate > rel_1_The_automobile.Passed_way
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively
  first

  Convert_rule
    A_condition            set Passively3
$End

$Pattern  Road_is_seen1 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Road           : Road                       NoChange
  rel_1_The_automobile : The_automobile_MECHANICAL  NoChange
  rel_2_The_automobile : The_automobile_ACS         Keep
$Body
rel_3_Road
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_3_Road.Coordinate <= rel_1_The_automobile.Passed_way
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively
  first

  Convert_rule
    A_condition              set Passively3

$End

$Pattern  Qualification_of_a_road1 : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange Erase
  rel_1_The_automobile : The_automobile_ACS     Keep     NoChange
$Time = Time
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = One_way and
    rel_2_Road.Width_roadside >= Safe_roadside
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively3
  first

  Convert_begin
    A_condition            set Passively1
    A_counter_movement     set No
    Passing_strips         set rel_2_Road.Of_passing_strips
    A_strip_from_the_right set rel_2_Road.A_strip_from_the_right
    Departure              set Is_possible
$End

$Pattern  Qualification_of_a_road2 : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange Erase
  rel_1_The_automobile : The_automobile_ACS     Keep     NoChange
$Time = Time
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = One_way and
    rel_2_Road.Width_roadside < Safe_roadside
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively3
  first

  Convert_begin
    A_condition            set Passively1
    A_counter_movement     set No
    Passing_strips         set rel_2_Road.Of_passing_strips
    A_strip_from_the_right set rel_2_Road.A_strip_from_the_right
    Departure              set Is_impossible
$End

$Pattern  Qualification_of_a_road3 : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange Erase
  rel_1_The_automobile : The_automobile_ACS     Keep     NoChange
$Time = Time
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = Counter and
    rel_2_Road.Width_roadside >= Safe_roadside
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively3
  first

  Convert_begin
    A_condition            set Passively1
    A_counter_movement     set Yes
    Passing_strips         set rel_2_Road.Of_passing_strips
    A_strip_from_the_right set rel_2_Road.A_strip_from_the_right
    Departure              set Is_possible
$End

$Pattern  Qualification_of_a_road4 : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange Erase
  rel_1_The_automobile : The_automobile_ACS     Keep     NoChange
$Time = Time
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = Counter and
    rel_2_Road.Width_roadside < Safe_roadside
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively3
  first

  Convert_begin
    A_condition            set Passively1
    A_counter_movement     set Yes
    Passing_strips         set rel_2_Road.Of_passing_strips
    A_strip_from_the_right set rel_2_Road.A_strip_from_the_right
    Departure              set Is_impossible
$End

$Pattern  Qualification_of_a_road5 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange
  rel_1_The_automobile : The_automobile_ACS     Keep
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = No and
    rel_2_Road.Movement = One_way and
    rel_2_Road.Width/An_accepted_strip <
     An_accepted_strip * 3.0 and
    rel_2_Road.Width/An_accepted_strip >=
     An_accepted_strip * 2.0
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively3
  first

  Convert_rule
    A_condition            set Passively4
    A_counter_movement     set No
    Passing_strips         set 2
$End

$Pattern  Qualification_of_a_road6 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange
  rel_1_The_automobile : The_automobile_ACS     Keep
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = No and rel_2_Road.Movement = One_way and
    rel_2_Road.Width/An_accepted_strip < An_accepted_strip * 2.0 and
    rel_2_Road.Width/An_accepted_strip >= An_accepted_strip * 1.0
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively3
  first

  Convert_rule
    A_condition            set Passively4
    A_counter_movement     set No
    Passing_strips         set 1
$End

$Pattern  Qualification_of_a_road7 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange
  rel_1_The_automobile : The_automobile_ACS     Keep
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = No and rel_2_Road.Movement = Counter and
    rel_2_Road.Width/An_accepted_strip < An_accepted_strip * 3.0 and
    rel_2_Road.Width/An_accepted_strip >= An_accepted_strip * 2.0
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively3
  first

  Convert_rule
    A_condition            set Passively4
    A_counter_movement     set Yes
    Passing_strips         set 2
$End

$Pattern  Qualification_of_a_road8 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange
  rel_1_The_automobile : The_automobile_ACS     Keep
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = No and rel_2_Road.Movement = Counter and
    rel_2_Road.Width/An_accepted_strip < An_accepted_strip * 2.0 and
    rel_2_Road.Width/An_accepted_strip >= An_accepted_strip * 1.0
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively3
  first

  Convert_rule
    A_condition            set Passively4
    A_counter_movement     set Yes
    Passing_strips         set 1
$End

$Pattern  Qualification_of_a_road9 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange
  rel_1_The_automobile : The_automobile_ACS     Keep
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = No and
    rel_2_Road.From_the_right < An_accepted_strip
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively4 and
    rel_1_The_automobile.Passing_strips = 2
  first

  Convert_rule
    A_strip_from_the_right set First
    A_condition            set Passively5
$End

$Pattern  Qualification_of_a_road10 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange
  rel_1_The_automobile : The_automobile_ACS     Keep
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = No and
    rel_2_Road.From_the_right >= An_accepted_strip
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively4 and
    rel_1_The_automobile.Passing_strips = 2
  first

  Convert_rule
    A_strip_from_the_right set Second
    A_condition            set Passively5
$End

$Pattern  Qualification_of_a_road11 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange
  rel_1_The_automobile : The_automobile_ACS     Keep
$Body
rel_2_Road
  Choice from
    rel_2_Road.Sectoring = No
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively4 and
    rel_1_The_automobile.Passing_strips = 1
  first

  Convert_rule
    A_strip_from_the_right set First
    A_condition            set Passively5
$End

$Pattern  Qualification_of_a_road12 : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange Erase
  rel_1_The_automobile : The_automobile_ACS     Keep     NoChange
$Time = Time
$Body
rel_2_Road
  Choice from
    rel_2_Road.Width_roadside >= Safe_roadside
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively5
  first

  Convert_begin
    Departure              set Is_possible
    A_condition            set Passively1
$End

$Pattern  Qualification_of_a_road13 : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_Road           : Road                   NoChange Erase
  rel_1_The_automobile : The_automobile_ACS     Keep     NoChange
$Time = Time
$Body
rel_2_Road
  Choice from
    rel_2_Road.Width_roadside < Safe_roadside
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively5
  first

  Convert_begin
    Departure              set Is_impossible
    A_condition            set Passively1
$End

$Pattern  The_object_is_seen : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Object         : Object                     NoChange Erase
  rel_1_The_automobile : The_automobile_MECHANICAL  NoChange NoChange
  rel_2_The_automobile : The_automobile_ACS         Keep     NoChange
$Time = Time
$Body
rel_3_Object
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Passed_way >=
      rel_3_Object.A_place_of_detection
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively
  first

  Convert_begin
    A_condition            set Passively6
    Object_speed           set rel_3_Object.Speed
    Object_distance        set rel_3_Object.Distance
    Object_Interval        set rel_3_Object.Interval
$End

$Pattern  Manoeuvre1 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Object_speed = rel_2_The_automobile.Speed
  first

  Convert_rule
    A_condition            set Passively1
$End

$Pattern  Manoeuvre2 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Object_speed <= rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0
  first

  Convert_rule
    A_condition            set Passively1
$End

$Pattern  Manoeuvre3 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0
  first

  Convert_rule
    A_condition            set Passively1
$End

$Pattern  Manoeuvre4 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Object_an_interval > 1.5 and
    rel_1_The_automobile.Object_an_interval <  1.5 * -1.0
  first

  Convert_rule
    A_condition            set Passively1
$End

$Pattern  Manoeuvre5 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Acceleration           set (rel_2_The_automobile.Speed *
                               rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed *
                               rel_1_The_automobile.Object_speed)/2/
                               rel_1_The_automobile.Object_distance/0.077

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.A_counter_movement = No and
    rel_1_The_automobile.Passing_strips = 1 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Departure = Is_impossible and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_braked
$End

$Pattern  Manoeuvre6_emergency : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Acceleration              set 6.4

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.A_counter_movement = No and
    rel_1_The_automobile.Passing_strips = 1 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Departure = Is_impossible and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance <= Safe_distance
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_braked
$End

$Pattern  Manoeuvre7 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.A_counter_movement = No and
    rel_1_The_automobile.Passing_strips = 1 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Departure = Is_impossible and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 > Safe_distance
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated
$End

$Pattern  Manoeuvre8_emergency : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels             set An_accepted_strip * 60/2/
                               Emergency_half_time/
                               rel_2_The_automobile.Speed/1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.A_counter_movement = No and
    rel_1_The_automobile.Passing_strips = 1 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Departure = Is_possible and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance <= Safe_distance
  first

  Convert_begin
    A_condition            set Passively7
    Turn_direction         set Right
    A_rudder               set Woking
$End

$Pattern  Manoeuvre8_1_emergency : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.A_counter_movement = No and
    rel_1_The_automobile.Passing_strips = 1 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Departure = Is_possible and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 <= Safe_distance
  first

  Convert_begin
    A_condition            set Passively7
    Turn_direction         set Right
    A_rudder               set Woking
$End

$Pattern  An_exit_on_roadside_emergency : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively7 and
    rel_1_The_automobile.Turn_direction = Right
  first

  Convert_begin
    Turn_direction         set Left

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set Safe_roadside * 60 / 2 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0
$End

$Pattern  An_exit_on_a_strip_to_the_right : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively8 and
    rel_1_The_automobile.Turn_direction = Right
  first

  Convert_begin
    Turn_direction         set Left

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0
$End

$Pattern  An_exit_on_a_strip_to_the_left : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively8 and
    rel_1_The_automobile.Turn_direction = Left
  first

  Convert_begin
    Turn_direction         set Right

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0
$End

$Pattern  An_exit_on_a_strip_to_the_right_emergency : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively9 and
    rel_1_The_automobile.Turn_direction = Right
  first

  Convert_begin
    Turn_direction         set Left

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0
$End

$Pattern  An_exit_on_a_strip_to_the_left_emergency : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively9 and
    rel_1_The_automobile.Turn_direction = Left
  first

  Convert_begin
    Turn_direction         set Right

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0
$End

$Pattern  Manoeuvre9 : rule
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.An_attribute = The_interdiction_change_the_band and
    [rel_1_The_automobile.Vision_of_a_sign = I_see or
    rel_1_The_automobile.Vision_of_a_sign = Passed_by] and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 > Safe_distance and
    rel_1_The_automobile.Object_an_interval < 1.5 and
    rel_1_The_automobile.Object_an_interval >  1.5* -1.0
  first

  Convert_rule
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre9_1 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 > Safe_distance and
    rel_1_The_automobile.Object_an_interval < 1.5 and
    rel_1_The_automobile.Object_an_interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively8
    Turn_direction         set Left
    A_rudder               set Woking
$End

$Pattern  Manoeuvre10 : rule
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.An_attribute = The_interdiction_change_the_band and
    [rel_1_The_automobile.Vision_of_a_sign = I_see or
    rel_1_The_automobile.Vision_of_a_sign = Passed_by] and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_an_interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_rule
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre10_1 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively8
    Turn_direction         set Left
    A_rudder               set Woking
$End

$Pattern  Manoeuvre11 : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively7
    Turn_direction         set Right
    A_rudder               set Woking
$End

$Pattern  Manoeuvre12 : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    [rel_1_The_automobile.Passing_strips = 2 or
    rel_1_The_automobile.Passing_strips = 1] and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively7
    Turn_direction         set Right
    A_rudder               set Woking
$End

$Pattern  Object_on_strip_of_chanche_the_band : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Object         : Object                     NoChange Erase
  rel_1_The_automobile : The_automobile_MECHANICAL  NoChange NoChange
  rel_2_The_automobile : The_automobile_ACS         Keep     NoChange
$Time = Time
$Body
rel_3_Object
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Passed_way >=
      rel_3_Object.A_place_of_detection
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively8
  first

  Convert_begin
    A_condition            set Passively10
    Object_speed           set rel_3_Object.Speed
    Object_distance        set rel_3_Object.Distance
    Object_Interval        set rel_3_Object.Interval
$End

$Pattern  Manoeuvre13 : rule
$Parameters
  Time            : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.A_condition = Passively10 or
    rel_1_The_automobile.A_condition = Passively14] and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_rule
    A_condition            set Passively8
$End

$Pattern  Manoeuvre14 : rule
$Parameters
  Time            : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  NoChange
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.A_condition = Passively10 or
    rel_1_The_automobile.A_condition = Passively14] and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 > Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_rule
    A_condition            set Passively8
$End

$Pattern  Manoeuvre15 : rule
$Parameters
  Time            : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.A_condition = Passively10 or
    rel_1_The_automobile.A_condition = Passively14] and
    rel_1_The_automobile.Object_Interval > 3.0 and
    rel_1_The_automobile.Object_Interval <  3.0 * -1.0
  first

  Convert_rule
    A_condition            set Passively8
$End

$Pattern  Manoeuvre16 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.A_condition = Passively10 or
    rel_1_The_automobile.A_condition = Passively12] and
    rel_1_The_automobile.Turn_direction = Left and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Turn_direction         set Right

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre17 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.A_condition = Passively10 or
    rel_1_The_automobile.A_condition = Passively14] and
    rel_1_The_automobile.Turn_direction = Right and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Turn_direction         set Left

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre18 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively10 and
    rel_1_The_automobile.Turn_direction = Left and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 > Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Turn_direction         set Right

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre19 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.A_condition = Passively10 or
    rel_1_The_automobile.A_condition = Passively14] and
    rel_1_The_automobile.Turn_direction = Right and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 > Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Turn_direction         set Left

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre20 : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    [rel_1_The_automobile.A_condition = Passively10 or
    rel_1_The_automobile.A_condition = Passively12] and
    rel_1_The_automobile.Turn_direction = Left and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Turn_direction         set Right

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre21 : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively10 and
    rel_1_The_automobile.Turn_direction = Right and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Turn_direction         set Left

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre22 : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively10 and
    rel_1_The_automobile.Turn_direction = Left and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Turn_direction         set Right

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre23 : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively10 and
    rel_1_The_automobile.Turn_direction = Right and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Turn_direction         set Left

  Convert_end
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre24 : rule
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.An_attribute = The_interdiction_change_the_band and
    [rel_1_The_automobile.Vision_of_a_sign = I_see or
    rel_1_The_automobile.Vision_of_a_sign = Passed_by] and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = Second and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_rule
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre24_1 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = Second and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively8
    Turn_direction         set Right
    A_rudder               set Woking

$End

$Pattern  Manoeuvre25 : rule
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.An_attribute = The_interdiction_change_the_band and
    [rel_1_The_automobile.Vision_of_a_sign = I_see or
    rel_1_The_automobile.Vision_of_a_sign = Passed_by] and
    rel_1_The_automobile.A_counter_movement = No and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = Second and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_rule
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre25_1 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.A_counter_movement = No and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = Second and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively8
    Turn_direction         set Right
    A_rudder               set Woking
$End

$Pattern  Manoeuvre26 : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = Second and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively9
    Turn_direction         set Right
    A_rudder               set Woking
$End

$Pattern  Manoeuvre27 : operation
$Parameters
  Time            : such_as Emergency_half_time
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Emergency_half_time /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = Second and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively7
    Turn_direction         set Right
    A_rudder               set Woking
$End

$Pattern  Manoeuvre28 : rule
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.An_attribute = The_interdiction_overtaking and
    [rel_1_The_automobile.Vision_of_a_sign = I_see or
    rel_1_The_automobile.Vision_of_a_sign = Passed_by] and
    rel_1_The_automobile.A_counter_movement = Yes and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = Second and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_rule
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre28_1 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.A_counter_movement = Yes and
    rel_1_The_automobile.Passing_strips = 2 and
    rel_1_The_automobile.A_strip_from_the_right = Second and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively11
    Turn_direction         set Left
    A_rudder               set Woking
$End

$Pattern  Manoeuvre29 : rule
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.An_attribute = The_interdiction_overtaking and
    [rel_1_The_automobile.Vision_of_a_sign = I_see or
    rel_1_The_automobile.Vision_of_a_sign = Passed_by] and
    rel_1_The_automobile.A_counter_movement = Yes and
    rel_1_The_automobile.Passing_strips = 1  and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_rule
    A_condition            set Passively1
    A_rudder               set Is_switched_off
$End

$Pattern  Manoeuvre29_1 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.A_counter_movement = Yes and
    rel_1_The_automobile.Passing_strips = 1  and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively11
    Turn_direction         set Left
    A_rudder               set Woking
$End

$Pattern  Object_on_a_counter_strip : operation
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_3_Object         : Object                     NoChange Erase
  rel_1_The_automobile : The_automobile_MECHANICAL  NoChange NoChange
  rel_2_The_automobile : The_automobile_ACS         Keep     NoChange
$Time = Time
$Body
rel_3_Object
  Choice NoCheck
  first

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Passed_way >= rel_3_Object.A_place_of_detection
  first

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.A_condition = Passively11
  first

  Convert_begin
    A_condition            set Passively12
    Object_speed           set rel_3_Object.Speed
    Object_distance        set rel_3_Object.Distance
    Object_Interval        set rel_3_Object.Interval
$End

$Pattern  Manoeuvre30 : rule
$Parameters
  Time            : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS           Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively12 and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_rule
    A_condition            set Passively11
$End

$Pattern  Manoeuvre31 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively11
  first

  Convert_begin
    Turn_direction         set Right

  Convert_end
    A_condition            set Passively13
    A_rudder               set Is_switched_off

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

$End

$Pattern  Manoeuvre32 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         NoChange Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep     NoChange
$Time = (rel_1_The_automobile.Object_distance + 20.0) /
        (rel_2_The_automobile.Speed - rel_1_The_automobile.Object_speed) / 1000
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively13 and
    [rel_1_The_automobile.Movement = Is_accelerated or
    rel_1_The_automobile.Movement = A_const_speed]
  first

  Convert_end
    A_condition            set Passively14

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Passed_way             set rel_2_The_automobile.Passed_way +
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 + 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Passed_after_a_sign    set rel_2_The_automobile.Passed_after_a_sign +
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 + 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    From_a_beginning_of_section  set rel_2_The_automobile.From_a_beginning_of_section +
                                     rel_2_The_automobile.Speed *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed)
                                     * 0.00028 * 3600 + 0.0005 *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     3600 * 3600 * rel_2_The_automobile.Acceleration
    From_a_beginning_of_turn   set rel_2_The_automobile.From_a_beginning_of_turn +
                                   rel_2_The_automobile.Speed *
                                   (rel_1_The_automobile.Object_distance
                                   + 20.0)/1000/(rel_2_The_automobile.Speed -
                                   rel_1_The_automobile.Object_speed)
                                   * 0.00028 * 3600 + 0.0005 *
                                   (rel_1_The_automobile.Object_distance
                                   + 20.0)/1000/(rel_2_The_automobile.Speed -
                                   rel_1_The_automobile.Object_speed) *
                                   (rel_1_The_automobile.Object_distance
                                   + 20.0)/1000/(rel_2_The_automobile.Speed -
                                   rel_1_The_automobile.Object_speed) *
                                   3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_sign   set rel_2_The_automobile.Distance_before_sign -
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 - 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_turn   set rel_2_The_automobile.Distance_before_turn -
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 - 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_crossing set rel_2_The_automobile.Distance_before_crossing -
                                 rel_2_The_automobile.Speed *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed)
                                 * 0.00028 * 3600 - 0.0005 *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 3600 * 3600 * rel_2_The_automobile.Acceleration
    Memory_before_crossing   set rel_2_The_automobile.Memory_before_crossing -
                                 rel_2_The_automobile.Speed *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed)
                                 * 0.00028 * 3600 - 0.0005 *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 3600 * 3600 * rel_2_The_automobile.Acceleration
    Speed                  set rel_2_The_automobile.Speed +
                               rel_2_The_automobile.Acceleration *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 3.6 * 3600
    Consumption            set rel_2_The_automobile.Consumption + 0.0000118 *
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) +
                               0.0000000011 * rel_2_The_automobile.Speed *
                               rel_2_The_automobile.Speed *
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               + 0.0000647 * rel_2_The_automobile.Speed *
                               rel_2_The_automobile.Acceleration *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
$End

$Pattern  Manoeuvre33 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         NoChange Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep     NoChange
$Time = (rel_1_The_automobile.Object_distance + 20.0) / 
        (rel_2_The_automobile.Speed - rel_1_The_automobile.Object_speed) / 1000
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively13 and
    rel_1_The_automobile.Movement = Is_braked
  first

  Convert_end
    A_condition            set Passively14

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Passed_way             set rel_2_The_automobile.Passed_way +
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 - 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Passed_after_a_sign    set rel_2_The_automobile.Passed_after_a_sign +
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 - 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    From_a_beginning_of_section  set rel_2_The_automobile.From_a_beginning_of_section +
                                     rel_2_The_automobile.Speed *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed)
                                     * 0.00028 * 3600 - 0.0005 *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     3600 * 3600 * rel_2_The_automobile.Acceleration
    From_a_beginning_of_turn     set rel_2_The_automobile.From_a_beginning_of_turn +
                                     rel_2_The_automobile.Speed *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed)
                                     * 0.00028 * 3600 - 0.0005 *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_sign   set rel_2_The_automobile.Distance_before_sign -
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 + 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_turn   set rel_2_The_automobile.Distance_before_turn -
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 + 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_crossing set rel_2_The_automobile.Distance_before_crossing -
                                 rel_2_The_automobile.Speed *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed)
                                 * 0.00028 * 3600 + 0.0005 *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 3600 * 3600 * rel_2_The_automobile.Acceleration
    Memory_before_crossing   set rel_2_The_automobile.Memory_before_crossing -
                                 rel_2_The_automobile.Speed *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed)
                                 * 0.00028 * 3600 + 0.0005 *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 3600 * 3600 * rel_2_The_automobile.Acceleration
    Speed                  set rel_2_The_automobile.Speed -
                               rel_2_The_automobile.Acceleration *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) * 3.6 * 3600
    Consumption            set rel_2_The_automobile.Consumption + 0.0000118 *
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
$End

$Pattern  Manoeuvre34 : operation
$Parameters
  Time            : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = (rel_1_The_automobile.Object_distance + 20.0) /
        (rel_2_The_automobile.Speed - rel_1_The_automobile.Object_speed) / 1000
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Passed_way             set rel_2_The_automobile.Passed_way +
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 - 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Passed_after_a_sign    set rel_2_The_automobile.Passed_after_a_sign +
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 - 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    From_a_beginning_of_section  set rel_2_The_automobile.From_a_beginning_of_section +
                                     rel_2_The_automobile.Speed *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed)
                                     * 0.00028 * 3600 - 0.0005 *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     3600 * 3600 * rel_2_The_automobile.Acceleration
    From_a_beginning_of_turn     set rel_2_The_automobile.From_a_beginning_of_turn +
                                     rel_2_The_automobile.Speed *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed)
                                     * 0.00028 * 3600 - 0.0005 *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_sign   set rel_2_The_automobile.Distance_before_sign -
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 + 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_turn   set rel_2_The_automobile.Distance_before_turn -
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 + 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_crossing   set rel_2_The_automobile.Distance_before_crossing -
                                   rel_2_The_automobile.Speed *
                                   (rel_1_The_automobile.Object_distance
                                   + 20.0)/1000/(rel_2_The_automobile.Speed -
                                   rel_1_The_automobile.Object_speed)
                                   * 0.00028 * 3600 + 0.0005 *
                                   (rel_1_The_automobile.Object_distance
                                   + 20.0)/1000/(rel_2_The_automobile.Speed -
                                   rel_1_The_automobile.Object_speed) *
                                   (rel_1_The_automobile.Object_distance
                                   + 20.0)/1000/(rel_2_The_automobile.Speed -
                                   rel_1_The_automobile.Object_speed) *
                                   3600 * 3600 * rel_2_The_automobile.Acceleration
    Memory_before_crossing     set rel_2_The_automobile.Memory_before_crossing -
                                   rel_2_The_automobile.Speed *
                                   (rel_1_The_automobile.Object_distance
                                   + 20.0)/1000/(rel_2_The_automobile.Speed -
                                   rel_1_The_automobile.Object_speed)
                                   * 0.00028 * 3600 + 0.0005 *
                                   (rel_1_The_automobile.Object_distance
                                   + 20.0)/1000/(rel_2_The_automobile.Speed -
                                   rel_1_The_automobile.Object_speed) *
                                   (rel_1_The_automobile.Object_distance
                                   + 20.0)/1000/(rel_2_The_automobile.Speed -
                                   rel_1_The_automobile.Object_speed) *
                                   3600 * 3600 * rel_2_The_automobile.Acceleration
    Speed                  set rel_2_The_automobile.Speed -
                               rel_2_The_automobile.Acceleration *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) * 3.6 * 3600
    Consumption            set rel_2_The_automobile.Consumption + 0.0000118 *
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)

  Convert_end
    Acceleration           set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively14 and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Movement               set Is_braked

  Convert_end
    Movement               set A_const_speed
$End

$Pattern  Manoeuvre35 : operation
$Parameters
  Time            : real = 0.0
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
  rel_1_The_automobile : The_automobile_ACS         Keep   Keep
$Time = (rel_1_The_automobile.Object_distance + 20.0) /
        (rel_2_The_automobile.Speed - rel_1_The_automobile.Object_speed) / 1000
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Passed_way             set rel_2_The_automobile.Passed_way +
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 - 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Passed_after_a_sign    set rel_2_The_automobile.Passed_after_a_sign +
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 - 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    From_a_beginning_of_section  set rel_2_The_automobile.From_a_beginning_of_section +
                                     rel_2_The_automobile.Speed *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed)
                                     * 0.00028 * 3600 - 0.0005 *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     3600 * 3600 * rel_2_The_automobile.Acceleration
    From_a_beginning_of_turn     set rel_2_The_automobile.From_a_beginning_of_turn +
                                     rel_2_The_automobile.Speed *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed)
                                     * 0.00028 * 3600 - 0.0005 *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     (rel_1_The_automobile.Object_distance
                                     + 20.0)/1000/(rel_2_The_automobile.Speed -
                                     rel_1_The_automobile.Object_speed) *
                                     3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_sign   set rel_2_The_automobile.Distance_before_sign -
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 + 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_turn   set rel_2_The_automobile.Distance_before_turn -
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 0.00028 * 3600 + 0.0005 *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed) *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Distance_before_crossing set rel_2_The_automobile.Distance_before_crossing -
                                 rel_2_The_automobile.Speed *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed)
                                 * 0.00028 * 3600 + 0.0005 *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 3600 * 3600 * rel_2_The_automobile.Acceleration
    Memory_before_crossing   set rel_2_The_automobile.Memory_before_crossing -
                                 rel_2_The_automobile.Speed *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed)
                                 * 0.00028 * 3600 + 0.0005 *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 (rel_1_The_automobile.Object_distance
                                 + 20.0)/1000/(rel_2_The_automobile.Speed -
                                 rel_1_The_automobile.Object_speed) *
                                 3600 * 3600 * rel_2_The_automobile.Acceleration
    Speed                  set rel_2_The_automobile.Speed -
                               rel_2_The_automobile.Acceleration *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)
                               * 3.6 * 3600
    Consumption            set rel_2_The_automobile.Consumption + 0.0000118 *
                               rel_2_The_automobile.Speed *
                               (rel_1_The_automobile.Object_distance
                               + 20.0)/1000/(rel_2_The_automobile.Speed -
                               rel_1_The_automobile.Object_speed)

  Convert_end
    Acceleration           set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively14 and
    rel_1_The_automobile.Turn_direction = Right and
    rel_1_The_automobile.Object_speed > rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance < 0.0 and
    rel_1_The_automobile.Object_distance * -1.0 <= Safe_distance and
    rel_1_The_automobile.Object_Interval < 3.0 and
    rel_1_The_automobile.Object_Interval >  3.0 * -1.0
  first

  Convert_begin
    Movement               set Is_braked

  Convert_end
    Movement               set A_const_speed
$End

$Pattern  Manoeuvre36 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep   NoChange
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep   Keep
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively14
  first

  Convert_begin
    A_condition            set Passively8
    Turn_direction         set Right
    A_rudder               set Woking

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0
$End

$Pattern  Manoeuvre37 : operation
$Parameters
  Time            : such_as Time_half_manoeuvre
$Relevant_resources
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  Keep
  rel_1_The_automobile : The_automobile_ACS         Keep  NoChange
$Time = Time
$Body
rel_2_The_automobile
  Choice NoCheck
  first

  Convert_begin
    Angle_of_wheels        set An_accepted_strip * 60 / 2 / Time_half_manoeuvre /
                               rel_2_The_automobile.Speed / 1000

  Convert_end
    Angle_of_wheels        set 0.0

rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively6 and
    rel_1_The_automobile.A_counter_movement = Yes and
    rel_1_The_automobile.Passing_strips = 1 and
    rel_1_The_automobile.A_strip_from_the_right = First and
    rel_1_The_automobile.Object_speed < rel_2_The_automobile.Speed and
    rel_1_The_automobile.Object_distance > 0.0 and
    rel_1_The_automobile.Object_distance > Safe_distance and
    rel_1_The_automobile.Object_Interval < 1.5 and
    rel_1_The_automobile.Object_Interval >  1.5 * -1.0
  first

  Convert_begin
    A_condition            set Passively8
    Turn_direction         set Right
    A_rudder               set Woking

$End

$Pattern  An_optimum_movement_with_acceleration : operation
$Parameters
  Time  : real = 0.00028
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep  Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep  NoChange
$Time = Time
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.Movement = Is_accelerated and
    rel_1_The_automobile.A_condition = Passively1
  first

  Convert_begin
    A_condition            set Actively

  Convert_end
    A_condition            set Passively

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Acceleration > 0.0
  first

  Convert_begin
    Passed_way             set rel_2_The_automobile.Passed_way +
                               rel_2_The_automobile.Speed * Time * 0.00028 * 3600 +
                               0.0005 * Time * Time *
                               3600 * 3600 * rel_2_The_automobile.Acceleration
    Passed_after_a_sign    set rel_2_The_automobile.Passed_after_a_sign +
                               rel_2_The_automobile.Speed * Time * 3600 * 0.00028 +
                               0.0005 * Time * Time * 3600 * 3600 *
                               rel_2_The_automobile.Acceleration
    From_a_beginning_of_section  set rel_2_The_automobile.From_a_beginning_of_section +
                                     rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                                     + 0.0005 * Time * Time * 3600 * 3600 *
                                     rel_2_The_automobile.Acceleration
    From_a_beginning_of_turn     set rel_2_The_automobile.From_a_beginning_of_turn +
                                     rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                                     + 0.0005 * Time * Time * 3600 * 3600 *
                                     rel_2_The_automobile.Acceleration
    Distance_before_sign   set rel_2_The_automobile.Distance_before_sign -
                               rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                               - 0.0005 * Time * Time * 3600 * 3600 *
                               rel_2_The_automobile.Acceleration
    Distance_before_turn   set rel_2_The_automobile.Distance_before_turn -
                               rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                               - 0.0005 * Time * Time * 3600 * 3600 *
                               rel_2_The_automobile.Acceleration
    Distance_before_crossing   set rel_2_The_automobile.Distance_before_crossing -
                                   rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                                   - 0.0005 * Time * Time * 3600 * 3600 *
                                   rel_2_The_automobile.Acceleration
    Memory_before_crossing set rel_2_The_automobile.Memory_before_crossing -
                               rel_2_The_automobile.Speed * Time * 0.00028 * 3600
                               - 0.0005 * Time * Time * 3600 * 3600 *
                               rel_2_The_automobile.Acceleration
    Speed                  set rel_2_The_automobile.Speed +
                               rel_2_The_automobile.Acceleration * Time * 3.6 * 3600
    Acceleration           set Ordinate_of_zero/Coefficient_of_division -
                               Tangent_of_the_diagram * rel_2_The_automobile.Speed /
                               Coefficient_of_division
    Consumption            set rel_2_The_automobile.Consumption + 0.0000118 *
                               rel_2_The_automobile.Speed * Time +
                               0.0000000011 * rel_2_The_automobile.Speed *
                               rel_2_The_automobile.Speed *
                               rel_2_The_automobile.Speed * Time +
                               0.0000647 * rel_2_The_automobile.Speed *
                               rel_2_The_automobile.Acceleration * Time
$End

$Pattern  Optimum_1 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_highway = The_end
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed < 55.0
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero/Coefficient_of_division -
                               Tangent_of_the_diagram *
                               rel_2_The_automobile.Speed/Coefficient_of_division
$End

$Pattern  Optimum_2 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    [rel_1_The_automobile.An_attribute = The_information or
    rel_1_The_automobile.An_attribute = Restriction_min] and
    rel_1_The_automobile.A_highway = The_end
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign > 0.0 and
    rel_2_The_automobile.Speed >= 55.0
  first

  Convert_rule
    Speed                  set 55.0
    Acceleration           set 0.0
$End

$Pattern  Optimum_3 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign <> I_see and
    rel_1_The_automobile.A_highway = The_end
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign <= 0.0 and
    rel_2_The_automobile.Speed >= 55.0
  first

  Convert_rule
    Speed                  set 55.0
    Acceleration           set 0.0
$End

$Pattern  Optimum_4 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.An_attribute <> Restriction_max and
    rel_1_The_automobile.An_attribute <> Recommended and
    rel_1_The_automobile.A_highway = A_beginning
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Acceleration >= 0.0 and
    rel_2_The_automobile.Speed < 55.0
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero/Coefficient_of_division -
                               Tangent_of_the_diagram *
                               rel_2_The_automobile.Speed/Coefficient_of_division
$End

$Pattern  Optimum_5 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = I_do_not_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.A_highway = A_beginning
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Acceleration >= 0.0 and
    rel_2_The_automobile.Speed < 55.0
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero/Coefficient_of_division -
                               Tangent_of_the_diagram *
                               rel_2_The_automobile.Speed/Coefficient_of_division
$End

$Pattern  Optimum_6 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    [rel_1_The_automobile.An_attribute = The_information or
    rel_1_The_automobile.An_attribute = Restriction_min] and
    rel_1_The_automobile.A_highway = A_beginning
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign > 0.0 and
    rel_2_The_automobile.Speed >= 55.0
  first

  Convert_rule
    Speed                  set 55.0
    Acceleration           set 0.0
$End

$Pattern  Optimum_7 : rule
$Parameters
  Time      : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.Vision_of_a_sign <> I_see and
    rel_1_The_automobile.A_highway = A_beginning
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set A_const_speed

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign <= 0.0 and
    rel_2_The_automobile.Speed >= 55.0
  first

  Convert_rule
    Speed                  set 55.0
    Acceleration           set 0.0
$End

$Pattern  Optimum_8 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = I_see and
    rel_1_The_automobile.A_section_type = Normal and
    rel_1_The_automobile.Vision_of_turn = I_do_not_see and
    rel_1_The_automobile.An_attribute = Restriction_min
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice NoCheck
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero/Coefficient_of_division -
                               Tangent_of_the_diagram *
                               rel_2_The_automobile.Speed/Coefficient_of_division
$End

$Pattern  Optimum_9 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_kind_of_a_sign = A_highway and
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign = Passed_by and
    rel_1_The_automobile.An_attribute = Recommended
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Distance_before_sign <= 0.0 and
    rel_2_The_automobile.Speed < rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero/Coefficient_of_division -
                               Tangent_of_the_diagram *
                               rel_2_The_automobile.Speed/Coefficient_of_division
$End

$Pattern  Optimum_10 : rule
$Parameters
  Time         : real = 0.0
$Relevant_resources
  rel_1_The_automobile : The_automobile_ACS         Keep
  rel_2_The_automobile : The_automobile_MECHANICAL  Keep
$Body
rel_1_The_automobile
  Choice from
    rel_1_The_automobile.A_condition = Passively and
    rel_1_The_automobile.Vision_of_a_sign <> I_do_not_see and
    rel_1_The_automobile.An_attribute = Recommended
  first

  Convert_rule
    A_condition            set Passively1
    Movement               set Is_accelerated

rel_2_The_automobile
  Choice from
    rel_2_The_automobile.Speed < rel_1_The_automobile.The_information_on_speed
  first

  Convert_rule
    Acceleration           set Ordinate_of_zero/Coefficient_of_division -
                               Tangent_of_the_diagram *
                               rel_2_The_automobile.Speed/Coefficient_of_division
$End }

