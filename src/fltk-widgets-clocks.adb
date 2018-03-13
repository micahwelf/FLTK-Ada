

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Clocks is


    procedure clock_output_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, clock_output_set_draw_hook, "clock_output_set_draw_hook");

    procedure clock_output_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, clock_output_set_handle_hook, "clock_output_set_handle_hook");




    function new_fl_clock_output
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_clock_output, "new_fl_clock_output");

    procedure free_fl_clock_output
           (F : in System.Address);
    pragma Import (C, free_fl_clock_output, "free_fl_clock_output");




    function fl_clock_output_get_hour
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_clock_output_get_hour, "fl_clock_output_get_hour");

    function fl_clock_output_get_minute
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_clock_output_get_minute, "fl_clock_output_get_minute");

    function fl_clock_output_get_second
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_clock_output_get_second, "fl_clock_output_get_second");




    function fl_clock_output_get_value
           (C : in System.Address)
        return Interfaces.C.unsigned_long;
    pragma Import (C, fl_clock_output_get_value, "fl_clock_output_get_value");

    procedure fl_clock_output_set_value
           (C : in System.Address;
            V : in Interfaces.C.unsigned_long);
    pragma Import (C, fl_clock_output_set_value, "fl_clock_output_set_value");

    procedure fl_clock_output_set_value2
           (C       : in System.Address;
            H, M, S : in Interfaces.C.int);
    pragma Import (C, fl_clock_output_set_value2, "fl_clock_output_set_value2");




    procedure fl_clock_output_draw
           (W : in System.Address);
    pragma Import (C, fl_clock_output_draw, "fl_clock_output_draw");

    function fl_clock_output_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_clock_output_handle, "fl_clock_output_handle");




    procedure Finalize
           (This : in out Clock) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Clock'Class
        then
            free_fl_clock_output (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Widget (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Clock is
        begin
            return This : Clock do
                This.Void_Ptr := new_fl_clock_output
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                clock_output_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                clock_output_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_Hour
           (This : in Clock)
        return Hour is
    begin
        return Hour (fl_clock_output_get_hour (This.Void_Ptr));
    end Get_Hour;


    function Get_Minute
           (This : in Clock)
        return Minute is
    begin
        return Minute (fl_clock_output_get_minute (This.Void_Ptr));
    end Get_Minute;


    function Get_Second
           (This : in Clock)
        return Second is
    begin
        return Second (fl_clock_output_get_second (This.Void_Ptr));
    end Get_Second;




    function Get_Time
           (This : in Clock)
        return Time_Value is
    begin
        return Time_Value (fl_clock_output_get_value (This.Void_Ptr));
    end Get_Time;


    procedure Set_Time
           (This : in out Clock;
            To   : in     Time_Value) is
    begin
        fl_clock_output_set_value (This.Void_Ptr, Interfaces.C.unsigned_long (To));
    end Set_Time;


    procedure Set_Time
           (This    : in out Clock;
            Hours   : in     Hour;
            Minutes : in     Minute;
            Seconds : in     Second) is
    begin
        fl_clock_output_set_value2
           (This.Void_Ptr,
            Interfaces.C.int (Hours),
            Interfaces.C.int (Minutes),
            Interfaces.C.int (Seconds));
    end Set_Time;




    procedure Draw
           (This : in out Clock) is
    begin
        fl_clock_output_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Clock;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_clock_output_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Clocks;

