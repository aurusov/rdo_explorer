$Pattern Last: operation trace
$Parameters
   Clock: real
$Relevant_resources
   Dan: Rez     NoChange  NoChange
   SbEd1: Telo  Keep      Keep
   SbEd2: Telo  NoChange  NoChange
   SbEd3: Telo  NoChange  NoChange
   SbEd4: Telo  NoChange  NoChange
   Piramida1: Na    NoChange  Keep
   Plac: Telo  NoChange  NoChange
   Piramida2: Na   Create NoChange
   Robot: Shvat     Keep    Keep
   Deal: Action     Keep    Keep
$Time=Clock
$Body
       Dan
          Choice from Dan.Telo1=Const1 and
                      Dan.Telo2=Const2
           first
      SbEd1
           Choice from SbEd1.Name=Dan.Telo1 and
                                  SbEd1.Podv=Mov
            first
            Convert_begin Xa NoChange
                          Ya set SbEd1.Ya - (SbEd1.RazmOy + 5)
                          Za NoChange
            Convert_end   Xa set Dan.Ox
                          Ya set Dan.Oy
                          Za set Dan.Oz
                          Podv set UnMov
      SbEd2
           Choice from SbEd2.Name=Dan.Telo2
            first

      SbEd3
             Choice from SbEd3.Ya<=SbEd1.Ya and
                               SbEd3.Xa<>SbEd1.Xa
              with_min (Mod(SbEd3.Xa,SbEd1.Xa))

      SbEd4
              Choice from SbEd4.Ya=Dan.Oy
               with_min (Mod(SbEd4.Xa,Dan.Ox))

       Piramida1
              Choice from Piramida1.Telo1=SbEd1.Name
                first
                Convert_end
                      Telo1 set Piramida1.Telo2
                      Telo2 set Piramida1.Telo3
                      Telo3 set Piramida1.Telo4
        Plac
            Choice from Plac.Name=Pol and
                        Plac.Ya=Dan.Oy
             first
       Piramida2
             Convert_begin
                 Telo1 set SbEd1.Name
                 Telo2 set Pol
                 Telo3 set Pol
                 Telo4 set Pol
       Robot
             Choice from Robot.Sost=Svoboden
             first
              Convert_begin  Sost set Zanjat
                             Ox set SbEd1.Xa
                             Oy set SbEd1.Ya
              Convert_end Sost set Svoboden
                          Ox set Dan.Ox
                          Oy set Dan.Oy - (SbEd1.RazmOy + 5)
       Deal
   Choice from SwStor(Us((SbEd1.Xa-SbEd3.Xa),(SbEd1.Xa-(SbEd3.Xa+SbEd3.RazmOx)),(SbEd3.Xa-(SbEd1.Xa+SbEd1.RazmOx))))=free and
SwPlace(Mod(Dan.Ox,SbEd4.Xa),Us((Dan.Ox-SbEd4.Xa),SbEd4.RazmOx,SbEd1.RazmOx))=free
              first
              Convert_begin
                         TeloN set SbEd1.Name
                         Do set take
               Convert_end
                         Do set put

$End

$Pattern OsvWerh: operation trace
$Parameters
   Clock: real
$Relevant_resources
    Dan: Goal     NoChange Keep
    SbEd1: Telo   Keep    Keep
    Pole: Telo   NoChange  NoChange
    SbEd2: Telo  NoChange  NoChange
    Piramida1: Na  NoChange   Keep
    Piramida2: Na  Create   NoChange
    SbEd3: Telo NoChange  NoChange
    Robot: Instrument  Keep  Keep
    Deal: Action    Keep  Keep
