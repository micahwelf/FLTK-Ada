

package FLTK.Screen is


    function Get_X
        return Integer;

    function Get_Y
        return Integer;

    function Get_W
        return Integer;

    function Get_H
        return Integer;




    function Count return Integer;

    --  Screen numbers in the range 1 .. Count
    procedure DPI
           (Horizontal, Vertical :    out Float;
            Screen_Number        : in     Integer := 1);




    function Containing
           (X, Y : in Integer)
        return Integer;

    function Containing
           (X, Y, W, H : in Integer)
        return Integer;




    procedure Work_Area
           (X, Y, W, H   :    out Integer;
            Pos_X, Pos_Y : in     Integer);

    procedure Work_Area
           (X, Y, W, H :    out Integer;
            Screen_Num : in     Integer);

    procedure Work_Area
           (X, Y, W, H : out Integer);




    procedure Bounding_Rect
           (X, Y, W, H   :    out Integer;
            Pos_X, Pos_Y : in     Integer);

    procedure Bounding_Rect
           (X, Y, W, H :    out Integer;
            Screen_Num : in     Integer);

    procedure Bounding_Rect
           (X, Y, W, H : out Integer);

    procedure Bounding_Rect
           (X, Y, W, H     :    out Integer;
            PX, PY, PW, PH : in     Integer);


private


    pragma Inline (Get_X);
    pragma Inline (Get_Y);
    pragma Inline (Get_W);
    pragma Inline (Get_H);
    pragma Inline (Count);
    pragma Inline (DPI);
    pragma Inline (Containing);
    pragma Inline (Work_Area);
    pragma Inline (Bounding_Rect);


end FLTK.Screen;

