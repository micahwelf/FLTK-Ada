

package FLTK.Widgets.Buttons.Light is


    type Light_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Light_Button;


    procedure Draw
           (This : in out Light_Button);


private


    type Light_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Light_Button);


    package Light_Button_Convert is new System.Address_To_Access_Conversions
           (Light_Button'Class);


end FLTK.Widgets.Buttons.Light;

