

package FLTK.Widgets.Buttons.Radio is


    type Radio_Button is new Button with private;
    type Radio_Button_Access is access all Radio_Button;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Radio_Button;


private


    type Radio_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Radio_Button);


end FLTK.Widgets.Buttons.Radio;

