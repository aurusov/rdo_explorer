$Pattern  Unused_generations_erasing_pat  : rule  {trace}
$Relevant_resources
  Common            : System          NoChange
  Individual        : An_individual   Erase

$Body
  Common
    Choice from Common.Generation_number > How_many_generations_to_keep
    first

  Individual
    Choice from Individual.Generation_number <= Common.Generation_number - How_many_generations_to_keep
    first
$End

$Pattern  Initial_generation_creating_pat  : rule  {trace}
$Relevant_resources
  Common      : System          Keep
  Individual  : An_individual   Create
$Body
  Common
    Choice from Common.Generation_number <= Number_of_generations and
                Common.Mode = Initialisation and
                Common.Counter < Common.Generation_size
    first
    Convert_rule
      Counter          set Common.Counter + 1

  Individual
    Convert_rule  trace
      Parameter_1         set Uniformly(0, 255)
      Parameter_2         set Uniformly(0, 255)
      Parameter_3         set Uniformly(0, 255)
      Parameter_4         set Uniformly(0, 255)
      Generation_number   set 1
      Individual_number   set Common.Counter
      Parent_1            set 0
      Parent_2            set 0
      Number_of_children  set 0
      Crossover_byte      set 0
      Crossover_bit       set 0
      Mutation_byte       set 0
      Mutation_bit        set 0
      Status              set not_considered
      FF_value            set -1.0
      Sum_before          set 0.0
      Sum_after           set 0.0
$End

$Pattern  End_of_initial_generation_creating_pat  : rule  {trace}
$Relevant_resources
  Common      : System         Keep
  Generation  : a_Generation   Create
$Body
  Common
    Choice from Common.Generation_number <= Number_of_generations and
                Common.Mode = Initialisation and
                Common.Counter = Common.Generation_size
    first
    Convert_rule
      Generation_number  set 1
      Mode             set FF_calculation
      Counter          set 0
      Counter_bit      set 0

  Generation
    Convert_rule  trace
      Number                set 1
      Size                  set Common.Generation_size
      Sum_of_FF_values      set 0.0
      Average_FF_value      set 0.0
      Minimum_FF_value      set 1.0e20
      Maximum_FF_value      set -1.0e20
      Number_of_crossovers  set 0
      Number_of_mutations   set 0
$End

$Pattern  FF_calculation_pat  : rule  {trace}
$Relevant_resources
  Common             : System                 Keep
  Individual         : An_individual          Keep
  Generation         : a_Generation           Keep
  Individual_to_show : An_individual_to_show  Keep

$Body
  Common
    Choice from Common.Generation_number <= Number_of_generations and
                Common.Mode = FF_calculation and
                Common.Counter < Common.Generation_size
    first
    Convert_rule
      Counter          set Common.Counter + 1
      Counter_bit      set Common.Counter_bit +
                           I_IfEQZero(Extract(Individual.Parameter_1, 3, 1), 0, 1)

  Individual
    Choice from Individual.Generation_number = Common.Generation_number and
                Individual.Individual_number = Common.Counter + 1
    first
    Convert_rule
      FF_value      set FF_calculation_fun((Extract(Individual.Parameter_1, 1, 8) +
                                            Extract(Individual.Parameter_2, 1, 8) / 256.0) / 256.0,
                                           (Extract(Individual.Parameter_3, 1, 8) +
                                            Extract(Individual.Parameter_4, 1, 8) / 256.0) / 256.0)
      Sum_before    set Generation.Sum_of_FF_values
      Sum_after     set Generation.Sum_of_FF_values + Individual.FF_value

  Generation
    Choice from Generation.Number = Common.Generation_number
    first
    Convert_rule
      Sum_of_FF_values  set Generation.Sum_of_FF_values + Individual.FF_value
      Minimum_FF_value  set RMin(Generation.Minimum_FF_value, Individual.FF_value)
      Maximum_FF_value  set RMax(Generation.Maximum_FF_value, Individual.FF_value)

  Individual_to_show
    Choice from Individual_to_show.Individual_number = Individual.Individual_number
    first
    Convert_rule
		X_value       set (Extract(Individual.Parameter_1, 1, 8) +
		                   Extract(Individual.Parameter_2, 1, 8) / 256.0) / 256.0
		Y_value       set (Extract(Individual.Parameter_3, 1, 8) +
		                   Extract(Individual.Parameter_4, 1, 8) / 256.0) / 256.0
		X_coordinate  set {(Extract(Individual.Parameter_1, 1, 8) * 128 +
		                   Extract(Individual.Parameter_2, 1, 8) / 2) / 546}
		                  34 + Individual_to_show.X_value * 450
		Y_coordinate  set {(Extract(Individual.Parameter_3, 1, 8) * 128 +
		                    Extract(Individual.Parameter_4, 1, 8) / 2) / 1725}
		                  475 - Individual_to_show.Y_value * 450
$End

$Pattern  End_of_FF_calculation_pat  : rule  trace
$Relevant_resources
  Common            : System        Keep
  Generation        : a_Generation  Keep

