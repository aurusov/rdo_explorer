$Constant
  Bottle_size : real = 0.066
  Conv_1_unit : real = 0.6071 {length / N_screen_pos}
  Conv_1_coef : real = 0.1087 {Bottle_size * N_screen_pos / number_of_bands / length}
  Conv_2_unit : real = 0.65   {length / N_screen_pos}
  Conv_2_coef : real = 0.0254 {Bottle_size * N_screen_pos / number_of_bands / length}
  Conv_3_unit : real = 0.6071 {length / N_screen_pos}
  Conv_3_coef : real = 0.1087 {Bottle_size * N_screen_pos / number_of_bands / length}
  Conv_4_unit : real = 0.6071 {length / N_screen_pos}
  Conv_4_coef : real = 0.1087 {Bottle_size * N_screen_pos / number_of_bands / length}
  Conv_5_unit : real = 0.65   {length / N_screen_pos}
  Conv_5_coef : real = 0.0254 {Bottle_size * N_screen_pos / number_of_bands / length}
  Conv_6_unit : real = 0.6071 {length / N_screen_pos}
  Conv_6_coef : real = 0.1087 {Bottle_size * N_screen_pos / number_of_bands / length}

  Smooth_time     : real    = 0.005
  Normal_quant    : integer = 440
  Normal_range    : integer = 30
  Min_120_80_time : real    = 0.002
$End

$Function If_LT : integer
$Type = algorithmic
$Parameters
  Comp_value  : real
$Body
  Calculate_if  Comp_value <  0.0  If_LT = 1
  Calculate_if  Comp_value >= 0.0  If_LT = 0
$End

$Function F_inter_distance : real
$Type = algorithmic
$Parameters
  This_capasity  : real
  Prev_capasity  : real
$Body
  Calculate_if  This_capasity < Prev_capasity  F_inter_distance = 0.002
  Calculate_if  This_capasity = Prev_capasity  F_inter_distance = 0.01
  Calculate_if  This_capasity > Prev_capasity  F_inter_distance =
    (Bottle_size * (This_capasity - Prev_capasity) {+
    This_capasity * 0.002}) / Prev_capasity * 1.0001
$End

$Function If_carry : integer
$Type = algorithmic
$Parameters
  Cur_quant  : integer
  add_value  : integer
$Body
  Calculate_if  Cur_quant <  10000  If_carry = 0
  Calculate_if  Cur_quant >= 10000  If_carry = add_value
$End

$Function Up_to_next : integer
$Type = algorithmic
$Parameters
  Value   : real
$Body
  Calculate_if Value > 0.0 and Value <=  1.0  Up_to_next = 1
  Calculate_if Value > 1.0 and Value <=  2.0  Up_to_next = 2
  Calculate_if Value > 2.0 and Value <=  3.0  Up_to_next = 3
  Calculate_if Value > 3.0 and Value <=  4.0  Up_to_next = 4
  Calculate_if Value > 4.0 and Value <=  5.0  Up_to_next = 5
  Calculate_if Value > 5.0 and Value <=  6.0  Up_to_next = 6
  Calculate_if Value > 6.0 and Value <=  7.0  Up_to_next = 7
  Calculate_if Value > 7.0 and Value <=  8.0  Up_to_next = 8
  Calculate_if Value > 8.0 and Value <=  9.0  Up_to_next = 9
  Calculate_if Value > 9.0 {and Value <= 10.0}  Up_to_next = 10
$End

$Function New_status : such_as a_Machine.status
$Type = algorithmic
$Parameters
  Time_to_problem  : real
  Old_status       : such_as a_Machine.status
$Body
  Calculate_if  Time_to_problem <= 0.0  New_status = broken
  Calculate_if  Time_to_problem  > 0.0  New_status = Old_status
$End

$Function New_position : real
$Type = algorithmic
$Parameters
  Calc_position  : real
  Length         : real
