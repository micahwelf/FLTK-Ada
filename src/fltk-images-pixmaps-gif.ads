

package FLTK.Images.Pixmaps.GIF is


    type GIF_Image is new Pixmap with private;

    type GIF_Image_Reference (Data : not null access GIF_Image'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (Filename : in String)
            return GIF_Image;

    end Forge;


private


    type GIF_Image is new Pixmap with null record;

    overriding procedure Finalize
           (This : in out GIF_Image);


end FLTK.Images.Pixmaps.GIF;

