

with

    FLTK.Menu_Items;

private with

    Interfaces,
    System;


package FLTK.Widgets.Menus is


    type Menu is new Widget with private;

    type Menu_Cursor (Data : access Menu'Class) is limited null record
        with Implicit_Dereference => Data;

    subtype Index is Positive;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Menu;

    end Forge;




    procedure Add
           (This     : in out Menu;
            Text     : in     String;
            Action   : in     Widget_Callback := null;
            Shortcut : in     Key_Combo := No_Key;
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

    overriding procedure Finalize
           (This : in out Menu);




    procedure Item_Hook (M, U : in System.Address);
    pragma Convention (C, Item_Hook);


end FLTK.Widgets.Menus;

