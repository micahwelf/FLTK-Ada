

package FLTK.Widgets.Inputs.Integer is


    type Integer_Input is new Input with private;


    function Create
           (X, Y, W, H : in Standard.Integer;
            Text       : in String)
        return Integer_Input;


    function Get_Value
           (This : in Integer_Input)
        return Standard.Integer;


    procedure Draw
           (This : in out Integer_Input);


    function Handle
           (This  : in out Integer_Input;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Integer_Input is new Input with null record;


    overriding procedure Finalize
           (This : in out Integer_Input);


end FLTK.Widgets.Inputs.Integer;

