

package FLTK.Widgets.Buttons.Toggle is


    type Toggle_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Toggle_Button;


    procedure Draw
           (This : in out Toggle_Button);


private


    type Toggle_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Toggle_Button);


end FLTK.Widgets.Buttons.Toggle;

