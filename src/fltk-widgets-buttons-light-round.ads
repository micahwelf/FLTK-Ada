

package FLTK.Widgets.Buttons.Light.Round is


    type Round_Button is new Light_Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Round_Button;


private


    procedure Draw
           (This : in out Round_Button);


    type Round_Button is new Light_Button with null record;


    overriding procedure Finalize
           (This : in out Round_Button);


    package Round_Button_Convert is new System.Address_To_Access_Conversions
           (Round_Button'Class);


end FLTK.Widgets.Buttons.Light.Round;

