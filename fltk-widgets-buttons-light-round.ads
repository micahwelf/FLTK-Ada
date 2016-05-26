

package FLTK.Widgets.Buttons.Light.Round is


    type Round_Button is new Light_Button with private;
    type Round_Button_Access is access all Round_Button;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Round_Button;


private


    type Round_Button is new Light_Button with null record;


    overriding procedure Finalize
           (This : in out Round_Button);


end FLTK.Widgets.Buttons.Light.Round;

