

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Groups.Windows.Double is


    procedure double_window_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, double_window_set_draw_hook, "double_window_set_draw_hook");

    procedure double_window_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, double_window_set_handle_hook, "double_window_set_handle_hook");




    function new_fl_double_window
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_double_window, "new_fl_double_window");

    function new_fl_double_window2
           (X, Y : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_double_window2, "new_fl_double_window2");

    procedure free_fl_double_window
            (W : in System.Address);
    pragma Import (C, free_fl_double_window, "free_fl_double_window");




    procedure fl_double_window_show
            (W : in System.Address);
    pragma Import (C, fl_double_window_show, "fl_double_window_show");

    procedure fl_double_window_hide
            (W : in System.Address);
    pragma Import (C, fl_double_window_hide, "fl_double_window_hide");

    procedure fl_double_window_flush
            (W : in System.Address);
    pragma Import (C, fl_double_window_flush, "fl_double_window_flush");




    procedure fl_double_window_draw
           (W : in System.Address);
    pragma Import (C, fl_double_window_draw, "fl_double_window_draw");

    function fl_double_window_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_double_window_handle, "fl_double_window_handle");




    procedure Finalize
           (This : in out Double_Window) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Double_Window'Class
        then
            This.Clear;
            free_fl_double_window (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Window (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Double_Window is
    begin
        return This : Double_Window do
            This.Void_Ptr := new_fl_double_window
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_group_end (This.Void_Ptr);
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            double_window_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            double_window_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;


    function Create
           (W, H : in Integer)
        return Double_Window is
    begin
        return This : Double_Window do
            This.Void_Ptr := new_fl_double_window2
                   (Interfaces.C.int (W),
                    Interfaces.C.int (H));
            fl_group_end (This.Void_Ptr);
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            double_window_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            double_window_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Show
           (This : in out Double_Window) is
    begin
        fl_double_window_show (This.Void_Ptr);
    end Show;


    procedure Hide
           (This : in out Double_Window) is
    begin
        fl_double_window_hide (This.Void_Ptr);
    end Hide;


    procedure Flush
           (This : in out Double_Window) is
    begin
        fl_double_window_flush (This.Void_Ptr);
    end Flush;




    procedure Draw
           (This : in out Double_Window) is
    begin
        fl_double_window_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Double_Window;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_double_window_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Windows.Double;

