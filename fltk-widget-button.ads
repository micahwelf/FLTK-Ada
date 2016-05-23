

package FLTK.Widget.Button is


    type Button_Type is new Widget_Type with private;


    function Create (X, Y, W, H : Integer; Label : String) return Button_Type;


private


    type Button_Type is new Widget_Type with null record;


    overriding procedure Finalize (This : in out Button_Type);


end FLTK.Widget.Button;

