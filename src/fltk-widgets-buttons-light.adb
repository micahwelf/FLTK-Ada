

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons.Light is


    procedure light_button_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, light_button_set_draw_hook, "light_button_set_draw_hook");

    procedure light_button_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, light_button_set_handle_hook, "light_button_set_handle_hook");


    function new_fl_light_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_light_button, "new_fl_light_button");

    procedure free_fl_light_button
           (B : in System.Address);
    pragma Import (C, free_fl_light_button, "free_fl_light_button");


    procedure fl_light_button_draw
           (W : in System.Address);
    pragma Import (C, fl_light_button_draw, "fl_light_button_draw");

    function fl_light_button_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_light_button_handle, "fl_light_button_handle");




    procedure Finalize
           (This : in out Light_Button) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Light_Button'Class
        then
            free_fl_light_button (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Button (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Light_Button is
    begin
        return This : Light_Button do
            This.Void_Ptr := new_fl_light_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            light_button_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            light_button_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Draw
           (This : in out Light_Button) is
    begin
        fl_light_button_draw (This.Void_Ptr);
    end Draw;




    function Handle
           (This  : in out Light_Button;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_light_button_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Buttons.Light;

