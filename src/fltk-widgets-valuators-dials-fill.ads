

package FLTK.Widgets.Valuators.Dials.Fill is


    type Fill_Dial is new Dial with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Fill_Dial;

    end Forge;




    procedure Draw
           (This : in out Fill_Dial);

    function Handle
           (This  : in out Fill_Dial;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Fill_Dial is new Dial with null record;

    overriding procedure Finalize
           (This : in out Fill_Dial);


end FLTK.Widgets.Valuators.Dials.Fill;

