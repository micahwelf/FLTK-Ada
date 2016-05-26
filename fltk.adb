

with Interfaces.C;
with System;


package body FLTK is


    function fl_run return Interfaces.C.int;
    pragma Import (C, fl_run, "fl_run");




    function Run return Integer is
    begin
        return Integer (fl_run);
    end Run;




    procedure Initialize
           (This : in out Wrapper) is
    begin
        This.Void_Ptr := System.Null_Address;
    end Initialize;


end FLTK;

