

with

    Interfaces.C,
    System,
    FLTK.Menu_Items;

use type

    System.Address,
    Interfaces.C.int,
    Interfaces.C.unsigned_long;


package body FLTK.Widgets.Menus is


    function "+"
           (Left, Right : in Menu_Flag)
        return Menu_Flag is
    begin
        return Left or Right;
    end "+";




    procedure menu_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, menu_set_draw_hook, "menu_set_draw_hook");

    procedure menu_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, menu_set_handle_hook, "menu_set_handle_hook");




    function new_fl_menu
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_menu, "new_fl_menu");

    procedure free_fl_menu
           (F : in System.Address);
    pragma Import (C, free_fl_menu, "free_fl_menu");




    function fl_menu_add
           (M    : in System.Address;
            T    : in Interfaces.C.char_array;
            S    : in Interfaces.C.unsigned_long;
            C, U : in System.Address;
            F    : in Interfaces.C.unsigned_long)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_add, "fl_menu_add");

    function fl_menu_find_item
           (M : in System.Address;
            T : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, fl_menu_find_item, "fl_menu_find_item");

    function fl_menu_mvalue
           (M : in System.Address)
        return System.Address;
    pragma Import (C, fl_menu_mvalue, "fl_menu_mvalue");




    procedure Item_Hook
           (M, U : in System.Address)
    is
        Ada_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (fl_widget_get_user_data (M));
        Action : Widget_Callback := Callback_Convert.To_Pointer (U);
    begin
        Action.all (Ada_Widget.all);
    end Item_Hook;




    procedure Finalize
           (This : in out Menu) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Menu'Class
        then
            free_fl_menu (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Widget (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Menu is
        begin
            return This : Menu do
                This.Void_Ptr := new_fl_menu
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                menu_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                menu_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Add
           (This     : in out Menu;
            Text     : in     String;
            Action   : in     Widget_Callback := null;
            Shortcut : in     Key_Combo := No_Key;
            Flags    : in     Menu_Flag := Flag_Normal)
    is
        Place : Interfaces.C.int;
        Callback, User_Data : System.Address;
    begin
        if Action = null then
            Callback := System.Null_Address;
            User_Data := System.Null_Address;
        else
            Callback := Item_Hook'Address;
            User_Data := Callback_Convert.To_Address (Action);
        end if;

        Place := fl_menu_add
               (This.Void_Ptr,
                Interfaces.C.To_C (Text),
                To_C (Shortcut),
                Callback,
                User_Data,
                Interfaces.C.unsigned_long (Flags));
    end Add;


    function Find_Item
           (This : in Menu'Class;
            Name : in String)
        return FLTK.Menu_Items.Menu_Item is
    begin
        return Item : FLTK.Menu_Items.Menu_Item do
            Wrapper (Item).Void_Ptr := fl_menu_find_item
                   (This.Void_Ptr,
                    Interfaces.C.To_C (Name));
        end return;
    end Find_Item;


    function Chosen
           (This : in Menu'Class)
        return FLTK.Menu_Items.Menu_Item is
    begin
        return Item : FLTK.Menu_Items.Menu_Item do
            Wrapper (Item).Void_Ptr := fl_menu_mvalue (This.Void_Ptr);
        end return;
    end Chosen;




    function Handle
           (This  : in out Menu;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Not_Handled;
    end Handle;


end FLTK.Widgets.Menus;

