$Pattern Born1:irregular_event trace
$Parameters
	Av_time:real
$Relevant_resources
	Who:S1 Keep
$Time = Exp_need1(Av_time)
$Body
 Who
  Convert_event
	Inquiry	set Be
$End

$Pattern Born2:irregular_event
$Parameters
	Av_time:real
$Relevant_resources
	Who:S2 Keep
$Time = Exp_need2(Av_time)
$Body
 Who
  Convert_event
	Inquiry	set Be
$End

$Pattern Born3:irregular_event
$Parameters
	Av_time:real
$Relevant_resources
	Who:S3 Keep
$Time = Exp_need3(Av_time)
$Body
 Who
  Convert_event
	Inquiry	set Be
$End

$Pattern Born4:irregular_event
$Parameters
	Av_time:real
$Relevant_resources
	Who:S4 Keep
$Time = Exp_need4(Av_time)
$Body
 Who
  Convert_event
	Inquiry	set Be
$End

$Pattern Move:operation trace
$Parameters
	Mov_time:real
$Relevant_resources
	Mar:M1	Keep	Keep
$Time = Mov_time
$Body
  Mar
	Choice from
	Mar.State = Output
 first
 Convert_begin
 	State	set Inaccessible
 Convert_end	
	Where	set Inc_to4(Mar.Where)
	State	set Input
$End

$Pattern Take:operation
$Parameters
	Av_time:real
$Relevant_resources
	Wh:M1	  	Keep	 	Keep
	Who: Abonent	NoChange	Keep
$Time = Exp_form(Av_time)
$Body
  Wh
	Choice from
	Wh.State = Input and
	Wh.Buzy_status = Free
 first
 Convert_begin
 	Holder	set Wh.Where
	Buzy_status	set Buzy
	Whom		set Priv(Wh.Where + Stoi(Inc))
	Weight	set How_many
	State		set Inaccessible
Convert_end	
	State	set Output
  Who
	Choice from
	Who.Number = Wh.Where and
	Who.Inquiry = Be
 first
 Convert_end
	Inquiry		set No
$End
	
$Pattern Out:operation
$Parameters
	Av_time:real
$Relevant_resources
	Ê1:M1	  Keep		  Keep
$Time = Exp_form(Av_time)
$Body
  Ê1
Choice from
	Ê1.State = Input and Ê1.Buzy_status = Buzy  and
	Ê1.Holder = Ê1.Where and Ê1.Weight = 0
 first
Convert_begin
	State		set Inaccessible
Convert_end
	Buzy_status	set Free	
	State		set Output
$End

$Pattern Copy:operation
$Parameters
	Av_time:real
$Relevant_resources
	Who:M1	  	Keep	 Keep
$Time = Exp_opr(Av_time)
$Body
  Who
	Choice from
	Who.State = Input and
	Who.Buzy_status = Buzy and
	Who.Whom = Who.Where and
	Who.Weight <> 0
 first
 Convert_begin
	State		set Inaccessible
 Convert_end
	Weight		set Who.Weight - 1
	State		set Output
$End

$Pattern Put:operation
$Parameters
	Av_time:real
$Relevant_resources
	Who:M1	  	Keep	Keep 
$Time = Exp_opr(Av_time)
$Body
  Who
	Choice from
	Who.State = Input and
	Who.Buzy_status = Buzy and
	Who.Holder = Who.Where and
	Who.Weight <> 0
 first
 Convert_begin
	State		set Inaccessible
Convert_end
	State		set Output
$End

$Pattern Thru:operation trace
$Parameters
	Av_time:real
$Relevant_resources
	Who:M1	  	Keep    	 Keep
$Time = Av_time
$Body
  Who
  Choice from
	Who.State = Input  and
	Who.Holder<>Who.Where and
	Who.Whom<>Who.Where 
 first
 Convert_begin
	State		set Inaccessible
 Convert_end
	State	set Output
$End
