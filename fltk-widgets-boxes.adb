

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Boxes is


    function new_fl_box
           (X, Y, W, H : in Interfaces.C.int;
            Label      : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_box, "new_fl_box");

    procedure free_fl_box
           (B : in System.Address);
    pragma Import (C, free_fl_box, "free_fl_box");




    procedure Finalize
           (This : in out Box) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_box (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Box is

        VP : System.Address;

    begin
        VP := new_fl_box
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Label));
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;


end FLTK.Widgets.Boxes;

