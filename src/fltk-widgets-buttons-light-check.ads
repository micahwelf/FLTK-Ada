

package FLTK.Widgets.Buttons.Light.Check is


    type Check_Button is new Light_Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Check_Button;


    procedure Draw
           (This : in out Check_Button);


private


    type Check_Button is new Light_Button with null record;


    overriding procedure Finalize
           (This : in out Check_Button);


    package Check_Button_Convert is new System.Address_To_Access_Conversions
           (Check_Button'Class);


end FLTK.Widgets.Buttons.Light.Check;

