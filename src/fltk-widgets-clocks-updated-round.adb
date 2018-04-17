

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Clocks.Updated.Round is


    procedure round_clock_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, round_clock_set_draw_hook, "round_clock_set_draw_hook");
    pragma Inline (round_clock_set_draw_hook);

    procedure round_clock_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, round_clock_set_handle_hook, "round_clock_set_handle_hook");
    pragma Inline (round_clock_set_handle_hook);




    function new_fl_round_clock
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_round_clock, "new_fl_round_clock");
    pragma Inline (new_fl_round_clock);

    procedure free_fl_round_clock
           (F : in System.Address);
    pragma Import (C, free_fl_round_clock, "free_fl_round_clock");
    pragma Inline (free_fl_round_clock);




    procedure fl_round_clock_draw
           (W : in System.Address);
    pragma Import (C, fl_round_clock_draw, "fl_round_clock_draw");
    pragma Inline (fl_round_clock_draw);

    procedure fl_round_clock_draw2
           (C          : in System.Address;
            X, Y, W, H : in Interfaces.C.int);
    pragma Import (C, fl_round_clock_draw2, "fl_round_clock_draw2");
    pragma Inline (fl_round_clock_draw2);

    function fl_round_clock_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_round_clock_handle, "fl_round_clock_handle");
    pragma Inline (fl_round_clock_handle);




    procedure Finalize
           (This : in out Round_Clock) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Round_Clock'Class
        then
            free_fl_round_clock (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Updated_Clock (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Round_Clock is
        begin
            return This : Round_Clock do
                This.Void_Ptr := new_fl_round_clock
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                round_clock_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                round_clock_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Round_Clock) is
    begin
        fl_round_clock_draw (This.Void_Ptr);
    end Draw;


    procedure Draw
           (This       : in out Clock;
            X, Y, W, H : in     Integer) is
    begin
        fl_round_clock_draw2
           (This.Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H));
    end Draw;


    function Handle
           (This  : in out Round_Clock;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_round_clock_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Clocks.Updated.Round;

