

package FLTK.Widgets.Inputs.Float is


    type Float_Input is new Input with private;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Float_Input;




    function Get_Value
           (This : in Float_Input)
        return Standard.Float;




    procedure Draw
           (This : in out Float_Input);

    function Handle
           (This  : in out Float_Input;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Float_Input is new Input with null record;

    overriding procedure Finalize
           (This : in out Float_Input);


end FLTK.Widgets.Inputs.Float;

