$Pattern Last: operation trace
$Parameters
   Clock: real
$Relevant_resources
   Dan: Rez     NoChange  NoChange
   SbEd1: Solid  Keep      Keep
   SbEd2: Solid  NoChange  NoChange
   SbEd3: Solid  NoChange  NoChange
   SbEd4: Solid  NoChange  NoChange
   Pyramid1: Na    NoChange  Keep
   Plac: Solid  NoChange  NoChange
   Pyramid2: Na   Create NoChange
   AiRobot: Gripper     Keep    Keep
   Deal: Action     Keep    Keep
$Time=Clock
$Body
       Dan
          Choice from Dan.Solid1=Const1 and
                      Dan.Solid2=Const2
           first
      SbEd1
           Choice from SbEd1.Name=Dan.Solid1 and
                                  SbEd1.Mobil=Mov
            first
            Convert_begin Xa NoChange
                          Ya set SbEd1.Ya - (SbEd1.SizeOy + 5)
                          Za NoChange
            Convert_end   Xa set Dan.Ox
                          Ya set Dan.Oy
                          Za set Dan.Oz
                          Mobil set UnMov
      SbEd2
           Choice from SbEd2.Name=Dan.Solid2
            first

      SbEd3
             Choice from SbEd3.Ya<=SbEd1.Ya and
                               SbEd3.Xa<>SbEd1.Xa
              with_min (Mod(SbEd3.Xa,SbEd1.Xa))

      SbEd4
              Choice from SbEd4.Ya=Dan.Oy
               with_min (Mod(SbEd4.Xa,Dan.Ox))

       Pyramid1
              Choice from Pyramid1.Solid1=SbEd1.Name
                first
                Convert_end
                      Solid1 set Pyramid1.Solid2
                      Solid2 set Pyramid1.Solid3
                      Solid3 set Pyramid1.Solid4
        Plac
            Choice from Plac.Name=floor and
                        Plac.Ya=Dan.Oy
             first
       Pyramid2
             Convert_begin
                 Solid1 set SbEd1.Name
                 Solid2 set floor
                 Solid3 set floor
                 Solid4 set floor
       AiRobot
             Choice from AiRobot.Status=Free
             first
              Convert_begin  Status set Busy
                             Ox set SbEd1.Xa
                             Oy set SbEd1.Ya
              Convert_end Status set Free
                          Ox set Dan.Ox
                          Oy set Dan.Oy - (SbEd1.SizeOy + 5)
       Deal
   Choice from FreeSide(Us((SbEd1.Xa-SbEd3.Xa),(SbEd1.Xa-(SbEd3.Xa+SbEd3.SizeOx)),(SbEd3.Xa-(SbEd1.Xa+SbEd1.SizeOx))))=free and
FreePlace(Mod(Dan.Ox,SbEd4.Xa),Us((Dan.Ox-SbEd4.Xa),SbEd4.SizeOx,SbEd1.SizeOx))=free
              first
              Convert_begin
                         Do set take
                         SolidN set SbEd1.Name
               Convert_end
                         Do set put

$End

$Pattern FreeTop: operation trace
$Parameters
   Clock: real
$Relevant_resources
    Dan: Goal     NoChange Keep
    SbEd1: Solid   Keep    Keep
    Pole: Solid   NoChange  NoChange
    SbEd2: Solid  NoChange  NoChange
    Pyramid1: Na  NoChange   Keep
    Pyramid2: Na  Create   NoChange
    SbEd3: Solid NoChange  NoChange
    AiRobot: Robot  Keep  Keep
    Deal: Action    Keep  Keep
