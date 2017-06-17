

package FLTK.Images.RGB.JPEG is


    type JPEG_Image is new RGB_Image with private;




    function Create
           (Filename : in String)
        return JPEG_Image;


private


    type JPEG_Image is new RGB_Image with null record;

    overriding procedure Finalize
           (This : in out JPEG_Image);


end FLTK.Images.RGB.JPEG;