$Time=Clock
$Body
    Dan
         Choice from  Dan.Telo1<> Const1
          first
         Convert_end
               Telo1 set Const1
   SbEd1
          Choice from  SbEd1.Name=Dan.Telo1  and
                                 SbEd1.Podv = Mov
           first
         Convert_begin
                    Ya set SbEd1.Ya -(SbEd1.RazmOy + 5)
                    Xa  NoChange
                    Za  NoChange
         Convert_end
               Xa set {F1(SbEd1.Xa,(SbEd3.Xa+SbEd3.RazmOx + 2))} SbEd3.Xa + SbEd3.RazmOx + 2
               Ya set {F2(SbEd1.Xa,(SbEd3.Xa+SbEd3.RazmOx + 2),SbEd1.Ya)} Pole.Ya
               Za NoChange
      Pole
          Choice from Pole.Name=Pol
                  first
      SbEd2
          Choice from SbEd2.Ya=Pole.Ya and
                      SbEd2.Xa>SbEd1.Xa
          with_min (SbEd2.Xa-(SbEd1.Xa+SbEd1.RazmOx))
     Piramida1
   Choice from Piramida1.Telo1=SbEd1.Name and Piramida1.Telo2<>Pol and
       Osnova(Mod(SbEd2.Xa,(SbEd1.Xa+SbEd1.RazmOx)),SbEd1.RazmOx)=pol
             first
           Convert_end
                 Telo1 set {F4(Robot.Sost,Piramida1.Telo1} Piramida1.Telo2
                 Telo2 set {F4(Robot.Sost,Piramida1.Telo2} Piramida1.Telo3
                 Telo3 set {F4(Robot.Sost,Piramida1.Telo3} Piramida1.Telo4
    Piramida2
             Convert_begin
                    Telo1 set SbEd1.Name
                    Telo2 set Pol
                    Telo3 set Pol
                    Telo4 set Pol
     SbEd3
          Choice from [SbEd3.Name=Piramida1.Telo3 and Piramida1.Telo3<>Pol] 
                 or  [SbEd3.Name=Piramida1.Telo2 and Piramida1.Telo2<>Pol]
                     first   
       Robot
            Choice from Robot.Sost=Svoboden
               first
            Convert_begin
                    Sost set Zanjat
                    Ox   set SbEd1.Xa
                    Oy   set SbEd1.Ya
             Convert_end
                     Sost set {F3(SbEd1.Xa,(SbEd3.Xa+SbEd3.RazmOx + 2))} Svoboden
                     Ox set SbEd1.Xa
                     Oy set SbEd1.Ya
    Deal
       Choice from (SbEd3.Xa + SbEd3.RazmOx + SbEd1.RazmOx)<(Pole.Xa + Pole.RazmOx)
              first
             Convert_begin
                         TeloN set Dan.Telo1
                         Do set take
              Convert_end
                         Do set put
$End

$Pattern OsvWerh2: operation trace
$Parameters
   Clock: real
$Relevant_resources
    Dan: Goal NoChange  Keep
    SbEd1: Telo  Keep  Keep
    SbEd2: Telo  NoChange  NoChange
    Pole: Telo  NoChange    NoChange
    SbEd3: Telo  NoChange  NoChange
    Piramida1: Na  NoChange  Keep
    SbEd4: Telo NoChange NoChange
    Piramida2: Na NoChange  Keep
    Robot: Instrument  Keep  Keep
    Deal: Action  Keep  Keep
$Time=Clock
$Body
    Dan
      Choice from  Dan.Telo1<>Const1
       first
    Convert_end
        Telo1 set Const1
    SbEd1
      Choice from SbEd1.Name=Dan.Telo1 and
                  SbEd1.Podv=Mov
        first
     Convert_begin
         Xa  NoChange
         Ya set SbEd1.Ya - (SbEd1.RazmOy + 5)
     Convert_end
         Xa set SbEd4.Xa
         Ya set SbEd4.Ya - SbEd4.RazmOy
         Za set SbEd4.Za
    SbEd2
      Choice from (SbEd2.Ya + SbEd2.RazmOy)>SbEd1.Ya  
             first
    Pole
      Choice from Pole.Name=Pol
        first
    SbEd3
      Choice from SbEd3.Ya=Pole.Ya and
                  SbEd3.Xa>SbEd1.Xa
      with_min (Mod(SbEd3.Xa,SbEd1.Xa))
    Piramida1
     Choice from Piramida1.Telo1=SbEd3.Name or
                Piramida1.Telo2=SbEd3.Name
        first
     Convert_end
         Telo1 set SbEd1.Name
         Telo2 set Piramida1.Telo1
         Telo3 set Piramida1.Telo2
    SbEd4
       Choice from SbEd4.Name=Piramida1.Telo1
            first
   Piramida2
      Choice from Piramida2.Telo1=SbEd1.Name and Piramida2.Telo2<>Pol and
       Osnova (Mod((SbEd1.Xa+SbEd1.RazmOx),SbEd3.Xa),SbEd1.RazmOx)=opora
         first
      Convert_end
          Telo1 set Piramida2.Telo2
          Telo2 set Piramida2.Telo3
          Telo3 set Piramida2.Telo4
   Robot
      Choice from Robot.Sost=Svoboden
       first
      Convert_begin
         Sost set Zanjat
         Ox set SbEd1.Xa
         Oy set SbEd1.Ya
     Convert_end
         Sost set Svoboden
         Ox set SbEd3.Xa
         Oy set SbEd3.Ya
    Deal
    Choice from SwStor(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.RazmOx)),(SbEd2.Xa-(SbEd1.Xa+SbEd1.RazmOx))))=free
       first
      Convert_begin
         TeloN set SbEd1.Name
         Do set take
      Convert_end
         TeloN NoChange
         Do set put
