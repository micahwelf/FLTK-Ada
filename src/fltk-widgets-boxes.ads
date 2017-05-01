

package FLTK.Widgets.Boxes is


    type Box is new Widget with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Box;


private


    procedure Draw
           (This : in out Box);


    type Box is new Widget with null record;


    overriding procedure Finalize
           (This : in out Box);


    package Box_Convert is new System.Address_To_Access_Conversions (Box'Class);


end FLTK.Widgets.Boxes;

