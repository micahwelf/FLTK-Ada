

package FLTK.Images is


    type Image is new Wrapper with private;


    function Create
           (Width, Height, Depth : in Natural)
        return Image;


    function Get_W (This : in Image) return Natural;
    function Get_H (This : in Image) return Natural;
    function Get_D (This : in Image) return Natural;


private


    type Image is new Wrapper with null record;


    overriding procedure Finalize
           (This : in out Image);


end FLTK.Images;

