

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Buttons.Repeat is


    procedure repeat_button_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, repeat_button_set_draw_hook, "repeat_button_set_draw_hook");

    procedure repeat_button_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, repeat_button_set_handle_hook, "repeat_button_set_handle_hook");




    function new_fl_repeat_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_repeat_button, "new_fl_repeat_button");

    procedure free_fl_repeat_button
           (B : in System.Address);
    pragma Import (C, free_fl_repeat_button, "free_fl_repeat_button");




    procedure fl_repeat_button_draw
           (W : in System.Address);
    pragma Import (C, fl_repeat_button_draw, "fl_repeat_button_draw");

    function fl_repeat_button_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_repeat_button_handle, "fl_repeat_button_handle");




    procedure Finalize
           (This : in out Repeat_Button) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Repeat_Button'Class
        then
            free_fl_repeat_button (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Button (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Repeat_Button is
        begin
            return This : Repeat_Button do
                This.Void_Ptr := new_fl_repeat_button
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                repeat_button_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                repeat_button_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Repeat_Button) is
    begin
        fl_repeat_button_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Repeat_Button;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_repeat_button_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Buttons.Repeat;

