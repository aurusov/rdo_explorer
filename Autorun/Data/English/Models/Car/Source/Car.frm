$Frame  Frame_1
$Back_picture = <0 0 100> {780  505} carfon_e
Show
  bitmap [5, 85, povor_e, povor1m]
  bitmap [594, 209, znak_e, znak1m] 
  text[494, 45, 80, 20, transparent, <255 0 0>, Time_now]
  text[224, 11, 80, 20, transparent, <255 0 0>, The_automobile_MECHANICAL1.Passed_way]
  text[224, 45, 80, 20, transparent, <255 0 0>, The_automobile_MECHANICAL1.Speed]
  text[494, 11, 80, 20, transparent, <255 0 0>, The_automobile_MECHANICAL1.Acceleration]
  text[442, 350, 80, 20, transparent, <255 255 0>, The_automobile_MECHANICAL1.Distance_before_sign]
  text[442, 374, 80, 20, transparent, <255 255 0>, The_automobile_MECHANICAL1.Passed_after_a_sign]
  text[442, 399, 80, 20, transparent, <255 255 0>, The_automobile_MECHANICAL1.Distance_before_turn]
  text[442, 424, 80, 20, transparent, <255 255 0>, The_automobile_MECHANICAL1.From_a_beginning_of_turn]
  text[442, 447, 80, 20, transparent, <255 255 0>, The_automobile_MECHANICAL1.From_a_beginning_of_section]
  text[118, 249, 80, 20, transparent, <255 38 147>, The_automobile_ACS1.Turn_radius]
  text[118, 272, 80, 20, transparent, <255 38 147>,  The_automobile_MECHANICAL1.Angle_of_wheels]
  text[150, 396, 80, 20, transparent, <255 38 147>, The_automobile_ACS1.Vibration]
  text[153, 427, 80, 20, transparent, <255 38 147>,  The_automobile_ACS1.Sliding]
  text[155, 455, 80, 20, transparent, <255 38 147>, The_automobile_ACS1.Slope]
  text[644, 365, 80, 20, transparent, <255 38 147>,  The_automobile_ACS1.A_zone_of_action]
  text[644, 400, 80, 20, transparent, <255 38 147>,  The_automobile_ACS1.The_information_on_speed]
     
Show_if  The_automobile_ACS1.Movement = A_const_speed
  text[643, 440, 180, 20, transparent, <255 255 0>, '   a const. speed   ']
Show_if The_automobile_ACS1.Movement = Is_accelerated
  text[643, 440, 150, 20, transparent, <0 255 0>, '     is accelerated    ']
Show_if  The_automobile_ACS1.Movement = Is_braked
  text[643, 440, 150, 20, transparent, <255 0 0>, '     is braked    ']
Show_if The_automobile_ACS1.Movement = Is_urgently_braked
  text[643, 440, 150, 20, transparent, <255 0 0>, '     extraordinary    ']
Show_if The_automobile_ACS1.Vision_of_turn = I_see
  text[14, 131, 180, 20, transparent, <0 255 255>,  '     the turn is seen    ']
Show_if The_automobile_ACS1.Vision_of_turn = I_do_not_see
  text[14, 131, 180, 20, transparent, <255 0 128>, '   the turn is not seen   ']
Show_if The_automobile_ACS1.Vision_of_turn = I_do_not_see1
  text[14, 131, 180, 20, transparent, <255 0 128>, '   the turn is not seen   ']
Show_if The_automobile_ACS1.Vision_of_turn = Passed_by
  text[14, 111, 200, 20, transparent, <255 0 0>, ' working of the speed ']
Show_if The_automobile_ACS1.A_rudder = Is_switched_off
  text[14, 166, 150, 20, transparent, <255 0 128>,  '     a rudder is switched off    ']
Show_if The_automobile_ACS1.A_rudder = Is_switched_on
  text[14, 166, 150, 20, transparent, <0 255 0>, '     a rudder is included     ']
Show_if The_automobile_ACS1.A_rudder = Woking
  text[14, 166, 200, 20, transparent, <255 0 0>,  '  rudder working   ']
Show_if The_automobile_ACS1.A_rudder = Woking1
  text[14, 166, 200, 20, transparent, <255 0 0>,  '  rudder working   ']
Show_if The_automobile_ACS1.Turn_direction = Left
  text[14, 202, 180, 20, transparent, <0 255 255>,  '  left turn ']
Show_if The_automobile_ACS1.Turn_direction = Right
  text[14, 202, 180, 20, transparent, <0 255 255>, 'right turn ']
Show_if The_automobile_ACS1.Turn_direction = Is_absent
  text[14, 202, 200, 20, transparent, <255 0 128>,  ' the turn is absent  ']