$Time=Clock
$Body
    Dan
         Choice from  Dan.Solid1<> Const1
          first
         Convert_end
               Solid1 set Const1
   SbEd1
          Choice from  SbEd1.Name=Dan.Solid1  and
                                 SbEd1.Mobil = Mov
           first
         Convert_begin
                    Xa  NoChange
                    Ya set SbEd1.Ya -(SbEd1.SizeOy + 5)
                    Za  NoChange
         Convert_end
               Xa set {F1(SbEd1.Xa,(SbEd3.Xa+SbEd3.SizeOx + 2))} SbEd3.Xa + SbEd3.SizeOx + 2
               Ya set {F2(SbEd1.Xa,(SbEd3.Xa+SbEd3.SizeOx + 2),SbEd1.Ya)} Pole.Ya
               Za NoChange
      Pole
          Choice from Pole.Name=floor
                  first
      SbEd2
          Choice from SbEd2.Ya=Pole.Ya and
                      SbEd2.Xa>SbEd1.Xa
          with_min (SbEd2.Xa-(SbEd1.Xa+SbEd1.SizeOx))
     Pyramid1
   Choice from Pyramid1.Solid1=SbEd1.Name and Pyramid1.Solid2<>floor and
       Base(Mod(SbEd2.Xa,(SbEd1.Xa+SbEd1.SizeOx)),SbEd1.SizeOx)=floor
             first
           Convert_end
                 Solid1 set {F4(AiRobot.Status,Pyramid1.Solid1} Pyramid1.Solid2
                 Solid2 set {F4(AiRobot.Status,Pyramid1.Solid2} Pyramid1.Solid3
                 Solid3 set {F4(AiRobot.Status,Pyramid1.Solid3} Pyramid1.Solid4
    Pyramid2
             Convert_begin
                    Solid1 set SbEd1.Name
                    Solid2 set floor
                    Solid3 set floor
                    Solid4 set floor
     SbEd3
          Choice from [SbEd3.Name=Pyramid1.Solid3 and Pyramid1.Solid3<>floor] 
                 or  [SbEd3.Name=Pyramid1.Solid2 and Pyramid1.Solid2<>floor]
                     first   
       AiRobot
            Choice from AiRobot.Status=Free
               first
            Convert_begin
                    Status set Busy
                    Ox   set SbEd1.Xa
                    Oy   set SbEd1.Ya
             Convert_end
                     Status set {F3(SbEd1.Xa,(SbEd3.Xa+SbEd3.SizeOx + 2))} Free
                     Ox set SbEd1.Xa
                     Oy set SbEd1.Ya
    Deal
       Choice from (SbEd3.Xa + SbEd3.SizeOx + SbEd1.SizeOx)<(Pole.Xa + Pole.SizeOx)
              first
             Convert_begin
                         Do set take
                         SolidN set Dan.Solid1
              Convert_end
                         Do set put
$End

$Pattern FreeTop2: operation trace
$Parameters
   Clock: real
$Relevant_resources
    Dan: Goal NoChange  Keep
    SbEd1: Solid  Keep  Keep
    SbEd2: Solid  NoChange  NoChange
    Pole: Solid  NoChange    NoChange
    SbEd3: Solid  NoChange  NoChange
    Pyramid1: Na  NoChange  Keep
    SbEd4: Solid NoChange NoChange
    Pyramid2: Na NoChange  Keep
    AiRobot: Robot  Keep  Keep
    Deal: Action  Keep  Keep
$Time=Clock
$Body
    Dan
      Choice from  Dan.Solid1<>Const1
       first
    Convert_end
        Solid1 set Const1
    SbEd1
      Choice from SbEd1.Name=Dan.Solid1 and
                  SbEd1.Mobil=Mov
        first
     Convert_begin
         Xa  NoChange
         Ya set SbEd1.Ya - (SbEd1.SizeOy + 5)
     Convert_end
         Xa set SbEd4.Xa
         Ya set SbEd4.Ya - SbEd4.SizeOy
         Za set SbEd4.Za
    SbEd2
      Choice from (SbEd2.Ya + SbEd2.SizeOy)>SbEd1.Ya  
             first
    Pole
      Choice from Pole.Name=floor
        first
    SbEd3
      Choice from SbEd3.Ya=Pole.Ya and
                  SbEd3.Xa>SbEd1.Xa
      with_min (Mod(SbEd3.Xa,SbEd1.Xa))
    Pyramid1
     Choice from Pyramid1.Solid1=SbEd3.Name or
                Pyramid1.Solid2=SbEd3.Name
        first
     Convert_end
         Solid1 set SbEd1.Name
         Solid2 set Pyramid1.Solid1
         Solid3 set Pyramid1.Solid2
    SbEd4
       Choice from SbEd4.Name=Pyramid1.Solid1
            first
   Pyramid2
      Choice from Pyramid2.Solid1=SbEd1.Name and Pyramid2.Solid2<>floor and
       Base (Mod((SbEd1.Xa+SbEd1.SizeOx),SbEd3.Xa),SbEd1.SizeOx)=opora
         first
      Convert_end
          Solid1 set Pyramid2.Solid2
          Solid2 set Pyramid2.Solid3
          Solid3 set Pyramid2.Solid4
   AiRobot
      Choice from AiRobot.Status=Free
       first
      Convert_begin
         Status set Busy
         Ox set SbEd1.Xa
         Oy set SbEd1.Ya
     Convert_end
         Status set Free
         Ox set SbEd3.Xa
         Oy set SbEd3.Ya
    Deal
    Choice from FreeSide(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.SizeOx)),(SbEd2.Xa-(SbEd1.Xa+SbEd1.SizeOx))))=free
       first
      Convert_begin
         Do set take
         SolidN set SbEd1.Name
      Convert_end
         Do set put
         SolidN NoChange
