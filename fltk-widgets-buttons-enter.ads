

--  Return Buttons, but return is a reserved word, so they're Enter Buttons instead
package FLTK.Widgets.Buttons.Enter is


    type Enter_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Enter_Button;


private


    type Enter_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Enter_Button);


end FLTK.Widgets.Buttons.Enter;

