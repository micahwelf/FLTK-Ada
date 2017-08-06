

with

    Interfaces.C;

use type

    Interfaces.C.int;


package body FLTK.Event is


    function fl_event_key
        return Interfaces.C.int;
    pragma Import (C, fl_event_key, "fl_event_key");




    function fl_event_x
        return Interfaces.C.int;
    pragma Import (C, fl_event_x, "fl_event_x");

    function fl_event_x_root
        return Interfaces.C.int;
    pragma Import (C, fl_event_x_root, "fl_event_x_root");

    function fl_event_y
        return Interfaces.C.int;
    pragma Import (C, fl_event_y, "fl_event_y");

    function fl_event_y_root
        return Interfaces.C.int;
    pragma Import (C, fl_event_y_root, "fl_event_y_root");

    function fl_event_is_click
        return Interfaces.C.int;
    pragma Import (C, fl_event_is_click, "fl_event_is_click");




    function Last_Keypress
        return Shortcut_Key is
    begin
        return C_To_Key (Interfaces.C.unsigned_long (fl_event_key));
    end Last_Keypress;




    function Mouse_X
        return Integer is
    begin
        return Integer (fl_event_x);
    end Mouse_X;


    function Mouse_X_Root
        return Integer is
    begin
        return Integer (fl_event_x_root);
    end Mouse_X_Root;


    function Mouse_Y
        return Integer is
    begin
        return Integer (fl_event_y);
    end Mouse_Y;


    function Mouse_Y_Root
        return Integer is
    begin
        return Integer (fl_event_y_root);
    end Mouse_Y_Root;


    function Is_Click
        return Boolean is
    begin
        return fl_event_is_click /= 0;
    end Is_Click;


end FLTK.Event;

