

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Text_Buffers is


    function new_fl_text_buffer
           (RS, PGS : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_text_buffer, "new_fl_text_buffer");

    procedure free_fl_text_buffer
           (TB : in System.Address);
    pragma Import (C, free_fl_text_buffer, "free_fl_text_buffer");




    procedure Finalize
           (This : in out Text_Buffer) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_text_buffer (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (Requested_Size     : in Natural := 0;
            Preferred_Gap_Size : in Natural := 1024)
        return Text_Buffer is

        VP : System.Address;

    begin
        VP := new_fl_text_buffer
                   (Interfaces.C.int (Requested_Size),
                    Interfaces.C.int (Preferred_Gap_Size));
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;


end FLTK.Text_Buffers;

