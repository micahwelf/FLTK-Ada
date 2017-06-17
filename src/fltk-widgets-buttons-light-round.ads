

package FLTK.Widgets.Buttons.Light.Round is


    type Round_Button is new Light_Button with private;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Round_Button;




    procedure Draw
           (This : in out Round_Button);

    function Handle
           (This  : in out Round_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Round_Button is new Light_Button with null record;

    overriding procedure Finalize
           (This : in out Round_Button);


end FLTK.Widgets.Buttons.Light.Round;

