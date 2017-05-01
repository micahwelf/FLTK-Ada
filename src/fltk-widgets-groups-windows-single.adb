

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Windows.Single is


    procedure single_window_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, single_window_set_draw_hook, "single_window_set_draw_hook");

    procedure fl_single_window_draw
           (W : in System.Address);
    pragma Import (C, fl_single_window_draw, "fl_single_window_draw");

    function new_fl_single_window
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_single_window, "new_fl_single_window");

    function new_fl_single_window2
           (W, H : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_single_window2, "new_fl_single_window2");

    procedure free_fl_single_window
           (S : in System.Address);
    pragma Import (C, free_fl_single_window, "free_fl_single_window");

    procedure fl_single_window_show
           (S : in System.Address);
    pragma Import (C, fl_single_window_show, "fl_single_window_show");

    procedure fl_single_window_flush
           (S : in System.Address);
    pragma Import (C, fl_single_window_flush, "fl_single_window_flush");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        Ada_Window : access Single_Window'Class :=
            Single_Window_Convert.To_Pointer (U);
    begin
        Ada_Window.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Single_Window) is
    begin
        fl_single_window_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Single_Window) is
    begin
        Finalize (Window (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Single_Window then
                free_fl_single_window (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Single_Window is
    begin
        return This : Single_Window do
            This.Void_Ptr := new_fl_single_window
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_group_end (This.Void_Ptr);
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            single_window_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;




    function Create
           (W, H : in Integer)
        return Single_Window is
    begin
        return This : Single_Window do
            This.Void_Ptr := new_fl_single_window2
                   (Interfaces.C.int (W),
                    Interfaces.C.int (H));
            fl_group_end (This.Void_Ptr);
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            single_window_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;




    procedure Show
           (This : in Single_Window) is
    begin
        fl_single_window_show (This.Void_Ptr);
    end Show;




    procedure Flush
           (This : in out Single_Window) is
    begin
        fl_single_window_flush (This.Void_Ptr);
    end Flush;


end FLTK.Widgets.Groups.Windows.Single;
