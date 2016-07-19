

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Menus.Menu_Bars is


    function new_fl_menu_bar
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_menu_bar, "new_fl_menu_bar");

    procedure free_fl_menu_bar
           (M : in System.Address);
    pragma Import (C, free_fl_menu_bar, "free_fl_menu_bar");




    procedure Finalize
           (This : in out Menu_Bar) is
    begin
        Finalize (Menu (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Menu_Bar then
                free_fl_menu_bar (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Menu_Bar is
    begin
        return This : Menu_Bar do
            This.Void_Ptr := new_fl_menu_bar
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
        end return;
    end Create;


end FLTK.Widgets.Menus.Menu_Bars;

