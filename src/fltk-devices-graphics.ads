

with

    FLTK.Images;


package FLTK.Devices.Graphics is


    type Graphics_Driver is new Device with private;

    type Graphics_Driver_Reference (Data : not null access Graphics_Driver'Class) is
        limited null record with Implicit_Dereference => Data;




    function Get_Color
           (This : in Graphics_Driver)
        return Color;




    function Get_Text_Descent
           (This : in Graphics_Driver)
        return Integer;

    function Get_Line_Height
           (This : in Graphics_Driver)
        return Integer;

    function Get_Width
           (This : in Graphics_Driver;
            Char : in Character)
        return Long_Float;

    function Get_Width
           (This : in Graphics_Driver;
            Str  : in String)
        return Long_Float;

    function Get_Font_Kind
           (This : in Graphics_Driver)
        return Font_Kind;

    function Get_Font_Size
           (This : in Graphics_Driver)
        return Font_Size;

    procedure Set_Font
           (This : in Graphics_Driver;
            Face : in Font_Kind;
            Size : in Font_Size);




    procedure Draw_Scaled_Image
           (This       : in Graphics_Driver;
            Img        : in FLTK.Images.Image'Class;
            X, Y, W, H : in Integer);


private


    type Graphics_Driver is new Device with null record;




    pragma Inline (Get_Color);


    pragma Inline (Get_Text_Descent);
    pragma Inline (Get_Line_Height);
    pragma Inline (Get_Width);
    pragma Inline (Get_Font_Kind);
    pragma Inline (Get_Font_Size);
    pragma Inline (Set_Font);


    pragma Inline (Draw_Scaled_Image);


end FLTK.Devices.Graphics;

