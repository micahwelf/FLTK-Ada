

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Images.Bitmaps is


    procedure free_fl_bitmap
           (I : in System.Address);
    pragma Import (C, free_fl_bitmap, "free_fl_bitmap");
    pragma Inline (free_fl_bitmap);

    function fl_bitmap_copy
           (I    : in System.Address;
            W, H : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_bitmap_copy, "fl_bitmap_copy");
    pragma Inline (fl_bitmap_copy);

    function fl_bitmap_copy2
           (I : in System.Address)
        return System.Address;
    pragma Import (C, fl_bitmap_copy2, "fl_bitmap_copy2");
    pragma Inline (fl_bitmap_copy2);




    procedure fl_bitmap_draw2
           (I    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_bitmap_draw2, "fl_bitmap_draw2");
    pragma Inline (fl_bitmap_draw2);

    procedure fl_bitmap_draw
           (I                  : in System.Address;
            X, Y, W, H, CX, CY : in Interfaces.C.int);
    pragma Import (C, fl_bitmap_draw, "fl_bitmap_draw");
    pragma Inline (fl_bitmap_draw);




    overriding procedure Finalize
           (This : in out Bitmap) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Bitmap'Class
        then
            free_fl_bitmap (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Image (This));
    end Finalize;




    function Copy
           (This          : in Bitmap;
            Width, Height : in Natural)
        return Bitmap'Class is
    begin
        return Copied : Bitmap do
            Copied.Void_Ptr := fl_bitmap_copy
                   (This.Void_Ptr,
                    Interfaces.C.int (Width),
                    Interfaces.C.int (Height));
        end return;
    end Copy;


    function Copy
           (This : in Bitmap)
        return Bitmap'Class is
    begin
        return Copied : Bitmap do
            Copied.Void_Ptr := fl_bitmap_copy2 (This.Void_Ptr);
        end return;
    end Copy;




    procedure Draw
           (This : in Bitmap;
            X, Y : in Integer) is
    begin
        fl_bitmap_draw2
               (This.Void_Ptr,
                Interfaces.C.int (X),
                Interfaces.C.int (Y));
    end Draw;


    procedure Draw
           (This       : in Bitmap;
            X, Y, W, H : in Integer;
            CX, CY     : in Integer := 0) is
    begin
        fl_bitmap_draw
               (This.Void_Ptr,
                Interfaces.C.int (X),
                Interfaces.C.int (Y),
                Interfaces.C.int (W),
                Interfaces.C.int (H),
                Interfaces.C.int (CX),
                Interfaces.C.int (CY));
    end Draw;


end FLTK.Images.Bitmaps;

