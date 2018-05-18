

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Images.Pixmaps.XPM is


    function new_fl_xpm_image
           (F : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_xpm_image, "new_fl_xpm_image");
    pragma Inline (new_fl_xpm_image);

    procedure free_fl_xpm_image
           (P : in System.Address);
    pragma Import (C, free_fl_xpm_image, "free_fl_xpm_image");
    pragma Inline (free_fl_xpm_image);




    overriding procedure Finalize
           (This : in out XPM_Image) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in XPM_Image'Class
        then
            free_fl_xpm_image (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Pixmap (This));
    end Finalize;




    package body Forge is

        function Create
               (Filename : in String)
            return XPM_Image is
        begin
            return This : XPM_Image do
                This.Void_Ptr := new_fl_xpm_image
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


end FLTK.Images.Pixmaps.XPM;

