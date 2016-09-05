

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Menu_Items is


    function Shortcut
           (Key : Pressable_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifier := Mod_None;
            This.Keypress := Key;
        end return;
    end Shortcut;


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




    function new_fl_menu_item
           (Text  : in Interfaces.C.char_array;
            CBack : in System.Address;
            --  Data  : in System.Address;
            Key   : in Interfaces.C.unsigned_long;
            Flags : in Interfaces.C.unsigned_short)
        return System.Address;
    pragma Import (C, new_fl_menu_item, "new_fl_menu_item");

    procedure free_fl_menu_item
           (M : in System.Address);
    pragma Import (C, free_fl_menu_item, "free_fl_menu_item");




    procedure Finalize
           (This : in out Menu_Item) is
    begin
        Finalize (Wrapper (This));
        if This in Menu_Item then
            free_fl_menu_item (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (Text     : in String;
            Action   : in FLTK.Callbacks.Callback;
            Shortcut : in Shortcut_Key := No_Key;
            Flags    : in Menu_Flag := Flag_Normal)
        return Menu_Item is
    begin
        return This : Menu_Item do
            null;
        end return;
    end Create;


end FLTK.Menu_Items;

