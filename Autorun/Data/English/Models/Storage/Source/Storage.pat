$Pattern  Delivery_on_warehouse  : operation   trace
$Relevant_resources
  Warehouse  :  Warehouse_1  Keep  Keep
$Time = Time_of_delivery(Lmin, Lmax)*24.0
$Body
  Warehouse
    Choice from Warehouse.Presence <= X_2 and
                Warehouse.State     = Normal
    first
    Convert_begin
      State           set Wait_delivery
    Convert_end
      Presence        set Warehouse.Presence + X_1
      State           set Normal
      Deliveries_fee  set Warehouse.Deliveries_fee + C_2
$End

$Pattern  Consumption  : operation   trace
$Relevant_resources
  Warehouse  :  Warehouse_1       Keep  Keep
$Time = 24.0
$Body
  Warehouse
    Choice from Warehouse.Order_for_day = 0
    first
    Convert_begin
      Order_for_day set Purchase(Dmin,Dmax)
      Storage_fee   set Warehouse.Storage_fee +
                              Warehouse.Presence * C_1
      Nonsales_fee  set Warehouse.Nonsales_fee +
                        Pay_for_deficit(Warehouse.Order_for_day)
    Convert_end
      Presence      set Rest(Warehouse.Order_for_day)
      Order_for_day set 0
$End
