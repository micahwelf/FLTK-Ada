

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Counters.Simple is


    procedure simple_counter_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, simple_counter_set_draw_hook, "simple_counter_set_draw_hook");

    procedure simple_counter_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, simple_counter_set_handle_hook, "simple_counter_set_handle_hook");




    function new_fl_simple_counter
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_simple_counter, "new_fl_simple_counter");

    procedure free_fl_simple_counter
           (A : in System.Address);
    pragma Import (C, free_fl_simple_counter, "free_fl_simple_counter");




    procedure fl_simple_counter_draw
           (W : in System.Address);
    pragma Import (C, fl_simple_counter_draw, "fl_simple_counter_draw");

    function fl_simple_counter_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_simple_counter_handle, "fl_simple_counter_handle");




    procedure Finalize
           (This : in out Simple_Counter) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Simple_Counter'Class
        then
            free_fl_simple_counter (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Counter (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Simple_Counter is
        begin
            return This : Simple_Counter do
                This.Void_Ptr := new_fl_simple_counter
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                simple_counter_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                simple_counter_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Simple_Counter) is
    begin
        fl_simple_counter_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Simple_Counter;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_simple_counter_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Counters.Simple;

