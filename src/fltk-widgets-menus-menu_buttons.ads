

package FLTK.Widgets.Menus.Menu_Buttons is


    type Menu_Button is new Menu with private;


    --  signifies which mouse buttons cause the menu to appear
    type Popup_Buttons is (No_Popup, Popup1, Popup2, Popup12, Popup3, Popup13, Popup23, Popup123);


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Menu_Button;


    procedure Set_Popup_Kind
           (This : in out Menu_Button;
            Pop  : in     Popup_Buttons);


private


    procedure Draw
           (This : in out Menu_Button);


    type Menu_Button is new Menu with null record;


    overriding procedure Finalize
           (This : in out Menu_Button);


    package Menu_Button_Convert is new System.Address_To_Access_Conversions
           (Menu_Button'Class);


end FLTK.Widgets.Menus.Menu_Buttons;

