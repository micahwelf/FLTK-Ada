

package FLTK.Images.RGB.JPEG is


    type JPEG_Image is new RGB_Image with private;

    type JPEG_Image_Reference (Data : not null access JPEG_Image'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (Filename : in String)
            return JPEG_Image;

    end Forge;


private


    type JPEG_Image is new RGB_Image with null record;

    overriding procedure Finalize
           (This : in out JPEG_Image);


end FLTK.Images.RGB.JPEG;

