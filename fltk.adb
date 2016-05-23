

with Interfaces.C;


package body FLTK is


    function fl_run return Interfaces.C.int;
    pragma Import (C, fl_run, "fl_run");


    function Run return Integer is
    begin
        return Integer (fl_run);
    end Run;


end FLTK;

