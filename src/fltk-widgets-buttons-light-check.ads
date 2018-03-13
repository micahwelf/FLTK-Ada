

package FLTK.Widgets.Buttons.Light.Check is


    type Check_Button is new Light_Button with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Check_Button;

    end Forge;




    procedure Draw
           (This : in out Check_Button);

    function Handle
           (This  : in out Check_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Check_Button is new Light_Button with null record;

    overriding procedure Finalize
           (This : in out Check_Button);


end FLTK.Widgets.Buttons.Light.Check;

