

package FLTK.Images is


    type Image is new Wrapper with private;

    type Image_Reference (Data : not null access Image'Class) is limited null record
        with Implicit_Dereference => Data;

    type Scaling_Kind is (Nearest, Bilinear);

    type Blend is new Float range 0.0 .. 1.0;

    No_Image_Error, File_Access_Error, Format_Error : exception;




    package Forge is

        function Create
               (Width, Height, Depth : in Natural)
            return Image;

    end Forge;




    function Get_Copy_Algorithm
        return Scaling_Kind;

    procedure Set_Copy_Algorithm
           (To : in Scaling_Kind);

    function Copy
           (This          : in Image;
            Width, Height : in Natural)
        return Image'Class;

    function Copy
           (This : in Image)
        return Image'Class;




    procedure Color_Average
           (This   : in out Image;
            Col    : in     Color;
            Amount : in     Blend);

    procedure Desaturate
           (This : in out Image);




    procedure Inactive
           (This : in out Image);

    function Is_Empty
           (This : in Image)
        return Boolean;




    function Get_W
           (This : in Image)
        return Natural;

    function Get_H
           (This : in Image)
        return Natural;

    function Get_D
           (This : in Image)
        return Natural;




    procedure Draw
           (This : in Image;
            X, Y : in Integer);

    procedure Draw
           (This       : in Image;
            X, Y, W, H : in Integer;
            CX, CY     : in Integer := 0);

    procedure Draw_Empty
           (This : in Image;
            X, Y : in Integer);


private


    type Image is new Wrapper with null record;

    overriding procedure Finalize
           (This : in out Image);




    pragma Inline (Copy);


    pragma Inline (Color_Average);
    pragma Inline (Desaturate);


    pragma Inline (Inactive);
    pragma Inline (Is_Empty);


    pragma Inline (Get_W);
    pragma Inline (Get_H);
    pragma Inline (Get_D);


    pragma Inline (Draw);
    pragma Inline (Draw_Empty);




    function fl_image_fail
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_image_fail, "fl_image_fail");


end FLTK.Images;

