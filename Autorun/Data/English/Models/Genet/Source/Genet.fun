$Constant
  Number_of_generations            : integer = 2
  Number_of_bytes_in_chromosome    : integer = 4
  Number_of_bits_in_last_byte      : integer = 8
  How_many_generations_to_keep     : integer = 1
$End

$Sequence  Uniformly  : integer [0..255]
$Type =  uniform
$End

$Function  Bits_of_string  : integer
$Type = table
$Parameters
  Bit_number   : integer  [1..9]
$Body
  256   128   64   32   16    8    4    2    1
$End

$Function  Extract  : integer [0..255]
$Type = algorithmic
$Parameters
  The_byte         : integer [0..255]
  From_bit         : integer [1..8]
  Quantity_of_bits : integer [1..8]
$Body
  Calculate_if  0 = 0
    Extract = (The_byte - The_byte / Bits_of_string(From_bit) * Bits_of_string(From_bit)) /
              Bits_of_string(From_bit + Quantity_of_bits)
$End

$Function  RMin  : real
$Type = algorithmic
$Parameters
  Parameter_1  : real
  Parameter_2  : real
$Body
  Calculate_if Parameter_1 <  Parameter_2 RMin = Parameter_1
  Calculate_if Parameter_1 >= Parameter_2 RMin = Parameter_2
$End

$Function  RMax  : real
$Type = algorithmic
$Parameters
  Parameter_1  : real
  Parameter_2  : real
$Body
  Calculate_if Parameter_1 >  Parameter_2 RMax = Parameter_1
  Calculate_if Parameter_1 <= Parameter_2 RMax = Parameter_2
$End

$Function  Parameter_of_hybrid : integer [0..255]
$Type = algorithmic
$Parameters
  Number       : integer
  Parameter_1  : integer [0..255]
  Parameter_2  : integer [0..255]
$Body
  Calculate_if Number < System.Crossover_byte Parameter_of_hybrid = Parameter_1
  Calculate_if Number > System.Crossover_byte Parameter_of_hybrid = Parameter_2
  Calculate_if Number = System.Crossover_byte and
               System.Crossover_bit = 8      Parameter_of_hybrid = Parameter_1
  Calculate_if Number = System.Crossover_byte and
               System.Crossover_bit < 8
               Parameter_of_hybrid = Extract(Parameter_1, 1, System.Crossover_bit) *
                                  Bits_of_string(System.Crossover_bit + 1) +
                                  Extract(Parameter_2, System.Crossover_bit + 1, 8 - System.Crossover_bit)
$End

$Sequence  Random_number_for_parent  : real
$Type =  uniform
$End

$Sequence  Choice_of_byte  : integer
$Type =  uniform
$End

$Sequence  Choice_of_bit  : integer
$Type =  uniform
$End

$Function  Cutting_limit  : integer [1..8]
$Type = algorithmic
$Parameters
  Parameter  : integer
$Body
  Calculate_if Parameter < Number_of_bytes_in_chromosome Cutting_limit = 8
  Calculate_if Parameter = Number_of_bytes_in_chromosome
    Cutting_limit = Number_of_bits_in_last_byte - 1
$End

$Sequence  Random_number_for_crossover  : real
$Type =  uniform
$End

$Sequence  Random_number_for_mutation  : real
$Type =  uniform
$End

$Function  Mutation_limit  : integer [1..8]
$Type = algorithmic
$Parameters
  Parameter  : integer
$Body
  Calculate_if Parameter < Number_of_bytes_in_chromosome Mutation_limit = 8
  Calculate_if Parameter = Number_of_bytes_in_chromosome
    Mutation_limit = Number_of_bits_in_last_byte
$End

$Function  If_mutation  : integer
$Type = algorithmic
$Parameters
  Parameter_1  : integer
  Parameter_2  : integer
$Body
  Calculate_if System.a_Value <= System.Probability_of_mutation If_mutation = Parameter_1
  Calculate_if System.a_Value >  System.Probability_of_mutation If_mutation = Parameter_2
$End

$Function  Parameter_of_mutant : integer [0..255]
$Type = algorithmic
$Parameters
  Number       : integer
  Parameter    : integer [0..255]
$Body
  Calculate_if Number <> System.Mutation_byte Parameter_of_mutant = Parameter
  Calculate_if Number =  System.Mutation_byte and Extract(Parameter, System.Mutation_bit, 1) = 1
               Parameter_of_mutant = Parameter - Bits_of_string(System.Mutation_bit + 1)
  Calculate_if Number =  System.Mutation_byte and Extract(Parameter, System.Mutation_bit, 1) = 0
               Parameter_of_mutant = Parameter + Bits_of_string(System.Mutation_bit + 1)
$End

$Function  FF_calculation_fun  : real [0.0..1.0]
$Type = algorithmic
$Parameters
  Parameter_1  : real [0.0..1.0]
  Parameter_2  : real [0.0..1.0]
$Body
  Calculate_if  0 = 0
  FF_calculation_fun = {(1 - (Parameter_1 * 2 - 1) * (Parameter_1 * 2 - 1)) / 2.0 +
                        (1 - (Parameter_2 * 2 - 1) * (Parameter_2 * 2 - 1)) / 2.0}
                       (Parameter_1 * Parameter_1 + Parameter_2 * Parameter_2) / 2.0
                       {(Parameter_1 - Parameter_2) * (Parameter_1 - Parameter_2) }
$End

$Function  I_IfEQZero : integer
$Type = algorithmic
$Parameters
  Base   : integer
  If_yes : integer
  If_no  : integer
$Body
  Calculate_if Base =  0  I_IfEQZero = If_yes
  Calculate_if Base <> 0  I_IfEQZero = If_no
$End
