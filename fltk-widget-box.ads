

package FLTK.Widget.Box is


    type Box_Type is new Widget_Type with private;


    function Create (X, Y, W, H : Integer; Label : String) return Box_Type;


private


    type Box_Type is new Widget_Type with null record;


    overriding procedure Finalize (This : in out Box_Type);


end FLTK.Widget.Box;

