

package FLTK.Widgets.Valuators.Dials.Line is


    type Line_Dial is new Dial with private;

    type Line_Dial_Reference (Data : not null access Line_Dial'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Line_Dial;

    end Forge;




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




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Dials.Line;

