

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons.Enter is


    procedure return_button_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, return_button_set_draw_hook, "return_button_set_draw_hook");

    procedure fl_return_button_draw
           (W : in System.Address);
    pragma Import (C, fl_return_button_draw, "fl_return_button_draw");

    function new_fl_return_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_return_button, "new_fl_return_button");

    procedure free_fl_return_button
           (B : in System.Address);
    pragma Import (C, free_fl_return_button, "free_fl_return_button");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Enter_Button_Convert is new
            System.Address_To_Access_Conversions (Enter_Button'Class);

        Ada_Enter_Button : access Enter_Button'Class :=
            Enter_Button_Convert.To_Pointer (U);
    begin
        Ada_Enter_Button.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Enter_Button) is
    begin
        fl_return_button_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Enter_Button) is
    begin
        if  This in Enter_Button and then
            This.Void_Ptr /= System.Null_Address
        then
            free_fl_return_button (This.Void_Ptr);
        end if;
        Finalize (Button (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Enter_Button is
    begin
        return This : Enter_Button do
            This.Void_Ptr := new_fl_return_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            return_button_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;


end FLTK.Widgets.Buttons.Enter;

