

with Interfaces.C;
with System;
use type System.Address;
with Ada.Containers.Vectors;
use type Ada.Containers.Count_Type;


package body FLTK.Widgets.Groups is


    function new_fl_group
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_group, "new_fl_group");

    procedure free_fl_group
           (G : in System.Address);
    pragma Import (C, free_fl_group, "free_fl_group");

    procedure fl_group_end
           (G : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");

    procedure fl_group_add
           (G, W : in System.Address);
    pragma Import (C, fl_group_add, "fl_group_add");

    procedure fl_group_clear
           (G : in System.Address);
    pragma Import (C, fl_group_clear, "fl_group_clear");

    --  function fl_group_find
    --         (G, W : in System.Address)
    --      return Interfaces.C.int;
    --  pragma Import (C, fl_group_find, "fl_group_find");

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




    procedure Initialize
           (This : in out Group) is
    begin
        Initialize (Widget (This));
        This.Widget_List := Widget_Vectors.Empty_Vector;
    end Initialize;




    procedure Finalize
           (This : in out Group) is
    begin
        Finalize (Widget (This));
        if This.Void_Ptr /= System.Null_Address then
            while This.Widget_List.Length > 0 loop
                This.Remove (This.Widget_List.Last_Index);
            end loop;
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
        end return;
    end Create;




    procedure Add
           (This : in out Group;
            Item : in out Widget'Class) is
    begin
        if Item.Parent /= null then
            Item.Parent.Remove (Item);
        end if;
        This.Widget_List.Append (Item'Unchecked_Access);
        Item.Parent := This'Unchecked_Access;
        fl_group_add (This.Void_Ptr, Item.Void_Ptr);
    end Add;




    function Child
           (This  : in Group;
            Place : in Index)
        return Widget_Cursor is
    begin
        return Ref : Widget_Cursor (This.Widget_List.Element (Place));
    end Child;




    procedure Clear
           (This : in out Group) is
    begin
        while This.Widget_List.Length > 0 loop
            This.Remove (This.Widget_List.Last_Index);
        end loop;
        fl_group_clear (This.Void_Ptr);
    end Clear;




    function Find
           (This : in     Group;
            Item : in out Widget'Class)
        return Index is
    begin
        return This.Widget_List.Find_Index (Item'Unchecked_Access);
    end Find;




    procedure Insert
           (This  : in out Group;
            Item  : in out Widget'Class;
            Place : in     Index) is
    begin
        if Item.Parent /= null then
            Item.Parent.Remove (Item);
        end if;
        This.Widget_List.Insert (Place, Item'Unchecked_Access);
        Item.Parent := This'Unchecked_Access;
        fl_group_insert
               (This.Void_Ptr,
                Item.Void_Ptr,
                Interfaces.C.int (Place));
    end Insert;




    procedure Remove
           (This : in out Group;
            Item : in out Widget'Class) is
    begin
        Item.Parent := null;
        This.Widget_List.Delete (This.Find (Item));
        fl_group_remove (This.Void_Ptr, Item.Void_Ptr);
    end Remove;




    procedure Remove
           (This  : in out Group;
            Place : in     Index) is
    begin
        This.Widget_List.Element (Place).Parent := null;
        This.Widget_List.Delete (Place);
        fl_group_remove2 (This.Void_Ptr, Interfaces.C.int (Place));
    end Remove;


end FLTK.Widgets.Groups;

