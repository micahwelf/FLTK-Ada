

with Interfaces.C.Strings;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs.Secret is


    procedure secret_input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, secret_input_set_draw_hook, "secret_input_set_draw_hook");

    procedure fl_secret_input_draw
           (W : in System.Address);
    pragma Import (C, fl_secret_input_draw, "fl_secret_input_draw");

    function new_fl_secret_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_secret_input, "new_fl_secret_input");

    procedure free_fl_secret_input
           (F : in System.Address);
    pragma Import (C, free_fl_secret_input, "free_fl_secret_input");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Secret_Input_Convert is new
            System.Address_To_Access_Conversions (Secret_Input'Class);

        Ada_Input : access Secret_Input'Class :=
            Secret_Input_Convert.To_Pointer (U);
    begin
        Ada_Input.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Secret_Input) is
    begin
        fl_secret_input_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Secret_Input) is
    begin
        if  This in Secret_Input and then
            This.Void_Ptr /= System.Null_Address
        then
            free_fl_secret_input (This.Void_Ptr);
        end if;
        Finalize (Input (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Secret_Input is
    begin
        return This : Secret_Input do
            This.Void_Ptr := new_fl_secret_input
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            secret_input_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;


end FLTK.Widgets.Inputs.Secret;

