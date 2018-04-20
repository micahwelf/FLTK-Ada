

package FLTK.Images.RGB.PNM is


    type PNM_Image is new RGB_Image with private;

    type PNM_Image_Reference (Data : not null access PNM_Image'Class) is limited null record
        with Implicit_Dereference => Data;




    package Forge is

        function Create
               (Filename : in String)
            return PNM_Image;

    end Forge;


private


    type PNM_Image is new RGB_Image with null record;

    overriding procedure Finalize
           (This : in out PNM_Image);


end FLTK.Images.RGB.PNM;

