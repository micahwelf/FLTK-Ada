

private with Interfaces;
private with System;
with FLTK.Menu_Items;


package FLTK.Widgets.Menus is


    type Menu is new Widget with private;


    type Menu_Cursor (Data : access Menu'Class) is limited null record
        with Implicit_Dereference => Data;


    type Index is new Positive;


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
        return Menu;


    procedure Add
           (This     : in out Menu;
            Text     : in     String;
            Action   : in     Widget_Callback := null;
            Shortcut : in     Shortcut_Key := No_Key;
            Flags    : in     Menu_Flag := Flag_Normal);


    function Find_Item
           (This : in Menu'Class;
            Name : in String)
        return FLTK.Menu_Items.Menu_Item;


    function Chosen
           (This : in Menu'Class)
        return FLTK.Menu_Items.Menu_Item;


    procedure Draw
           (This : in out Menu) is null;


    function Handle
           (This  : in out Menu;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Menu is new Widget with null record;


    procedure Item_Hook (M, U : in System.Address);
    pragma Convention (C, Item_Hook);


    overriding procedure Finalize
           (This : in out Menu);


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

