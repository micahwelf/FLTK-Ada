

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Groups.Scrolls is


    procedure scroll_set_draw_hook
           (S, D : in System.Address);
    pragma Import (C, scroll_set_draw_hook, "scroll_set_draw_hook");
    pragma Inline (scroll_set_draw_hook);

    procedure scroll_set_handle_hook
           (S, H : in System.Address);
    pragma Import (C, scroll_set_handle_hook, "scroll_set_handle_hook");
    pragma Inline (scroll_set_handle_hook);




    function new_fl_scroll
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_scroll, "new_fl_scroll");
    pragma Inline (new_fl_scroll);

    procedure free_fl_scroll
           (S : in System.Address);
    pragma Import (C, free_fl_scroll, "free_fl_scroll");
    pragma Inline (free_fl_scroll);




    procedure fl_scroll_clear
           (S : in System.Address);
    pragma Import (C, fl_scroll_clear, "fl_scroll_clear");
    pragma Inline (fl_scroll_clear);




    procedure fl_scroll_to
           (S    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_scroll_to, "fl_scroll_to");
    pragma Inline (fl_scroll_to);

    procedure fl_scroll_set_type
           (S : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_scroll_set_type, "fl_scroll_set_type");
    pragma Inline (fl_scroll_set_type);




    function fl_scroll_get_size
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_scroll_get_size, "fl_scroll_get_size");
    pragma Inline (fl_scroll_get_size);

    procedure fl_scroll_set_size
           (S : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_scroll_set_size, "fl_scroll_set_size");
    pragma Inline (fl_scroll_set_size);

    function fl_scroll_xposition
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_scroll_xposition, "fl_scroll_xposition");
    pragma Inline (fl_scroll_xposition);

    function fl_scroll_yposition
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_scroll_yposition, "fl_scroll_yposition");
    pragma Inline (fl_scroll_yposition);




    procedure fl_scroll_draw
           (S : in System.Address);
    pragma Import (C, fl_scroll_draw, "fl_scroll_draw");
    pragma Inline (fl_scroll_draw);

    function fl_scroll_handle
           (S : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_scroll_handle, "fl_scroll_handle");
    pragma Inline (fl_scroll_handle);




    procedure Finalize
           (This : in out Scroll) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Scroll'Class
        then
            This.Clear;
            free_fl_scroll (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Group (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Scroll is
        begin
            return This : Scroll do
                This.Void_Ptr := new_fl_scroll
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_group_end (This.Void_Ptr);
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                scroll_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                scroll_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Clear
           (This : in out Scroll) is
    begin
        fl_scroll_clear (This.Void_Ptr);
    end Clear;




    procedure Scroll_To
           (This : in out Scroll;
            X, Y : in     Integer) is
    begin
        fl_scroll_to (This.Void_Ptr, Interfaces.C.int (X), Interfaces.C.int (Y));
    end Scroll_To;


    procedure Set_Type
           (This : in out Scroll;
            Mode : in     Scroll_Kind) is
    begin
        fl_scroll_set_type (This.Void_Ptr, Scroll_Kind'Pos (Mode));
    end Set_Type;




    function Get_Scrollbar_Size
           (This : in Scroll)
        return Integer is
    begin
        return Integer (fl_scroll_get_size (This.Void_Ptr));
    end Get_Scrollbar_Size;


    procedure Set_Scrollbar_Size
           (This : in out Scroll;
            To   : in     Integer) is
    begin
        fl_scroll_set_size (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Scrollbar_Size;


    function Get_Scroll_X
           (This : in Scroll)
        return Integer is
    begin
        return Integer (fl_scroll_xposition (This.Void_Ptr));
    end Get_Scroll_X;


    function Get_Scroll_Y
           (This : in Scroll)
        return Integer is
    begin
        return Integer (fl_scroll_yposition (This.Void_Ptr));
    end Get_Scroll_Y;




    procedure Draw
           (This : in out Scroll) is
    begin
        fl_scroll_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Scroll;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_scroll_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Scrolls;

