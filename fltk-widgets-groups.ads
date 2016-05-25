

package FLTK.Widgets.Groups is


    type Group is new Widget with private;
    type Index is new Integer;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Group;


    procedure Add
           (This : Group'Class;
            Item : Widget'Class);


    procedure Clear
           (This : Group'Class);


    function Find
           (This : Group'Class;
            Item : Widget'Class)
        return Index;


    procedure Insert
           (This  : Group'Class;
            Item  : Widget'Class;
            Place : Index);


    procedure Remove
           (This : Group'Class;
            Item : Widget'Class);


    procedure Remove
           (This  : Group'Class;
            Place : Index);


private


    type Group is new Widget with null record;


    overriding procedure Finalize (This : in out Group);


end FLTK.Widgets.Groups;

