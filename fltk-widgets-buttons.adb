

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons is


    function new_fl_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
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




    procedure Finalize
           (This : in out Button) is
    begin
        Finalize (Widget (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Button then
                free_fl_button (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Button is
    begin
        return This : Button do
            This.Void_Ptr := new_fl_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
        end return;
    end Create;




    function Get_State
           (This : in Button)
        return State is
    begin
        return State'Val (fl_button_get_state (This.Void_Ptr));
    end Get_State;




    procedure Set_State
           (This : in out Button;
            St   : in     State) is
    begin
        fl_button_set_state (This.Void_Ptr, State'Pos (St));
    end Set_State;




    procedure Set_Only
           (This : in out Button) is
    begin
        fl_button_set_only (This.Void_Ptr);
    end Set_Only;


end FLTK.Widgets.Buttons;

