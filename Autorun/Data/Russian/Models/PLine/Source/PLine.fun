$Constant
  Диаметр_бутылки : real = 0.066
  Конв_1_единица  : real = 0.6071 {Длина / Колич_поз_экрана}
  Конв_1_коэффиц  : real = 0.1087 {Диаметр_бутылки * Колич_поз_экрана / Количество_рядов / Длина}
  Конв_2_единица  : real = 0.65   {Длина / Колич_поз_экрана}
  Конв_2_коэффиц  : real = 0.0254 {Диаметр_бутылки * Колич_поз_экрана / Количество_рядов / Длина}
  Конв_3_единица  : real = 0.6071 {Длина / Колич_поз_экрана}
  Конв_3_коэффиц  : real = 0.1087 {Диаметр_бутылки * Колич_поз_экрана / Количество_рядов / Длина}
  Конв_4_единица  : real = 0.6071 {Длина / Колич_поз_экрана}
  Конв_4_коэффиц  : real = 0.1087 {Диаметр_бутылки * Колич_поз_экрана / Количество_рядов / Длина}
  Конв_5_единица  : real = 0.65   {Длина / Колич_поз_экрана}
  Конв_5_коэффиц  : real = 0.0254 {Диаметр_бутылки * Колич_поз_экрана / Количество_рядов / Длина}
  Конв_6_единица  : real = 0.6071 {Длина / Колич_поз_экрана}
  Конв_6_коэффиц  : real = 0.1087 {Диаметр_бутылки * Колич_поз_экрана / Количество_рядов / Длина}

  Время_сглаживания     : real    = 0.005
  Нормальное_количество : integer = 440
  Нормальный_диапазон   : integer = 30
  Мин_время_120_80      : real    = 0.002
$End

$Function Если_меньше : integer
$Type = algorithmic
$Parameters
  Значение_для_сравнения  : real
$Body
  Calculate_if  Значение_для_сравнения <  0.0  Если_меньше = 1
  Calculate_if  Значение_для_сравнения >= 0.0  Если_меньше = 0
$End

$Function Функ_Расст_между_бутылками : real
$Type = algorithmic
$Parameters
  Текущая_производительность     : real
  Предыдущая_производительность  : real
$Body
  Calculate_if  Текущая_производительность < Предыдущая_производительность  Функ_Расст_между_бутылками = 0.002
  Calculate_if  Текущая_производительность = Предыдущая_производительность  Функ_Расст_между_бутылками = 0.01
  Calculate_if  Текущая_производительность > Предыдущая_производительность  Функ_Расст_между_бутылками =
    (Диаметр_бутылки * (Текущая_производительность - Предыдущая_производительность) {+
    Текущая_производительность * 0.002}) / Предыдущая_производительность * 1.0001
$End

$Function Если_перенос : integer
$Type = algorithmic
$Parameters
  Текущее_количество  : integer
  Значение_добавить   : integer
$Body
  Calculate_if  Текущее_количество <  10000  Если_перенос = 0
  Calculate_if  Текущее_количество >= 10000  Если_перенос = Значение_добавить
$End

$Function Вверх_до_целого : integer
$Type = algorithmic
$Parameters
  Значение   : real
$Body
  Calculate_if Значение > 0.0 and Значение <=  1.0  Вверх_до_целого = 1
  Calculate_if Значение > 1.0 and Значение <=  2.0  Вверх_до_целого = 2
  Calculate_if Значение > 2.0 and Значение <=  3.0  Вверх_до_целого = 3
  Calculate_if Значение > 3.0 and Значение <=  4.0  Вверх_до_целого = 4
  Calculate_if Значение > 4.0 and Значение <=  5.0  Вверх_до_целого = 5
  Calculate_if Значение > 5.0 and Значение <=  6.0  Вверх_до_целого = 6
  Calculate_if Значение > 6.0 and Значение <=  7.0  Вверх_до_целого = 7
  Calculate_if Значение > 7.0 and Значение <=  8.0  Вверх_до_целого = 8
  Calculate_if Значение > 8.0 and Значение <=  9.0  Вверх_до_целого = 9
  Calculate_if Значение > 9.0 {and Значение <= 10.0}  Вверх_до_целого = 10
$End

$Function Новый_статус : such_as Машины.Статус
$Type = algorithmic
$Parameters
  Время_до_сбоя  : real
  Старый_статус  : such_as Машины.Статус
$Body
  Calculate_if  Время_до_сбоя <= 0.0  Новый_статус = поломка_сбой
  Calculate_if  Время_до_сбоя  > 0.0  Новый_статус = Старый_статус
$End

$Function Новое_положение : real
$Type = algorithmic
$Parameters
  Вычисл_положение  : real
  Длина             : real
$Body
  Calculate_if Вычисл_положение <  0.0  Новое_положение = Вычисл_положение + Длина
  Calculate_if Вычисл_положение >= 0.0  Новое_положение = Вычисл_положение
$End

{$Function Расстояние : real
$Type = algorithmic
$Parameters
  Вычисл_расстояние  : real
  Длина              : real
$Body
  Calculate_if Вычисл_расстояние <= Длина  Расстояние = Вычисл_расстояние
  Calculate_if Вычисл_расстояние >  Длина  Расстояние = Вычисл_расстояние - Длина
$End}

$Sequence Машина_А_сбои : such_as Машины.Сбои_типа_А
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

$Function Машина_А_среднее_время : real
$Type = table
$Parameters
  Вид_сбоя : such_as Машины.Сбои_типа_А
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

$Sequence Машина_А_время_устранения : real
$Type = uniform
$End

$Sequence Машина_А_время_между   : real
$Type = exponential
$End

$Sequence Машина_Б_сбои : such_as Машины.Сбои_типа_Б
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

$Function Машина_Б_среднее_время : real
$Type = table
$Parameters
  Вид_сбоя : such_as Машины.Сбои_типа_Б
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

$Sequence Машина_Б_время_устранения : real
$Type = uniform
$End

$Sequence Машина_Б_время_между   : real
$Type = exponential
$End

