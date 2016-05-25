

package FLTK.Widgets.Buttons.Light is


    type Light_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Light_Button;


private


    type Light_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Light_Button);


end FLTK.Widgets.Buttons.Light;

