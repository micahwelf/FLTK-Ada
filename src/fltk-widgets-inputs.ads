

package FLTK.Widgets.Inputs is


    type Input is new Widget with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Input;


    function Get_Value
           (This : in Input)
        return String;


    procedure Draw
           (This : in out Input);


private


    type Input is new Widget with null record;


    overriding procedure Finalize
           (This : in out Input);


end FLTK.Widgets.Inputs;

