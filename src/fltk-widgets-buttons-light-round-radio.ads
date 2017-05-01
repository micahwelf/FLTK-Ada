

package FLTK.Widgets.Buttons.Light.Round.Radio is


    type Radio_Round_Button is new Round_Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Radio_Round_Button;


private


    procedure Draw
           (This : in out Radio_Round_Button);


    type Radio_Round_Button is new Round_Button with null record;


    overriding procedure Finalize
           (This : in out Radio_Round_Button);


    package Radio_Round_Button_Convert is new System.Address_To_Access_Conversions
           (Radio_Round_Button'Class);


end FLTK.Widgets.Buttons.Light.Round.Radio;
