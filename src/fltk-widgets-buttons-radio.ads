

package FLTK.Widgets.Buttons.Radio is


    type Radio_Button is new Button with private;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Radio_Button;




    procedure Draw
           (This : in out Radio_Button);

    function Handle
           (This  : in out Radio_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Radio_Button is new Button with null record;

    overriding procedure Finalize
           (This : in out Radio_Button);


end FLTK.Widgets.Buttons.Radio;

