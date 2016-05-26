

package FLTK.Widgets.Boxes is


    type Box is new Widget with private;
    type Box_Access is access all Box;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Box;


private


    type Box is new Widget with null record;


    overriding procedure Finalize
           (This : in out Box);


end FLTK.Widgets.Boxes;

