

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Groups.Windows.Single is


    procedure single_window_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, single_window_set_draw_hook, "single_window_set_draw_hook");
    pragma Inline (single_window_set_draw_hook);

    procedure single_window_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, single_window_set_handle_hook, "single_window_set_handle_hook");
    pragma Inline (single_window_set_handle_hook);




    function new_fl_single_window
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_single_window, "new_fl_single_window");
    pragma Inline (new_fl_single_window);

    function new_fl_single_window2
           (W, H : in Interfaces.C.int;
            Text : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_single_window2, "new_fl_single_window2");
    pragma Inline (new_fl_single_window2);

    procedure free_fl_single_window
           (S : in System.Address);
    pragma Import (C, free_fl_single_window, "free_fl_single_window");
    pragma Inline (free_fl_single_window);




    procedure fl_single_window_show
           (S : in System.Address);
    pragma Import (C, fl_single_window_show, "fl_single_window_show");
    pragma Inline (fl_single_window_show);

    procedure fl_single_window_flush
           (S : in System.Address);
    pragma Import (C, fl_single_window_flush, "fl_single_window_flush");
    pragma Inline (fl_single_window_flush);




    procedure fl_single_window_draw
           (W : in System.Address);
    pragma Import (C, fl_single_window_draw, "fl_single_window_draw");
    pragma Inline (fl_single_window_draw);

    function fl_single_window_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_single_window_handle, "fl_single_window_handle");
    pragma Inline (fl_single_window_handle);




    procedure Finalize
           (This : in out Single_Window) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Single_Window'Class
        then
            This.Clear;
            free_fl_single_window (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Window (This));
    end Finalize;




    package body Forge is

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
                single_window_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;


        function Create
               (W, H : in Integer;
                Text : in String)
            return Single_Window is
        begin
            return This : Single_Window do
                This.Void_Ptr := new_fl_single_window2
                       (Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_group_end (This.Void_Ptr);
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                single_window_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                single_window_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Show
           (This : in out Single_Window) is
    begin
        fl_single_window_show (This.Void_Ptr);
    end Show;


    procedure Flush
           (This : in out Single_Window) is
    begin
        fl_single_window_flush (This.Void_Ptr);
    end Flush;




    procedure Draw
           (This : in out Single_Window) is
    begin
        fl_single_window_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Single_Window;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_single_window_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Windows.Single;

