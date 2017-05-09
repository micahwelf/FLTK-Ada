

with Interfaces.C.Strings;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs.Integer is


    procedure int_input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, int_input_set_draw_hook, "int_input_set_draw_hook");

    procedure fl_int_input_draw
           (W : in System.Address);
    pragma Import (C, fl_int_input_draw, "fl_int_input_draw");

    function new_fl_int_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_int_input, "new_fl_int_input");

    procedure free_fl_int_input
           (F : in System.Address);
    pragma Import (C, free_fl_int_input, "free_fl_int_input");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Integer_Input_Convert is new
            System.Address_To_Access_Conversions (Integer_Input'Class);

        Ada_Input : access Integer_Input'Class :=
            Integer_Input_Convert.To_Pointer (U);
    begin
        Ada_Input.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Integer_Input) is
    begin
        fl_int_input_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Integer_Input) is
    begin
        if  This in Integer_Input and then
            This.Void_Ptr /= System.Null_Address
        then
            free_fl_int_input (This.Void_Ptr);
        end if;
        Finalize (Input (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Standard.Integer;
            Text       : in String)
        return Integer_Input is
    begin
        return This : Integer_Input do
            This.Void_Ptr := new_fl_int_input
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            int_input_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;




    function Get_Value
           (This : in Integer_Input)
        return Standard.Integer is
    begin
        return Standard.Integer'Value
               (Interfaces.C.Strings.Value (fl_input_get_value (This.Void_Ptr)));
    end Get_Value;


end FLTK.Widgets.Inputs.Integer;

