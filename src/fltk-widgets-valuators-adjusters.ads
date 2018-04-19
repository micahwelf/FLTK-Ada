

package FLTK.Widgets.Valuators.Adjusters is


    type Adjuster is new Valuator with private;

    type Adjuster_Reference (Data : not null access Adjuster'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Adjuster;

    end Forge;




    function Is_Soft
           (This : in Adjuster)
        return Boolean;

    procedure Set_Soft
           (This : in out Adjuster;
            To   : in     Boolean);




    procedure Draw
           (This : in out Adjuster);

    function Handle
           (This  : in out Adjuster;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Adjuster is new Valuator with null record;

    overriding procedure Finalize
           (This : in out Adjuster);




    pragma Inline (Is_Soft);
    pragma Inline (Set_Soft);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Adjusters;

