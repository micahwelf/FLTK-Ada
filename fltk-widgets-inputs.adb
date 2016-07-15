

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs is


    function new_fl_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_input, "new_fl_input");

    procedure free_fl_input
           (F : in System.Address);
    pragma Import (C, free_fl_input, "free_fl_input");




    procedure Finalize
           (This : in out Input) is
    begin
        Finalize (Widget (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Input then
                free_fl_input (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Input is
    begin
        return This : Input do
            This.Void_Ptr := new_fl_input
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
        end return;
    end Create;


end FLTK.Widgets.Inputs;

