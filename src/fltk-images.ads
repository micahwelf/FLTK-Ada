

with FLTK.Enums; use FLTK.Enums;


package FLTK.Images is


    type Image is new Wrapper with private;


    type Blend is new Float range 0.0 .. 1.0;


    function Create
           (Width, Height, Depth : in Natural)
        return Image;


    function Copy
           (This          : in Image;
            Width, Height : in Natural)
        return Image;


    function Copy
           (This : in Image)
        return Image;


    procedure Color_Average
           (This   : in out Image;
            Col    : in     Color;
            Amount : in     Blend);


    procedure Desaturate
           (This : in out Image);


    procedure Inactive
           (This : in out Image);


    function Get_W
           (This : in Image)
        return Natural;


    function Get_H
           (This : in Image)
        return Natural;


    function Get_D
           (This : in Image)
        return Natural;


private


    type Image is new Wrapper with null record;


    overriding procedure Finalize
           (This : in out Image);


end FLTK.Images;

