

with

    Ada.Iterator_Interfaces;

private with

    System.Address_To_Access_Conversions;


package FLTK.Widgets.Groups is


    type Group is new Widget with private
        with Default_Iterator  => Iterate,
             Iterator_Element  => Widget_Reference,
             Variable_Indexing => Child;

    type Group_Reference (Data : not null access Group'Class) is limited null record
        with Implicit_Dereference => Data;

    subtype Index is Positive;

    --  type Clip_Mode is (No_Clip, Clip);

    type Cursor is private;




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




    function Has_Child
           (This  : in Group;
            Place : in Index)
        return Boolean;

    function Has_Child
           (Place : in Cursor)
        return Boolean;

    function Child
           (This  : in Group;
            Place : in Index)
        return Widget_Reference;

    function Child
           (This  : in Group;
            Place : in Cursor)
        return Widget_Reference;

    function Find
           (This : in     Group;
            Item : in out Widget'Class)
        return Index;

    function Number_Of_Children
           (This : in Group)
        return Natural;




    package Group_Iterators is
        new Ada.Iterator_Interfaces (Cursor, Has_Child);

    function Iterate
           (This : in Group)
        return Group_Iterators.Reversible_Iterator'Class;




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




    function Get_Current
        return access Group'Class;

    procedure Set_Current
           (To : in Group'Class);




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

    package Group_Convert is new System.Address_To_Access_Conversions (Group);




    procedure fl_group_end
           (G : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");




    type Cursor is record
        My_Container : access Group;
        My_Index     : Index'Base := Index'First;
    end record;

    type Iterator is new Group_Iterators.Reversible_Iterator with record
        My_Container : access Group;
    end record;

    overriding function First
           (Object : in Iterator)
        return Cursor;

    overriding function Next
           (Object : in Iterator;
            Place  : in Cursor)
        return Cursor;

    overriding function Last
           (Object : in Iterator)
        return Cursor;

    overriding function Previous
           (Object : in Iterator;
            Place  : in Cursor)
        return Cursor;




    pragma Inline (Add);
    pragma Inline (Insert);
    pragma Inline (Remove);
    pragma Inline (Clear);


    pragma Inline (Has_Child);
    pragma Inline (Child);
    pragma Inline (Find);
    pragma Inline (Number_Of_Children);


    pragma Inline (Iterate);


    --  pragma Inline (Get_Clip_Mode);
    --  pragma Inline (Set_Clip_Mode);


    pragma Inline (Get_Resizable);
    pragma Inline (Set_Resizable);
    pragma Inline (Reset_Initial_Sizes);


    pragma Inline (Get_Current);
    pragma Inline (Set_Current);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups;

