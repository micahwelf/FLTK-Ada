

package FLTK.Widgets.Buttons is


    type Button is new Widget with private;
    type Button_Access is access all Button;


    type State is (On, Off);


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Button;


    function Get_State
           (B : in Button'Class)
        return State;


    procedure Set_State
           (B : in out Button'Class;
            S : in     State);


    procedure Set_Only
           (B : in out Button'Class);


private


    type Button is new Widget with null record;


    overriding procedure Finalize
           (This : in out Button);


end FLTK.Widgets.Buttons;

