

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Inputs.Secret is


    procedure secret_input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, secret_input_set_draw_hook, "secret_input_set_draw_hook");

    procedure secret_input_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, secret_input_set_handle_hook, "secret_input_set_handle_hook");




    function new_fl_secret_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_secret_input, "new_fl_secret_input");

    procedure free_fl_secret_input
           (F : in System.Address);
    pragma Import (C, free_fl_secret_input, "free_fl_secret_input");




    procedure fl_secret_input_draw
           (W : in System.Address);
    pragma Import (C, fl_secret_input_draw, "fl_secret_input_draw");

    function fl_secret_input_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_secret_input_handle, "fl_secret_input_handle");




    procedure Finalize
           (This : in out Secret_Input) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Secret_Input'Class
        then
            free_fl_secret_input (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
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
            secret_input_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Draw
           (This : in out Secret_Input) is
    begin
        fl_secret_input_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Secret_Input;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_secret_input_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Inputs.Secret;

