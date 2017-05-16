

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Images.Bitmaps is


    procedure free_fl_bitmap
           (I : in System.Address);
    pragma Import (C, free_fl_bitmap, "free_fl_bitmap");

    function fl_bitmap_copy
           (I    : in System.Address;
            W, H : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_bitmap_copy, "fl_bitmap_copy");

    function fl_bitmap_copy2
           (I : in System.Address)
        return System.Address;
    pragma Import (C, fl_bitmap_copy2, "fl_bitmap_copy2");




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
        return Bitmap is
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
        return Bitmap is
    begin
        return Copied : Bitmap do
            Copied.Void_Ptr := fl_bitmap_copy2 (This.Void_Ptr);
        end return;
    end Copy;


end FLTK.Images.Bitmaps;

