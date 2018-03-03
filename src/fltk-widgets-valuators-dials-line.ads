

package FLTK.Widgets.Valuators.Dials.Line is


    type Line_Dial is new Dial with private;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Line_Dial;




    procedure Draw
           (This : in out Line_Dial);

    function Handle
           (This  : in out Line_Dial;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Line_Dial is new Dial with null record;

    overriding procedure Finalize
           (This : in out Line_Dial);


end FLTK.Widgets.Valuators.Dials.Line;