$End

$Pattern OsvStor: operation trace
$Parameters
    Clock: real
$Relevant_resources
    Dan: Rez NoChange  Keep
    SbEd1: Telo  Keep   Keep
    Pole: Telo  NoChange NoChange
    SbEd2: Telo NoChange NoChange
    SbEd3: Telo NoChange NoChange
    Piramida1: Na NoChange  Keep
    Piramida2: Na Create  NoChange
    Robot: Instrument Keep  Keep
    Deal: Action Keep  Keep
$Time=Clock
$Body
    Dan
      Choice from Dan.Telo1<>Const1
       first
     Convert_end
         Telo1 set Const1
    SbEd1
      Choice from SbEd1.Name = Dan.Telo1 and
                  SbEd1.Podv=Mov
      first
      Convert_begin
          Xa NoChange
          Ya set SbEd1.Ya - (SbEd1.RazmOy + 5)
     Convert_end
          Xa set SbEd1.Xa + Road(SbEd1.Xa,SbEd2.Xa)
          Ya set Pole.Ya
   Pole
     Choice from Pole.Name=Pol
       first
   SbEd2
     Choice from SbEd2.Name=Const1
           first
   SbEd3
      Choice from SbEd3.Ya=Pole.Ya and SbEd3.Name<>SbEd2.Name
           with_min (Mod(SbEd1.Xa,SbEd3.Xa))
   Piramida1
     Choice from Piramida1.Telo1=SbEd1.Name and
Osnova(Us((SbEd1.Xa-SbEd3.Xa),(SbEd1.Xa-(SbEd3.Xa+SbEd3.RazmOx)),(SbEd3.Xa-(SbEd1.Xa+SbEd1.RazmOx))), 5)=pol
       first
     Convert_end
         Telo1 set Piramida1.Telo2
         Telo2 set Piramida1.Telo3
         Telo3 set Piramida1.Telo4
    Piramida2
     Convert_begin
        Telo1 set SbEd1.Name
        Telo2 set Pole.Name
        Telo3 set Pol
        Telo4 set Pol
   Robot
     Choice from Robot.Sost=Svoboden and
 SbEd1.Xa + Road(SbEd1.Xa,SbEd2.Xa)> Pole.Xa and
