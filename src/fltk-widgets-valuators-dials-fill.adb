

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Dials.Fill is


    procedure fill_dial_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, fill_dial_set_draw_hook, "fill_dial_set_draw_hook");
    pragma Inline (fill_dial_set_draw_hook);

    procedure fill_dial_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, fill_dial_set_handle_hook, "fill_dial_set_handle_hook");
    pragma Inline (fill_dial_set_handle_hook);




    function new_fl_fill_dial
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_fill_dial, "new_fl_fill_dial");
    pragma Inline (new_fl_fill_dial);

    procedure free_fl_fill_dial
           (D : in System.Address);
    pragma Import (C, free_fl_fill_dial, "free_fl_fill_dial");
    pragma Inline (free_fl_fill_dial);




    procedure fl_fill_dial_draw
           (W : in System.Address);
    pragma Import (C, fl_fill_dial_draw, "fl_fill_dial_draw");
    pragma Inline (fl_fill_dial_draw);

    function fl_fill_dial_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_fill_dial_handle, "fl_fill_dial_handle");
    pragma Inline (fl_fill_dial_handle);




    procedure Finalize
           (This : in out Fill_Dial) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Fill_Dial'Class
        then
            free_fl_fill_dial (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Dial (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Fill_Dial is
        begin
            return This : Fill_Dial do
                This.Void_Ptr := new_fl_fill_dial
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                fill_dial_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                fill_dial_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Fill_Dial) is
    begin
        fl_fill_dial_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Fill_Dial;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_fill_dial_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Dials.Fill;

