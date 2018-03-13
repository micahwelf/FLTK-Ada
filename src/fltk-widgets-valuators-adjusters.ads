

package FLTK.Widgets.Valuators.Adjusters is


    type Adjuster is new Valuator with private;




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


end FLTK.Widgets.Valuators.Adjusters;

