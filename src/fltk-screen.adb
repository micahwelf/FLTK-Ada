

with

    Interfaces.C;

use type

    Interfaces.C.int;


package body FLTK.Screen is


    function screen_x return Interfaces.C.int;
    pragma Import (C, screen_x, "screen_x");

    function screen_y return Interfaces.C.int;
    pragma Import (C, screen_y, "screen_y");

    function screen_w return Interfaces.C.int;
    pragma Import (C, screen_w, "screen_w");

    function screen_h return Interfaces.C.int;
    pragma Import (C, screen_h, "screen_h");




    function screen_count return Interfaces.C.int;
    pragma Import (C, screen_count, "screen_count");

    procedure screen_dpi
           (H, V :    out Interfaces.C.C_float;
            N    : in     Interfaces.C.int);
    pragma Import (C, screen_dpi, "screen_dpi");




    function Get_X return Integer is
    begin
        return Integer (screen_x);
    end Get_X;


    function Get_Y return Integer is
    begin
        return Integer (screen_y);
    end Get_Y;


    function Get_W return Integer is
    begin
        return Integer (screen_w);
    end Get_W;


    function Get_H return Integer is
    begin
        return Integer (screen_h);
    end Get_H;




    function Get_Count return Integer is
    begin
        return Integer (screen_count);
    end Get_Count;


    --  Screen numbers in the range 1 .. Get_Count
    procedure Get_DPI
           (Horizontal, Vertical :    out Float;
            Screen_Number        : in     Integer := 1)
    is
        H, V : Interfaces.C.C_float;
    begin
        screen_dpi (H, V, Interfaces.C.int (Screen_Number) - 1);
        Horizontal := Float (H);
        Vertical := Float (V);
    end Get_DPI;


end FLTK.Screen;

