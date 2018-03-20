

package FLTK.Widgets.Buttons is


    type Button is new Widget with private;

    type State is (Off, On);




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Button;

    end Forge;




    function Get_State
           (This : in Button)
        return State;

    procedure Set_State
           (This : in out Button;
            St   : in     State);

    procedure Set_Only
           (This : in out Button);




    function Get_Down_Box
           (This : in Button)
        return Box_Kind;

    procedure Set_Down_Box
           (This : in out Button;
            To   : in     Box_Kind);

    function Get_Shortcut
           (This : in Button)
        return Shortcut_Key;

    procedure Set_Shortcut
           (This : in out Button;
            Key  : in     Shortcut_Key);




    procedure Draw
           (This : in out Button);

    function Handle
           (This  : in out Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Button is new Widget with null record;

    overriding procedure Finalize
           (This : in out Button);


end FLTK.Widgets.Buttons;

