

package FLTK.Widgets.Inputs.Int is


    type Integer_Input is new Input with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Integer_Input;


    function Get_Value
           (This : in Integer_Input)
        return Integer;


private


    type Integer_Input is new Input with null record;


    overriding procedure Finalize
           (This : in out Integer_Input);


end FLTK.Widgets.Inputs.Int;

