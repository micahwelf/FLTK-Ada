

package FLTK.Images.RGB is


    type RGB_Image is new Image with private;


    function Copy
           (This          : in RGB_Image;
            Width, Height : in Natural)
        return RGB_Image;


    function Copy
           (This : in RGB_Image)
        return RGB_Image;


    procedure Color_Average
           (This   : in out RGB_Image;
            Col    : in     Color;
            Amount : in     Blend);


    procedure Desaturate
           (This : in out RGB_Image);


private


    type RGB_Image is new Image with null record;


    overriding procedure Finalize
           (This : in out RGB_Image);


end FLTK.Images.RGB;

