

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons.Radio is


    procedure radio_button_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, radio_button_set_draw_hook, "radio_button_set_draw_hook");

    procedure fl_radio_button_draw
           (W : in System.Address);
    pragma Import (C, fl_radio_button_draw, "fl_radio_button_draw");

    function new_fl_radio_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_radio_button, "new_fl_radio_button");

    procedure free_fl_radio_button
           (B : in System.Address);
    pragma Import (C, free_fl_radio_button, "free_fl_radio_button");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Radio_Button_Convert is new
            System.Address_To_Access_Conversions (Radio_Button'Class);

        Ada_Radio_Button : access Radio_Button'Class :=
            Radio_Button_Convert.To_Pointer (U);
    begin
        Ada_Radio_Button.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Radio_Button) is
    begin
        fl_radio_button_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Radio_Button) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Radio_Button'Class
        then
            free_fl_radio_button (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Button (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Radio_Button is
    begin
        return This : Radio_Button do
            This.Void_Ptr := new_fl_radio_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            radio_button_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;


end FLTK.Widgets.Buttons.Radio;

