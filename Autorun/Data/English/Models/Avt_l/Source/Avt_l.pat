$Pattern Result_of_action_1 : rule { trace }
$Relevant_resources
  Automaton_   :  Automaton   Keep

$Body
  Automaton_
    Choice from
       Automaton_.Status  =  Action and
       Automaton.State_Petal  =  1
     first
    Convert_rule
          Status       set   Transition
          Environment  set   Environment_action_1
          Counter_1    set   Automaton.Counter_1 + 1
$End

$Pattern Result_of_action_2 : rule { trace }
$Relevant_resources
  Automaton_   :  Automaton   Keep

$Body
  Automaton_
    Choice from
       Automaton_.Status =  Action and
       Automaton.State_Petal  =  2
     first
    Convert_rule
          Status        set   Transition
          Environment   set   Environment_action_2
          Counter_2     set   Automaton.Counter_2 + 1
$End

$Pattern Result_of_action_3 : rule { trace }
$Relevant_resources
  Automaton_   :  Automaton   Keep

$Body
  Automaton_
    Choice from
       Automaton_.Status  =  Action and
       Automaton.State_Petal  =  3
     first
    Convert_rule
          Status        set   Transition
          Environment   set   Environment_action_3
          Counter_3     set   Automaton.Counter_3 + 1
$End

$Pattern  Transition_of_Automaton_Penalty : rule   { trace }
$Parameters
   Petal               :  integer
   Position            :  integer
   Petal_new_pen       :  integer
   Position_new_pen    :  integer
$Relevant_resources
  Automaton_  : Automaton  Keep 
 
$Body
  Automaton_
    Choice from Automaton_.Status = Transition  and
                Automaton_.Environment  = Penalty    and
                Automaton.State_Petal = Petal and
                Automaton_.State_Position  = Position
          first
    Convert_rule
                Status           set  Action
                State_Petal      set  Petal_new_pen
                State_Position   set  Position_new_pen
                Counter          set  Automaton_.Counter + 1
$End
   

$Pattern  Transition_of_Automaton_Encouragement : rule  { trace }
$Parameters
   Petal               :  integer
   Position            :  integer
   Position_new_enc    :  integer
$Relevant_resources
  Automaton_  : Automaton  Keep 
 
$Body
  Automaton_
    Choice from Automaton_.Status = Transition  and
                Automaton_.Environment  = Encouragement and
                Automaton.State_Petal = Petal and
                Automaton_.State_Position  = Position 
          first
    Convert_rule
                Status              set  Action
                State_Position      set  Position_new_enc
                Counter             set  Automaton_.Counter + 1
$End
   