

with

    Interfaces.C,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Images is


    function new_fl_image
           (W, H, D : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_image, "new_fl_image");

    procedure free_fl_image
           (I : in System.Address);
    pragma Import (C, free_fl_image, "free_fl_image");

    function fl_image_copy
           (I    : in System.Address;
            W, H : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_image_copy, "fl_image_copy");

    function fl_image_copy2
           (I : in System.Address)
        return System.Address;
    pragma Import (C, fl_image_copy2, "fl_image_copy2");




    procedure fl_image_color_average
           (I : in System.Address;
            C : in Interfaces.C.int;
            B : in Interfaces.C.C_float);
    pragma Import (C, fl_image_color_average, "fl_image_color_average");

    procedure fl_image_desaturate
           (I : in System.Address);
    pragma Import (C, fl_image_desaturate, "fl_image_desaturate");




    procedure fl_image_inactive
           (I : in System.Address);
    pragma Import (C, fl_image_inactive, "fl_image_inactive");




    function fl_image_w
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_image_w, "fl_image_w");

    function fl_image_h
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_image_h, "fl_image_h");

    function fl_image_d
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_image_d, "fl_image_d");




    procedure fl_image_draw
           (I    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_image_draw, "fl_image_draw");

    procedure fl_image_draw2
           (I                  : in System.Address;
            X, Y, W, H, CX, CY : in Interfaces.C.int);
    pragma Import (C, fl_image_draw2, "fl_image_draw2");

    procedure fl_image_draw_empty
           (I    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_image_draw_empty, "fl_image_draw_empty");




    overriding procedure Finalize
           (This : in out Image) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Image'Class
        then
            free_fl_image (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
    end Finalize;




    function Create
           (Width, Height, Depth : in Natural)
        return Image is
    begin
        return This : Image do
            This.Void_Ptr := new_fl_image
                   (Interfaces.C.int (Width),
                    Interfaces.C.int (Height),
                    Interfaces.C.int (Depth));
            case fl_image_fail (This.Void_Ptr) is
                when 1 =>
                    raise No_Image_Error;
                when 2 =>
                    raise File_Access_Error;
                when 3 =>
                    raise Format_Error;
                when others =>
                    null;
            end case;
        end return;
    end Create;


    function Copy
           (This          : in Image;
            Width, Height : in Natural)
        return Image is
    begin
        return Copied : Image do
            Copied.Void_Ptr := fl_image_copy
                   (This.Void_Ptr,
                    Interfaces.C.int (Width),
                    Interfaces.C.int (Height));
        end return;
    end Copy;


    function Copy
           (This : in Image)
        return Image is
    begin
        return Copied : Image do
            Copied.Void_Ptr := fl_image_copy2 (This.Void_Ptr);
        end return;
    end Copy;




    procedure Color_Average
           (This   : in out Image;
            Col    : in     Color;
            Amount : in     Blend) is
    begin
        fl_image_color_average
               (This.Void_Ptr,
                Interfaces.C.int (Col),
                Interfaces.C.C_float (Amount));
    end Color_Average;


    procedure Desaturate
           (This : in out Image) is
    begin
        fl_image_desaturate (This.Void_Ptr);
    end Desaturate;




    procedure Inactive
           (This : in out Image) is
    begin
        fl_image_inactive (This.Void_Ptr);
    end Inactive;


    function Is_Empty
           (This : in Image)
        return Boolean is
    begin
        return fl_image_fail (This.Void_Ptr) /= 0;
    end Is_Empty;




    function Get_W
           (This : in Image)
        return Natural is
    begin
        return Natural (fl_image_w (This.Void_Ptr));
    end Get_W;


    function Get_H
           (This : in Image)
        return Natural is
    begin
        return Natural (fl_image_h (This.Void_Ptr));
    end Get_H;


    function Get_D
           (This : in Image)
        return Natural is
    begin
        return Natural (fl_image_d (This.Void_Ptr));
    end Get_D;




    procedure Draw
           (This : in Image;
            X, Y : in Integer) is
    begin
        fl_image_draw
               (This.Void_Ptr,
                Interfaces.C.int (X),
                Interfaces.C.int (Y));
    end Draw;


    procedure Draw
           (This       : in Image;
            X, Y, W, H : in Integer;
            CX, CY     : in Integer := 0) is
    begin
        fl_image_draw2
               (This.Void_Ptr,
                Interfaces.C.int (X),
                Interfaces.C.int (Y),
                Interfaces.C.int (W),
                Interfaces.C.int (H),
                Interfaces.C.int (CX),
                Interfaces.C.int (CY));
    end Draw;


    procedure Draw_Empty
           (This : in Image;
            X, Y : in Integer) is
    begin
        fl_image_draw_empty
               (This.Void_Ptr,
                Interfaces.C.int (X),
                Interfaces.C.int (Y));
    end Draw_Empty;


end FLTK.Images;

