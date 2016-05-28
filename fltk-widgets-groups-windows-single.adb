

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Windows.Single is


    function new_fl_single_window
           (X, Y, W, H : in Interfaces.C.int;
            Label      : in Interfaces.C.char_array)
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




    procedure fl_group_end
           (G : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");




    procedure Finalize
           (This : in out Single_Window) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_single_window (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Single_Window is

        VP : System.Address;

    begin
        VP := new_fl_single_window
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
        return Single_Window is

        VP : System.Address;

    begin
        VP := new_fl_single_window2
                   (Interfaces.C.int (W),
                    Interfaces.C.int (H));
        fl_group_end (VP);
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;




    procedure Show
           (S : in Single_Window) is
    begin
        fl_single_window_show (S.Void_Ptr);
    end Show;




    procedure Flush
           (S : in out Single_Window) is
    begin
        fl_single_window_flush (S.Void_Ptr);
    end Flush;


end FLTK.Widgets.Groups.Windows.Single;

