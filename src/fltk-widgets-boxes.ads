

package FLTK.Widgets.Boxes is


    type Box is new Widget with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Box;

    end Forge;




    procedure Draw
           (This : in out Box);

    function Handle
           (This  : in out Box;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Box is new Widget with null record;

    overriding procedure Finalize
           (This : in out Box);


end FLTK.Widgets.Boxes;