$Body
  Common
    Choice from Common.Generation_number <= Number_of_generations and
                Common.Mode = FF_calculation and
                Common.Counter = Common.Generation_size
    first
    Convert_rule
      Mode            set Reproduction
      Counter         set 0
      a_Value         set Random_number_for_parent(0.0, Generation.Sum_of_FF_values)

  Generation
    Choice from Generation.Number = Common.Generation_number
    first
    Convert_rule
      Average_FF_value       set Generation.Sum_of_FF_values / Common.Generation_size
$End

$Pattern  Reproduction_pat  : rule  {trace}
$Relevant_resources
  Common           : System             Keep
  Generation       : a_Generation       NoChange
  Parent           : An_individual      Keep
  Child            : An_individual      Create

$Body
  Common
    Choice from Common.Generation_number < Number_of_generations and
                Common.Mode = Reproduction and
                Common.Counter < Common.Generation_size
    first
    Convert_rule
      Counter          set Common.Counter + 1
      a_Value          set Random_number_for_parent(0.0, Generation.Sum_of_FF_values)

  Generation
    Choice from Generation.Number = Common.Generation_number
    first

  Parent
    Choice from Parent.Generation_number = Common.Generation_number and
                Parent.Sum_before    <= Common.a_Value and
                Parent.Sum_after >= Common.a_Value
    first
    Convert_rule
      Number_of_children    set Parent.Number_of_children + 1

  Child
    Convert_rule  {trace}
      Parameter_1           set Parent.Parameter_1
      Parameter_2           set Parent.Parameter_2
      Parameter_3           set Parent.Parameter_3
      Parameter_4           set Parent.Parameter_4
      Generation_number     set Common.Generation_number + 1
      Individual_number     set Common.Counter
      Parent_1              set Parent.Individual_number
      Parent_2              set 0
      Number_of_children    set 0
      Crossover_byte        set 0
      Crossover_bit         set 0
      Mutation_byte         set 0
      Mutation_bit          set 0
      Status                set not_considered
      FF_value              set -1.0
      Sum_before            set 0.0
      Sum_after             set 0.0
$End

$Pattern  End_of_reproduction_pat  : rule  {trace}
$Relevant_resources
  Common            : System         Keep
  Generation        : a_Generation   Create

$Body
  Common
    Choice from Common.Generation_number < Number_of_generations and
                Common.Mode = Reproduction and
                Common.Counter = Common.Generation_size
    first
    Convert_rule
      Mode            set Crossover
      Counter         set 0
      a_Value         set 2.0

  Generation
    Convert_rule  trace
      Number                set Common.Generation_number + 1
      Size                  set Common.Generation_size
      Sum_of_FF_values      set 0.0
      Average_FF_value      set 0.0
      Minimum_FF_value      set 1.0e20
      Maximum_FF_value      set -1.0e20
      Number_of_crossovers  set 0
      Number_of_mutations   set 0
$End

$Pattern  Crossover_pat  : rule  {trace}
$Relevant_resources
  Common         : System          Keep
  Generation     : a_Generation    Keep
  Hybrid_1       : An_individual   Create
  Hybrid_2       : An_individual   Create
  Individual_1   : An_individual   Erase
  Individual_2   : An_individual   Erase

$Body
  Common
    Choice from Common.Generation_number < Number_of_generations and
                Common.Mode = Crossover and
                Common.Counter <= Common.Generation_size / 2 and
                Common.a_Value <= Common.Probability_of_crossover
    first
    Convert_rule
      a_Value            set 2.0

  Generation
    Choice from Generation.Number = Common.Generation_number + 1
    first
    Convert_rule
      Number_of_crossovers  set Generation.Number_of_crossovers + 1

  Hybrid_1
    Convert_rule  {trace}
      Parameter_1         set Parameter_of_hybrid(1, Individual_1.Parameter_1, Individual_2.Parameter_1)
      Parameter_2         set Parameter_of_hybrid(2, Individual_1.Parameter_2, Individual_2.Parameter_2)
      Parameter_3         set Parameter_of_hybrid(3, Individual_1.Parameter_3, Individual_2.Parameter_3)
      Parameter_4         set Parameter_of_hybrid(4, Individual_1.Parameter_4, Individual_2.Parameter_4)
      Generation_number   set Individual_1.Generation_number
      Individual_number   set Individual_1.Individual_number
      Parent_1            set Individual_1.Parent_1
      Parent_2            set Individual_2.Parent_1
      Number_of_children  set Individual_1.Number_of_children
      Crossover_byte      set Common.Crossover_byte
      Crossover_bit       set Common.Crossover_bit
      Mutation_byte       set Individual_1.Mutation_byte
      Mutation_bit        set Individual_1.Mutation_bit
      Status              set Individual_1.Status
      FF_value            set Individual_1.FF_value
      Sum_before          set Individual_1.Sum_before
      Sum_after           set Individual_1.Sum_after

  Hybrid_2
    Convert_rule  {trace}
      Parameter_1         set Parameter_of_hybrid(1, Individual_2.Parameter_1, Individual_1.Parameter_1)
      Parameter_2         set Parameter_of_hybrid(2, Individual_2.Parameter_2, Individual_1.Parameter_2)
      Parameter_3         set Parameter_of_hybrid(3, Individual_2.Parameter_3, Individual_1.Parameter_3)
      Parameter_4         set Parameter_of_hybrid(4, Individual_2.Parameter_4, Individual_1.Parameter_4)
      Generation_number   set Individual_2.Generation_number
      Individual_number   set Individual_2.Individual_number
      Parent_1            set Individual_1.Parent_1
      Parent_2            set Individual_2.Parent_1
      Number_of_children  set Individual_2.Number_of_children
      Crossover_byte      set Common.Crossover_byte
      Crossover_bit       set Common.Crossover_bit
      Mutation_byte       set Individual_2.Mutation_byte
      Mutation_bit        set Individual_2.Mutation_bit
      Status              set Individual_2.Status
      FF_value            set Individual_2.FF_value
      Sum_before          set Individual_2.Sum_before
      Sum_after           set Individual_2.Sum_after

  Individual_1
    Choice from Individual_1.Generation_number = Common.Generation_number + 1 and
                Individual_1.Individual_number = Common.Parent_1
    first

  Individual_2
    Choice from Individual_2.Generation_number = Common.Generation_number + 1 and
                Individual_2.Individual_number = Common.Parent_2
    first