SbEd1.Xa + Road(SbEd1.Xa,SbEd2.Xa)< (Pole.Xa + Pole.RazmOx)
      first
     Convert_begin
        Sost set Zanjat
        Ox set SbEd1.Xa
        Oy set SbEd1.Ya
    Convert_end
        Sost set Svoboden
        Ox set SbEd1.Xa
        Oy set Pole.Ya - (SbEd1.RazmOy + 5)
   Deal
     Choice from SwStor(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.RazmOx)),(SbEd2.Xa-(SbEd1.Xa+SbEd1.RazmOx))))=nofree
      first
     Convert_begin
      TeloN set Dan.Telo1
      Do set take
    Convert_end
         Do set put
         TeloN NoChange
$End

$Pattern OsvStor2: operation trace
$Parameters
    Clock: real
$Relevant_resources
    Dan: Goal  NoChange  Keep
    SbEd1: Telo  Keep   Keep
    SbEd2: Telo  NoChange  NoChange
    Pole: Telo  NoChange  NoChange
    SbEd3: Telo  NoChange  NoChange
    Piramida1: Na NoChange  Keep
    SbEd4: Telo  NoChange  NoChange
    Piramida2: Na  NoChange  Keep
    Robot: Shvat  Keep  Keep
    Deal: Action  Keep   Keep
$Time=Clock
$Body
     Dan
         Choice from Dan.Telo1<>Const1
              first
          Convert_end
                  Telo1 set Const1
      SbEd1
         Choice from  SbEd1.Name=Dan.Telo1  and
                                 SbEd1.Podv=Mov
                first
          Convert_begin
                  Ya set SbEd1.Ya - (SbEd1.RazmOy + 2)
          Convert_end
                  Xa set SbEd4.Xa
                  Ya set SbEd4.Ya - SbEd4.RazmOy
                  Za set SbEd4.Za
    SbEd2
        Choice from SbEd2.Name=Const1
            first
   Pole
        Choice from Pole.Name =Pol
             first
   SbEd3
       Choice from  SbEd3.Ya=Pole.Ya  and SbEd3.Xa<>SbEd1.Xa and
                    SbEd3.Name<>Const1
          with_min (Mod(SbEd3.Xa,SbEd1.Xa))
Piramida1
        Choice from Piramida1.Telo1=SbEd3.Name or
      Piramida1.Telo2=SbEd3.Name or Piramida1.Telo3=SbEd3.Name
               first
         Convert_end
                 Telo1 set SbEd1.Name
                 Telo2 set Piramida1.Telo1
                 Telo3 set Piramida1.Telo2
   SbEd4
         Choice from SbEd4.Name=Piramida1.Telo1 and
                     SbEd4.Name<>Const1
              first
  Piramida2
          Choice from Piramida2.Telo1=SbEd1.Name  and
Osnova(Us((SbEd1.Xa-SbEd3.Xa),(SbEd1.Xa-(SbEd3.Xa+SbEd3.RazmOx)),(SbEd3.Xa-(SbEd1.Xa+SbEd1.RazmOx))),SbEd1.RazmOx)=opora
              first
          Convert_end
                  Telo1 set Piramida2.Telo2
                  Telo2 set Piramida2.Telo3
                  Telo3 set Piramida2.Telo4
    Robot
          Choice from Robot.Sost=Svoboden
                 first
           Convert_begin
                    Sost set Zanjat
                    Ox set SbEd1.Xa
                    Oy set SbEd1.Ya
          Convert_end
                    Sost set Svoboden
                    Ox set SbEd4.Xa
                    Oy set SbEd4.Ya - (SbEd4.RazmOy + 2)
    Deal
     Choice from SwStor(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.RazmOx)),
                 (SbEd2.Xa-(SbEd1.Xa+SbEd1.RazmOx))))=nofree
                   first
           Convert_begin
                     TeloN set SbEd1.Name
                     Do set take
            Convert_end
                     TeloN  NoChange
                     Do set put
$End

$Pattern SwMesto: operation trace
$Parameters
   Clock: real
$Relevant_resources
    Dan: Goal  NoChange  Keep
    SbEd:  Telo NoChange NoChange
    SbEd1: Telo  Keep  Keep
    SbEd2: Telo NoChange NoChange
    Piramida: Na NoChange  Keep
    Robot: Instrument Keep  Keep
    Deal: Action Keep  Keep
