

package FLTK.Widgets.Buttons.Repeat is


    type Repeat_Button is new Button with private;
    type Repeat_Button_Access is access all Repeat_Button;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Repeat_Button;


private


    type Repeat_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Repeat_Button);


end FLTK.Widgets.Buttons.Repeat;

