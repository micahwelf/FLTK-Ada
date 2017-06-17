

package FLTK.Images.RGB.PNM is


    type PNM_Image is new RGB_Image with private;




    function Create
           (Filename : in String)
        return PNM_Image;


private


    type PNM_Image is new RGB_Image with null record;

    overriding procedure Finalize
           (This : in out PNM_Image);


end FLTK.Images.RGB.PNM;

