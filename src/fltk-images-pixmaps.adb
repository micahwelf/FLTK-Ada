

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Images.Pixmaps is


    procedure free_fl_pixmap
           (I : in System.Address);
    pragma Import (C, free_fl_pixmap, "free_fl_pixmap");
    pragma Inline (free_fl_pixmap);

    function fl_pixmap_copy
           (I    : in System.Address;
            W, H : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_pixmap_copy, "fl_pixmap_copy");
    pragma Inline (fl_pixmap_copy);

    function fl_pixmap_copy2
           (I : in System.Address)
        return System.Address;
    pragma Import (C, fl_pixmap_copy2, "fl_pixmap_copy2");
    pragma Inline (fl_pixmap_copy2);




    procedure fl_pixmap_color_average
           (I : in System.Address;
            C : in Interfaces.C.int;
            B : in Interfaces.C.C_float);
    pragma Import (C, fl_pixmap_color_average, "fl_pixmap_color_average");
    pragma Inline (fl_pixmap_color_average);

    procedure fl_pixmap_desaturate
           (I : in System.Address);
    pragma Import (C, fl_pixmap_desaturate, "fl_pixmap_desaturate");
    pragma Inline (fl_pixmap_desaturate);




    procedure fl_pixmap_draw2
           (I    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_pixmap_draw2, "fl_pixmap_draw2");
    pragma Inline (fl_pixmap_draw2);

    procedure fl_pixmap_draw
           (I                  : in System.Address;
            X, Y, W, H, CX, CY : in Interfaces.C.int);
    pragma Import (C, fl_pixmap_draw, "fl_pixmap_draw");
    pragma Inline (fl_pixmap_draw);




    overriding procedure Finalize
           (This : in out Pixmap) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Pixmap'Class
        then
            free_fl_pixmap (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Image (This));
    end Finalize;




    function Copy
           (This          : in Pixmap;
            Width, Height : in Natural)
        return Pixmap'Class is
    begin
        return Copied : Pixmap do
            Copied.Void_Ptr := fl_pixmap_copy
                   (This.Void_Ptr,
                    Interfaces.C.int (Width),
                    Interfaces.C.int (Height));
        end return;
    end Copy;


    function Copy
           (This : in Pixmap)
        return Pixmap'Class is
    begin
        return Copied : Pixmap do
            Copied.Void_Ptr := fl_pixmap_copy2 (This.Void_Ptr);
        end return;
    end Copy;




    procedure Color_Average
           (This   : in out Pixmap;
            Col    : in     Color;
            Amount : in     Blend) is
    begin
        fl_pixmap_color_average
               (This.Void_Ptr,
                Interfaces.C.int (Col),
                Interfaces.C.C_float (Amount));
    end Color_Average;


    procedure Desaturate
           (This : in out Pixmap) is
    begin
        fl_pixmap_desaturate (This.Void_Ptr);
    end Desaturate;




    procedure Draw
           (This : in Pixmap;
            X, Y : in Integer) is
    begin
        fl_pixmap_draw2
               (This.Void_Ptr,
                Interfaces.C.int (X),
                Interfaces.C.int (Y));
    end Draw;


    procedure Draw
           (This       : in Pixmap;
            X, Y, W, H : in Integer;
            CX, CY     : in Integer := 0) is
    begin
        fl_pixmap_draw
               (This.Void_Ptr,
                Interfaces.C.int (X),
                Interfaces.C.int (Y),
                Interfaces.C.int (W),
                Interfaces.C.int (H),
                Interfaces.C.int (CX),
                Interfaces.C.int (CY));
    end Draw;


end FLTK.Images.Pixmaps;

