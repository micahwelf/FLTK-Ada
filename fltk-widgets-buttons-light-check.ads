

package FLTK.Widgets.Buttons.Light.Check is


    type Check_Button is new Light_Button with private;
    type Check_Button_Access is access all Check_Button;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Check_Button;


private


    type Check_Button is new Light_Button with null record;


    overriding procedure Finalize
           (This : in out Check_Button);


end FLTK.Widgets.Buttons.Light.Check;

