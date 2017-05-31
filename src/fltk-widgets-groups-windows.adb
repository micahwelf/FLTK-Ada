

with Interfaces.C;
with System;
with FLTK.Images.RGB;
use type System.Address;


package body FLTK.Widgets.Groups.Windows is


    procedure window_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, window_set_draw_hook, "window_set_draw_hook");

    procedure window_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, window_set_handle_hook, "window_set_handle_hook");


    function new_fl_window
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_window, "new_fl_window");

    function new_fl_window2
           (W, H : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_window2, "new_fl_window2");

    procedure free_fl_window
           (W : in System.Address);
    pragma Import (C, free_fl_window, "free_fl_window");


    procedure fl_window_show
           (W : in System.Address);
    pragma Import (C, fl_window_show, "fl_window_show");

    procedure fl_window_hide
           (W : in System.Address);
    pragma Import (C, fl_window_hide, "fl_window_hide");

    procedure fl_window_make_current
           (W : in System.Address);
    pragma Import (C, fl_window_make_current, "fl_window_make_current");

    function fl_window_get_border
           (W : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_window_get_border, "fl_window_get_border");

    procedure fl_window_set_border
           (W : in System.Address;
            S : in Interfaces.C.int);
    pragma Import (C, fl_window_set_border, "fl_window_set_border");

    procedure fl_window_set_label
           (W : in System.Address;
            T : in Interfaces.C.char_array);
    pragma Import (C, fl_window_set_label, "fl_window_set_label");

    procedure fl_window_size_range
           (W                         : in System.Address;
            LW, LH, HW, HH, DW, DH, A : in Interfaces.C.int);
    pragma Import (C, fl_window_size_range, "fl_window_size_range");

    procedure fl_window_set_icon
           (W, P : in System.Address);
    pragma Import (C, fl_window_set_icon, "fl_window_set_icon");

    procedure fl_window_set_modal
           (W : in System.Address);
    pragma Import (C, fl_window_set_modal, "fl_window_set_modal");

    procedure fl_window_set_non_modal
           (W : in System.Address);
    pragma Import (C, fl_window_set_non_modal, "fl_window_set_non_modal");

    procedure fl_window_set_cursor
           (W : in System.Address;
            C : in Interfaces.C.int);
    pragma Import (C, fl_window_set_cursor, "fl_window_set_cursor");

    procedure fl_window_set_default_cursor
           (W : in System.Address;
            C : in Interfaces.C.int);
    pragma Import (C, fl_window_set_default_cursor, "fl_window_set_default_cursor");

    function fl_window_get_x_root
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_window_get_x_root, "fl_window_get_x_root");

    function fl_window_get_y_root
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_window_get_y_root, "fl_window_get_y_root");

    function fl_window_get_decorated_w
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_window_get_decorated_w, "fl_window_get_decorated_w");

    function fl_window_get_decorated_h
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_window_get_decorated_h, "fl_window_get_decorated_h");

    procedure fl_window_draw
           (W : in System.Address);
    pragma Import (C, fl_window_draw, "fl_window_draw");

    function fl_window_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_window_handle, "fl_window_handle");




    procedure Finalize
           (This : in out Window) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Window'Class
        then
            This.Clear;
            free_fl_window (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Group (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Window is
    begin
        return This : Window do
            This.Void_Ptr := new_fl_window
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_group_end (This.Void_Ptr);
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            window_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            window_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    function Create
           (W, H : in Integer)
        return Window is
    begin
        return This : Window do
            This.Void_Ptr := new_fl_window2
                   (Interfaces.C.int (W),
                    Interfaces.C.int (H));
            fl_group_end (This.Void_Ptr);
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            window_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;




    procedure Show
           (This : in out Window) is
    begin
        fl_window_show (This.Void_Ptr);
    end Show;




    procedure Hide
           (This : in out Window) is
    begin
        fl_window_hide (This.Void_Ptr);
    end Hide;




    procedure Make_Current
           (This : in out Window) is
    begin
        fl_window_make_current (This.Void_Ptr);
    end Make_Current;




    function Get_Border
           (This : in Window)
        return Border_State is
    begin
        return Border_State'Val (fl_window_get_border (This.Void_Ptr));
    end Get_Border;



    procedure Set_Border
           (This : in out Window;
            To   : in     Border_State) is
    begin
        fl_window_set_border (This.Void_Ptr, Border_State'Pos (To));
    end Set_Border;




    procedure Set_Label
           (This : in out Window;
            Text : in     String) is
    begin
        fl_window_set_label (This.Void_Ptr, Interfaces.C.To_C (Text));
    end Set_Label;




    procedure Set_Size_Range
           (This                           : in out Window;
            Min_W, Min_H                   : in     Integer;
            Max_W, Max_H, Incre_W, Incre_H : in     Integer := 0;
            Keep_Aspect                    : in     Boolean := False) is
    begin
        fl_window_size_range
               (This.Void_Ptr,
                Interfaces.C.int (Min_W),
                Interfaces.C.int (Min_H),
                Interfaces.C.int (Max_W),
                Interfaces.C.int (Max_H),
                Interfaces.C.int (Incre_W),
                Interfaces.C.int (Incre_H),
                Boolean'Pos (Keep_Aspect));
    end Set_Size_Range;




    procedure Set_Icon
           (This : in out Window;
            Pic  : in out FLTK.Images.RGB.RGB_Image'Class) is
    begin
        fl_window_set_icon
               (This.Void_Ptr,
                Wrapper (Pic).Void_Ptr);
    end Set_Icon;




    procedure Set_Modal
           (This : in out Window) is
    begin
        fl_window_set_modal (This.Void_Ptr);
    end Set_Modal;




    procedure Set_Non_Modal
           (This : in out Window) is
    begin
        fl_window_set_non_modal (This.Void_Ptr);
    end Set_Non_Modal;




    procedure Set_Cursor
           (This : in out Window;
            To   : in     Cursor) is
    begin
        fl_window_set_cursor (This.Void_Ptr, Cursor_Values (To));
    end Set_Cursor;




    procedure Set_Default_Cursor
           (This : in out Window;
            To   : in     Cursor) is
    begin
        fl_window_set_default_cursor (This.Void_Ptr, Cursor_Values (To));
    end Set_Default_Cursor;




    function Get_X_Root
           (This : in Window)
        return Integer is
    begin
        return Integer (fl_window_get_x_root (This.Void_Ptr));
    end Get_X_Root;




    function Get_Y_Root
           (This : in Window)
        return Integer is
    begin
        return Integer (fl_window_get_y_root (This.Void_Ptr));
    end Get_Y_Root;




    function Get_Decorated_W
           (This : in Window)
        return Integer is
    begin
        return Integer (fl_window_get_decorated_w (This.Void_Ptr));
    end Get_Decorated_W;




    function Get_Decorated_H
           (This : in Window)
        return Integer is
    begin
        return Integer (fl_window_get_decorated_h (This.Void_Ptr));
    end Get_Decorated_H;




    procedure Draw
           (This : in out Window) is
    begin
        fl_window_draw (This.Void_Ptr);
    end Draw;




    function Handle
           (This  : in out Window;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_window_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Windows;

