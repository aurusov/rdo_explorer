$Pattern  Tanker_arrival_pat : irregular_event  trace
$Relevant_resources
  _port : Port     Keep
$Time = Tanker_arrival_interval(4, 18)
$Body
  _port
    Convert_event
      Tanker_arrived  set yes
$End

$Pattern  Tanker_creation_pat : rule  trace
$Relevant_resources
  _port      : Port              Keep
  New_tanker : a_Tanker          Create
  TTS        : a_Tanker_to_show  Keep
$Body
  _port
    Choice from _port.Tanker_arrived = yes first
    Convert_rule
      Tanker_arrived          set no
      Counter                 set _port.Counter + 1
      Type_of_tanker_arrived  set Random_tanker_type
  New_tanker
    Convert_rule  trace
      Number                  set _port.Counter
      Type                    set _port.Type_of_tanker_arrived
      State                   set just_arrived
      Arrival_time            set Time_now
      Time_on_road            set 0.0
      Time_of_filling         set 0.0
  TTS
    Choice from TTS.Tanker_number = 0  first
    Convert_rule
      Tanker_number           set _port.Counter
      Type                    set _port.Type_of_tanker_arrived
      State                   set just_arrived
$End

$Pattern  Mooring_by_tug_pat : operation  trace
$Relevant_resources
  _port     : Port              Keep  NoChange
  _terminal : a_Terminal        Keep  NoChange
  _tanker   : a_Tanker          Keep  Keep
  _tug      : Tug               Keep  Keep
  TTS       : a_Tanker_to_show  Keep  Keep
$Time = 1.0
$Body
  _port
    Choice from _port.Number_of_free_terminals > 0 and
		 _port.Weather = there_is_no_storm
    first
    Convert_begin
      Number_of_free_terminals  set _port.Number_of_free_terminals - 1
  _terminal
    Choice from _terminal.Busyness = free
    first
    Convert_begin
      Busyness        set busy
  _tanker
    Choice from _tanker.State = just_arrived
    first
    Convert_begin
      State           set mooring
      Time_on_road    set Time_now - _tanker.Arrival_time
    Convert_end
      State           set moored
  _tug
    Choice from _tug.Busyness = free
    first
    Convert_begin
      Busyness        set busy
    Convert_end
      Busyness        set free
      Counter         set 0          
  TTS
    Choice from TTS.Tanker_number = _tanker.Number  first
    Convert_begin
      State           set mooring
      Terminal        set _terminal.Number
    Convert_end
      State           set moored
$End

$Pattern Step_pat : operation
$Relevant_resources
  _tug : Tug    Keep  Keep
$Time = 0.01
$Body
  _tug
    Choice from _tug.Busyness = busy and _tug.Step = no
    first
    Convert_begin
      Counter     set _tug.Counter + 1
      Step        set yes
    Convert_end
      Step        set no
$End

$Pattern  Tanker_filling_pat : operation  trace
$Relevant_resources
  _tanker : a_Tanker   Keep  Keep
$Time = Time_of_filling_fun(_tanker.Type)
$Body
  _tanker
    Choice from _tanker.State = moored
    first
    Convert_begin
      State            set filling
      Time_of_filling  set Time_now
    Convert_end
      State            set filled
      Time_of_filling  set Time_now - _tanker.Time_of_filling
$End

$Pattern  Tanker_leaving_pat : operation  trace
$Relevant_resources
  _port      : Port              Keep      NoChange
  _tanker    : a_Tanker          Keep      Erase
  TTS_old    : a_Tanker_to_show  Keep      Keep
  _terminal  : a_Terminal        Keep      NoChange
  _tug       : Tug               Keep      Keep
$Time = 1.0
$Body
  _port
    Choice from _port.Weather = there_is_no_storm
    first
    Convert_begin
      Number_of_free_terminals  set _port.Number_of_free_terminals + 1
  _tanker
    Choice from _tanker.State = filled and
                _tanker.Type <> type_4
    first
    Convert_begin
      State           set leaving
  TTS_old
    Choice from TTS_old.Tanker_number = _tanker.Number  first
    Convert_begin
      State           set leaving
    Convert_end
      Tanker_number   set 0
      Terminal        set 0
  _terminal
    Choice from _terminal.Number = TTS_old.Terminal
    first
    Convert_begin
      Busyness        set free
  _tug
    Choice from _tug.Busyness = free
    first
    Convert_begin
      Busyness        set busy
    Convert_end
      Busyness        set free
      Counter         set 0
$End

$Pattern  Storm_beginning_pat : irregular_event  trace
$Relevant_resources
  _port   : Port  Keep
$Time = Interval_between_storms(48)
$Body
  _port
    Convert_event
      Weather      set beginning_of_storm
$End

$Pattern  Storm_pat : operation  trace
$Relevant_resources
  _port   : Port  Keep  Keep
$Time = Storm_duration(2, 6)
$Body
  _port
    Choice from _port.Weather = beginning_of_storm
    first
    Convert_begin
      Weather      set there_is_storm
    Convert_end
      Weather      set there_is_no_storm
$End

$Pattern  Tanker_leaving_pat_type_4 : operation  trace
$Relevant_resources
  _port        : Port              Keep  NoChange
  _tanker      : a_Tanker          Keep  Keep
  TTS_old      : a_Tanker_to_show  Keep  Keep
  _terminal    : a_Terminal        Keep  NoChange
  _tug         : Tug               Keep  Keep
$Time = 1.0
$Body
  _port
    Choice from _port.Weather = there_is_no_storm
    first
    Convert_begin
      Number_of_free_terminals  set _port.Number_of_free_terminals + 1
  _tanker
    Choice from _tanker.State = filled and
                _tanker.Type = type_4
    first
    Convert_begin
      State          set leaving
    Convert_end
      State          set gone
  TTS_old
    Choice from TTS_old.Tanker_number = _tanker.Number  first
    Convert_begin
      State          set leaving
    Convert_end
      Tanker_number  set 0
      State          set gone
      Terminal       set 0
  _terminal
    Choice from _terminal.Number = TTS_old.Terminal
    first
    Convert_begin
      Busyness       set free
  _tug
    Choice from _tug.Busyness = free
    first
    Convert_begin
      Busyness       set busy
    Convert_end
      Busyness       set free
      Counter        set 0
$End

$Pattern  Tanker_navigation_pat : operation  trace
$Relevant_resources
  _tanker     : a_Tanker          Erase     NonExist
  TTS_old     : a_Tanker_to_show  Keep      NoChange
  _port       : a_Port            NoChange  Keep
  new_tanker  : a_Tanker          NonExist  Create
  TTS         : a_Tanker_to_show  Keep      Keep
$Time = Navigation_time(216, 264)
$Body
  _tanker
    Choice from _tanker.State = gone and
		_tanker.Type = type_4
    first
  TTS_old
    Choice from TTS_old.Tanker_number = _tanker.Number  first
    Convert_begin
      Tanker_number   set 0
  _port
    Choice NoCheck first
    Convert_end
      Counter         set _port.Counter + 1
  new_tanker
    Convert_end
      Number          set _port.Counter
      Type            set type_4
      State           set just_arrived
      Arrival_time    set Time_now
      Time_on_road    set 0.0
      Time_of_filling set 0.0
  TTS
    Choice from TTS.Tanker_number = 0  first
    Convert_begin
      Tanker_number   set -1
    Convert_end
      Tanker_number   set _port.Counter
      Type            set type_4
      State           set just_arrived
$End
