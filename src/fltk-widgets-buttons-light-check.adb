

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons.Light.Check is


    procedure check_button_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, check_button_set_draw_hook, "check_button_set_draw_hook");

    procedure check_button_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, check_button_set_handle_hook, "check_button_set_handle_hook");

    procedure fl_check_button_draw
           (W : in System.Address);
    pragma Import (C, fl_check_button_draw, "fl_check_button_draw");

    function fl_check_button_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_check_button_handle, "fl_check_button_handle");

    function new_fl_check_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_check_button, "new_fl_check_button");

    procedure free_fl_check_button
           (B : in System.Address);
    pragma Import (C, free_fl_check_button, "free_fl_check_button");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Check_Button_Convert is new
            System.Address_To_Access_Conversions (Check_Button'Class);

        Ada_Check_Button : access Check_Button'Class :=
            Check_Button_Convert.To_Pointer (U);
    begin
        Ada_Check_Button.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Check_Button) is
    begin
        fl_check_button_draw (This.Void_Ptr);
    end Draw;




    function Handle
           (This  : in out Check_Button;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_check_button_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;




    procedure Finalize
           (This : in out Check_Button) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Check_Button'Class
        then
            free_fl_check_button (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Light_Button (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Check_Button is
    begin
        return This : Check_Button do
            This.Void_Ptr := new_fl_check_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            check_button_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            check_button_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;


end FLTK.Widgets.Buttons.Light.Check;

