

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Windows is


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




    procedure fl_group_end
           (G : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");




    procedure Finalize
           (This : in out Window) is
    begin
        Finalize (Group (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Window then
                free_fl_window (This.Void_Ptr);
            end if;
        end if;
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
        end return;
    end Create;




    procedure Show
           (This : in Window) is
    begin
        fl_window_show (This.Void_Ptr);
    end Show;


end FLTK.Widgets.Groups.Windows;

