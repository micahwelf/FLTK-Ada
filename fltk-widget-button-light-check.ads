

package FLTK.Widget.Button.Light.Check is


    type Check_Type is new Light_Type with private;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Check_Type;


private


    type Check_Type is new Light_Type with null record;


    overriding procedure Finalize (This : in out Check_Type);


end FLTK.Widget.Button.Light.Check;

