

package FLTK.Images.Bitmaps is


    type Bitmap is new Image with private;




    function Copy
           (This          : in Bitmap;
            Width, Height : in Natural)
        return Bitmap'Class;

    function Copy
           (This : in Bitmap)
        return Bitmap'Class;




    procedure Draw
           (This       : in Bitmap;
            X, Y, W, H : in Integer;
            CX, CY     : in Integer := 0);


private


    type Bitmap is new Image with null record;

    overriding procedure Finalize
           (This : in out Bitmap);


end FLTK.Images.Bitmaps;

