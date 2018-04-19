

package FLTK.Widgets.Valuators.Counters.Simple is


    type Simple_Counter is new Counter with private;

    type Simple_Counter_Reference (Data : not null access Simple_Counter'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Simple_Counter;

    end Forge;




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




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Counters.Simple;

