

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Menus.Menu_Buttons is


    procedure menu_button_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, menu_button_set_draw_hook, "menu_button_set_draw_hook");

    procedure fl_menu_button_draw
           (W : in System.Address);
    pragma Import (C, fl_menu_button_draw, "fl_menu_button_draw");

    function new_fl_menu_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_menu_button, "new_fl_menu_button");

    procedure free_fl_menu_button
           (M : in System.Address);
    pragma Import (C, free_fl_menu_button, "free_fl_menu_button");

    procedure fl_menu_button_type
           (M : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_menu_button_type, "fl_menu_button_type");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Menu_Button_Convert is new
            System.Address_To_Access_Conversions (Menu_Button'Class);

        Ada_Menu_Button : access Menu_Button'Class :=
            Menu_Button_Convert.To_Pointer (U);
    begin
        Ada_Menu_Button.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Menu_Button) is
    begin
        fl_menu_button_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Menu_Button) is
    begin
        if  This in Menu_Button and then
            This.Void_Ptr /= System.Null_Address
        then
            free_fl_menu_button (This.Void_Ptr);
        end if;
        Finalize (Menu (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Menu_Button is
    begin
        return This : Menu_Button do
            This.Void_Ptr := new_fl_menu_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            menu_button_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;




    procedure Set_Popup_Kind
           (This : in out Menu_Button;
            Pop  : in     Popup_Buttons) is
    begin
        fl_menu_button_type (This.Void_Ptr, Popup_Buttons'Pos (Pop));
    end Set_Popup_Kind;


end FLTK.Widgets.Menus.Menu_Buttons;

