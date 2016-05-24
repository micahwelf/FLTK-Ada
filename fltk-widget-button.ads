

package FLTK.Widget.Button is


    type Button_Type is new Widget_Type with private;
    type State is (On, Off);


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Button_Type;


    function Get_State
           (B : in Button_Type'Class)
        return State;


    procedure Set_State
           (B : in Button_Type'Class;
            S : in State);


    procedure Set_Only
           (B : in Button_Type'Class);


private


    type Button_Type is new Widget_Type with null record;


    overriding procedure Finalize (This : in out Button_Type);


end FLTK.Widget.Button;

