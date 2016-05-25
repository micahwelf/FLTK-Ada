

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widget.Group is


    function new_fl_group
           (X, Y, W, H : in Interfaces.C.int;
            L          : in Interfaces.C.char_array)
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




    procedure Finalize (This : in out Group_Type) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_group (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Group_Type is

        VP : System.Address;

    begin
        VP := new_fl_group
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Label));
        fl_group_end (VP);
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;




    procedure Add
           (This : Group_Type'Class;
            Item : Widget_Type'Class) is
    begin
        fl_group_add (This.Void_Ptr, Item.Void_Ptr);
    end Add;




    procedure Clear
           (This : Group_Type'Class) is
    begin
        fl_group_clear (This.Void_Ptr);
    end Clear;




    function Find
           (This : Group_Type'Class;
            Item : Widget_Type'Class)
        return Index is
    begin
        return Index (fl_group_find (This.Void_Ptr, Item.Void_Ptr));
    end Find;




    procedure Insert
           (This  : Group_Type'Class;
            Item  : Widget_Type'Class;
            Place : Index) is
    begin
        fl_group_insert
               (This.Void_Ptr,
                Item.Void_Ptr,
                Interfaces.C.int (Place));
    end Insert;




    procedure Remove
           (This : Group_Type'Class;
            Item : Widget_Type'Class) is
    begin
        fl_group_remove (This.Void_Ptr, Item.Void_Ptr);
    end Remove;




    procedure Remove
           (This  : Group_Type'Class;
            Place : Index) is
    begin
        fl_group_remove2 (This.Void_Ptr, Interfaces.C.int (Place));
    end Remove;


end FLTK.Widget.Group;

