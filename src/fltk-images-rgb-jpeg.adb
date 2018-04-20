

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Images.RGB.JPEG is


    function new_fl_jpeg_image
           (F : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_jpeg_image, "new_fl_jpeg_image");
    pragma Inline (new_fl_jpeg_image);

    procedure free_fl_jpeg_image
           (P : in System.Address);
    pragma Import (C, free_fl_jpeg_image, "free_fl_jpeg_image");
    pragma Inline (free_fl_jpeg_image);




    overriding procedure Finalize
           (This : in out JPEG_Image) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in JPEG_Image'Class
        then
            free_fl_jpeg_image (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (RGB_Image (This));
    end Finalize;




    package body Forge is

        function Create
               (Filename : in String)
            return JPEG_Image is
        begin
            return This : JPEG_Image do
                This.Void_Ptr := new_fl_jpeg_image
                       (Interfaces.C.To_C (Filename));
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

    end Forge;


end FLTK.Images.RGB.JPEG;

