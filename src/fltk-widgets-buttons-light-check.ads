

package FLTK.Widgets.Buttons.Light.Check is


    type Check_Button is new Light_Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Check_Button;


    procedure Draw
           (This : in out Check_Button);


private


    type Check_Button is new Light_Button with null record;


    overriding procedure Finalize
           (This : in out Check_Button);


end FLTK.Widgets.Buttons.Light.Check;

