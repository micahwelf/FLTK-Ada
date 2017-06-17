

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Images.RGB.PNM is


    function new_fl_pnm_image
           (F : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_pnm_image, "new_fl_pnm_image");

    procedure free_fl_pnm_image
           (P : in System.Address);
    pragma Import (C, free_fl_pnm_image, "free_fl_pnm_image");




    overriding procedure Finalize
           (This : in out PNM_Image) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in PNM_Image'Class
        then
            free_fl_pnm_image (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (RGB_Image (This));
    end Finalize;




    function Create
           (Filename : in String)
        return PNM_Image is
    begin
        return This : PNM_Image do
            This.Void_Ptr := new_fl_pnm_image
                   (Interfaces.C.To_C (Filename));
        end return;
    end Create;


end FLTK.Images.RGB.PNM;

