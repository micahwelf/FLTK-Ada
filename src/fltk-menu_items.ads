
with

    FLTK.Widgets;


package FLTK.Menu_Items is


    type Menu_Item is new Wrapper with private;

    type Menu_Item_Reference (Data : not null access Menu_Item'Class) is limited null record
        with Implicit_Dereference => Data;




    package Forge is

        --  Usually you don't bother with this and just add items
        --  to Menus directly using the Add subprograms in that package.

        function Create
               (Text        : in String;
                Action      : in FLTK.Widgets.Widget_Callback := null;
                Shortcut    : in Key_Combo := No_Key;
                Flags       : in Menu_Flag := Flag_Normal)
            return Menu_Item;

    end Forge;




    function Get_Callback
           (Item : in Menu_Item)
        return FLTK.Widgets.Widget_Callback;

    procedure Set_Callback
           (Item : in out Menu_Item;
            Func : in     FLTK.Widgets.Widget_Callback);

    procedure Do_Callback
           (Item   : in out Menu_Item;
            Widget : in out FLTK.Widgets.Widget'Class);




    function Has_Checkbox
           (Item : in Menu_Item)
        return Boolean;

    function Is_Radio
           (Item : in Menu_Item)
        return Boolean;

    function Get_State
           (Item : in Menu_Item)
        return Boolean;

    procedure Set_State
           (Item : in out Menu_Item;
            To   : in     Boolean);

    procedure Set_Only
           (Item : in out Menu_Item);




    function Get_Label
           (Item : in Menu_Item)
        return String;

    procedure Set_Label
           (Item : in out Menu_Item;
            Text : in     String);

    function Get_Label_Color
           (Item : in Menu_Item)
        return Color;

    procedure Set_Label_Color
           (Item : in out Menu_Item;
            To   : in     Color);

    function Get_Label_Font
           (Item : in Menu_Item)
        return Font_Kind;

    procedure Set_Label_Font
           (Item : in out Menu_Item;
            To   : in     Font_Kind);

    function Get_Label_Size
           (Item : in Menu_Item)
        return Font_Size;

    procedure Set_Label_Size
           (Item : in out Menu_Item;
            To   : in     Font_Size);

    function Get_Label_Type
           (Item : in Menu_Item)
        return Label_Kind;

    procedure Set_Label_Type
           (Item : in out Menu_Item;
            To   : in     Label_Kind);




    function Get_Shortcut
           (Item : in Menu_Item)
        return Key_Combo;

    procedure Set_Shortcut
           (Item : in out Menu_Item;
            To   : in     Key_Combo);




    procedure Activate
           (Item : in out Menu_Item);

    procedure Deactivate
           (Item : in out Menu_Item);

    procedure Show
           (Item : in out Menu_Item);

    procedure Hide
           (Item : in out Menu_Item);

    function Is_Active
           (Item : in Menu_Item)
        return Boolean;

    function Is_Visible
           (Item : in Menu_Item)
        return Boolean;

    function Is_Active_And_Visible
           (Item : in Menu_Item)
        return Boolean;


private


    type Menu_Item is new Wrapper with null record;

    overriding procedure Finalize
           (This : in out Menu_Item);




    pragma Inline (Get_Callback);
    pragma Inline (Set_Callback);
    pragma Inline (Do_Callback);


    pragma Inline (Has_Checkbox);
    pragma Inline (Is_Radio);
    pragma Inline (Get_State);
    pragma Inline (Set_State);
    pragma Inline (Set_Only);


    pragma Inline (Get_Label);
    pragma Inline (Set_Label);
    pragma Inline (Get_Label_Color);
    pragma Inline (Set_Label_Color);
    pragma Inline (Get_Label_Font);
    pragma Inline (Set_Label_Font);
    pragma Inline (Get_Label_Size);
    pragma Inline (Set_Label_Size);
    pragma Inline (Get_Label_Type);
    pragma Inline (Set_Label_Type);


    pragma Inline (Get_Shortcut);
    pragma Inline (Set_Shortcut);


    pragma Inline (Activate);
    pragma Inline (Deactivate);
    pragma Inline (Show);
    pragma Inline (Hide);
    pragma Inline (Is_Active);
    pragma Inline (Is_Visible);
    pragma Inline (Is_Active_And_Visible);


end FLTK.Menu_Items;

