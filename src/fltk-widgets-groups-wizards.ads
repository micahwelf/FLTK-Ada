

package FLTK.Widgets.Groups.Wizards is


    type Wizard is new Group with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Wizard;

    end Forge;




    procedure Next
           (This : in out Wizard);

    procedure Prev
           (This : in out Wizard);




    function Get_Visible
           (This : in Wizard)
        return access Widget'Class;

    procedure Set_Visible
           (This : in out Wizard;
            Item : access Widget'Class);




    procedure Draw
           (This : in out Wizard);

    function Handle
           (This  : in out Wizard;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Wizard is new Group with null record;

    overriding procedure Finalize
           (This : in out Wizard);


end FLTK.Widgets.Groups.Wizards;

