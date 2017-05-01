

package FLTK.Widgets.Inputs is


    type Input is new Widget with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Input;


    function Get_Value
           (This : in Input)
        return String;


private


    procedure Draw
           (This : in out Input);


    type Input is new Widget with null record;


    overriding procedure Finalize
           (This : in out Input);


    package Input_Convert is new System.Address_To_Access_Conversions (Input'Class);


end FLTK.Widgets.Inputs;
