

with

    FLTK.Menu_Items;


package FLTK.Widgets.Menus.Menu_Buttons is


    type Menu_Button is new Menu with private;

    type Menu_Button_Reference (Data : access Menu_Button'Class) is limited null record
        with Implicit_Dereference => Data;

    --  signifies which mouse buttons cause the menu to appear
    type Popup_Buttons is (No_Popup, Popup1, Popup2, Popup12, Popup3, Popup13, Popup23, Popup123);




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Menu_Button;

    end Forge;




    procedure Set_Popup_Kind
           (This : in out Menu_Button;
            Pop  : in     Popup_Buttons);

    function Popup
           (This : in out Menu_Button)
        return FLTK.Menu_Items.Menu_Item;




    procedure Draw
           (This : in out Menu_Button);

    function Handle
           (This  : in out Menu_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Menu_Button is new Menu with null record;

    overriding procedure Finalize
           (This : in out Menu_Button);




    pragma Inline (Set_Popup_Kind);
    pragma Inline (Popup);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Menus.Menu_Buttons;

