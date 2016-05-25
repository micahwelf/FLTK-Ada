

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs is


    function new_fl_input
           (X, Y, W, H : in Interfaces.C.int;
            Label      : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_input, "new_fl_input");

    procedure free_fl_input
           (F : in System.Address);
    pragma Import (C, free_fl_input, "free_fl_input");




    procedure Finalize
           (This : in out Input) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_input (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Input is

        VP : System.Address;

    begin
        VP := new_fl_input
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Label));
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;


end FLTK.Widgets.Inputs;