$End

$Pattern FrSide: operation trace
$Parameters
    Clock: real
$Relevant_resources
    Dan: Rez NoChange  Keep
    SbEd1: Solid  Keep   Keep
    Pole: Solid  NoChange NoChange
    SbEd2: Solid NoChange NoChange
    SbEd3: Solid NoChange NoChange
    Pyramid1: Na NoChange  Keep
    Pyramid2: Na Create  NoChange
    AiRobot: Robot Keep  Keep
    Deal: Action Keep  Keep
$Time=Clock
$Body
    Dan
      Choice from Dan.Solid1<>Const1
       first
     Convert_end
         Solid1 set Const1
    SbEd1
      Choice from SbEd1.Name = Dan.Solid1 and
                  SbEd1.Mobil=Mov
      first
      Convert_begin
          Xa NoChange
          Ya set SbEd1.Ya - (SbEd1.SizeOy + 5)
     Convert_end
          Xa set SbEd1.Xa + Road(SbEd1.Xa,SbEd2.Xa)
          Ya set Pole.Ya
   Pole
     Choice from Pole.Name=floor
       first
   SbEd2
     Choice from SbEd2.Name=Const1
           first
   SbEd3
      Choice from SbEd3.Ya=Pole.Ya and SbEd3.Name<>SbEd2.Name
           with_min (Mod(SbEd1.Xa,SbEd3.Xa))
   Pyramid1
     Choice from Pyramid1.Solid1=SbEd1.Name and
Base(Us((SbEd1.Xa-SbEd3.Xa),(SbEd1.Xa-(SbEd3.Xa+SbEd3.SizeOx)),(SbEd3.Xa-(SbEd1.Xa+SbEd1.SizeOx))), 5)=floor
       first
     Convert_end
         Solid1 set Pyramid1.Solid2
         Solid2 set Pyramid1.Solid3
         Solid3 set Pyramid1.Solid4
    Pyramid2
     Convert_begin
        Solid1 set SbEd1.Name
        Solid2 set Pole.Name
        Solid3 set floor
        Solid4 set floor
   AiRobot
     Choice from AiRobot.Status=Free and
 SbEd1.Xa + Road(SbEd1.Xa,SbEd2.Xa)> Pole.Xa and
SbEd1.Xa + Road(SbEd1.Xa,SbEd2.Xa)< (Pole.Xa + Pole.SizeOx)
      first
     Convert_begin
        Status set Busy
        Ox set SbEd1.Xa
        Oy set SbEd1.Ya
    Convert_end
        Status set Free
        Ox set SbEd1.Xa
        Oy set Pole.Ya - (SbEd1.SizeOy + 5)
   Deal
     Choice from FreeSide(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.SizeOx)),(SbEd2.Xa-(SbEd1.Xa+SbEd1.SizeOx))))=nofree
      first
     Convert_begin
      Do set take
      SolidN set Dan.Solid1
    Convert_end
         Do set put
         SolidN NoChange
