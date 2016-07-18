

with Interfaces.C;
with System;
use type System.Address;


package body FLTK is


    function fl_run return Interfaces.C.int;
    pragma Import (C, fl_run, "fl_run");




    function Run return Integer is
    begin
        return Integer (fl_run);
    end Run;




    function Has_Valid_Ptr
           (This : in Wrapper)
        return Boolean is
    begin
        return This.Void_Ptr /= System.Null_Address;
    end Has_Valid_Ptr;




    procedure Initialize
           (This : in out Wrapper) is
    begin
        This.Void_Ptr := System.Null_Address;
    end Initialize;


end FLTK;

