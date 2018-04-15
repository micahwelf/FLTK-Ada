

package FLTK.Widgets.Buttons.Light.Round.Radio is


    type Radio_Round_Button is new Round_Button with private;

    type Radio_Round_Button_Reference (Data : not null access Radio_Round_Button'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Radio_Round_Button;

    end Forge;




    procedure Draw
           (This : in out Radio_Round_Button);

    function Handle
           (This  : in out Radio_Round_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Radio_Round_Button is new Round_Button with null record;

    overriding procedure Finalize
           (This : in out Radio_Round_Button);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Buttons.Light.Round.Radio;

