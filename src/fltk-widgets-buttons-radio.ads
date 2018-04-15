

package FLTK.Widgets.Buttons.Radio is


    type Radio_Button is new Button with private;

    type Radio_Button_Reference (Data : not null access Radio_Button'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Radio_Button;

    end Forge;




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




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Buttons.Radio;

