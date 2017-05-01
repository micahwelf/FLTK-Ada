

--  Return Buttons, but return is a reserved word, so they're Enter Buttons instead


package FLTK.Widgets.Buttons.Enter is


    type Enter_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Enter_Button;


private


    procedure Draw
           (This : in out Enter_Button);


    type Enter_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Enter_Button);


    package Enter_Button_Convert is new System.Address_To_Access_Conversions
           (Enter_Button'Class);


end FLTK.Widgets.Buttons.Enter;
