

private with Interfaces;
private with System;


package FLTK.Widgets.Menus is


    type Menu is abstract new Widget with private;
    type Menu_Cursor (Data : access Menu'Class) is limited null record
        with Implicit_Dereference => Data;


    type Menu_Item is tagged limited private;


    type Index is new Positive;


    type Shortcut_Key is private;
    subtype Pressable_Key is Character range Character'Val (32) .. Character'Val (126);
    function Shortcut (Key : Pressable_Key) return Shortcut_Key;
    No_Key : constant Shortcut_Key;


    type Modifier_Key is private;
    function "+" (Left, Right : in Modifier_Key) return Modifier_Key;
    function "+" (Left : in Modifier_Key; Right : in Pressable_Key) return Shortcut_Key;
    function "+" (Left : in Modifier_Key; Right : in Shortcut_Key) return Shortcut_Key;
    Mod_None  : constant Modifier_Key;
    Mod_Shift : constant Modifier_Key;
    Mod_Ctrl  : constant Modifier_Key;
    Mod_Alt   : constant Modifier_Key;


    type Menu_Flag is private;
    function "+" (Left, Right : in Menu_Flag) return Menu_Flag;
    Flag_Normal    : constant Menu_Flag;
    Flag_Inactive  : constant Menu_Flag;
    Flag_Toggle    : constant Menu_Flag;
    Flag_Value     : constant Menu_Flag;
    Flag_Radio     : constant Menu_Flag;
    Flag_Invisible : constant Menu_Flag;
    Flag_Submenu   : constant Menu_Flag;
    Flag_Divider   : constant Menu_Flag;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Menu is abstract;


    procedure Add
           (This     : in out Menu;
            Text     : in     String;
            Action   : in     Widget_Callback := null;
            Shortcut : in     Shortcut_Key := No_Key;
            Flags    : in     Menu_Flag := Flag_Normal);


    function Chosen
           (This : in Menu'Class)
        return Menu_Item;


    function Value
           (Item : in Menu_Item)
        return Boolean;


private


    type Menu is abstract new Widget with null record;


    type Menu_Item is tagged limited
        record
            Void_Ptr : System.Address;
        end record;


    --  these values designed to align with FLTK enumeration types
    type Modifier_Key is new Interfaces.Unsigned_8;
    Mod_None  : constant Modifier_Key := 2#00000000#;
    Mod_Shift : constant Modifier_Key := 2#00000001#;
    Mod_Ctrl  : constant Modifier_Key := 2#00000100#;
    Mod_Alt   : constant Modifier_Key := 2#00001000#;


    type Shortcut_Key is
        record
            Modifier : Modifier_Key;
            Keypress : Character;
        end record;
    No_Key : constant Shortcut_Key :=
        (Modifier => Mod_None, Keypress => Character'Val (0));


    type Menu_Flag is new Interfaces.Unsigned_8;
    Flag_Normal    : constant Menu_Flag := 2#00000000#;
    Flag_Inactive  : constant Menu_Flag := 2#00000001#;
    Flag_Toggle    : constant Menu_Flag := 2#00000010#;
    Flag_Value     : constant Menu_Flag := 2#00000100#;
    Flag_Radio     : constant Menu_Flag := 2#00001000#;
    Flag_Invisible : constant Menu_Flag := 2#00010000#;
    --  Flag_Submenu_Pointer unlikely to be used
    Flag_Submenu   : constant Menu_Flag := 2#01000000#;
    Flag_Divider   : constant Menu_Flag := 2#10000000#;


end FLTK.Widgets.Menus;

