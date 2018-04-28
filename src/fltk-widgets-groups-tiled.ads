

package FLTK.Widgets.Groups.Tiled is


    type Tiled_Group is new Group with private;

    type Tiled_Group_Reference (Data : not null access Tiled_Group'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Tiled_Group;

    end Forge;




    procedure Position
           (This         : in out Tiled_Group;
            Old_X, Old_Y : in     Integer;
            New_X, New_Y : in     Integer);




    procedure Draw
           (This : in out Tiled_Group);

    function Handle
           (This  : in out Tiled_Group;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Tiled_Group is new Group with null record;

    overriding procedure Finalize
           (This : in out Tiled_Group);




    pragma Inline (Position);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups.Tiled;

