

private with System;


package FLTK.Widgets.Groups is


    type Group is new Widget with private;
    type Index is new Positive;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Group;


    procedure Add
           (This : in out Group;
            Item : in out Widget'Class);


    function Child
           (This  : in Group;
            Place : in Index)
        return access Widget'Class;


    function Number_Of_Children
           (This : in Group)
        return Natural;


    procedure Clear
           (This : in out Group);


    function Find
           (This : in     Group;
            Item : in out Widget'Class)
        return Index;


    procedure Insert
           (This  : in out Group;
            Item  : in out Widget'Class;
            Place : in     Index);


    procedure Remove
           (This : in out Group;
            Item : in out Widget'Class);


    procedure Remove
           (This  : in out Group;
            Place : in     Index);


    procedure Set_Resizable
           (This : in out Group;
            Item : in     Widget'Class);


    procedure Draw
           (This : in out Group);


private


    type Group is new Widget with null record;


    overriding procedure Finalize
           (This : in out Group);


    package Group_Convert is new System.Address_To_Access_Conversions (Group'Class);


    procedure fl_group_end
           (G : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");


end FLTK.Widgets.Groups;

