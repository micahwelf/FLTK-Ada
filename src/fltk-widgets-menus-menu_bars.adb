

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Menus.Menu_Bars is


    procedure menu_bar_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, menu_bar_set_draw_hook, "menu_bar_set_draw_hook");

    procedure fl_menu_bar_draw
           (W : in System.Address);
    pragma Import (C, fl_menu_bar_draw, "fl_menu_bar_draw");

    function new_fl_menu_bar
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_menu_bar, "new_fl_menu_bar");

    procedure free_fl_menu_bar
           (M : in System.Address);
    pragma Import (C, free_fl_menu_bar, "free_fl_menu_bar");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        Ada_Menu_Bar : access Menu_Bar'Class :=
            Menu_Bar_Convert.To_Pointer (U);
    begin
        Ada_Menu_Bar.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Menu_Bar) is
    begin
        fl_menu_bar_draw (This.Void_Ptr);
    end Draw;




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
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            menu_bar_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;


end FLTK.Widgets.Menus.Menu_Bars;

