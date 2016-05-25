

package FLTK.Widget.Group is


    type Group_Type is new Widget_Type with private;
    type Index is new Integer;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Group_Type;


    procedure Add
           (This : Group_Type'Class;
            Item : Widget_Type'Class);


    procedure Clear
           (This : Group_Type'Class);


    function Find
           (This : Group_Type'Class;
            Item : Widget_Type'Class)
        return Index;


    procedure Insert
           (This  : Group_Type'Class;
            Item  : Widget_Type'Class;
            Place : Index);


    procedure Remove
           (This : Group_Type'Class;
            Item : Widget_Type'Class);


    procedure Remove
           (This  : Group_Type'Class;
            Place : Index);


private


    type Group_Type is new Widget_Type with null record;


    overriding procedure Finalize (This : in out Group_Type);


end FLTK.Widget.Group;

