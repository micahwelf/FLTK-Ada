

package FLTK.Images.Pixmaps.XPM is


    type XPM_Image is new Pixmap with private;

    type XPM_Image_Reference (Data : not null access XPM_Image'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (Filename : in String)
            return XPM_Image;

    end Forge;


private


    type XPM_Image is new Pixmap with null record;

    overriding procedure Finalize
           (This : in out XPM_Image);


end FLTK.Images.Pixmaps.XPM;