$Body
  Calculate_if Calc_position <  0.0  New_position = Calc_position + Length
  Calculate_if Calc_position >= 0.0  New_position = Calc_position
$End

{$Function Distance : real
$Type = algorithmic
$Parameters
  Calc_distance  : real
  Length         : real
$Body
  Calculate_if Calc_distance <= Length  Distance = Calc_distance
  Calculate_if Calc_distance >  Length  Distance = Calc_distance - Length
$End}

$Sequence Machine_A_problems : such_as a_Machine.problem_type_A
$Type = by_hist
$Body
  vis_sans_fin_forcee           11.5
  etoile_de_sortie_desac         0.2
  boite_couchee_sertisseuse      8.1
  secu_carter_prot_perrier       5.7
  ecran_de_prot_n6_ouvert        7.1
  def_porte_sertisseuse_dr      13.3
  ecran_de_prot_n2_ouvert        9.1
  ecran_de_prot_n4_ouvert        9.6
  securite_carte_volant_manu     0.9
  ecran_de_prot_n3_ouvert        8.8
  ecran_de_prot_n1_ouvert        4.3
  au_pupitre_arm_mach_soutir    {10.5}  0.0
  au_derriere_simonazzi         { 7.7}  0.0
  ecran_de_prot_n5_ouvert       { 3.1}  0.0
$End

$Function Machine_A_average_time : real
$Type = table
$Parameters
  Problem_number : such_as a_Machine.problem_type_A
$Body
{  vis_sans_fin_forcee        }     17.0
{  etoile_de_sortie_desac     }     52.0
{  boite_couchee_sertisseuse  }     59.0
{  secu_carter_prot_perrier   }     81.0
{  ecran_de_prot_n6_ouvert    }    231.0
{  def_porte_sertisseuse_dr   }    269.0
{  ecran_de_prot_n2_ouvert    }    385.0
{  ecran_de_prot_n4_ouvert    }    625.0
{  securite_carte_volant_manu }    648.0
{  ecran_de_prot_n3_ouvert    }    649.0
{  ecran_de_prot_n1_ouvert    }    763.0
{  au_pupitre_arm_mach_soutir }   1412.0
{  au_derriere_simonazzi      }   1900.0
{  ecran_de_prot_n5_ouvert    }   2239.0
$End

$Sequence Machine_A_solving_time : real
$Type = uniform
$End

$Sequence Machine_A_inter_time   : real
$Type = exponential
$End

$Sequence Machine_B_problems : such_as a_Machine.problem_type_B
$Type = by_hist
$Body
  defaut_bord_decoupe              5.0
  def_prod_et_decoupe_async_1     17.0
  double_decoupe                   7.0
  prod_tombe_apres_stat_grou      13.0
  prod_tombe_entree_machine       24.0
  def_prod_et_decoupe_async_2     11.0
  defaut_fardelage                 8.0
  prod_incor_chaine_pliage         4.0
  prod_tombe_chaine_separ          1.0
  def_limit_couple_barquet         7.0
  lubrification                    2.0
  thermique_disjoncte             { 1.0}  0.0
$End

$Function Machine_B_average_time : real
$Type = table
$Parameters
  Problem_number : such_as a_Machine.problem_type_B
$Body
{  defaut_bord_decoupe         }    25.0
{  def_prod_et_decoupe_async_1 }    34.0
{  double_decoupe              }    38.0
{  prod_tombe_apres_stat_grou  }    41.0
{  prod_tombe_entree_machine   }    41.0
{  def_prod_et_decoupe_async_2 }    51.0
{  defaut_fardelage            }    60.0
{  prod_incor_chaine_pliage    }   117.0
{  prod_tombe_chaine_separ     }   117.0
{  def_limit_couple_barquet    }   573.0
{  lubrification               }   952.0
{  thermique_disjoncte         }  3827.0
$End

$Sequence Machine_B_solving_time : real
$Type = uniform
$End

$Sequence Machine_B_inter_time   : real
$Type = exponential
$End
