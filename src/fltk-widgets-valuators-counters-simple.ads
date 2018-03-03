

package FLTK.Widgets.Valuators.Counters.Simple is


    type Simple_Counter is new Counter with private;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Simple_Counter;




    procedure Draw
           (This : in out Simple_Counter);

    function Handle
           (This  : in out Simple_Counter;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Simple_Counter is new Counter with null record;

    overriding procedure Finalize
           (This : in out Simple_Counter);


end FLTK.Widgets.Valuators.Counters.Simple;

