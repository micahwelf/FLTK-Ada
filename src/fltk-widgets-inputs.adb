

with Interfaces.C;
with Interfaces.C.Strings;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs is


    procedure input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, input_set_draw_hook, "input_set_draw_hook");

    procedure fl_input_draw
           (W : in System.Address);
    pragma Import (C, fl_input_draw, "fl_input_draw");

    function new_fl_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_input, "new_fl_input");

    procedure free_fl_input
           (F : in System.Address);
    pragma Import (C, free_fl_input, "free_fl_input");

    function fl_input_get_value
           (F : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_input_get_value, "fl_input_get_value");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Input_Convert is new System.Address_To_Access_Conversions (Input'Class);

        Ada_Input : access Input'Class :=
            Input_Convert.To_Pointer (U);
    begin
        Ada_Input.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Input) is
    begin
        fl_input_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Input) is
    begin
        if  This in Input and then
            This.Void_Ptr /= System.Null_Address
        then
            free_fl_input (This.Void_Ptr);
        end if;
        Finalize (Widget (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Input is
    begin
        return This : Input do
            This.Void_Ptr := new_fl_input
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            input_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;




    function Get_Value
           (This : in Input)
        return String is
    begin
        return Interfaces.C.Strings.Value (fl_input_get_value (This.Void_Ptr));
    end Get_Value;


end FLTK.Widgets.Inputs;

