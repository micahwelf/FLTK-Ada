

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Menu_Items is


    function Create
           (Key : Pressable_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifiers := Mod_None;
            This.Keypress := Key;
        end return;
    end Create;


    function "+"
           (Left, Right : in Modifer_Key)
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
            This.Modifiers := Left;
            This.Keypress := Right;
        end return;
    end "+";


    function "+"
           (Left  : in Modifer_Key;
            Right : in Shortcut_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifiers := Left or Right.Modifiers;
            This.Keypress := Right.Keypress;
        end return;
    end "+";




    function "+"
           (Left, Right : in Menu_Flag)
        return Menu_Flag is
    begin
        return Left or Right;
    end "+";




    procedure Finalize
           (This : in out Menu_Item) is
    begin
        null;
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

