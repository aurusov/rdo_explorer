$Frame  Block
$Back_picture = <0 0 255> back1_e

Show_if [[Nurse.Step_No <> 0] and [Nurse.Step_No <> 24]]
	bitmap [Nurse.Coordinate_X, Nurse.Coordinate_Y, nur, nurm]

Show_if [[Nurse.Step_No > 0] and [Nurse.Step_No <= 24]]
	text [90, 270, 200, 20, transparent, <255 22 139>, = 'State became worse']
	
Show_if [[Nurse.Step_No = 0] or [Nurse.Step_No >= 25]]
	text [90, 270, 200, 20, transparent, <0 255 0>, = 'State is normal']

Show_if [[Nurse.Step_No = 0] and [Nurse.Step = Done]]
        bitmap [Nurse.Coordinate_X, Nurse.Coordinate_Y, nursit, nursitm]

Show_if [[Nurse.Step_No = 0] and [Nurse.Step = Doing]]
        bitmap [Nurse.Coordinate_X, Nurse.Coordinate_Y, nur, nurm]

Show_if [Nurse.Step_No = 24]
        bitmap [Nurse.Coordinate_X, Nurse.Coordinate_Y, nurh, nurhm]

Show_if [View.Alarm = Blinking]
	bitmap [708, 92, sirrd, sirm]
        text [670,  15,  100,  20, transparent, <255 0 0>, = 'Alarm']	

Show_if [View.Alarm = Not_Blinking] or [View.Alarm = Blinking_1] or [View.Alarm = Not_Blinking_1]
	bitmap [708, 92, sirbl, sirm]

Show_if [[Doctor.Step_No <> 0] and [[Doctor.Step_No <= 14] or [Doctor.Step_No >= 31]]]
	bitmap [Doctor.Coordinate_X, Doctor.Coordinate_Y, doc, docm]

Show_if [Doctor.Step_No = 15] and [Doctor.Step = Done]
	bitmap [Doctor.Coordinate_X, Doctor.Coordinate_Y, docsit, docsitm]

Show_if [Doctor.Step_No >= 16] and [Doctor.Step_No <= 30]
	bitmap [Doctor.Coordinate_X, Doctor.Coordinate_Y, docsit, docsitm]

Show_if [Computer.Busy = 1]
	bitmap [153, 65, comp, compm]

Show_if [Computer.Busy = 0]
	bitmap [153, 65, compw, compm]

Show_if [Computer.Busy = 0] and [Doctor.Step_No = 21] and [Doctor.Step = Done]
	text [70, 15, 300, 20, transparent, <38 112 255>, = 'Doctor works with DB']

Show_if [Computer.Busy = 0] and [Doctor.Step_No <> 21]
	text [70, 15, 300, 20, transparent, <38 112 255>, = 'Data processing and storing']

Show_if [Gauges_busy.Heart = 0] or [Gauges_busy.Pressure = 0] or [Gauges_busy.Temperature = 0] or [Gauges_busy.Skin = 0]
	text [252, 320, 200, 20, transparent, <38 112 255>, = 'Gaudges work']

$End

$Frame  Info
$Back_picture = <0 0 255> back2_e

Show_if [Gauge_of_heart_rythm.Value >= Range_of_rythm.Maximum] or [Gauge_of_heart_rythm.Value <= Range_of_rythm.Minimum]
	text [140, 235, 100, 20, transparent, <255 0 0>, = Gauge_of_heart_rythm.Value]

Show_if [Gauge_of_heart_rythm.Value < Range_of_rythm.Maximum] and [Gauge_of_heart_rythm.Value > Range_of_rythm.Minimum]
	text [140, 235, 100, 20, transparent, <169 224 169>, = Gauge_of_heart_rythm.Value]

Show_if [Gauge_of_pressure.Value >= Range_of_pressure.Maximum] or [Gauge_of_pressure.Value <= Range_of_pressure.Minimum]
	text [140, 275, 100, 20, transparent, <255 0 0>, = Gauge_of_pressure.Value]

Show_if [Gauge_of_pressure.Value < Range_of_pressure.Maximum] and [Gauge_of_pressure.Value > Range_of_pressure.Minimum]
	text [140, 275, 100, 20, transparent, <169 224 169>, = Gauge_of_pressure.Value]

Show_if [Gauge_of_temperature.Value >= Range_of_temperature.Maximum] or [Gauge_of_temperature.Value <= Range_of_temperature.Minimum]
	text [140, 315, 100, 20, transparent, <255 0 0>, = Gauge_of_temperature.Value]

