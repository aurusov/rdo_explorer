$Constant
  �������_������� : real = 0.066
  ����_1_�������  : real = 0.6071 {����� / �����_���_������}
  ����_1_�������  : real = 0.1087 {�������_������� * �����_���_������ / ����������_����� / �����}
  ����_2_�������  : real = 0.65   {����� / �����_���_������}
  ����_2_�������  : real = 0.0254 {�������_������� * �����_���_������ / ����������_����� / �����}
  ����_3_�������  : real = 0.6071 {����� / �����_���_������}
  ����_3_�������  : real = 0.1087 {�������_������� * �����_���_������ / ����������_����� / �����}
  ����_4_�������  : real = 0.6071 {����� / �����_���_������}
  ����_4_�������  : real = 0.1087 {�������_������� * �����_���_������ / ����������_����� / �����}
  ����_5_�������  : real = 0.65   {����� / �����_���_������}
  ����_5_�������  : real = 0.0254 {�������_������� * �����_���_������ / ����������_����� / �����}
  ����_6_�������  : real = 0.6071 {����� / �����_���_������}
  ����_6_�������  : real = 0.1087 {�������_������� * �����_���_������ / ����������_����� / �����}

  �����_�����������     : real    = 0.005
  ����������_���������� : integer = 440
  ����������_��������   : integer = 30
  ���_�����_120_80      : real    = 0.002
$End

$Function ����_������ : integer
$Type = algorithmic
$Parameters
  ��������_���_���������  : real
$Body
  Calculate_if  ��������_���_��������� <  0.0  ����_������ = 1
  Calculate_if  ��������_���_��������� >= 0.0  ����_������ = 0
$End

$Function ����_�����_�����_��������� : real
$Type = algorithmic
$Parameters
  �������_������������������     : real
  ����������_������������������  : real
$Body
  Calculate_if  �������_������������������ < ����������_������������������  ����_�����_�����_��������� = 0.002
  Calculate_if  �������_������������������ = ����������_������������������  ����_�����_�����_��������� = 0.01
  Calculate_if  �������_������������������ > ����������_������������������  ����_�����_�����_��������� =
    (�������_������� * (�������_������������������ - ����������_������������������) {+
    �������_������������������ * 0.002}) / ����������_������������������ * 1.0001
$End

$Function ����_������� : integer
$Type = algorithmic
$Parameters
  �������_����������  : integer
  ��������_��������   : integer
$Body
  Calculate_if  �������_���������� <  10000  ����_������� = 0
  Calculate_if  �������_���������� >= 10000  ����_������� = ��������_��������
$End

$Function �����_��_������ : integer
$Type = algorithmic
$Parameters
  ��������   : real
$Body
  Calculate_if �������� > 0.0 and �������� <=  1.0  �����_��_������ = 1
  Calculate_if �������� > 1.0 and �������� <=  2.0  �����_��_������ = 2
  Calculate_if �������� > 2.0 and �������� <=  3.0  �����_��_������ = 3
  Calculate_if �������� > 3.0 and �������� <=  4.0  �����_��_������ = 4
  Calculate_if �������� > 4.0 and �������� <=  5.0  �����_��_������ = 5
  Calculate_if �������� > 5.0 and �������� <=  6.0  �����_��_������ = 6
  Calculate_if �������� > 6.0 and �������� <=  7.0  �����_��_������ = 7
  Calculate_if �������� > 7.0 and �������� <=  8.0  �����_��_������ = 8
  Calculate_if �������� > 8.0 and �������� <=  9.0  �����_��_������ = 9
  Calculate_if �������� > 9.0 {and �������� <= 10.0}  �����_��_������ = 10
$End

$Function �����_������ : such_as ������.������
$Type = algorithmic
$Parameters
  �����_��_����  : real
  ������_������  : such_as ������.������
$Body
  Calculate_if  �����_��_���� <= 0.0  �����_������ = �������_����
  Calculate_if  �����_��_����  > 0.0  �����_������ = ������_������
$End

$Function �����_��������� : real
$Type = algorithmic
$Parameters
  ������_���������  : real
  �����             : real
$Body
  Calculate_if ������_��������� <  0.0  �����_��������� = ������_��������� + �����
  Calculate_if ������_��������� >= 0.0  �����_��������� = ������_���������
$End

{$Function ���������� : real
$Type = algorithmic
$Parameters
  ������_����������  : real
  �����              : real
$Body
  Calculate_if ������_���������� <= �����  ���������� = ������_����������
  Calculate_if ������_���������� >  �����  ���������� = ������_���������� - �����
$End}

$Sequence ������_�_���� : such_as ������.����_����_�
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

$Function ������_�_�������_����� : real
$Type = table
$Parameters
  ���_���� : such_as ������.����_����_�
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

$Sequence ������_�_�����_���������� : real
$Type = uniform
$End

$Sequence ������_�_�����_�����   : real
$Type = exponential
$End

$Sequence ������_�_���� : such_as ������.����_����_�
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

$Function ������_�_�������_����� : real
$Type = table
$Parameters
  ���_���� : such_as ������.����_����_�
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

$Sequence ������_�_�����_���������� : real
$Type = uniform
$End

$Sequence ������_�_�����_�����   : real
$Type = exponential
$End

