

package FLTK.Widgets.Valuators.Dials.Fill is


    type Fill_Dial is new Dial with private;

    type Fill_Dial_Reference (Data : not null access Fill_Dial'Class) is
        limited null record with Implicit_Dereference => Data;




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




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Dials.Fill;

