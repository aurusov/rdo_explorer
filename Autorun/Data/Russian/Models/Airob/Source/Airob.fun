$Constant
   Const1: such_as Telo.Name = C
   Const2: such_as Const1 = E
$End

$Function SwStor:(free,nofree)
$Type=algorithmic
$Parameters
  Sa: integer
$Body
  Calculate_if  Sa<2 
         SwStor=nofree
  Calculate_if   Sa>=2 
         SwStor=free
$End

$Function Osnova:(pol,opora)
$Type=algorithmic
$Parameters
     Sa: such_as Telo.Xa
     Ra: such_as Telo.RazmOx
$Body
  Calculate_if  Sa>Ra
                      Osnova=pol
  Calculate_if   Sa<Ra
                         Osnova=opora
$End

$Function  SwPlace: ( free,nofree )
$Type = algorithmic
$Parameters
      Sa: integer
      Ra: integer
$Body
       Calculate_if  Sa>=Ra
                 SwPlace=free
       Calculate_if  Sa<Ra
                 SwPlace=nofree
$End

$Function  Mod: integer
$Type=algorithmic
$Parameters
    X1: integer
    X2: integer
$Body
       Calculate_if  X1-X2>0
                  Mod=X1-X2
        Calculate_if  X1-X2<0
                   Mod=(-1)*(X1-X2)
$End

$Function Road: integer
$Type=algorithmic
$Parameters
    X1: integer
    X2: integer
$Body
     Calculate_if X1>X2
            Road=5
     Calculate_if X1<X2
            Road=-5
$End

$Function Us: integer
$Type=algorithmic
$Parameters
    Sa: integer
    R1: integer
    R2: integer
$Body
   Calculate_if Sa>0
      Us= R1
   Calculate_if Sa<0
      Us= R2
$End 

$Function F1:integer
$Type=algorithmic
$Parameters
  X1: integer
  X2: integer
$Body
  Calculate_if X1<>X2
      F1=X1 + 1
  Calculate_if X1=X2
      F1=X2
$End

$Function F2: integer
$Type=algorithmic
$Parameters
  X1: integer
  X2: integer
  Y2: integer
$Body
  Calculate_if X1<>X2
     F2=Y2
  Calculate_if X1=X2
      F2=18
$End

$Function F3: such_as Instrument.Sost
$Type=algorithmic
$Parameters
   X1: integer
   X2: integer
$Body
  Calculate_if X1<>X2
      F3=Zanjat
  Calculate_if X1=X2
     F3=Svoboden
$End

$Function F4: such_as Telo.Name
$Type=algorithmic
$Parameters
   S1: such_as Instrument.Sost
   S2: such_as Telo.Name
   S3: such_as Telo.Name
$Body
   Calculate_if S1=Zanjat
       F4=S2
   Calculate_if S1=Svoboden
      F4=S3 
$End