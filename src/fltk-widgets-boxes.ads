

package FLTK.Widgets.Boxes is


    type Box is new Widget with private;

    type Box_Reference (Data : not null access Box'Class) is limited null record
        with Implicit_Dereference => Data;




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




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Boxes;

