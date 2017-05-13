

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups is


    procedure group_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, group_set_draw_hook, "group_set_draw_hook");

    procedure group_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, group_set_handle_hook, "group_set_handle_hook");

    procedure fl_group_draw
           (W : in System.Address);
    pragma Import (C, fl_group_draw, "fl_group_draw");

    function fl_group_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_group_handle, "fl_group_handle");

    function new_fl_group
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_group, "new_fl_group");

    procedure free_fl_group
           (G : in System.Address);
    pragma Import (C, free_fl_group, "free_fl_group");

    procedure fl_group_add
           (G, W : in System.Address);
    pragma Import (C, fl_group_add, "fl_group_add");

    function fl_group_find
           (G, W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_group_find, "fl_group_find");

    procedure fl_group_insert
           (G, W : in System.Address;
            P    : in Interfaces.C.int);
    pragma Import (C, fl_group_insert, "fl_group_insert");

    procedure fl_group_remove
           (G, W : in System.Address);
    pragma Import (C, fl_group_remove, "fl_group_remove");

    procedure fl_group_remove2
           (G : in System.Address;
            P : in Interfaces.C.int);
    pragma Import (C, fl_group_remove2, "fl_group_remove2");

    function fl_group_children
           (G : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_group_children, "fl_group_children");

    function fl_group_child
           (G : in System.Address;
            I : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_group_child, "fl_group_child");

    procedure fl_group_resizable
           (G, W : in System.Address);
    pragma Import (C, fl_group_resizable, "fl_group_resizable");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Group_Convert is new System.Address_To_Access_Conversions (Group'Class);

        Ada_Group : access Group'Class :=
            Group_Convert.To_Pointer (U);
    begin
        Ada_Group.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Group) is
    begin
        fl_group_draw (This.Void_Ptr);
    end Draw;




    function Handle
           (This  : in out Group;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_group_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;




    procedure Finalize
           (This : in out Group) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Group'Class
        then
            This.Clear;
            free_fl_group (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Widget (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Group is
    begin
        return This : Group do
            This.Void_Ptr := new_fl_group
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_group_end (This.Void_Ptr);
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            group_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            group_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Add
           (This : in out Group;
            Item : in out Widget'Class) is
    begin
        fl_group_add (This.Void_Ptr, Item.Void_Ptr);
    end Add;




    function Child
           (This  : in Group;
            Place : in Index)
        return access Widget'Class
    is
        Widget_Ptr : System.Address :=
                fl_group_child (This.Void_Ptr, Interfaces.C.int (Place - 1));

        Actual_Widget : access Widget'Class :=
                Widget_Convert.To_Pointer (fl_widget_get_user_data (Widget_Ptr));
    begin
        return Actual_Widget;
    end Child;




    function Number_Of_Children
           (This : in Group)
        return Natural is
    begin
        return Natural (fl_group_children (This.Void_Ptr));
    end Number_Of_Children;




    procedure Clear
           (This : in out Group) is
    begin
        for I in reverse 1 .. This.Number_Of_Children loop
            This.Remove (Index (I));
        end loop;
    end Clear;




    function Find
           (This : in     Group;
            Item : in out Widget'Class)
        return Index is
    begin
        --  should set this up to throw an exception if not found
        return Index (fl_group_find (This.Void_Ptr, Item.Void_Ptr));
    end Find;




    procedure Insert
           (This  : in out Group;
            Item  : in out Widget'Class;
            Place : in     Index) is
    begin
        fl_group_insert
               (This.Void_Ptr,
                Item.Void_Ptr,
                Interfaces.C.int (Place));
    end Insert;




    procedure Remove
           (This : in out Group;
            Item : in out Widget'Class) is
    begin
        fl_group_remove (This.Void_Ptr, Item.Void_Ptr);
    end Remove;




    procedure Remove
           (This  : in out Group;
            Place : in     Index) is
    begin
        fl_group_remove2 (This.Void_Ptr, Interfaces.C.int (Place));
    end Remove;




    procedure Set_Resizable
           (This : in out Group;
            Item : in     Widget'Class) is
    begin
        fl_group_resizable (This.Void_Ptr, Item.Void_Ptr);
    end Set_Resizable;


end FLTK.Widgets.Groups;

