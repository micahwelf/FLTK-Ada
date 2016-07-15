

with Interfaces.C;
with System;
use type System.Address;
use type Interfaces.C.unsigned;


package body FLTK.Widgets.Groups.Windows.Single.Menu is


    function new_fl_menu_window
           (X, Y, W, H : in Interfaces.C.int;
            Label      : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_menu_window, "new_fl_menu_window");

    function new_fl_menu_window2
           (W, H : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_menu_window2, "new_fl_menu_window2");

    procedure free_fl_menu_window
           (M : in System.Address);
    pragma Import (C, free_fl_menu_window, "free_fl_menu_window");

    procedure fl_menu_window_show
           (M : in System.Address);
    pragma Import (C, fl_menu_window_show, "fl_menu_window_show");

    procedure fl_menu_window_hide
           (M : in System.Address);
    pragma Import (C, fl_menu_window_hide, "fl_menu_window_hide");

    procedure fl_menu_window_flush
           (M : in System.Address);
    pragma Import (C, fl_menu_window_flush, "fl_menu_window_flush");

    procedure fl_menu_window_set_overlay
           (M : in System.Address);
    pragma Import (C, fl_menu_window_set_overlay, "fl_menu_window_set_overlay");

    procedure fl_menu_window_clear_overlay
           (M : in System.Address);
    pragma Import (C, fl_menu_window_clear_overlay, "fl_menu_window_clear_overlay");

    function fl_menu_window_overlay
           (M : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_menu_window_overlay, "fl_menu_window_overlay");




    procedure fl_group_end
           (G : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");




    procedure Finalize
           (This : in out Menu_Window) is
    begin
        Finalize (Single_Window (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Menu_Window then
                free_fl_menu_window (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Menu_Window is
    begin
        return This : Menu_Window do
            This.Void_Ptr := new_fl_menu_window
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_group_end (This.Void_Ptr);
        end return;
    end Create;




    function Create
           (W, H : in Integer)
        return Menu_Window is
    begin
        return This : Menu_Window do
            This.Void_Ptr := new_fl_menu_window2
                   (Interfaces.C.int (W),
                    Interfaces.C.int (H));
            fl_group_end (This.Void_Ptr);
        end return;
    end Create;




    procedure Show
           (This : in Menu_Window) is
    begin
        fl_menu_window_show (This.Void_Ptr);
    end Show;




    procedure Hide
           (This : in Menu_Window) is
    begin
        fl_menu_window_hide (This.Void_Ptr);
    end Hide;




    procedure Flush
           (This : in out Menu_Window) is
    begin
        fl_menu_window_flush (This.Void_Ptr);
    end Flush;




    function Get_Overlay
           (This : in Menu_Window)
        return Boolean is
    begin
        if fl_menu_window_overlay (This.Void_Ptr) = 0 then
            return False;
        else
            return True;
        end if;
    end Get_Overlay;



    procedure Set_Overlay
           (This  : in out Menu_Window;
            Value : in     Boolean) is
    begin
        if Value then
            fl_menu_window_set_overlay (This.Void_Ptr);
        else
            fl_menu_window_clear_overlay (This.Void_Ptr);
        end if;
    end Set_Overlay;


end FLTK.Widgets.Groups.Windows.Single.Menu;

