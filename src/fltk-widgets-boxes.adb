

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Boxes is


    procedure box_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, box_set_draw_hook, "box_set_draw_hook");

    procedure box_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, box_set_handle_hook, "box_set_handle_hook");




    function new_fl_box
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_box, "new_fl_box");

    procedure free_fl_box
           (B : in System.Address);
    pragma Import (C, free_fl_box, "free_fl_box");




    procedure fl_box_draw
           (W : in System.Address);
    pragma Import (C, fl_box_draw, "fl_box_draw");

    function fl_box_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_box_handle, "fl_box_handle");




    procedure Finalize
           (This : in out Box) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Box'Class
        then
            if This.Needs_Dealloc then
                free_fl_box (This.Void_Ptr);
            end if;
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Widget (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Box is
        begin
            return This : Box do
                This.Void_Ptr := new_fl_box
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                box_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                box_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Box) is
    begin
        fl_box_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Box;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_box_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Boxes;

