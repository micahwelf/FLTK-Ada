

with

    Interfaces.C;

use type

    Interfaces.C.int;


package body FLTK.Screen is


    function fl_screen_x return Interfaces.C.int;
    pragma Import (C, fl_screen_x, "fl_screen_x");

    function fl_screen_y return Interfaces.C.int;
    pragma Import (C, fl_screen_y, "fl_screen_y");

    function fl_screen_w return Interfaces.C.int;
    pragma Import (C, fl_screen_w, "fl_screen_w");

    function fl_screen_h return Interfaces.C.int;
    pragma Import (C, fl_screen_h, "fl_screen_h");




    function fl_screen_count return Interfaces.C.int;
    pragma Import (C, fl_screen_count, "fl_screen_count");

    procedure fl_screen_dpi
           (H, V :    out Interfaces.C.C_float;
            N    : in     Interfaces.C.int);
    pragma Import (C, fl_screen_dpi, "fl_screen_dpi");




    function Get_X return Integer is
    begin
        return Integer (fl_screen_x);
    end Get_X;


    function Get_Y return Integer is
    begin
        return Integer (fl_screen_y);
    end Get_Y;


    function Get_W return Integer is
    begin
        return Integer (fl_screen_w);
    end Get_W;


    function Get_H return Integer is
    begin
        return Integer (fl_screen_h);
    end Get_H;




    function Get_Count return Integer is
    begin
        return Integer (fl_screen_count);
    end Get_Count;


    --  Screen numbers in the range 1 .. Get_Count
    procedure Get_DPI
           (Horizontal, Vertical :    out Float;
            Screen_Number        : in     Integer := 1)
    is
        H, V : Interfaces.C.C_float;
    begin
        fl_screen_dpi (H, V, Interfaces.C.int (Screen_Number) - 1);
        Horizontal := Float (H);
        Vertical := Float (V);
    end Get_DPI;


end FLTK.Screen;

