

with FLTK.Callbacks;
private with Interfaces;


package FLTK.Menu_Items is


    type Menu_Item is new Wrapper with private;


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
           (Text     : in String;
            Action   : in FLTK.Callbacks.Callback;
            Shortcut : in Shortcut_Key := No_Key;
            Flags    : in Menu_Flag := Flag_Normal)
        return Menu_Item;


private


    --  these values designed to align with FLTK enumeration types
    type Modifier_Key is new Interfaces.Unsigned_8;
    Mod_None  : constant Modifier_Key := 2#0000#;
    Mod_Shift : constant Modifier_Key := 2#0001#;
    Mod_Ctrl  : constant Modifier_Key := 2#0100#;
    Mod_Alt   : constant Modifier_Key := 2#1000#;


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
    --  Flag_Submenu_Pointer is currently unused
    Flag_Submenu   : constant Menu_Flag := 2#01000000#;
    Flag_Divider   : constant Menu_Flag := 2#10000000#;


    type Menu_Item is new Wrapper with null record;


    overriding procedure Finalize
           (This : in out Menu_Item);


end FLTK.Menu_Items;

