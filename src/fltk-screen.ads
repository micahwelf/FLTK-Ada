

package FLTK.Screen is


    function Get_X return Integer;
    function Get_Y return Integer;
    function Get_W return Integer;
    function Get_H return Integer;


    function Get_Count return Integer;


    --  Screen numbers in the range 1 .. Get_Count
    procedure Get_DPI
           (Horizontal, Vertical :    out Float;
            Screen_Number        : in     Integer := 1);


private


    pragma Inline (Get_X);
    pragma Inline (Get_Y);
    pragma Inline (Get_W);
    pragma Inline (Get_H);
    pragma Inline (Get_Count);
    pragma Inline (Get_DPI);


end FLTK.Screen;

