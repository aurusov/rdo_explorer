$Constant
   Const1: such_as Solid.Name = C
   Const2: such_as Const1 = E
$End

$Function FreeSide:(free,nofree)
$Type=algorithmic
$Parameters
  Sa: integer
$Body
  Calculate_if  Sa<2 
         FreeSide=nofree
  Calculate_if   Sa>=2 
         FreeSide=free
$End

$Function Base:(floor,opora)
$Type=algorithmic
$Parameters
     Sa: such_as Solid.Xa
     Ra: such_as Solid.SizeOx
$Body
  Calculate_if  Sa>Ra
                      Base=floor
  Calculate_if   Sa<Ra
                         Base=opora
$End

$Function  FreePlace: ( free,nofree )
$Type = algorithmic
$Parameters
      Sa: integer
      Ra: integer
$Body
       Calculate_if  Sa>=Ra
                 FreePlace=free
       Calculate_if  Sa<Ra
                 FreePlace=nofree
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

$Function F3: such_as Robot.Status
$Type=algorithmic
$Parameters
   X1: integer
   X2: integer
$Body
  Calculate_if X1<>X2
      F3=Busy
  Calculate_if X1=X2
     F3=Free
$End

$Function F4: such_as Solid.Name
$Type=algorithmic
$Parameters
   S1: such_as Robot.Status
   S2: such_as Solid.Name
   S3: such_as Solid.Name
$Body
   Calculate_if S1=Busy
       F4=S2
   Calculate_if S1=Free
      F4=S3 
$End