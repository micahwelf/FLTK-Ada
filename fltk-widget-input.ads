

package FLTK.Widget.Input is


    type Input_Type is new Widget_Type with private;


    function Create (X, Y, W, H : Integer; Label : String) return Input_Type;


private


    type Input_Type is new Widget_Type with null record;


    overriding procedure Finalize (This : in out Input_Type);


end FLTK.Widget.Input;

