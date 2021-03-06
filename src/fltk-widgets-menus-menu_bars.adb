

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Menus.Menu_Bars is


    procedure menu_bar_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, menu_bar_set_draw_hook, "menu_bar_set_draw_hook");
    pragma Inline (menu_bar_set_draw_hook);

    procedure menu_bar_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, menu_bar_set_handle_hook, "menu_bar_set_handle_hook");
    pragma Inline (menu_bar_set_handle_hook);




    function new_fl_menu_bar
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_menu_bar, "new_fl_menu_bar");
    pragma Inline (new_fl_menu_bar);

    procedure free_fl_menu_bar
           (M : in System.Address);
    pragma Import (C, free_fl_menu_bar, "free_fl_menu_bar");
    pragma Inline (free_fl_menu_bar);




    procedure fl_menu_bar_draw
           (W : in System.Address);
    pragma Import (C, fl_menu_bar_draw, "fl_menu_bar_draw");
    pragma Inline (fl_menu_bar_draw);

    function fl_menu_bar_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_bar_handle, "fl_menu_bar_handle");
    pragma Inline (fl_menu_bar_handle);




    procedure Finalize
           (This : in out Menu_Bar) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Menu_Bar'Class
        then
            free_fl_menu_bar (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Menu (This));
    end Finalize;




    package body Forge is

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
                menu_bar_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Menu_Bar) is
    begin
        fl_menu_bar_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Menu_Bar;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_menu_bar_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Menus.Menu_Bars;

