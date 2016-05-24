

package FLTK.Widget.Button.Light.Radio is


    type Radio_Type is new Light_Type with private;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Radio_Type;


private


    type Radio_Type is new Light_Type with null record;


    overriding procedure Finalize (This : in out Radio_Type);


end FLTK.Widget.Button.Light.Radio;

