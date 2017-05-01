

package FLTK.Widgets.Buttons.Radio is


    type Radio_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Radio_Button;


private


    procedure Draw
           (This : in out Radio_Button);


    type Radio_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Radio_Button);


    package Radio_Button_Convert is new System.Address_To_Access_Conversions
           (Radio_Button'Class);


end FLTK.Widgets.Buttons.Radio;

