

private with Ada.Containers.Vectors;


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
        return Widget_Cursor;


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


private


    type Widget_Access is access all Widget'Class;
    package Widget_Vectors is new Ada.Containers.Vectors (Index, Widget_Access);


    type Group is new Widget with
        record
            Widget_List : Widget_Vectors.Vector;
        end record;


    overriding procedure Initialize
           (This : in out Group);


    overriding procedure Finalize
           (This : in out Group);


end FLTK.Widgets.Groups;

