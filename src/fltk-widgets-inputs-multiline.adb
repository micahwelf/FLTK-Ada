

with Interfaces.C.Strings;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs.Multiline is


    procedure multiline_input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, multiline_input_set_draw_hook, "multiline_input_set_draw_hook");

    procedure fl_multiline_input_draw
           (W : in System.Address);
    pragma Import (C, fl_multiline_input_draw, "fl_multiline_input_draw");

    function new_fl_multiline_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_multiline_input, "new_fl_multiline_input");

    procedure free_fl_multiline_input
           (F : in System.Address);
    pragma Import (C, free_fl_multiline_input, "free_fl_multiline_input");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Multi_Input_Convert is new
            System.Address_To_Access_Conversions (Multiline_Input'Class);

        Ada_Input : access Multiline_Input'Class :=
            Multi_Input_Convert.To_Pointer (U);
    begin
        Ada_Input.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Multiline_Input) is
    begin
        fl_multiline_input_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Multiline_Input) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Multiline_Input'Class
        then
            free_fl_multiline_input (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Input (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Multiline_Input is
    begin
        return This : Multiline_Input do
            This.Void_Ptr := new_fl_multiline_input
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            multiline_input_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;


end FLTK.Widgets.Inputs.Multiline;

