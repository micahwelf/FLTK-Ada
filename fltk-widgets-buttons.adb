

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons is


    function new_fl_button
           (X, Y, W, H : in Interfaces.C.int;
            L          : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_button, "new_fl_button");

    procedure free_fl_button
           (B : in System.Address);
    pragma Import (C, free_fl_button, "free_fl_button");

    function fl_button_get_state
           (B : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_button_get_state, "fl_button_get_state");

    procedure fl_button_set_state
           (B : in System.Address;
            S : in Interfaces.C.int);
    pragma Import (C, fl_button_set_state, "fl_button_set_state");

    procedure fl_button_set_only
           (B : in System.Address);
    pragma Import (C, fl_button_set_only, "fl_button_set_only");




    procedure Finalize (This : in out Button) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_button (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Button is

        VP : System.Address;

    begin
        VP := new_fl_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Label));
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;




    function Get_State
           (B : in Button'Class)
        return State is
    begin
        return State'Val (fl_button_get_state (B.Void_Ptr));
    end Get_State;




    procedure Set_State
           (B : in Button'Class;
            S : in State) is
    begin
        fl_button_set_state (B.Void_Ptr, State'Pos (S));
    end Set_State;




    procedure Set_Only
           (B : in Button'Class) is
    begin
        fl_button_set_only (B.Void_Ptr);
    end Set_Only;


end FLTK.Widgets.Buttons;

