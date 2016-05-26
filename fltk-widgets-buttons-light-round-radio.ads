

package FLTK.Widgets.Buttons.Light.Round.Radio is


    type Radio_Round_Button is new Round_Button with private;
    type Radio_Round_Button_Access is access all Radio_Round_Button;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Radio_Round_Button;


private


    type Radio_Round_Button is new Round_Button with null record;


    overriding procedure Finalize
           (This : in out Radio_Round_Button);


end FLTK.Widgets.Buttons.Light.Round.Radio;

