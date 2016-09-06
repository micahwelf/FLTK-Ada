

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups is


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




    procedure Finalize
           (This : in out Group) is
    begin
        Finalize (Widget (This));
        if This.Void_Ptr /= System.Null_Address then
            This.Clear;
            if This in Group then
                free_fl_group (This.Void_Ptr);
            end if;
        end if;
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
        return Widget_Cursor is

        Widget_Ptr : System.Address :=
                fl_group_child (This.Void_Ptr, Interfaces.C.int (Place - 1));

        Actual_Widget : access Widget'Class :=
                Widget_Convert.To_Pointer (fl_widget_get_user_data (Widget_Ptr));

    begin
        return Ref : Widget_Cursor (Data => Actual_Widget);
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


end FLTK.Widgets.Groups;

