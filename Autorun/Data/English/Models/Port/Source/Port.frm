$Frame  Frame_1
$Back_picture = <255 255 0> {780  505}  port_v
{Show text [10,20,50,20,<255 255 255>, <0 0 0>, Tug.Counter]
	  text [10,50,50,20,<255 255 255>, <0 0 0>, TTS_1.Terminal]}

Show_if Port.Weather = there_is_no_storm
  bitmap [ 165, 185, rybka1 ]
  bitmap [ 365, 180, rybka1 ]
  bitmap [ 410, 55 , rybka1 ]
  bitmap [ 325, 300, rybka1 ]
  bitmap [ 530, 100, rybka1 ]
  bitmap [ 500, 460, rybka1 ]
  bitmap [ 330, 430, rybka1 ]
  bitmap [ 25, 320 , pticka1 ]
  bitmap [ 25, 170 , pticka1 ]
  bitmap [ 190, 370 , pticka1 ]
  bitmap [ 13, 430 , pticka1 ]
Show_if Port.Weather = there_is_storm
  bitmap [ 165, 185, pena ]
  bitmap [ 365, 180, pena ]
  bitmap [ 410, 55 , pena ]
  bitmap [ 325, 300, pena ]
  bitmap [ 530, 100, pena ]
  bitmap [ 500, 460, pena ]
  bitmap [ 330, 430, pena ]
  bitmap [ 25, 320 , pena ]
  bitmap [ 190, 370, pena ]
  bitmap [ 13, 430 , pena ]
  bitmap [ 25, 170 , pena ]

Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_1
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal),
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal), buk, bukm ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_1 and TTS_1.State = mooring
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal) + 90 ,
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal) + 30 , tan, tanm ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_1 and TTS_1.State = leaving
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal) + 90 ,
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal) + 30 , tan, tanm ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_2
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal),
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal), ship, shipm ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_2 and TTS_1.State = mooring
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal) + 90 ,
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal) + 30 , tan, tanm ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_2 and TTS_1.State = leaving
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal) + 90 ,
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal) + 30 , tan, tanm ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_3
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal),
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal), lod, LODM ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_3 and TTS_1.State = mooring
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal) + 90 ,
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal) + 30 , tan, tanm ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_3 and TTS_1.State = leaving
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal) + 90 ,
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal) + 30 , tan, tanm ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_4
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal),
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal), lodk, LODKM ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_4 and TTS_1.State = mooring
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal) + 90 ,
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal) + 30 , tan, tanm ]
Show_if TTS_1.Tanker_number > 0 and TTS_1.Type = type_4 and TTS_1.State = leaving
  bitmap [ TTS_X(1, TTS_1.State, TTS_1.Terminal) + 90 ,
	  TTS_Y(1, TTS_1.State, TTS_1.Terminal) + 30 , tan, tanm ]

Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_1
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal),
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal), buk,bukm ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_1 and TTS_2.State = mooring
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal) + 90 ,
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal) + 30 , tan, tanm ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_1 and TTS_2.State = leaving
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal) + 90 ,
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal) + 30 , tan, tanm ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_2
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal),
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal), ship, shipm ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_2 and TTS_2.State = leaving
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal) + 90 ,
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal) + 30 , tan, tanm ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_2 and TTS_2.State = mooring
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal) + 90 ,
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal) + 30 , tan, tanm ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_3
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal),
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal), lod, LODM ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_3 and TTS_2.State = mooring
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal) + 90 ,
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal) + 30 , tan, tanm ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_3 and TTS_2.State = leaving
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal) + 90 ,
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal) + 30 , tan, tanm ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_4
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal),
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal), lodk, LODKM ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_4 and TTS_2.State = mooring
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal) + 90 ,
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal) + 30 , tan, tanm ]
Show_if TTS_2.Tanker_number > 0 and TTS_2.Type = type_4 and TTS_2.State = leaving
  bitmap [ TTS_X(2, TTS_2.State, TTS_2.Terminal) + 90 ,
	  TTS_Y(2, TTS_2.State, TTS_2.Terminal) + 30 , tan, tanm ]

Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_1
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal),
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal), buk,bukm ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_1 and TTS_3.State = mooring
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal) + 90 ,
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal) + 30 , tan, tanm ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_1 and TTS_3.State = leaving
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal) + 90 ,
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal) + 30 , tan, tanm ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_2
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal),
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal), ship, shipm ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_2 and TTS_3.State = mooring
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal) + 90 ,
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal) + 30 , tan, tanm ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_2 and TTS_3.State = leaving
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal) + 90 ,
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal) + 30 , tan, tanm ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_3
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal),
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal), lod, LODM ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_3 and TTS_3.State = mooring
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal) + 90 ,
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal) + 30 , tan, tanm ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_3 and TTS_3.State = leaving
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal) + 90 ,
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal) + 30 , tan, tanm ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_4
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal),
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal), lodk, LODKM ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_4 and TTS_3.State = mooring
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal) + 90 ,
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal) + 30 , tan, tanm ]
Show_if TTS_3.Tanker_number > 0 and TTS_3.Type = type_4 and TTS_3.State = leaving
  bitmap [ TTS_X(3, TTS_3.State, TTS_3.Terminal) + 90 ,
	  TTS_Y(3, TTS_3.State, TTS_3.Terminal) + 30 , tan, tanm ]

Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_1
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal),
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal), buk,bukm ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_1 and TTS_4.State = mooring
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal) + 90 ,
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal) + 30 , tan, tanm ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_1 and TTS_4.State = leaving
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal) + 90 ,
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal) + 30 , tan, tanm ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_2
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal),
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal), ship, shipm ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_2 and TTS_4.State = mooring
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal) + 90 ,
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal) + 30 , tan, tanm ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_2 and TTS_4.State = leaving
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal) + 90 ,
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal) + 30 , tan, tanm ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_3
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal),
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal), lod, LODM ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_3 and TTS_4.State = mooring
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal) + 90 ,
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal) + 30 , tan, tanm ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_3 and TTS_4.State = leaving
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal) + 90 ,
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal) + 30 , tan, tanm ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_4
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal),
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal), lodk, LODKM ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_4 and TTS_4.State = mooring
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal) + 90 ,
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal) + 30 , tan, tanm ]
Show_if TTS_4.Tanker_number > 0 and TTS_4.Type = type_4 and TTS_4.State = leaving
  bitmap [ TTS_X(4, TTS_4.State, TTS_4.Terminal) + 90 ,
	  TTS_Y(4, TTS_4.State, TTS_4.Terminal) + 30 , tan, tanm ]

Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_1
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal),
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal), buk,bukm ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_1 and TTS_5.State = mooring
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal) + 90 ,
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal) + 30 , tan, tanm ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_1 and TTS_5.State = leaving
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal) + 90 ,
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal) + 30 , tan, tanm ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_2
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal),
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal), ship, shipm ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_2 and TTS_5.State = mooring
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal) + 90 ,
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal) + 30 , tan, tanm ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_2 and TTS_5.State = leaving
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal) + 90 ,
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal) + 30 , tan, tanm ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_3
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal),
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal), lod, LODM ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_3 and TTS_5.State = mooring
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal) + 90 ,
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal) + 30 , tan, tanm ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_3 and TTS_5.State = leaving
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal) + 90 ,
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal) + 30 , tan, tanm ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_4
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal),
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal), lodk, LODKM ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_4 and TTS_5.State = mooring
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal) + 90 ,
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal) + 30 , tan, tanm ]
Show_if TTS_5.Tanker_number > 0 and TTS_5.Type = type_4 and TTS_5.State = leaving
  bitmap [ TTS_X(5, TTS_5.State, TTS_5.Terminal) + 90 ,
	  TTS_Y(5, TTS_5.State, TTS_5.Terminal) + 30 , tan, tanm ]

Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_1
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal),
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal), buk,bukm ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_1 and TTS_6.State = mooring
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal) + 90 ,
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal) + 30 , tan, tanm ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_1 and TTS_6.State = leaving
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal) + 90 ,
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal) + 30 , tan, tanm ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_2
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal),
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal), ship, shipm ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_2 and TTS_6.State = mooring
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal) + 90 ,
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal) + 30 , tan, tanm ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_2 and TTS_6.State = leaving
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal) + 90 ,
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal) + 30 , tan, tanm ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_3
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal),
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal), lod, LODM ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_3 and TTS_6.State = mooring
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal) + 90 ,
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal) + 30 , tan, tanm ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_3 and TTS_6.State = leaving
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal) + 90 ,
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal) + 30 , tan, tanm ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_4
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal),
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal), lodk, LODKM ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_4 and TTS_6.State = mooring
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal) + 90 ,
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal) + 30 , tan, tanm ]
Show_if TTS_6.Tanker_number > 0 and TTS_6.Type = type_4 and TTS_6.State = leaving
  bitmap [ TTS_X(6, TTS_6.State, TTS_6.Terminal) + 90 ,
	  TTS_Y(6, TTS_6.State, TTS_6.Terminal) + 30 , tan, tanm ]

Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_1
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal),
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal), buk,bukm ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_1 and TTS_7.State = mooring
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal) + 90 ,
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal) + 30 , tan, tanm ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_1 and TTS_7.State = leaving
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal) + 90 ,
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal) + 30 , tan, tanm ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_2
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal),
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal), ship, shipm ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_2 and TTS_7.State = mooring
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal) + 90 ,
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal) + 30 , tan, tanm ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_2 and TTS_7.State = leaving
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal) + 90 ,
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal) + 30 , tan, tanm ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_3
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal),
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal), lod, LODM ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_3 and TTS_7.State = mooring
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal) + 90 ,
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal) + 30 , tan, tanm ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_3 and TTS_7.State = leaving
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal) + 90 ,
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal) + 30 , tan, tanm ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_4
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal),
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal), lodk, LODKM ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_4 and TTS_7.State = mooring
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal) + 90 ,
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal) + 30 , tan, tanm ]
Show_if TTS_7.Tanker_number > 0 and TTS_7.Type = type_4 and TTS_7.State = leaving
  bitmap [ TTS_X(7, TTS_7.State, TTS_7.Terminal) + 90 ,
	  TTS_Y(7, TTS_7.State, TTS_7.Terminal) + 30 , tan, tanm ]

Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_1
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal),
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal), buk,bukm ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_1 and TTS_8.State = mooring
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal) + 90 ,
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal) + 30 , tan, tanm ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_1 and TTS_8.State = leaving
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal) + 90 ,
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal) + 30 , tan, tanm ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_2
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal),
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal), ship, shipm ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_2 and TTS_8.State = mooring
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal) + 90 ,
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal) + 30 , tan, tanm ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_2 and TTS_8.State = leaving
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal) + 90 ,
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal) + 30 , tan, tanm ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_3
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal),
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal), lod, LODM ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_3 and TTS_8.State = mooring
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal) + 90 ,
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal) + 30 , tan, tanm ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_3 and TTS_8.State = leaving
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal) + 90 ,
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal) + 30 , tan, tanm ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_4
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal),
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal), lodk, LODKM ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_4 and TTS_8.State = mooring
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal) + 90 ,
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal) + 30 , tan, tanm ]
Show_if TTS_8.Tanker_number > 0 and TTS_8.Type = type_4 and TTS_8.State = leaving
  bitmap [ TTS_X(8, TTS_8.State, TTS_8.Terminal) + 90 ,
	  TTS_Y(8, TTS_8.State, TTS_8.Terminal) + 30 , tan, tanm ]

Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_1
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal),
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal), buk,bukm ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_1 and TTS_9.State = mooring
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal) + 90 ,
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal) + 30 , tan, tanm ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_1 and TTS_9.State = leaving
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal) + 90 ,
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal) + 30 , tan, tanm ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_2
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal),
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal), ship, shipm ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_2 and TTS_9.State = mooring
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal) + 90 ,
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal) + 30 , tan, tanm ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_2 and TTS_9.State = leaving
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal) + 90 ,
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal) + 30 , tan, tanm ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_3
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal),
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal), lod, LODM ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_3 and TTS_9.State = mooring
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal) + 90 ,
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal) + 30 , tan, tanm ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_3 and TTS_9.State = leaving
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal) + 90 ,
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal) + 30 , tan, tanm ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_4
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal),
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal), lodk, LODKM ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_4 and TTS_9.State = mooring
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal) + 90 ,
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal) + 30 , tan, tanm ]
Show_if TTS_9.Tanker_number > 0 and TTS_9.Type = type_4 and TTS_9.State = leaving
  bitmap [ TTS_X(9, TTS_9.State, TTS_9.Terminal) + 90 ,
	  TTS_Y(9, TTS_9.State, TTS_9.Terminal) + 30 , tan, tanm ]

Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_1
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal),
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal), buk,bukm ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_1 and TTS_10.State = mooring
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal) + 90 ,
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal) + 30 , tan, tanm ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_1 and TTS_10.State = leaving
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal) + 90 ,
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal) + 30 , tan, tanm ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_2
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal),
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal), ship, shipm ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_2 and TTS_10.State = mooring
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal) + 90 ,
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal) + 30 , tan, tanm ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_2 and TTS_10.State = leaving
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal) + 90 ,
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal) + 30 , tan, tanm ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_3
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal),
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal), lod, LODM ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_3 and TTS_10.State = mooring
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal) + 90 ,
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal) + 30 , tan, tanm ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_3 and TTS_10.State = leaving
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal) + 90 ,
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal) + 30 , tan, tanm ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_4
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal),
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal), lodK, LODKM ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_4 and TTS_10.State = mooring
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal) + 90 ,
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal) + 30 , tan, tanm ]
Show_if TTS_10.Tanker_number > 0 and TTS_10.Type = type_4 and TTS_10.State = leaving
  bitmap [ TTS_X(10, TTS_10.State, TTS_10.Terminal) + 90 ,
	  TTS_Y(10, TTS_10.State, TTS_10.Terminal) + 30 , tan, tanm ]

$End

