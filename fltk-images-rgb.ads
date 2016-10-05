

package FLTK.Images.RGB is


    type RGB_Image is new Image with private;


private


    type RGB_Image is new Image with null record;


    overriding procedure Finalize
           (This : in out RGB_Image);


end FLTK.Images.RGB;

