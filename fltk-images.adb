

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Images is


    function new_fl_image
           (W, H, D : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_image, "new_fl_image");

    procedure free_fl_image
           (I : in System.Address);
    pragma Import (C, free_fl_image, "free_fl_image");

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




    overriding procedure Finalize
           (This : in out Image) is
    begin
        Finalize (Wrapper (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Image then
                free_fl_image (This.Void_Ptr);
            end if;
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
        end return;
    end Create;




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


end FLTK.Images;