Show_if [Gauge_of_temperature.Value < Range_of_temperature.Maximum] and [Gauge_of_temperature.Value > Range_of_temperature.Minimum]
	text [140, 315, 100, 20, transparent, <169 224 169>, = Gauge_of_temperature.Value]

Show_if [Gauge_of_skin_resistance.Value >= Range_of_skin_resistance.Maximum] or [Gauge_of_skin_resistance.Value <= Range_of_skin_resistance.Minimum]
	text [140, 375, 100, 20, transparent, <255 0 0>, = Gauge_of_skin_resistance.Value]

Show_if [Gauge_of_skin_resistance.Value < Range_of_skin_resistance.Maximum] and [Gauge_of_skin_resistance.Value > Range_of_skin_resistance.Minimum]
	text [140, 375, 100, 20, transparent, <169 224 169>, = Gauge_of_skin_resistance.Value]

Show
	text [212, 235, 100, 20, transparent, <255 255 255>, = Range_of_rythm.Minimum]
	text [262, 235, 100, 20, transparent, <255 255 255>, = Range_of_rythm.Maximum]
	text [212, 275, 100, 20, transparent, <255 255 255>, = Range_of_pressure.Minimum]
	text [262, 275, 100, 20, transparent, <255 255 255>, = Range_of_pressure.Maximum]
	text [212, 315, 100, 20, transparent, <255 255 255>, = Range_of_temperature.Minimum]
	text [262, 315, 100, 20, transparent, <255 255 255>, = Range_of_temperature.Maximum]
	text [212, 375, 100, 20, transparent, <255 255 255>, = Range_of_skin_resistance.Minimum]
	text [262, 375, 100, 20, transparent, <255 255 255>, = Range_of_skin_resistance.Maximum]

Show_if [ Nurse.Step_No = 0 ] 
	text [333, 310, 100, 20, transparent, <169 224 169>, = 'No alarm']

Show_if [ Nurse.Step_No <> 0 ] 
	text [333, 310, 100, 20, transparent, <255 0 0>, = 'Alarm']

Show_if [Computer.Busy <> 0] or [Doctor.Step_No <> 21] or [[Doctor.Step_No = 21] and [Doctor.Step <> Done]]
	text [572, 170, 300, 20, transparent, <169 224 169>, = 'Do not work']

Show_if [Computer.Busy = 0] and [Doctor.Step_No = 21] and [Doctor.Step = Done]
	text [572, 170, 300, 20, transparent, <255 0 0>, = 'Working']

Show
	text [670, 290, 100, 20, transparent, <169 224 169>, = History_of_illness.Rythm]
	text [670, 330, 100, 20, transparent, <169 224 169>, = History_of_illness.Pressure]
	text [670, 370, 100, 20, transparent, <169 224 169>, = History_of_illness.Temperature]
	text [670, 410, 100, 20, transparent, <169 224 169>, = History_of_illness.Resistanse]

Show_if [ Drug_s_data.Data = 1 ] and [Doctor.Step_No = 21] and [Doctor.Step = Done] and [ Doctor.Wants_to = Has_place ]
	text [647, 210, 150, 20, transparent, <255 255 255>, = 'Input/correction']

Show_if [[ Drug_s_data.Data = 1 ] and [ Doctor.Wants_to = Has_no_place ]] or [[ Drug_s_data.Data = 1 ] and [Doctor.Wants_to = Has_place] and [[Doctor.Step_No <> 21] or [[Doctor.Step_No = 21] and [Doctor.Step <> Done]]]]
	text [670, 210, 100, 20, transparent, <169 224 169>, = 'Data storing']

Show_if [ Drug_s_data.Data = 0 ]
	text [670, 210, 100, 20, transparent, <169 224 169>, = 'No data']

Show_if [ Treating_doctors_s_data.Data = 1 ] and [Doctor.Step_No = 21] and [Doctor.Step = Done] and [ Doctor.Wants_to = Has_place ]
	text [647, 250, 150, 20, transparent, <255 255 255>, = 'Input/correction']

Show_if [[ Treating_doctors_s_data.Data = 1 ] and [ Doctor.Wants_to = Has_no_place ]] or [[Treating_doctors_s_data.Data = 1 ] and [Doctor.Wants_to = Has_place] and [[Doctor.Step_No <> 21] or [[Doctor.Step_No = 21] and [Doctor.Step <> Done]]]]
	text [670, 250, 100, 20, transparent, <169 224 169>, = 'Data storing']

Show_if [ Treating_doctors_s_data.Data = 0 ]
	text [670, 250, 100, 20, transparent, <169 224 169>, = 'No data']

$End

