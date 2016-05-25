

package FLTK.Widgets.Groups is


    type Group is new Widget with private;
    type Index is new Integer;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Group;


    procedure Add
           (This : in out Group'Class;
            Item : in     Widget'Class);


    procedure Clear
           (This : in out Group'Class);


    function Find
           (This : in Group'Class;
            Item : in Widget'Class)
        return Index;


    procedure Insert
           (This  : in out Group'Class;
            Item  : in     Widget'Class;
            Place : in     Index);


    procedure Remove
           (This : in out Group'Class;
            Item : in     Widget'Class);


    procedure Remove
           (This  : in out Group'Class;
            Place : in     Index);


private


    type Group is new Widget with null record;


    overriding procedure Finalize
           (This : in out Group);


end FLTK.Widgets.Groups;

