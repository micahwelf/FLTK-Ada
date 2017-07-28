

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Images.RGB is


    procedure free_fl_rgb_image
           (I : in System.Address);
    pragma Import (C, free_fl_rgb_image, "free_fl_rgb_image");

    function fl_rgb_image_copy
           (I    : in System.Address;
            W, H : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_rgb_image_copy, "fl_rgb_image_copy");

    function fl_rgb_image_copy2
           (I : in System.Address)
        return System.Address;
    pragma Import (C, fl_rgb_image_copy2, "fl_rgb_image_copy2");




    procedure fl_rgb_image_color_average
           (I : in System.Address;
            C : in Interfaces.C.int;
            B : in Interfaces.C.C_float);
    pragma Import (C, fl_rgb_image_color_average, "fl_rgb_image_color_average");

    procedure fl_rgb_image_desaturate
           (I : in System.Address);
    pragma Import (C, fl_rgb_image_desaturate, "fl_rgb_image_desaturate");




    procedure fl_rgb_image_draw
           (I                  : in System.Address;
            X, Y, W, H, CX, CY : in Interfaces.C.int);
    pragma Import (C, fl_rgb_image_draw, "fl_rgb_image_draw");




    overriding procedure Finalize
           (This : in out RGB_Image) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in RGB_Image'Class
        then
            free_fl_rgb_image (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Image (This));
    end Finalize;




    function Copy
           (This          : in RGB_Image;
            Width, Height : in Natural)
        return RGB_Image is
    begin
        return Copied : RGB_Image do
            Copied.Void_Ptr := fl_rgb_image_copy
                   (This.Void_Ptr,
                    Interfaces.C.int (Width),
                    Interfaces.C.int (Height));
        end return;
    end Copy;


    function Copy
           (This : in RGB_Image)
        return RGB_Image is
    begin
        return Copied : RGB_Image do
            Copied.Void_Ptr := fl_rgb_image_copy2 (This.Void_Ptr);
        end return;
    end Copy;




    procedure Color_Average
           (This   : in out RGB_Image;
            Col    : in     Color;
            Amount : in     Blend) is
    begin
        fl_rgb_image_color_average
               (This.Void_Ptr,
                Interfaces.C.int (Col),
                Interfaces.C.C_float (Amount));
    end Color_Average;


    procedure Desaturate
           (This : in out RGB_Image) is
    begin
        fl_rgb_image_desaturate (This.Void_Ptr);
    end Desaturate;




    procedure Draw
           (This       : in RGB_Image;
            X, Y, W, H : in Integer;
            CX, CY     : in Integer := 0) is
    begin
        fl_rgb_image_draw
               (This.Void_Ptr,
                Interfaces.C.int (X),
                Interfaces.C.int (Y),
                Interfaces.C.int (W),
                Interfaces.C.int (H),
                Interfaces.C.int (CX),
                Interfaces.C.int (CY));
    end Draw;


end FLTK.Images.RGB;

