

package FLTK.Widgets.Groups.Packed is


    type Packed_Group is new Group with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Packed_Group;

    end Forge;




    function Get_Spacing
           (This : in Packed_Group)
        return Integer;

    procedure Set_Spacing
           (This : in out Packed_Group;
            To   : in     Integer);




    procedure Draw
           (This : in out Packed_Group);

    function Handle
           (This  : in out Packed_Group;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Packed_Group is new Group with null record;

    overriding procedure Finalize
           (This : in out Packed_Group);


end FLTK.Widgets.Groups.Packed;

