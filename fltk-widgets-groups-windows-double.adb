

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Windows.Double is


    function new_fl_double_window
           (X, Y, W, H : in Interfaces.C.int;
            L          : in Interfaces.C.char_array)
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




    procedure fl_group_end (G : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");




    procedure Finalize (This : in out Double_Window) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_double_window (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Double_Window is

        VP : System.Address;

    begin
        VP := new_fl_double_window
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Label));
        fl_group_end (VP);
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;




    function Create
           (W, H : in Integer)
        return Double_Window is

        VP : System.Address;

    begin
        VP := new_fl_double_window2
                   (Interfaces.C.int (W),
                    Interfaces.C.int (H));
        fl_group_end (VP);
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;




    procedure Show
           (W : in Double_Window) is
    begin
        fl_double_window_show (W.Void_Ptr);
    end Show;


end FLTK.Widgets.Groups.Windows.Double;

