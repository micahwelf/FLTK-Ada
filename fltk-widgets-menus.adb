

with Interfaces.C;
with System;
use type System.Address;
use type Interfaces.C.int;
use type Interfaces.C.unsigned_long;


package body FLTK.Widgets.Menus is


    function Shortcut
           (Key : Pressable_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifier := Mod_None;
            This.Keypress := Key;
        end return;
    end Shortcut;




    function Key_To_C
           (Key : Shortcut_Key)
        return Interfaces.C.unsigned_long is
    begin
        return Interfaces.C.unsigned_long (Key.Modifier) *
               65536 + Character'Pos (Key.Keypress);
    end Key_To_C;




    function "+"
           (Left, Right : in Modifier_Key)
        return Modifier_Key is
    begin
        return Left or Right;
    end "+";




    function "+"
           (Left  : in Modifier_Key;
            Right : in Pressable_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifier := Left;
            This.Keypress := Right;
        end return;
    end "+";




    function "+"
           (Left  : in Modifier_Key;
            Right : in Shortcut_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifier := Left or Right.Modifier;
            This.Keypress := Right.Keypress;
        end return;
    end "+";




    function "+"
           (Left, Right : in Menu_Flag)
        return Menu_Flag is
    begin
        return Left or Right;
    end "+";




    function fl_menu_add
           (M    : in System.Address;
            T    : in Interfaces.C.char_array;
            S    : in Interfaces.C.unsigned_long;
            C, U : in System.Address;
            F    : in Interfaces.C.unsigned_long)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_add, "fl_menu_add");

    function fl_menu_mvalue
           (M : in System.Address)
        return System.Address;
    pragma Import (C, fl_menu_mvalue, "fl_menu_mvalue");

    function fl_menuitem_value
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menuitem_value, "fl_menuitem_value");




    procedure Item_Hook (M, U : in System.Address);
    pragma Convention (C, Item_Hook);

    procedure Item_Hook
           (M, U : in System.Address)
    is
        Ada_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (fl_widget_get_user_data (M));
        Action : Widget_Callback := Callback_Convert.To_Pointer (U);
    begin
        Action.all (Ada_Widget.all);
    end Item_Hook;




    procedure Add
           (This     : in out Menu;
            Text     : in     String;
            Action   : in     Widget_Callback := null;
            Shortcut : in     Shortcut_Key := No_Key;
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
                Key_To_C (Shortcut),
                Callback,
                User_Data,
                Interfaces.C.unsigned_long (Flags));
    end Add;




    function Chosen
           (This : in Menu'Class)
        return Menu_Item is
    begin
        return Item : Menu_Item do
            Item.Void_Ptr := fl_menu_mvalue (This.Void_Ptr);
        end return;
    end Chosen;




    function Value
           (Item : in Menu_Item)
        return Boolean is
    begin
        return fl_menuitem_value (Item.Void_Ptr) /= 0;
    end Value;


end FLTK.Widgets.Menus;

