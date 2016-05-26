

package FLTK.Widgets.Buttons.Light.Radio is


    type Radio_Light_Button is new Light_Button with private;
    type Radio_Light_Button_Access is access all Radio_Light_Button;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Radio_Light_Button;


private


    type Radio_Light_Button is new Light_Button with null record;


    overriding procedure Finalize
           (This : in out Radio_Light_Button);


end FLTK.Widgets.Buttons.Light.Radio;

