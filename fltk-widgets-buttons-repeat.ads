

package FLTK.Widgets.Buttons.Repeat is


    type Repeat_Button is new Button with private;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Repeat_Button;


private


    type Repeat_Button is new Button with null record;


    overriding procedure Finalize (This : in out Repeat_Button);


end FLTK.Widgets.Buttons.Repeat;