$End

$Pattern FrSide2: operation trace
$Parameters
    Clock: real
$Relevant_resources
    Dan: Goal  NoChange  Keep
    SbEd1: Solid  Keep   Keep
    SbEd2: Solid  NoChange  NoChange
    Pole: Solid  NoChange  NoChange
    SbEd3: Solid  NoChange  NoChange
    Pyramid1: Na NoChange  Keep
    SbEd4: Solid  NoChange  NoChange
    Pyramid2: Na  NoChange  Keep
    AiRobot: Gripper  Keep  Keep
    Deal: Action  Keep   Keep
$Time=Clock
$Body
     Dan
         Choice from Dan.Solid1<>Const1
              first
          Convert_end
                  Solid1 set Const1
      SbEd1
         Choice from  SbEd1.Name=Dan.Solid1  and
                                 SbEd1.Mobil=Mov
                first
          Convert_begin
                  Ya set SbEd1.Ya - (SbEd1.SizeOy + 2)
          Convert_end
                  Xa set SbEd4.Xa
                  Ya set SbEd4.Ya - SbEd4.SizeOy
                  Za set SbEd4.Za
    SbEd2
        Choice from SbEd2.Name=Const1
            first
   Pole
        Choice from Pole.Name =floor
             first
   SbEd3
       Choice from  SbEd3.Ya=Pole.Ya  and SbEd3.Xa<>SbEd1.Xa and
                    SbEd3.Name<>Const1
          with_min (Mod(SbEd3.Xa,SbEd1.Xa))
Pyramid1
        Choice from Pyramid1.Solid1=SbEd3.Name or
      Pyramid1.Solid2=SbEd3.Name or Pyramid1.Solid3=SbEd3.Name
               first
         Convert_end
                 Solid1 set SbEd1.Name
                 Solid2 set Pyramid1.Solid1
                 Solid3 set Pyramid1.Solid2
   SbEd4
         Choice from SbEd4.Name=Pyramid1.Solid1 and
                     SbEd4.Name<>Const1
              first
  Pyramid2
          Choice from Pyramid2.Solid1=SbEd1.Name  and
Base(Us((SbEd1.Xa-SbEd3.Xa),(SbEd1.Xa-(SbEd3.Xa+SbEd3.SizeOx)),(SbEd3.Xa-(SbEd1.Xa+SbEd1.SizeOx))),SbEd1.SizeOx)=opora
              first
          Convert_end
                  Solid1 set Pyramid2.Solid2
                  Solid2 set Pyramid2.Solid3
                  Solid3 set Pyramid2.Solid4
    AiRobot
          Choice from AiRobot.Status=Free
                 first
           Convert_begin
                    Status set Busy
                    Ox set SbEd1.Xa
                    Oy set SbEd1.Ya
          Convert_end
                    Status set Free
                    Ox set SbEd4.Xa
                    Oy set SbEd4.Ya - (SbEd4.SizeOy + 2)
    Deal
     Choice from FreeSide(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.SizeOx)),
                 (SbEd2.Xa-(SbEd1.Xa+SbEd1.SizeOx))))=nofree
                   first
           Convert_begin
                     Do set take
                     SolidN set SbEd1.Name
            Convert_end
                     Do set put
                     SolidN  NoChange
$End

$Pattern FrPlace: operation trace
$Parameters
   Clock: real
$Relevant_resources
    Dan: Goal  NoChange  Keep
    SbEd:  Solid NoChange NoChange
    SbEd1: Solid  Keep  Keep
    SbEd2: Solid NoChange NoChange
    Pyramid: Na NoChange  Keep
    AiRobot: Robot Keep  Keep
    Deal: Action Keep  Keep
