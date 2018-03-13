

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Rollers is


    procedure roller_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, roller_set_draw_hook, "roller_set_draw_hook");

    procedure roller_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, roller_set_handle_hook, "roller_set_handle_hook");




    function new_fl_roller
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_roller, "new_fl_roller");

    procedure free_fl_roller
           (D : in System.Address);
    pragma Import (C, free_fl_roller, "free_fl_roller");




    procedure fl_roller_draw
           (W : in System.Address);
    pragma Import (C, fl_roller_draw, "fl_roller_draw");

    function fl_roller_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_roller_handle, "fl_roller_handle");




    procedure Finalize
           (This : in out Roller) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Roller'Class
        then
            free_fl_roller (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Valuator (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Roller is
        begin
            return This : Roller do
                This.Void_Ptr := new_fl_roller
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                roller_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                roller_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Roller) is
    begin
        fl_roller_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Roller;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_roller_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Rollers;

