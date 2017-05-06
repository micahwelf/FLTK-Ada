

package FLTK.Widgets.Buttons.Repeat is


    type Repeat_Button is new Button with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Repeat_Button;


    procedure Draw
           (This : in out Repeat_Button);


private


    type Repeat_Button is new Button with null record;


    overriding procedure Finalize
           (This : in out Repeat_Button);


    package Repeat_Button_Convert is new System.Address_To_Access_Conversions
           (Repeat_Button'Class);


end FLTK.Widgets.Buttons.Repeat;