$End

$Pattern  Pairs_selection_pat  : rule  {trace}
$Relevant_resources
  Common        : System             Keep
  Individual_1  : An_individual      Keep
  Individual_2  : An_individual      Keep

$Body
  Common
    Choice from Common.Generation_number < Number_of_generations and
                Common.Mode = Crossover and
                Common.Counter < Common.Generation_size / 2
    first
    Convert_rule
      Counter        set Common.Counter + 1
      a_Value        set Random_number_for_crossover(0.0, 1.0)
      Parent_1       set Individual_1.Individual_number
      Parent_2       set Individual_2.Individual_number
      Crossover_byte set Choice_of_byte(1, Number_of_bytes_in_chromosome)
      Crossover_bit  set Choice_of_bit(1, Cutting_limit(Common.Crossover_byte))

  Individual_1
    Choice from Individual_1.Generation_number = Common.Generation_number + 1 and
                Individual_1.Status = not_considered
    with_min Random_number_for_crossover(0.0, 1.0)
    Convert_rule
      Status         set considered

  Individual_2
    Choice from Individual_2.Generation_number = Common.Generation_number + 1 and
                Individual_2.Status = not_considered and
                Individual_2.Individual_number <> Individual_1.Individual_number and
                Individual_2.Parent_1 <> Individual_1.Parent_1
    with_min Random_number_for_crossover(0.0, 1.0)
    Convert_rule
      Status         set considered
$End

$Pattern  End_of_crossover_pat  : rule  {trace}
$Relevant_resources
  Common            : System     Keep

$Body
  Common
    Choice from Common.Generation_number < Number_of_generations and
                Common.Mode = Crossover
    first
    Convert_rule
      Mode            set Mutation
      Counter         set 0
$End

$Pattern  Mutation_pat  : rule  {trace}
$Relevant_resources
  Common            : System             Keep
  Individual        : An_individual      Keep
  Generation        : a_Generation       Keep

$Body
  Common
    Choice from Common.Generation_number < Number_of_generations and
                Common.Mode = Mutation and
                Common.Counter < Common.Generation_size
    first
    Convert_rule
      Counter          set Common.Counter + 1
      a_Value          set Random_number_for_mutation(0.0, 1.0)
      Mutation_byte    set Choice_of_byte(1, Number_of_bytes_in_chromosome)
      Mutation_bit     set Choice_of_bit(1, Mutation_limit(Common.Mutation_byte))

  Individual
    Choice from Individual.Generation_number = Common.Generation_number + 1 and
                Individual.Individual_number = Common.Counter + 1
    first
    Convert_rule
      Parameter_1      set If_mutation(Parameter_of_mutant(1, Individual.Parameter_1), Individual.Parameter_1)
      Parameter_2      set If_mutation(Parameter_of_mutant(2, Individual.Parameter_2), Individual.Parameter_2)
      Parameter_3      set If_mutation(Parameter_of_mutant(3, Individual.Parameter_3), Individual.Parameter_3)
      Parameter_4      set If_mutation(Parameter_of_mutant(4, Individual.Parameter_4), Individual.Parameter_4)
      Mutation_byte    set If_mutation(Common.Mutation_byte, 0)
      Mutation_bit     set If_mutation(Common.Mutation_bit, 0)

  Generation
    Choice from Generation.Number = Common.Generation_number + 1
    first
    Convert_rule
      Number_of_mutations  set Generation.Number_of_mutations + If_mutation(1, 0)
$End

$Pattern  End_of_mutation_pat  : rule  {trace}
$Relevant_resources
  Common            : System     Keep

$Body
  Common
    Choice from Common.Generation_number < Number_of_generations and
                Common.Mode = Mutation and
                Common.Counter = Common.Generation_size
    first
    Convert_rule
      Generation_number  set Common.Generation_number + 1
      Mode               set FF_calculation
      Counter            set 0
      Counter_bit        set 0
$End