Show_if The_automobile_ACS1.A_highway = A_beginning
  text[317, 29, 200, 20, transparent, <255 0 0>,  '  a highway ']
Show_if The_automobile_ACS1.A_highway = The_end
  text[317, 29, 200, 20, transparent, <255 0 0>, ' The end of a highway ']
Show_if The_automobile_ACS1.A_section_type = Special
  text[128, 355, 100, 20, transparent, <255 255 255>, '       special         ']
Show_if The_automobile_ACS1.A_section_type = Normal
  text[128, 355, 150, 20, transparent, <255 255 255>, '      normal      ']
Show_if The_automobile_ACS1.A_section_type = Normal1
  text[128, 355, 150, 20, transparent, <255 255 255>, '      normal      ']
Show_if The_automobile_ACS1.Vision_of_a_sign = I_see
  text[608, 254, 180, 20, transparent, <255 0 0>, '    the sign is seen    ']
Show_if The_automobile_ACS1.Vision_of_a_sign = I_do_not_see
  text[608, 254, 180, 20, transparent, <0 0 255>, '   the sign is not seen  ']
Show_if The_automobile_ACS1.Vision_of_a_sign = Passed_by
  text[608, 254, 180, 20, transparent, <0 255 0>, '   a sign passed   ']
Show_if The_automobile_ACS1.An_attribute = Restriction_max
  text[608, 286, 150, 20, transparent, <255 0 0>, ' restriction max ']
Show_if The_automobile_ACS1.An_attribute = Restriction_min
  text[608, 286, 150, 20, transparent, <0 0 255>, '  restriction min ']
Show_if The_automobile_ACS1.An_attribute = Recommended
  text[608, 286, 150, 20, transparent, <0 255 0>, '   recommendation   ']
Show_if The_automobile_ACS1.An_attribute = The_information
  text[608, 286, 150, 20, transparent, <0 255 255>, '    the information    ']

Show_if The_automobile_ACS1.Vision_of_a_sign = I_do_not_see
  bitmap[624, 87, zn11_e, zn1m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = Road_for_automobiles and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
 bitmap[624, 87, zn1, zn1m]

Show_if The_automobile_ACS1.A_kind_of_a_sign = A_highway and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
  bitmap[624, 87, zn2, zn2m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = The_end_of_a_highway and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
 bitmap[624, 87, zn3, zn2m]

Show_if The_automobile_ACS1.A_kind_of_a_sign = Restriction_of_the_max_speed and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see and
        The_automobile_ACS1.The_information_on_speed = 50.0
  bitmap[624, 87, zn41, zn4m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = Restriction_of_the_max_speed and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see and
        The_automobile_ACS1.The_information_on_speed = 60.0
  bitmap[624, 87, zn42, zn4m]

Show_if The_automobile_ACS1.A_kind_of_a_sign = Restriction_of_the_min_speed and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see and
        The_automobile_ACS1.The_information_on_speed = 60.0
  bitmap[624, 87, zn51, zn4m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = Restriction_of_the_min_speed and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see and
        The_automobile_ACS1.The_information_on_speed = 80.0
  bitmap[624, 87, zn52, zn4m]

Show_if The_automobile_ACS1.A_kind_of_a_sign = Recommended_speed and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see and
        The_automobile_ACS1.The_information_on_speed = 60.0
  bitmap[624, 87, zn61, zn6m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = Recommended_speed and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see and
        The_automobile_ACS1.The_information_on_speed = 50.0
  bitmap[624, 87, zn62, zn6m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = Recommended_speed and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see and
        The_automobile_ACS1.The_information_on_speed = 70.0
  bitmap[624, 87, zn63, zn6m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = A_slippery_road and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
  bitmap[624, 87, zn7, zn7m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = A_rough_road and
       The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
  bitmap[624, 87, zn71, zn7m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = A_brupt_descent and
       The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
  bitmap[624, 87, zn72, zn7m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = Dangerous_turn and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
  bitmap[624, 87, zn73, zn7m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = A_beginning_of_settlement_populated_area_60 and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
  bitmap[624, 87, zn81, zn8m]
Show_if The_automobile_ACS1.A_kind_of_a_sign = The_end_of_settlement_populated_area_60 and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
  bitmap[624, 87, zn82, zn8m]

Show_if The_automobile_ACS1.A_kind_of_a_sign = The_entrance_is_forbidden and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
 bitmap[624, 87, zn9, zn9m]

Show_if The_automobile_ACS1.A_kind_of_a_sign = Stop and
        The_automobile_ACS1.Vision_of_a_sign <> I_do_not_see
  bitmap[624, 87, zn10, zn10m]
$End

