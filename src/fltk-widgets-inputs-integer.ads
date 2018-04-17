

package FLTK.Widgets.Inputs.Integer is


    type Integer_Input is new Input with private;

    type Integer_Input_Reference (Data : not null access Integer_Input'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Standard.Integer;
                Text       : in String)
            return Integer_Input;

    end Forge;




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




    pragma Inline (Get_Value);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Inputs.Integer;

