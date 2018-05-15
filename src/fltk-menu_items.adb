

with

    System,
    Interfaces.C.Strings,
    Ada.Unchecked_Conversion;

use type

    System.Address,
    Interfaces.C.int,
    Interfaces.C.Strings.chars_ptr;


package body FLTK.Menu_Items is


    function new_fl_menu_item
           (T    : in Interfaces.C.char_array;
            C    : in System.Address;
            S, F : in Interfaces.C.unsigned_long)
        return System.Address;
    pragma Import (C, new_fl_menu_item, "new_fl_menu_item");
    pragma Inline (new_fl_menu_item);

    procedure free_fl_menu_item
           (MI : in System.Address);
    pragma Import (C, free_fl_menu_item, "free_fl_menu_item");
    pragma Inline (free_fl_menu_item);




    function fl_menu_item_get_user_data
           (MI : in System.Address)
        return System.Address;
    pragma Import (C, fl_menu_item_get_user_data, "fl_menu_item_get_user_data");
    pragma Inline (fl_menu_item_get_user_data);

    procedure fl_menu_item_set_user_data
           (MI, C : in System.Address);
    pragma Import (C, fl_menu_item_set_user_data, "fl_menu_item_set_user_data");
    pragma Inline (fl_menu_item_set_user_data);

    procedure fl_menu_item_do_callback
           (MI, W : in System.Address);
    pragma Import (C, fl_menu_item_do_callback, "fl_menu_item_do_callback");
    pragma Inline (fl_menu_item_do_callback);




    function fl_menu_item_checkbox
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_checkbox, "fl_menu_item_checkbox");
    pragma Inline (fl_menu_item_checkbox);

    function fl_menu_item_radio
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_radio, "fl_menu_item_radio");
    pragma Inline (fl_menu_item_radio);

    function fl_menu_item_value
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_value, "fl_menu_item_value");
    pragma Inline (fl_menu_item_value);

    procedure fl_menu_item_set
           (MI : in System.Address);
    pragma Import (C, fl_menu_item_set, "fl_menu_item_set");
    pragma Inline (fl_menu_item_set);

    procedure fl_menu_item_clear
           (MI : in System.Address);
    pragma Import (C, fl_menu_item_clear, "fl_menu_item_clear");
    pragma Inline (fl_menu_item_clear);

    procedure fl_menu_item_setonly
           (MI : in System.Address);
    pragma Import (C, fl_menu_item_setonly, "fl_menu_item_setonly");
    pragma Inline (fl_menu_item_setonly);




    function fl_menu_item_get_label
           (MI : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_menu_item_get_label, "fl_menu_item_get_label");
    pragma Inline (fl_menu_item_get_label);

    procedure fl_menu_item_set_label
           (MI : in System.Address;
            T  : in Interfaces.C.char_array);
    pragma Import (C, fl_menu_item_set_label, "fl_menu_item_set_label");
    pragma Inline (fl_menu_item_set_label);

    function fl_menu_item_get_labelcolor
           (MI : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_menu_item_get_labelcolor, "fl_menu_item_get_labelcolor");
    pragma Inline (fl_menu_item_get_labelcolor);

    procedure fl_menu_item_set_labelcolor
           (MI : in System.Address;
            C  : in Interfaces.C.unsigned);
    pragma Import (C, fl_menu_item_set_labelcolor, "fl_menu_item_set_labelcolor");
    pragma Inline (fl_menu_item_set_labelcolor);

    function fl_menu_item_get_labelfont
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_get_labelfont, "fl_menu_item_get_labelfont");
    pragma Inline (fl_menu_item_get_labelfont);

    procedure fl_menu_item_set_labelfont
           (MI : in System.Address;
            F  : in Interfaces.C.int);
    pragma Import (C, fl_menu_item_set_labelfont, "fl_menu_item_set_labelfont");
    pragma Inline (fl_menu_item_set_labelfont);

    function fl_menu_item_get_labelsize
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_get_labelsize, "fl_menu_item_get_labelsize");
    pragma Inline (fl_menu_item_get_labelsize);

    procedure fl_menu_item_set_labelsize
           (MI : in System.Address;
            S  : in Interfaces.C.int);
    pragma Import (C, fl_menu_item_set_labelsize, "fl_menu_item_set_labelsize");
    pragma Inline (fl_menu_item_set_labelsize);

    function fl_menu_item_get_labeltype
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_get_labeltype, "fl_menu_item_get_labeltype");
    pragma Inline (fl_menu_item_get_labeltype);

    procedure fl_menu_item_set_labeltype
           (MI : in System.Address;
            T  : in Interfaces.C.int);
    pragma Import (C, fl_menu_item_set_labeltype, "fl_menu_item_set_labeltype");
    pragma Inline (fl_menu_item_set_labeltype);




    function fl_menu_item_get_shortcut
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_get_shortcut, "fl_menu_item_get_shortcut");
    pragma Inline (fl_menu_item_get_shortcut);

    procedure fl_menu_item_set_shortcut
           (MI : in System.Address;
            S  : in Interfaces.C.int);
    pragma Import (C, fl_menu_item_set_shortcut, "fl_menu_item_set_shortcut");
    pragma Inline (fl_menu_item_set_shortcut);

    function fl_menu_item_get_flags
           (MI : in System.Address)
        return Interfaces.C.unsigned_long;
    pragma Import (C, fl_menu_item_get_flags, "fl_menu_item_get_flags");
    pragma Inline (fl_menu_item_get_flags);

    procedure fl_menu_item_set_flags
           (MI : in System.Address;
            F  : in Interfaces.C.unsigned_long);
    pragma Import (C, fl_menu_item_set_flags, "fl_menu_item_set_flags");
    pragma Inline (fl_menu_item_set_flags);




    procedure fl_menu_item_activate
           (MI : in System.Address);
    pragma Import (C, fl_menu_item_activate, "fl_menu_item_activate");
    pragma Inline (fl_menu_item_activate);

    procedure fl_menu_item_deactivate
           (MI : in System.Address);
    pragma Import (C, fl_menu_item_deactivate, "fl_menu_item_deactivate");
    pragma Inline (fl_menu_item_deactivate);

    procedure fl_menu_item_show
           (MI : in System.Address);
    pragma Import (C, fl_menu_item_show, "fl_menu_item_show");
    pragma Inline (fl_menu_item_show);

    procedure fl_menu_item_hide
           (MI : in System.Address);
    pragma Import (C, fl_menu_item_hide, "fl_menu_item_hide");
    pragma Inline (fl_menu_item_hide);

    function fl_menu_item_active
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_active, "fl_menu_item_active");
    pragma Inline (fl_menu_item_active);

    function fl_menu_item_visible
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_visible, "fl_menu_item_visible");
    pragma Inline (fl_menu_item_visible);

    function fl_menu_item_activevisible
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_item_activevisible, "fl_menu_item_activevisible");
    pragma Inline (fl_menu_item_activevisible);




    procedure Finalize
           (This : in out Menu_Item) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Menu_Item'Class
        then
            if This.Needs_Dealloc then
                free_fl_menu_item (This.Void_Ptr);
            end if;
            This.Void_Ptr := System.Null_Address;
        end if;
    end Finalize;




    package Callback_Convert is
        function To_Pointer is new Ada.Unchecked_Conversion
            (System.Address, FLTK.Widgets.Widget_Callback);
        function To_Address is new Ada.Unchecked_Conversion
            (FLTK.Widgets.Widget_Callback, System.Address);
    end Callback_Convert;




    package body Forge is

        function Create
               (Text        : in String;
                Action      : in FLTK.Widgets.Widget_Callback := null;
                Shortcut    : in Key_Combo := No_Key;
                Flags       : in Menu_Flag := Flag_Normal)
            return Menu_Item is
        begin
            return Item : Menu_Item do
                Item.Void_Ptr := new_fl_menu_item
                   (Interfaces.C.To_C (Text),
                    Callback_Convert.To_Address (Action),
                    To_C (Shortcut),
                    Interfaces.C.unsigned_long (Flags));
            end return;
        end Create;

        pragma Inline (Create);

    end Forge;




    function Get_Callback
           (Item : in Menu_Item)
        return FLTK.Widgets.Widget_Callback is
    begin
        return Callback_Convert.To_Pointer
            (fl_menu_item_get_user_data (Item.Void_Ptr));
    end Get_Callback;


    procedure Set_Callback
           (Item : in out Menu_Item;
            Func : in     FLTK.Widgets.Widget_Callback) is
    begin
        fl_menu_item_set_user_data
           (Item.Void_Ptr,
            Callback_Convert.To_Address (Func));
    end Set_Callback;


    procedure Do_Callback
           (Item   : in out Menu_Item;
            Widget : in out FLTK.Widgets.Widget'Class) is
    begin
        fl_menu_item_do_callback (Item.Void_Ptr, Wrapper (Widget).Void_Ptr);
    end Do_Callback;




    function Has_Checkbox
           (Item : in Menu_Item)
        return Boolean is
    begin
        return fl_menu_item_checkbox (Item.Void_Ptr) /= 0;
    end Has_Checkbox;

    function Is_Radio
           (Item : in Menu_Item)
        return Boolean is
    begin
        return fl_menu_item_radio (Item.Void_Ptr) /= 0;
    end Is_Radio;

    function Get_State
           (Item : in Menu_Item)
        return Boolean is
    begin
        return fl_menu_item_value (Item.Void_Ptr) /= 0;
    end Get_State;

    procedure Set_State
           (Item : in out Menu_Item;
            To   : in     Boolean) is
    begin
        if To then
            fl_menu_item_set (Item.Void_Ptr);
        else
            fl_menu_item_clear (Item.Void_Ptr);
        end if;
    end Set_State;

    procedure Set_Only
           (Item : in out Menu_Item) is
    begin
        fl_menu_item_setonly (Item.Void_Ptr);
    end Set_Only;




    function Get_Label
           (Item : in Menu_Item)
        return String
    is
        Ptr : Interfaces.C.Strings.chars_ptr := fl_menu_item_get_label (Item.Void_Ptr);
    begin
        if Ptr = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            return Interfaces.C.Strings.Value (Ptr);
        end if;
    end Get_Label;

    procedure Set_Label
           (Item : in out Menu_Item;
            Text : in     String) is
    begin
        fl_menu_item_set_label (Item.Void_Ptr, Interfaces.C.To_C (Text));
    end Set_Label;

    function Get_Label_Color
           (Item : in Menu_Item)
        return Color is
    begin
        return Color (fl_menu_item_get_labelcolor (Item.Void_Ptr));
    end Get_Label_Color;

    procedure Set_Label_Color
           (Item : in out Menu_Item;
            To   : in     Color) is
    begin
        fl_menu_item_set_labelcolor (Item.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Label_Color;

    function Get_Label_Font
           (Item : in Menu_Item)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_menu_item_get_labelfont (Item.Void_Ptr));
    end Get_Label_Font;

    procedure Set_Label_Font
           (Item : in out Menu_Item;
            To   : in     Font_Kind) is
    begin
        fl_menu_item_set_labelfont (Item.Void_Ptr, Font_Kind'Pos (To));
    end Set_Label_Font;

    function Get_Label_Size
           (Item : in Menu_Item)
        return Font_Size is
    begin
        return Font_Size (fl_menu_item_get_labelsize (Item.Void_Ptr));
    end Get_Label_Size;

    procedure Set_Label_Size
           (Item : in out Menu_Item;
            To   : in     Font_Size) is
    begin
        fl_menu_item_set_labelsize (Item.Void_Ptr, Interfaces.C.int (To));
    end Set_Label_Size;

    function Get_Label_Type
           (Item : in Menu_Item)
        return Label_Kind is
    begin
        return Label_Kind'Val (fl_menu_item_get_labeltype (Item.Void_Ptr));
    end Get_Label_Type;

    procedure Set_Label_Type
           (Item : in out Menu_Item;
            To   : in     Label_Kind) is
    begin
        fl_menu_item_set_labeltype (Item.Void_Ptr, Label_Kind'Pos (To));
    end Set_Label_Type;




    function Get_Shortcut
           (Item : in Menu_Item)
        return Key_Combo is
    begin
        return To_Ada (Interfaces.C.unsigned_long (fl_menu_item_get_shortcut (Item.Void_Ptr)));
    end Get_Shortcut;

    procedure Set_Shortcut
           (Item : in out Menu_Item;
            To   : in     Key_Combo) is
    begin
        fl_menu_item_set_shortcut (Item.Void_Ptr, Interfaces.C.int (To_C (To)));
    end Set_Shortcut;


    function Get_Flags
           (Item : in Menu_Item)
        return Menu_Flag is
    begin
        return Menu_Flag (fl_menu_item_get_flags (Item.Void_Ptr));
    end Get_Flags;


    procedure Set_Flags
           (Item : in out Menu_Item;
            To   : in     Menu_Flag) is
    begin
        fl_menu_item_set_flags (Item.Void_Ptr, Interfaces.C.unsigned_long (To));
    end Set_Flags;




    procedure Activate
           (Item : in out Menu_Item) is
    begin
        fl_menu_item_activate (Item.Void_Ptr);
    end Activate;


    procedure Deactivate
           (Item : in out Menu_Item) is
    begin
        fl_menu_item_deactivate (Item.Void_Ptr);
    end Deactivate;


    procedure Show
           (Item : in out Menu_Item) is
    begin
        fl_menu_item_show (Item.Void_Ptr);
    end Show;


    procedure Hide
           (Item : in out Menu_Item) is
    begin
        fl_menu_item_hide (Item.Void_Ptr);
    end Hide;


    function Is_Active
           (Item : in Menu_Item)
        return Boolean is
    begin
        return fl_menu_item_active (Item.Void_Ptr) /= 0;
    end Is_Active;


    function Is_Visible
           (Item : in Menu_Item)
        return Boolean is
    begin
        return fl_menu_item_visible (Item.Void_Ptr) /= 0;
    end Is_Visible;


    function Is_Active_And_Visible
           (Item : in Menu_Item)
        return Boolean is
    begin
        return fl_menu_item_activevisible (Item.Void_Ptr) /= 0;
    end Is_Active_And_Visible;


end FLTK.Menu_Items;

