

package FLTK.Images.RGB.PNG is


    type PNG_Image is new RGB_Image with private;




    function Create
           (Filename : in String)
        return PNG_Image;


private


    type PNG_Image is new RGB_Image with null record;

    overriding procedure Finalize
           (This : in out PNG_Image);


end FLTK.Images.RGB.PNG;

