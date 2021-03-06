

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Buttons.Light.Round.Radio is


    procedure radio_round_button_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, radio_round_button_set_draw_hook, "radio_round_button_set_draw_hook");
    pragma Inline (radio_round_button_set_draw_hook);

    procedure radio_round_button_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, radio_round_button_set_handle_hook, "radio_round_button_set_handle_hook");
    pragma Inline (radio_round_button_set_handle_hook);




    function new_fl_radio_round_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_radio_round_button, "new_fl_radio_round_button");
    pragma Inline (new_fl_radio_round_button);

    procedure free_fl_radio_round_button
           (B : in System.Address);
    pragma Import (C, free_fl_radio_round_button, "free_fl_radio_round_button");
    pragma Inline (free_fl_radio_round_button);




    procedure fl_radio_round_button_draw
           (W : in System.Address);
    pragma Import (C, fl_radio_round_button_draw, "fl_radio_round_button_draw");
    pragma Inline (fl_radio_round_button_draw);

    function fl_radio_round_button_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_radio_round_button_handle, "fl_radio_round_button_handle");
    pragma Inline (fl_radio_round_button_handle);




    procedure Finalize
           (This : in out Radio_Round_Button) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Radio_Round_Button'Class
        then
            free_fl_radio_round_button (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Round_Button (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Radio_Round_Button is
        begin
            return This : Radio_Round_Button do
                This.Void_Ptr := new_fl_radio_round_button
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                radio_round_button_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                radio_round_button_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Radio_Round_Button) is
    begin
        fl_radio_round_button_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Radio_Round_Button;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_radio_round_button_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Buttons.Light.Round.Radio;

