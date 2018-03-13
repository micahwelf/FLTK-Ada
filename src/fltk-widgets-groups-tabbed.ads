

package FLTK.Widgets.Groups.Tabbed is


    type Tabs is new Group with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Tabs;

    end Forge;




    procedure Get_Client_Area
           (This       : in     Tabs;
            Tab_Height : in     Natural;
            X, Y, W, H :    out Integer);




    function Get_Push
           (This : in Tabs)
        return access Widget'Class;

    procedure Set_Push
           (This : in out Tabs;
            Item : access Widget'Class);

    function Get_Visible
           (This : in Tabs)
        return access Widget'Class;

    procedure Set_Visible
           (This : in out Tabs;
            Item : access Widget'Class);

    function Get_Which
           (This             : in Tabs;
            Event_X, Event_Y : in Integer)
        return access Widget'Class;




    procedure Draw
           (This : in out Tabs);

    function Handle
           (This  : in out Tabs;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Tabs is new Group with null record;

    overriding procedure Finalize
           (This : in out Tabs);


end FLTK.Widgets.Groups.Tabbed;

