

with

    Interfaces.C;


package body FLTK.Event is


    function fl_event_key
        return Interfaces.C.int;
    pragma Import (C, fl_event_key, "fl_event_key");




    function Last_Keypress
        return Shortcut_Key is
    begin
        return C_To_Key (Interfaces.C.unsigned_long (fl_event_key));
    end Last_Keypress;


end FLTK.Event;