$Time=Clock
$Body
    Dan
      Choice from Dan.Telo1<>Const1
       first
     Convert_end
         Telo1 set Const1
    SbEd
      Choice from SbEd.Name=Const1
        first
    SbEd1
      Choice from SbEd1.Name=Dan.Telo1 and
                  SbEd1.Podv=Mov and
SwPlace(Mod(SbEd1.Xa,Dan.Ox),Us((SbEd1.Xa-Dan.Ox),SbEd.RazmOx,SbEd1.RazmOx))=nofree
         first
      Convert_begin
         Xa NoChange
         Ya set SbEd1.Ya - (SbEd1.RazmOy + 5)
      Convert_end
         Xa set 20
         Ya set 320
         Za set 165
    SbEd2
      Choice from SbEd2.Ya>=SbEd1.Ya  and
                    SbEd1.Xa<>SbEd2.Xa
       with_min (Mod(SbEd1.Xa,SbEd2.Xa))
    Piramida
      Choice from Piramida.Telo1=SbEd1.Name
        first
      Convert_end
         Telo1 set Piramida.Telo2
         Telo2 set Piramida.Telo3
         Telo3 set Piramida.Telo4
    Robot
      Choice from Robot.Sost=Svoboden
        first
      Convert_begin
         Sost set Zanjat
         Ox set SbEd1.Xa
         Oy set SbEd1.Ya
      Convert_end
          Sost set Svoboden
          Ox set 20
          Oy set 320 - (SbEd1.RazmOy + 5)
    Deal
      Choice from SwStor(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.RazmOx)),(SbEd2.Xa-(SbEd1.Xa+SbEd1.RazmOx))))=free
        first
      Convert_begin
          TeloN set SbEd1.Name
          Do set take
      Convert_end
          TeloN  NoChange
          Do set kill
$End

$Pattern Peremena1: rule trace
$Relevant_resources
    SbEd1: Telo NoChange
    SbEd2: Telo NoChange
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
      Choice from Dan.Telo1=Const1 and
SwStor(Us((SbEd1.Xa-SbEd2.Xa),(SbEd1.Xa-(SbEd2.Xa+SbEd2.RazmOx)),(SbEd2.Xa-(SbEd1.Xa+SbEd1.RazmOx))))=nofree
         first
      Convert_rule
         Telo1 set SbEd2.Name
$End

$Pattern Peremena2: rule trace
$Relevant_resources
    Piramida: Na NoChange
    Dan: Goal  Keep
$Body
    Piramida
      Choice from Piramida.Telo2=Const1 or
                  Piramida.Telo3=Const1
        first
    Dan
      Choice from Dan.Telo1=Const1
      first
      Convert_rule
         Telo1 set Piramida.Telo1
$End

$Pattern Peremena3: rule  trace
$Relevant_resources
   Dan: Goal  Keep
   SbEd1: Telo NoChange
   SbEd2: Telo NoChange
$Body
    Dan
      Choice from Dan.Telo1=Const1
        first
      Convert_rule
         Telo1 set SbEd2.Name
    SbEd1
      Choice from SbEd1.Name=Dan.Telo1
        first
    SbEd2
      Choice from SbEd2.Ya=Dan.Oy  and SbEd2.Podv=Mov and
 SwPlace(Mod(Dan.Ox,SbEd2.Xa),Us((SbEd2.Xa-Dan.Ox),SbEd1.RazmOx,SbEd2.RazmOx))=nofree
      with_min (Mod(Dan.Ox,SbEd2.Xa))
$End

$Pattern Dopoln: irregular_event trace
$Parameters
   Clock: real
$Relevant_resources
    Deal: Deistv Keep
    Robot: Shvat Keep
$Time = Clock 
$Body
   Deal
      Convert_event
           Do set raport
    Robot
      Convert_event
          Ox set 15
          Oy set 220
          Oz set 50
$End
