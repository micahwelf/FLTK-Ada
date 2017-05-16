

package FLTK.Images.Bitmaps is


    type Bitmap is new Image with private;


    function Copy
           (This          : in Bitmap;
            Width, Height : in Natural)
        return Bitmap;


    function Copy
           (This : in Bitmap)
        return Bitmap;


private


    type Bitmap is new Image with null record;


    overriding procedure Finalize
           (This : in out Bitmap);


end FLTK.Images.Bitmaps;

