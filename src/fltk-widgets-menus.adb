

with

    Interfaces.C.Strings,
    Ada.Unchecked_Deallocation,
    System;

use type

    System.Address,
    Interfaces.C.int,
    Interfaces.C.unsigned_long,
    Interfaces.C.Strings.chars_ptr;


package body FLTK.Widgets.Menus is


    procedure menu_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, menu_set_draw_hook, "menu_set_draw_hook");
    pragma Inline (menu_set_draw_hook);

    procedure menu_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, menu_set_handle_hook, "menu_set_handle_hook");
    pragma Inline (menu_set_handle_hook);




    function new_fl_menu
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_menu, "new_fl_menu");
    pragma Inline (new_fl_menu);

    procedure free_fl_menu
           (F : in System.Address);
    pragma Import (C, free_fl_menu, "free_fl_menu");
    pragma Inline (free_fl_menu);




    function fl_menu_add
           (M    : in System.Address;
            T    : in Interfaces.C.char_array;
            S    : in Interfaces.C.unsigned_long;
            C, U : in System.Address;
            F    : in Interfaces.C.unsigned_long)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_add, "fl_menu_add");
    pragma Inline (fl_menu_add);

    function fl_menu_insert
           (M    : in System.Address;
            P    : in Interfaces.C.int;
            T    : in Interfaces.C.char_array;
            S    : in Interfaces.C.unsigned_long;
            C, U : in System.Address;
            F    : in Interfaces.C.unsigned_long)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_insert, "fl_menu_insert");
    pragma Inline (fl_menu_insert);

    procedure fl_menu_remove
           (M : in System.Address;
            P : in Interfaces.C.int);
    pragma Import (C, fl_menu_remove, "fl_menu_remove");
    pragma Inline (fl_menu_remove);

    procedure fl_menu_clear
           (M : in System.Address);
    pragma Import (C, fl_menu_clear, "fl_menu_clear");
    pragma Inline (fl_menu_clear);




    function fl_menu_get_item
           (M : in System.Address;
            I : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_menu_get_item, "fl_menu_get_item");
    pragma Inline (fl_menu_get_item);

    function fl_menu_find_item
           (M : in System.Address;
            T : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, fl_menu_find_item, "fl_menu_find_item");
    pragma Inline (fl_menu_find_item);

    function fl_menu_find_item2
           (M, C : in System.Address)
        return System.Address;
    pragma Import (C, fl_menu_find_item2, "fl_menu_find_item2");
    pragma Inline (fl_menu_find_item2);

    function fl_menu_find_index
           (M : in System.Address;
            T : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_find_index, "fl_menu_find_index");
    pragma Inline (fl_menu_find_index);

    function fl_menu_find_index2
           (M, I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_find_index2, "fl_menu_find_index2");
    pragma Inline (fl_menu_find_index2);

    function fl_menu_find_index3
           (M, C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_find_index3, "fl_menu_find_index3");
    pragma Inline (fl_menu_find_index3);

    function fl_menu_size
           (M : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_size, "fl_menu_size");
    pragma Inline (fl_menu_size);




    function fl_menu_mvalue
           (M : in System.Address)
        return System.Address;
    pragma Import (C, fl_menu_mvalue, "fl_menu_mvalue");
    pragma Inline (fl_menu_mvalue);

    function fl_menu_text
           (M : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_menu_text, "fl_menu_text");
    pragma Inline (fl_menu_text);

    function fl_menu_value
           (M : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_value, "fl_menu_value");
    pragma Inline (fl_menu_value);

    function fl_menu_set_value
           (M : in System.Address;
            I : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_set_value, "fl_menu_set_value");
    pragma Inline (fl_menu_set_value);

    function fl_menu_set_value2
           (M, I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_set_value2, "fl_menu_set_value2");
    pragma Inline (fl_menu_set_value2);




    function fl_menu_get_textcolor
           (M : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_menu_get_textcolor, "fl_menu_get_textcolor");
    pragma Inline (fl_menu_get_textcolor);

    procedure fl_menu_set_textcolor
           (M : in System.Address;
            C : in Interfaces.C.unsigned);
    pragma Import (C, fl_menu_set_textcolor, "fl_menu_set_textcolor");
    pragma Inline (fl_menu_set_textcolor);

    function fl_menu_get_textfont
           (M : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_get_textfont, "fl_menu_get_textfont");
    pragma Inline (fl_menu_get_textfont);

    procedure fl_menu_set_textfont
           (M : in System.Address;
            F : in Interfaces.C.int);
    pragma Import (C, fl_menu_set_textfont, "fl_menu_set_textfont");
    pragma Inline (fl_menu_set_textfont);

    function fl_menu_get_textsize
           (M : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_get_textsize, "fl_menu_get_textsize");
    pragma Inline (fl_menu_get_textsize);

    procedure fl_menu_set_textsize
           (M : in System.Address;
            S : in Interfaces.C.int);
    pragma Import (C, fl_menu_set_textsize, "fl_menu_set_textsize");
    pragma Inline (fl_menu_set_textsize);




    function fl_menu_get_down_box
           (M : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_get_down_box, "fl_menu_get_down_box");
    pragma Inline (fl_menu_get_down_box);

    procedure fl_menu_set_down_box
           (M : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_menu_set_down_box, "fl_menu_set_down_box");
    pragma Inline (fl_menu_set_down_box);

    procedure fl_menu_global
           (M : in System.Address);
    pragma Import (C, fl_menu_global, "fl_menu_global");
    pragma Inline (fl_menu_global);

    function fl_menu_measure
           (M : in     System.Address;
            I : in     Interfaces.C.int;
            H :    out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_menu_measure, "fl_menu_measure");
    pragma Inline (fl_menu_measure);




    function fl_menu_popup
           (M    : in System.Address;
            X, Y : in Interfaces.C.int;
            T    : in Interfaces.C.char_array;
            N    : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_menu_popup, "fl_menu_popup");
    pragma Inline (fl_menu_popup);

    function fl_menu_pulldown
           (M          : in System.Address;
            X, Y, W, H : in Interfaces.C.int;
            N          : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_menu_pulldown, "fl_menu_pulldown");
    pragma Inline (fl_menu_pulldown);




    procedure fl_menu_draw_item
           (M          : in System.Address;
            I          : in Interfaces.C.int;
            X, Y, W, H : in Interfaces.C.int;
            S          : in Interfaces.C.int);
    pragma Import (C, fl_menu_draw_item, "fl_menu_draw_item");
    pragma Inline (fl_menu_draw_item);




    procedure Item_Hook
           (M, U : in System.Address)
    is
        Ada_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (fl_widget_get_user_data (M));
        Action : Widget_Callback := Callback_Convert.To_Pointer (U);
    begin
        Action.all (Ada_Widget.all);
    end Item_Hook;




    procedure Free_Item is new Ada.Unchecked_Deallocation
        (Object => FLTK.Menu_Items.Menu_Item, Name => Item_Access);




    procedure Finalize
           (This : in out Menu) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Menu'Class
        then
            for Item of This.My_Items loop
                Free_Item (Item);
            end loop;
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
                This.My_Items := Item_Vectors.Empty_Vector;
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
        Callback, User_Data : System.Address := System.Null_Address;
        New_Item : Item_Access;
    begin
        if Action /= null then
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

        New_Item := new FLTK.Menu_Items.Menu_Item;
        Wrapper (New_Item.all).Void_Ptr := fl_menu_get_item (This.Void_Ptr, Place);
        Wrapper (New_Item.all).Needs_Dealloc := False;
        This.My_Items.Append (New_Item);
    end Add;


    procedure Insert
           (This     : in out Menu;
            Place    : in     Index;
            Text     : in     String;
            Action   : in     Widget_Callback := null;
            Shortcut : in     Key_Combo := No_Key;
            Flags    : in     Menu_Flag := Flag_Normal)
    is
        Ret_Place : Interfaces.C.int;
        Callback, User_Data : System.Address := System.Null_Address;
        New_Item : Item_Access;
    begin
        if Action /= null then
            Callback := Item_Hook'Address;
            User_Data := Callback_Convert.To_Address (Action);
        end if;

        Ret_Place := fl_menu_insert
           (This.Void_Ptr,
            Interfaces.C.int (Place) - 1,
            Interfaces.C.To_C (Text),
            To_C (Shortcut),
            Callback,
            User_Data,
            Interfaces.C.unsigned_long (Flags));

        New_Item := new FLTK.Menu_Items.Menu_Item;
        Wrapper (New_Item.all).Void_Ptr := fl_menu_get_item (This.Void_Ptr, Ret_Place);
        Wrapper (New_Item.all).Needs_Dealloc := False;
        This.My_Items.Insert (Positive (Ret_Place + 1), New_Item);
    end Insert;


    procedure Remove
           (This  : in out Menu;
            Place : in     Index) is
    begin
        Free_Item (This.My_Items.Reference (Place));
        This.My_Items.Delete (Place);
        fl_menu_remove (This.Void_Ptr, Interfaces.C.int (Place) - 1);
    end Remove;


    procedure Clear
           (This : in out Menu) is
    begin
        for Item of This.My_Items loop
            Free_Item (Item);
        end loop;
        This.My_Items := Item_Vectors.Empty_Vector;
        fl_menu_clear (This.Void_Ptr);
    end Clear;




    function Has_Item
           (This  : in Menu;
            Place : in Index)
        return Boolean is
    begin
        return Place in 1 .. This.Number_Of_Items;
    end Has_Item;


    function Has_Item
           (Place : in Cursor)
        return Boolean is
    begin
        return Place.My_Container.Has_Item (Place.My_Index);
    end Has_Item;


    function Item
           (This  : in Menu;
            Place : in Index)
        return FLTK.Menu_Items.Menu_Item_Reference is
    begin
        return (Data => This.My_Items.Element (Place));
    end Item;


    function Item
           (This  : in Menu;
            Place : in Cursor)
        return FLTK.Menu_Items.Menu_Item_Reference is
    begin
        return This.Item (Place.My_Index);
    end Item;


    function Find_Item
           (This : in Menu;
            Name : in String)
        return FLTK.Menu_Items.Menu_Item_Reference is
    begin
        return (Data => This.My_Items.Element (This.Find_Index (Name)));
    end Find_Item;


    function Find_Item
           (This   : in Menu;
            Action : in Widget_Callback)
        return FLTK.Menu_Items.Menu_Item_Reference is
    begin
        return (Data => This.My_Items.Element (This.Find_Index (Action)));
    end Find_Item;


    function Find_Index
           (This : in Menu;
            Name : in String)
        return Extended_Index
    is
        Ret : Interfaces.C.int;
    begin
        Ret := fl_menu_find_index (This.Void_Ptr, Interfaces.C.To_C (Name));
        return Extended_Index (Ret + 1);
    end Find_Index;


    function Find_Index
           (This : in Menu;
            Item : in FLTK.Menu_Items.Menu_Item)
        return Extended_Index
    is
        Ret : Interfaces.C.int;
    begin
        Ret := fl_menu_find_index2 (This.Void_Ptr, Wrapper (Item).Void_Ptr);
        return Extended_Index (Ret + 1);
    end Find_Index;


    function Find_Index
           (This   : in Menu;
            Action : in Widget_Callback)
        return Extended_Index
    is
        Ret : Interfaces.C.int;
    begin
        Ret := fl_menu_find_index3
           (This.Void_Ptr,
            Callback_Convert.To_Address (Action));
        return Extended_Index (Ret + 1);
    end Find_Index;


    function Number_Of_Items
           (This : in Menu)
        return Natural is
    begin
        return Natural (fl_menu_size (This.Void_Ptr));
    end Number_Of_Items;




    function Iterate
           (This : in Menu)
        return Menu_Iterators.Reversible_Iterator'Class is
    begin
        return It : Iterator := (My_Container => This'Unrestricted_Access);
    end Iterate;


    function First
           (Object : in Iterator)
        return Cursor is
    begin
        return Cu : Cursor :=
           (My_Container => Object.My_Container,
            My_Index     => 1);
    end First;


    function Next
           (Object : in Iterator;
            Place  : in Cursor)
        return Cursor is
    begin
        return Cu : Cursor :=
           (My_Container => Place.My_Container,
            My_Index     => Place.My_Index + 1);
    end Next;


    function Last
           (Object : in Iterator)
        return Cursor is
    begin
        return Cu : Cursor :=
           (My_Container => Object.My_Container,
            My_Index     => Object.My_Container.Number_Of_Items);
    end Last;


    function Previous
           (Object : in Iterator;
            Place  : in Cursor)
        return Cursor is
    begin
        return Cu : Cursor :=
           (My_Container => Place.My_Container,
            My_Index     => Place.My_Index - 1);
    end Previous;




    function Chosen
           (This : in Menu)
        return FLTK.Menu_Items.Menu_Item_Reference is
    begin
        return (Data => This.My_Items.Element (This.Chosen_Index));
    end Chosen;


    function Chosen_Label
           (This : in Menu)
        return String
    is
        Ptr : Interfaces.C.Strings.chars_ptr := fl_menu_text (This.Void_Ptr);
    begin
        if Ptr = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            --  no dealloc required?
            return Interfaces.C.Strings.Value (Ptr);
        end if;
    end Chosen_Label;


    function Chosen_Index
           (This : in Menu)
        return Extended_Index is
    begin
        return Extended_Index (fl_menu_value (This.Void_Ptr) + 1);
    end Chosen_Index;


    procedure Set_Chosen
           (This  : in out Menu;
            Place : in     Index)
    is
        Ignore_Ret : Interfaces.C.int;
    begin
        Ignore_Ret := fl_menu_set_value (This.Void_Ptr, Interfaces.C.int (Place) - 1);
    end Set_Chosen;


    procedure Set_Chosen
           (This : in out Menu;
            Item : in     FLTK.Menu_Items.Menu_Item)
    is
        Ignore_Ret : Interfaces.C.int;
    begin
        Ignore_Ret := fl_menu_set_value2 (This.Void_Ptr, Wrapper (Item).Void_Ptr);
    end Set_Chosen;




    function Get_Text_Color
           (This : in Menu)
        return Color is
    begin
        return Color (fl_menu_get_textcolor (This.Void_Ptr));
    end Get_Text_Color;


    procedure Set_Text_Color
           (This : in out Menu;
            To   : in     Color) is
    begin
        fl_menu_set_textcolor (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Text_Color;


    function Get_Text_Font
           (This : in Menu)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_menu_get_textfont (This.Void_Ptr));
    end Get_Text_Font;


    procedure Set_Text_Font
           (This : in out Menu;
            To   : in     Font_Kind) is
    begin
        fl_menu_set_textfont (This.Void_Ptr, Font_Kind'Pos (To));
    end Set_Text_Font;


    function Get_Text_Size
           (This : in Menu)
        return Font_Size is
    begin
        return Font_Size (fl_menu_get_textsize (This.Void_Ptr));
    end Get_Text_Size;


    procedure Set_Text_Size
           (This : in out Menu;
            To   : in     Font_Size) is
    begin
        fl_menu_set_textsize (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Text_Size;




    function Get_Down_Box
           (This : in Menu)
        return Box_Kind is
    begin
        return Box_Kind'Val (fl_menu_get_down_box (This.Void_Ptr));
    end Get_Down_Box;


    procedure Set_Down_Box
           (This : in out Menu;
            To   : in     Box_Kind) is
    begin
        fl_menu_set_down_box (This.Void_Ptr, Box_Kind'Pos (To));
    end Set_Down_Box;


    procedure Make_Global
           (This : in out Menu) is
    begin
        fl_menu_global (This.Void_Ptr);
    end Make_Global;


    procedure Measure_Item
           (This : in     Menu;
            Item : in     Index;
            W, H :    out Integer) is
    begin
        W := Integer (fl_menu_measure
           (This.Void_Ptr,
            Interfaces.C.int (Item) - 1,
            Interfaces.C.int (H)));
    end Measure_Item;




    function Popup
           (This    : in Menu;
            X, Y    : in Integer;
            Title   : in String := "";
            Initial : in Extended_Index := No_Index)
        return FLTK.Menu_Items.Menu_Item_Reference
    is
        Ptr : System.Address := fl_menu_popup
           (This.Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.To_C (Title),
            Interfaces.C.int (Initial) - 1);
        Place : Index := Index (fl_menu_find_index2 (This.Void_Ptr, Ptr) + 1);
    begin
        return (Data => This.My_Items.Element (Place));
    end Popup;


    function Pulldown
           (This       : in Menu;
            X, Y, W, H : in Integer;
            Initial    : in Extended_Index := No_Index)
        return FLTK.Menu_Items.Menu_Item_Reference
    is
        Ptr : System.Address := fl_menu_pulldown
           (This.Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.int (Initial) - 1);
        Place : Index := Index (fl_menu_find_index2 (This.Void_Ptr, Ptr) + 1);
    begin
        return (Data => This.My_Items.Element (Place));
    end Pulldown;




    procedure Draw_Item
           (This       : in out Menu;
            Item       : in     Index;
            X, Y, W, H : in     Integer;
            Selected   : in     Boolean := False) is
    begin
        fl_menu_draw_item
           (This.Void_Ptr,
            Interfaces.C.int (Item) - 1,
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Boolean'Pos (Selected));
    end Draw_Item;


    function Handle
           (This  : in out Menu;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Not_Handled;
    end Handle;


end FLTK.Widgets.Menus;

