

package FLTK.Widgets.Groups.Packed is


    type Packed_Group is new Group with private;

    type Packed_Group_Reference (Data : not null access Packed_Group'Class) is
        limited null record with Implicit_Dereference => Data;




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




    pragma Inline (Get_Spacing);
    pragma Inline (Set_Spacing);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups.Packed;

