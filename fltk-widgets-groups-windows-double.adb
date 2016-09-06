

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Windows.Double is


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




    procedure Finalize
           (This : in out Double_Window) is
    begin
        Finalize (Window (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Double_Window then
                free_fl_double_window (This.Void_Ptr);
            end if;
        end if;
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
        end return;
    end Create;




    procedure Show
           (This : in Double_Window) is
    begin
        fl_double_window_show (This.Void_Ptr);
    end Show;


end FLTK.Widgets.Groups.Windows.Double;

