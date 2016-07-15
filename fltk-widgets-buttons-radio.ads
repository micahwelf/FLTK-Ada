

package FLTK.Widgets.Buttons.Radio is


    type Radio_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Radio_Button;


private


    type Radio_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Radio_Button);


end FLTK.Widgets.Buttons.Radio;

