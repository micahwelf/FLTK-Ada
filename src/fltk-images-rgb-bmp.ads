

package FLTK.Images.RGB.BMP is


    type BMP_Image is new RGB_Image with private;

    type BMP_Image_Reference (Data : not null access BMP_Image'Class) is limited null record
        with Implicit_Dereference => Data;




    package Forge is

        function Create
               (Filename : in String)
            return BMP_Image;

    end Forge;


private


    type BMP_Image is new RGB_Image with null record;

    overriding procedure Finalize
           (This : in out BMP_Image);


end FLTK.Images.RGB.BMP;

