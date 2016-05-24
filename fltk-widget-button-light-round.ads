

package FLTK.Widget.Button.Light.Round is


    type Round_Type is new Light_Type with private;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Round_Type;


private


    type Round_Type is new Light_Type with null record;


    overriding procedure Finalize (This : in out Round_Type);


end FLTK.Widget.Button.Light.Round;

