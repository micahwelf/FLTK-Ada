

package FLTK.Widgets.Valuators.Rollers is


    type Roller is new Valuator with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Roller;

    end Forge;




    procedure Draw
           (This : in out Roller);

    function Handle
           (This  : in out Roller;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Roller is new Valuator with null record;

    overriding procedure Finalize
           (This : in out Roller);


end FLTK.Widgets.Valuators.Rollers;

