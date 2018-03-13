

package FLTK.Widgets.Clocks.Updated.Round is


    type Round_Clock is new Updated_Clock with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Round_Clock;

    end Forge;




    procedure Draw
           (This : in out Round_Clock);

    function Handle
           (This  : in out Round_Clock;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Round_Clock is new Updated_Clock with null record;

    overriding procedure Finalize
           (This : in out Round_Clock);


end FLTK.Widgets.Clocks.Updated.Round;

