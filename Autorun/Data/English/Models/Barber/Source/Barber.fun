$Sequence  Uniform_interval : real
$Type = uniform  123456789
$End

$Sequence  Exponential_interval : real
$Type = exponential  123456789
$End

$Sequence  Normal_interval : real [0.0..1.0]
$Type = normal  123456789
$End

$Sequence  Enumerative_interval : real
$Type = enumerative
$Body
  0.1   0.2   0.3   0.4   0.5   0.5   0.6   0.7   0.8   0.9
  0.15  0.25  0.35  0.45  0.55  0.55  0.65  0.75  0.85  0.95
  0.05  0.15  0.25  0.35  0.45  0.45  0.55  0.65  0.75  0.85
  0.11  0.21  0.31  0.41  0.51  0.51  0.61  0.71  0.81  0.91
  0.09  0.19  0.29  0.39  0.49  0.49  0.59  0.69  0.79  0.89
$End

$Sequence  Interval_by_hist : real
$Type = by_hist  123456789
$Body
  0.1   0.2    1.0
  0.2   0.3    2.0
  0.3   0.4    3.0
  0.4   0.45   4.0
  0.45  0.55   5.0
  0.55  0.6    1.0
  0.6   0.7    1.0
  0.7   0.8    2.0
  0.8   0.9    3.0
$End

$Sequence  Normal_distribution_of_servicing : real [0.0..1.0]
$Type = normal  234567891
$End

$Sequence  Random_number: real [0.0..1.0]
$Type = uniform  123456789
$End

$Function  Choice_of_place_in_a_queue : integer
$Type = algorithmic
$Parameters
  Empty  : integer
$Body
  Calculate_if Client_1.Position_in_a_queue <> 1 and
	       Client_2.Position_in_a_queue <> 1 and
	       Client_3.Position_in_a_queue <> 1 and
	       Client_4.Position_in_a_queue <> 1 and
	       Client_5.Position_in_a_queue <> 1 and
	       Client_6.Position_in_a_queue <> 1 Choice_of_place_in_a_queue = 1
  Calculate_if Client_1.Position_in_a_queue <> 2 and
	       Client_2.Position_in_a_queue <> 2 and
	       Client_3.Position_in_a_queue <> 2 and
	       Client_4.Position_in_a_queue <> 2 and
	       Client_5.Position_in_a_queue <> 2 and
	       Client_6.Position_in_a_queue <> 2 Choice_of_place_in_a_queue = 2
  Calculate_if Client_1.Position_in_a_queue <> 3 and
	       Client_2.Position_in_a_queue <> 3 and
	       Client_3.Position_in_a_queue <> 3 and
	       Client_4.Position_in_a_queue <> 3 and
	       Client_5.Position_in_a_queue <> 3 and
	       Client_6.Position_in_a_queue <> 3 Choice_of_place_in_a_queue = 3
  Calculate_if Client_1.Position_in_a_queue <> 4 and
	       Client_2.Position_in_a_queue <> 4 and
	       Client_3.Position_in_a_queue <> 4 and
	       Client_4.Position_in_a_queue <> 4 and
	       Client_5.Position_in_a_queue <> 4 and
	       Client_6.Position_in_a_queue <> 4 Choice_of_place_in_a_queue = 4
  Calculate_if Client_1.Position_in_a_queue <> 5 and
	       Client_2.Position_in_a_queue <> 5 and
	       Client_3.Position_in_a_queue <> 5 and
	       Client_4.Position_in_a_queue <> 5 and
	       Client_5.Position_in_a_queue <> 5 and
	       Client_6.Position_in_a_queue <> 5 Choice_of_place_in_a_queue = 5
  Calculate_if Client_1.Position_in_a_queue <> 6 and
	       Client_2.Position_in_a_queue <> 6 and
	       Client_3.Position_in_a_queue <> 6 and
	       Client_4.Position_in_a_queue <> 6 and
	       Client_5.Position_in_a_queue <> 6 and
	       Client_6.Position_in_a_queue <> 6 Choice_of_place_in_a_queue = 6
$End
