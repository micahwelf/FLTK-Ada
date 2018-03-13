

package FLTK.Widgets.Valuators.Dials is


    type Dial is new Valuator with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Dial;

    end Forge;




    function Get_First_Angle
           (This : in Dial)
        return Integer;

    procedure Set_First_Angle
           (This : in out Dial;
            To   : in     Integer);

    function Get_Second_Angle
           (This : in Dial)
        return Integer;

    procedure Set_Second_Angle
           (This : in out Dial;
            To   : in     Integer);

    procedure Set_Angles
           (This     : in out Dial;
            One, Two : in     Integer);




    procedure Draw
           (This : in out Dial);

    function Handle
           (This  : in out Dial;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Dial is new Valuator with null record;

    overriding procedure Finalize
           (This : in out Dial);


end FLTK.Widgets.Valuators.Dials;

