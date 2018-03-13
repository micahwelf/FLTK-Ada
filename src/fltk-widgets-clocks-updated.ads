

package FLTK.Widgets.Clocks.Updated is


    type Updated_Clock is new Clock with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Updated_Clock;

    end Forge;




    procedure Draw
           (This : in out Updated_Clock);

    function Handle
           (This  : in out Updated_Clock;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Updated_Clock is new Clock with null record;

    overriding procedure Finalize
           (This : in out Updated_Clock);


end FLTK.Widgets.Clocks.Updated;

