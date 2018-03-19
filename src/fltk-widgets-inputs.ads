

private with

    Interfaces.C.Strings,
    System;


package FLTK.Widgets.Inputs is


    type Input is new Widget with private;

    type Input_Cursor (Data : access Input'Class) is limited null record
        with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Input;

    end Forge;




    procedure Copy
           (This : in out Input);

    procedure Cut
           (This : in out Input);

    procedure Cut
           (This      : in out Input;
            Num_Bytes : in     Integer);

    procedure Cut
           (This          : in out Input;
            Start, Finish : in     Integer);

    procedure Copy_Cuts
           (This : in out Input);




    function Has_Changed
           (This : in Input)
        return Boolean;

    procedure Clear_Changed
           (This : in out Input);

    function Is_Readonly
           (This : in Input)
        return Boolean;

    procedure Set_Readonly
           (This : in out Input;
            To   : in     Boolean);




    function Get_Value
           (This : in Input)
        return String;

    procedure Set_Value
           (This : in out Input;
            To   : in     String);




    function Get_Text_Color
           (This : in Input)
        return Color;

    procedure Set_Text_Color
           (This : in out Input;
            To   : in     Color);

    function Get_Text_Font
           (This : in Input)
        return Font_Kind;

    procedure Set_Text_Font
           (This : in out Input;
            To   : in     Font_Kind);

    function Get_Text_Size
           (This : in Input)
        return Font_Size;

    procedure Set_Text_Size
           (This : in out Input;
            To   : in     Font_Size);




    procedure Draw
           (This : in out Input);

    function Handle
           (This  : in out Input;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Input is new Widget with record
        Was_Changed : Boolean := False;
    end record;

    overriding procedure Finalize
           (This : in out Input);




    function fl_input_get_value
           (F : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_input_get_value, "fl_input_get_value");


end FLTK.Widgets.Inputs;

