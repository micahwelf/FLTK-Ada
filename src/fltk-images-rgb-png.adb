

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Images.RGB.PNG is


    function new_fl_png_image
           (F : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_png_image, "new_fl_png_image");

    procedure free_fl_png_image
           (P : in System.Address);
    pragma Import (C, free_fl_png_image, "free_fl_png_image");




    overriding procedure Finalize
           (This : in out PNG_Image) is
    begin
        Finalize (RGB_Image (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in PNG_Image then
                free_fl_png_image (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (Filename : in String)
        return PNG_Image is
    begin
        return This : PNG_Image do
            This.Void_Ptr := new_fl_png_image
                   (Interfaces.C.To_C (Filename));
        end return;
    end Create;


end FLTK.Images.RGB.PNG;

