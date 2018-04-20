

package FLTK.Images.Bitmaps is


    type Bitmap is new Image with private;

    type Bitmap_Reference (Data : not null access Bitmap'Class) is limited null record
        with Implicit_Dereference => Data;




    function Copy
           (This          : in Bitmap;
            Width, Height : in Natural)
        return Bitmap'Class;

    function Copy
           (This : in Bitmap)
        return Bitmap'Class;




    procedure Draw
           (This : in Bitmap;
            X, Y : in Integer);

    procedure Draw
           (This       : in Bitmap;
            X, Y, W, H : in Integer;
            CX, CY     : in Integer := 0);


private


    type Bitmap is new Image with null record;

    overriding procedure Finalize
           (This : in out Bitmap);




    pragma Inline (Copy);
    pragma Inline (Draw);


end FLTK.Images.Bitmaps;

