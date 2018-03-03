

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Progress_Bars is


    procedure progress_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, progress_set_draw_hook, "progress_set_draw_hook");

    procedure progress_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, progress_set_handle_hook, "progress_set_handle_hook");




    function new_fl_progress
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_progress, "new_fl_progress");

    procedure free_fl_progress
           (P : in System.Address);
    pragma Import (C, free_fl_progress, "free_fl_progress");




    function fl_progress_get_minimum
           (P : in System.Address)
        return Interfaces.C.C_float;
    pragma Import (C, fl_progress_get_minimum, "fl_progress_get_minimum");

    procedure fl_progress_set_minimum
           (P : in System.Address;
            T : in Interfaces.C.C_float);
    pragma Import (C, fl_progress_set_minimum, "fl_progress_set_minimum");

    function fl_progress_get_maximum
           (P : in System.Address)
        return Interfaces.C.C_float;
    pragma Import (C, fl_progress_get_maximum, "fl_progress_get_maximum");

    procedure fl_progress_set_maximum
           (P : in System.Address;
            T : in Interfaces.C.C_float);
    pragma Import (C, fl_progress_set_maximum, "fl_progress_set_maximum");

    function fl_progress_get_value
           (P : in System.Address)
        return Interfaces.C.C_float;
    pragma Import (C, fl_progress_get_value, "fl_progress_get_value");

    procedure fl_progress_set_value
           (P : in System.Address;
            T : in Interfaces.C.C_float);
    pragma Import (C, fl_progress_set_value, "fl_progress_set_value");




    procedure fl_progress_draw
           (P : in System.Address);
    pragma Import (C, fl_progress_draw, "fl_progress_draw");

    function fl_progress_handle
           (P : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_progress_handle, "fl_progress_handle");




    procedure Finalize
           (This : in out Progress_Bar) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Progress_Bar'Class
        then
            free_fl_progress (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Widget (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Progress_Bar is
    begin
        return This : Progress_Bar do
            This.Void_Ptr := new_fl_progress
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            progress_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            progress_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;





    function Get_Minimum
           (This : in Progress_Bar)
        return Float is
    begin
        return Float (fl_progress_get_minimum (This.Void_Ptr));
    end Get_Minimum;


    procedure Set_Minimum
           (This : in out Progress_Bar;
            To   : in     Float) is
    begin
        fl_progress_set_minimum (This.Void_Ptr, Interfaces.C.C_float (To));
    end Set_Minimum;


    function Get_Maximum
           (This : in Progress_Bar)
        return Float is
    begin
        return Float (fl_progress_get_maximum (This.Void_Ptr));
    end Get_Maximum;


    procedure Set_Maximum
           (This : in out Progress_Bar;
            To   : in     Float) is
    begin
        fl_progress_set_maximum (This.Void_Ptr, Interfaces.C.C_float (To));
    end Set_Maximum;


    function Get_Value
           (This : in Progress_Bar)
        return Float is
    begin
        return Float (fl_progress_get_value (This.Void_Ptr));
    end Get_Value;


    procedure Set_Value
           (This : in out Progress_Bar;
            To   : in     Float) is
    begin
        fl_progress_set_value (This.Void_Ptr, Interfaces.C.C_float (To));
    end Set_Value;




    procedure Draw
           (This : in out Progress_Bar) is
    begin
        fl_progress_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Progress_Bar;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_progress_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Progress_Bars;

