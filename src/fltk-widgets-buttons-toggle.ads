

package FLTK.Widgets.Buttons.Toggle is


    type Toggle_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Toggle_Button;


    procedure Draw
           (This : in out Toggle_Button);


private


    type Toggle_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Toggle_Button);


    package Toggle_Button_Convert is new System.Address_To_Access_Conversions
           (Toggle_Button'Class);


end FLTK.Widgets.Buttons.Toggle;

