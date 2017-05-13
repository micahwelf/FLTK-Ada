

package FLTK.Widgets.Buttons.Light is


    type Light_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Light_Button;


    procedure Draw
           (This : in out Light_Button);


    function Handle
           (This  : in out Light_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Light_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Light_Button);


end FLTK.Widgets.Buttons.Light;

