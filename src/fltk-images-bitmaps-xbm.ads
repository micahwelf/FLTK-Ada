

package FLTK.Images.Bitmaps.XBM is


    type XBM_Image is new Bitmap with private;




    function Create
           (Filename : in String)
        return XBM_Image;


private


    type XBM_Image is new Bitmap with null record;

    overriding procedure Finalize
           (This : in out XBM_Image);


end FLTK.Images.Bitmaps.XBM;

