

package FLTK.Widgets.Buttons.Light.Radio is


    type Radio_Light_Button is new Light_Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Radio_Light_Button;


    procedure Draw
           (This : in out Radio_Light_Button);


private


    type Radio_Light_Button is new Light_Button with null record;


    overriding procedure Finalize
           (This : in out Radio_Light_Button);


    package Radio_Light_Button_Convert is new System.Address_To_Access_Conversions
           (Radio_Light_Button'Class);


end FLTK.Widgets.Buttons.Light.Radio;

