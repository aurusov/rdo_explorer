$Pattern  Client_arrival_pattern : irregular_event  trace
$Relevant_resources
  Figaro : BarberShop  Keep
$Time = {Uniform_interval(0.25, 0.75)}
        Exponential_interval(0.5)
        {Normal_interval(0.5, 0.2)}
        {Enumerative_interval}
        {Interval_by_hist}
$Body
  Figaro
    Convert_event
      Entry  set client_arrival
$End

$Pattern  Placing_Pattern : rule  trace
$Relevant_resources
  Client : Clients     Keep
  Figaro : BarberShop  Keep
$Body
  Client
    Choice from  Client.Status = no
    with_min  Random_number(0.0, 1.0)
    Convert_rule
      Status               set in_a_queue
      Time_of_arrival      set Time_now
      Position_in_a_queue  set Choice_of_place_in_a_queue(0)
  Figaro
    Choice from  Figaro.Entry = client_arrival and
		    Figaro.Number_of_clients_in_a_queue < 6
    first
    Convert_rule
      Entry                         set no_klients
      Number_of_clients_in_a_queue  set Figaro.Number_of_clients_in_a_queue + 1
$End

$Pattern  Client_servicing_pattern : operation  trace
$Relevant_resources
  Figaro : BarberShop  Keep  Keep
  Client : Clients     Keep  Keep
$Time = Normal_distribution_of_servicing(0.45, 0.2)
$Body
  Figaro
    Choice from Figaro.Number_of_clients_in_a_queue > 0 and
		   Figaro.Busyness_of_hairdresser = Free
    first
    Convert_begin
      Busyness_of_hairdresser       set Busy
    Convert_end
      Number_of_clients_in_a_queue  set Figaro.Number_of_clients_in_a_queue - 1
      Busyness_of_hairdresser       set Free
      Number_of_clients_serviced    set Figaro.Number_of_clients_serviced + 1
  Client
    Choice from  Client.Status = in_a_queue
    with_min Client.Time_of_arrival
    Convert_begin
      Status               set haircutting
      Position_in_a_queue  set 0
    Convert_end
      Status               set no
$End

