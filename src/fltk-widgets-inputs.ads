

private with

    Interfaces.C.Strings,
    System;


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

    function Handle
           (This  : in out Input;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Input is new Widget with null record;

    overriding procedure Finalize
           (This : in out Input);




    function fl_input_get_value
           (F : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_input_get_value, "fl_input_get_value");


end FLTK.Widgets.Inputs;

