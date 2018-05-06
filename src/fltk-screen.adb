

with

    Interfaces.C;

use type

    Interfaces.C.int;


package body FLTK.Screen is


    function fl_screen_x
        return Interfaces.C.int;
    pragma Import (C, fl_screen_x, "fl_screen_x");
    pragma Inline (fl_screen_x);

    function fl_screen_y
        return Interfaces.C.int;
    pragma Import (C, fl_screen_y, "fl_screen_y");
    pragma Inline (fl_screen_y);

    function fl_screen_w
        return Interfaces.C.int;
    pragma Import (C, fl_screen_w, "fl_screen_w");
    pragma Inline (fl_screen_w);

    function fl_screen_h
        return Interfaces.C.int;
    pragma Import (C, fl_screen_h, "fl_screen_h");
    pragma Inline (fl_screen_h);




    function fl_screen_count
        return Interfaces.C.int;
    pragma Import (C, fl_screen_count, "fl_screen_count");
    pragma Inline (fl_screen_count);

    procedure fl_screen_dpi
           (H, V :    out Interfaces.C.C_float;
            N    : in     Interfaces.C.int);
    pragma Import (C, fl_screen_dpi, "fl_screen_dpi");
    pragma Inline (fl_screen_dpi);




    function fl_screen_num
           (X, Y : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_screen_num, "fl_screen_num");
    pragma Inline (fl_screen_num);

    function fl_screen_num2
           (X, Y, W, H : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_screen_num2, "fl_screen_num2");
    pragma Inline (fl_screen_num2);




    procedure fl_screen_work_area
           (X, Y, W, H :    out Interfaces.C.int;
            PX, PY     : in     Interfaces.C.int);
    pragma Import (C, fl_screen_work_area, "fl_screen_work_area");
    pragma Inline (fl_screen_work_area);

    procedure fl_screen_work_area2
           (X, Y, W, H :    out Interfaces.C.int;
            N          : in     Interfaces.C.int);
    pragma Import (C, fl_screen_work_area2, "fl_screen_work_area2");
    pragma Inline (fl_screen_work_area2);

    procedure fl_screen_work_area3
           (X, Y, W, H : out Interfaces.C.int);
    pragma Import (C, fl_screen_work_area3, "fl_screen_work_area3");
    pragma Inline (fl_screen_work_area3);




    procedure fl_screen_xywh
           (X, Y, W, H :    out Interfaces.C.int;
            PX, PY     : in     Interfaces.C.int);
    pragma Import (C, fl_screen_xywh, "fl_screen_xywh");
    pragma Inline (fl_screen_xywh);

    procedure fl_screen_xywh2
           (X, Y, W, H :    out Interfaces.C.int;
            N          : in     Interfaces.C.int);
    pragma Import (C, fl_screen_xywh2, "fl_screen_xywh2");
    pragma Inline (fl_screen_xywh2);

    procedure fl_screen_xywh3
           (X, Y, W, H : out Interfaces.C.int);
    pragma Import (C, fl_screen_xywh3, "fl_screen_xywh3");
    pragma Inline (fl_screen_xywh3);

    procedure fl_screen_xywh4
           (X, Y, W, H     :    out Interfaces.C.int;
            PX, PY, PW, PH : in     Interfaces.C.int);
    pragma Import (C, fl_screen_xywh4, "fl_screen_xywh4");
    pragma Inline (fl_screen_xywh4);




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




    function Count return Integer is
    begin
        return Integer (fl_screen_count);
    end Count;


    --  Screen numbers in the range 1 .. Get_Count
    procedure DPI
           (Horizontal, Vertical :    out Float;
            Screen_Number        : in     Integer := 1) is
    begin
        fl_screen_dpi
           (Interfaces.C.C_float (Horizontal),
            Interfaces.C.C_float (Vertical),
            Interfaces.C.int (Screen_Number) - 1);
    end DPI;




    function Containing
           (X, Y : in Integer)
        return Integer is
    begin
        return Integer (fl_screen_num
           (Interfaces.C.int (X),
            Interfaces.C.int (Y)));
    end Containing;


    function Containing
           (X, Y, W, H : in Integer)
        return Integer is
    begin
        return Integer (fl_screen_num2
           (Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H)));
    end Containing;




    procedure Work_Area
           (X, Y, W, H   :    out Integer;
            Pos_X, Pos_Y : in     Integer) is
    begin
        fl_screen_work_area
           (Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.int (Pos_X),
            Interfaces.C.int (Pos_Y));
    end Work_Area;


    procedure Work_Area
           (X, Y, W, H :    out Integer;
            Screen_Num : in     Integer) is
    begin
        fl_screen_work_area2
           (Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.int (Screen_Num));
    end Work_Area;


    procedure Work_Area
           (X, Y, W, H : out Integer) is
    begin
        fl_screen_work_area3
           (Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H));
    end Work_Area;




    procedure Bounding_Rect
           (X, Y, W, H   :    out Integer;
            Pos_X, Pos_Y : in     Integer) is
    begin
        fl_screen_xywh
           (Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.int (Pos_X),
            Interfaces.C.int (Pos_Y));
    end Bounding_Rect;


    procedure Bounding_Rect
           (X, Y, W, H :    out Integer;
            Screen_Num : in     Integer) is
    begin
        fl_screen_xywh2
           (Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.int (Screen_Num));
    end Bounding_Rect;


    procedure Bounding_Rect
           (X, Y, W, H : out Integer) is
    begin
        fl_screen_xywh3
           (Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H));
    end Bounding_Rect;


    procedure Bounding_Rect
           (X, Y, W, H     :    out Integer;
            PX, PY, PW, PH : in     Integer) is
    begin
        fl_screen_xywh4
           (Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.int (PX),
            Interfaces.C.int (PY),
            Interfaces.C.int (PW),
            Interfaces.C.int (PH));
    end Bounding_Rect;


end FLTK.Screen;