$Time=Clock
$Body
    Dan
      Choice from Dan.Solid1<>Const1
       first
     Convert_end
         Solid1 set Const1
    SbEd
      Choice from SbEd.Name=Const1
        first
    SbEd1
      Choice from SbEd1.Name=Dan.Solid1 and
                  SbEd1.Mobil=Mov and
FreePlace(Mod(SbEd1.Xa,Dan.Ox),Us((SbEd1.Xa-Dan.Ox),SbEd.SizeOx,SbEd1.SizeOx))=nofree
         first
      Convert_begin
         Xa NoChange
         Ya set SbEd1.Ya - (SbEd1.SizeOy + 5)
      Convert_end
         Xa set 20
         Ya set 320
         Za set 165
    SbEd2
      Choice from SbEd2.Ya>=SbEd1.Ya  and
                    SbEd1.Xa<>SbEd2.Xa
       with_min (Mod(SbEd1.Xa,SbEd2.Xa))
    Pyramid
      Choice from Pyramid.Solid1=SbEd1.Name
        first
      Convert_end
         Solid1 set Pyramid.Solid2
         Solid2 set Pyramid.Solid3
         Solid3 set Pyramid.Solid4
    AiRobot
      Choice from AiRobot.Status=Free
        first
      Convert_begin
         Status set Busy
         Ox set SbEd1.Xa
         Oy set SbEd1.Ya
      Convert_end
          Status set Free
          Ox set 20
          Oy set 320 - (SbEd1.SizeOy + 5)
    Deal
      Choice from FreeSide(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.SizeOx)),(SbEd2.Xa-(SbEd1.Xa+SbEd1.SizeOx))))=free
        first
      Convert_begin
          Do set take
          SolidN set SbEd1.Name
      Convert_end
          Do set kill
          SolidN  NoChange
$End

$Pattern Change1: rule trace
$Relevant_resources
    SbEd1: Solid NoChange
    SbEd2: Solid NoChange
    Dan: Goal  Keep
$Body
    SbEd1
      Choice from SbEd1.Name = Const1
        first
    SbEd2
      Choice from  SbEd2.Ya<=SbEd1.Ya  and
                    SbEd1.Xa<>SbEd2.Xa
       with_min (Mod(SbEd1.Xa,SbEd2.Xa))
    Dan
      Choice from Dan.Solid1=Const1 and
FreeSide(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.SizeOx)),(SbEd2.Xa-(SbEd1.Xa+SbEd1.SizeOx))))=nofree
         first
      Convert_rule
         Solid1 set SbEd2.Name
$End

$Pattern Change2: rule trace
$Relevant_resources
    Pyramid: Na NoChange
    Dan: Goal  Keep
$Body
    Pyramid
      Choice from Pyramid.Solid2=Const1 or
                  Pyramid.Solid3=Const1
        first
    Dan
      Choice from Dan.Solid1=Const1
      first
      Convert_rule
         Solid1 set Pyramid.Solid1
$End

$Pattern Change3: rule  trace
$Relevant_resources
   Dan: Goal  Keep
   SbEd1: Solid NoChange
   SbEd2: Solid NoChange
$Body
    Dan
      Choice from Dan.Solid1=Const1
        first
      Convert_rule
         Solid1 set SbEd2.Name
    SbEd1
      Choice from SbEd1.Name=Dan.Solid1
        first
    SbEd2
      Choice from SbEd2.Ya=Dan.Oy  and SbEd2.Mobil=Mov and
 FreePlace(Mod(Dan.Ox,SbEd2.Xa),Us((SbEd2.Xa-Dan.Ox),SbEd1.SizeOx,SbEd2.SizeOx))=nofree
      with_min (Mod(Dan.Ox,SbEd2.Xa))
$End

$Pattern Add: irregular_event trace
$Parameters
   Clock: real
$Relevant_resources
    Deal: Deistv Keep
    AiRobot: Gripper Keep
$Time = Clock 
$Body
   Deal
      Convert_event
           Do set raport
    AiRobot
      Convert_event
          Ox set 15
          Oy set 220
          Oz set 50
$End
