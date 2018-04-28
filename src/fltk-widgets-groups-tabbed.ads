

package FLTK.Widgets.Groups.Tabbed is


    type Tabbed_Group is new Group with private;

    type Tabbed_Group_Reference (Data : not null access Tabbed_Group'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Tabbed_Group;

    end Forge;




    procedure Get_Client_Area
           (This       : in     Tabbed_Group;
            Tab_Height : in     Natural;
            X, Y, W, H :    out Integer);




    function Get_Push
           (This : in Tabbed_Group)
        return access Widget'Class;

    procedure Set_Push
           (This : in out Tabbed_Group;
            Item : in out Widget'Class);

    function Get_Visible
           (This : in Tabbed_Group)
        return access Widget'Class;

    procedure Set_Visible
           (This : in out Tabbed_Group;
            Item : in out Widget'Class);

    function Get_Which
           (This             : in Tabbed_Group;
            Event_X, Event_Y : in Integer)
        return access Widget'Class;




    procedure Draw
           (This : in out Tabbed_Group);

    function Handle
           (This  : in out Tabbed_Group;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Tabbed_Group is new Group with null record;

    overriding procedure Finalize
           (This : in out Tabbed_Group);




    pragma Inline (Get_Client_Area);


    pragma Inline (Get_Push);
    pragma Inline (Set_Push);
    pragma Inline (Get_Visible);
    pragma Inline (Set_Visible);
    pragma Inline (Get_Which);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups.Tabbed;

