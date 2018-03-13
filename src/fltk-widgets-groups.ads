

private with

    System;


package FLTK.Widgets.Groups is


    type Group is new Widget with private;

    type Index is new Positive;
    --  type Clip_Mode is (No_Clip, Clip);




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Group;

    end Forge;




    procedure Add
           (This : in out Group;
            Item : in out Widget'Class);

    procedure Insert
           (This  : in out Group;
            Item  : in out Widget'Class;
            Place : in     Index);

    procedure Insert
           (This   : in out Group;
            Item   : in out Widget'Class;
            Before : in     Widget'Class);

    procedure Remove
           (This : in out Group;
            Item : in out Widget'Class);

    procedure Remove
           (This  : in out Group;
            Place : in     Index);

    procedure Clear
           (This : in out Group);




    function Child
           (This  : in Group;
            Place : in Index)
        return access Widget'Class;

    function Find
           (This : in     Group;
            Item : in out Widget'Class)
        return Index;

    function Number_Of_Children
           (This : in Group)
        return Natural;




    --  function Get_Clip_Mode
    --         (This : in Group)
    --      return Clip_Mode;

    --  procedure Set_Clip_Mode
    --         (This : in out Group;
    --          Mode : in     Clip_Mode);




    function Get_Resizable
           (This : in Group)
        return access Widget'Class;

    procedure Set_Resizable
           (This : in out Group;
            Item : in     Widget'Class);

    procedure Reset_Initial_Sizes
           (This : in out Group);




    procedure Draw
           (This : in out Group);

    function Handle
           (This  : in out Group;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Group is new Widget with null record;

    overriding procedure Finalize
           (This : in out Group);




    procedure fl_group_end
           (G : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");


end FLTK.Widgets.Groups;

