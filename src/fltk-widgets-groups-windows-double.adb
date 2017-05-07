

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Windows.Double is


    procedure double_window_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, double_window_set_draw_hook, "double_window_set_draw_hook");

    procedure fl_double_window_draw
           (W : in System.Address);
    pragma Import (C, fl_double_window_draw, "fl_double_window_draw");

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




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Double_Window_Convert is new
            System.Address_To_Access_Conversions (Double_Window'Class);

        Ada_Window : access Double_Window'Class :=
            Double_Window_Convert.To_Pointer (U);
    begin
        Ada_Window.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Double_Window) is
    begin
        fl_double_window_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Double_Window) is
    begin
        if  This in Double_Window and then
            This.Void_Ptr /= System.Null_Address
        then
            This.Clear;
            free_fl_double_window (This.Void_Ptr);
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
        end return;
    end Create;




    procedure Show
           (This : in Double_Window) is
    begin
        fl_double_window_show (This.Void_Ptr);
    end Show;




    procedure Hide
           (This : in Double_Window) is
    begin
        fl_double_window_hide (This.Void_Ptr);
    end Hide;


end FLTK.Widgets.Groups.Windows.Double;

