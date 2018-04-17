

package FLTK.Widgets.Clocks.Updated.Round is


    type Round_Clock is new Updated_Clock with private;

    type Round_Clock_Reference (Data : not null access Round_Clock'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Round_Clock;

    end Forge;




    procedure Draw
           (This : in out Round_Clock);

    procedure Draw
           (This       : in out Clock;
            X, Y, W, H : in     Integer);

    function Handle
           (This  : in out Round_Clock;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Round_Clock is new Updated_Clock with null record;

    overriding procedure Finalize
           (This : in out Round_Clock);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Clocks.Updated.Round;

