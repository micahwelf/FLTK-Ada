

package FLTK.Images.RGB.BMP is


    type BMP_Image is new RGB_Image with private;


    function Create
           (Filename : in String)
        return BMP_Image;


private


    type BMP_Image is new RGB_Image with null record;


    overriding procedure Finalize
           (This : in out BMP_Image);


end FLTK.Images.RGB.BMP;

