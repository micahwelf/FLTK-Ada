

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Dials.Line is


    procedure line_dial_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, line_dial_set_draw_hook, "line_dial_set_draw_hook");

    procedure line_dial_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, line_dial_set_handle_hook, "line_dial_set_handle_hook");




    function new_fl_line_dial
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_line_dial, "new_fl_line_dial");

    procedure free_fl_line_dial
           (D : in System.Address);
    pragma Import (C, free_fl_line_dial, "free_fl_line_dial");




    procedure fl_line_dial_draw
           (W : in System.Address);
    pragma Import (C, fl_line_dial_draw, "fl_line_dial_draw");

    function fl_line_dial_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_line_dial_handle, "fl_line_dial_handle");




    procedure Finalize
           (This : in out Line_Dial) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Line_Dial'Class
        then
            free_fl_line_dial (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Dial (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Line_Dial is
    begin
        return This : Line_Dial do
            This.Void_Ptr := new_fl_line_dial
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            line_dial_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            line_dial_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Draw
           (This : in out Line_Dial) is
    begin
        fl_line_dial_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Line_Dial;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_line_dial_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Dials.Line;

