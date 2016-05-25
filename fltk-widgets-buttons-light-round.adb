

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons.Light.Round is


    function new_fl_round_button
           (X, Y, W, H : in Interfaces.C.int;
            Label      : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_round_button, "new_fl_round_button");

    procedure free_fl_round_button
           (B : in System.Address);
    pragma Import (C, free_fl_round_button, "free_fl_round_button");




    procedure Finalize
           (This : in out Round_Button) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_round_button (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Round_Button is

        VP : System.Address;

    begin
        VP := new_fl_round_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Label));
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;


end FLTK.Widgets.Buttons.Light.Round;

