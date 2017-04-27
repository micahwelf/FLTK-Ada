

package body FLTK.Images.RGB is


    overriding procedure Finalize
           (This : in out RGB_Image) is
    begin
        Finalize (Image (This));
    end Finalize;


end FLTK.Images.RGB;

