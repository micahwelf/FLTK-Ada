

with

    Interfaces.C,
    System;


package body FLTK.Devices.Graphics is


    function fl_graphics_driver_color
           (G : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_graphics_driver_color, "fl_graphics_driver_color");




    function fl_graphics_driver_descent
           (G : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_graphics_driver_descent, "fl_graphics_driver_descent");

    function fl_graphics_driver_height
           (G : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_graphics_driver_height, "fl_graphics_driver_height");

    function fl_graphics_driver_width
           (G : in System.Address;
            C : in Interfaces.C.unsigned)
        return Interfaces.C.double;
    pragma Import (C, fl_graphics_driver_width, "fl_graphics_driver_width");

    function fl_graphics_driver_width2
           (G : in System.Address;
            S : in Interfaces.C.char_array;
            L : in Interfaces.C.int)
        return Interfaces.C.double;
    pragma Import (C, fl_graphics_driver_width2, "fl_graphics_driver_width2");

    function fl_graphics_driver_get_font
           (G : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_graphics_driver_get_font, "fl_graphics_driver_get_font");

    function fl_graphics_driver_size
           (G : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_graphics_driver_size, "fl_graphics_driver_size");

    procedure fl_graphics_driver_set_font
           (G    : in System.Address;
            K, S : in Interfaces.C.int);
    pragma Import (C, fl_graphics_driver_set_font, "fl_graphics_driver_set_font");




    procedure fl_graphics_driver_draw_scaled
           (G, I       : in System.Address;
            X, Y, W, H : in Interfaces.C.int);
    pragma Import (C, fl_graphics_driver_draw_scaled, "fl_graphics_driver_draw_scaled");




    function Get_Color
           (This : in Graphics_Driver)
        return Color is
    begin
        return Color (fl_graphics_driver_color (This.Void_Ptr));
    end Get_Color;




    function Get_Text_Descent
           (This : in Graphics_Driver)
        return Integer is
    begin
        return Integer (fl_graphics_driver_descent (This.Void_Ptr));
    end Get_Text_Descent;


    function Get_Line_Height
           (This : in Graphics_Driver)
        return Integer is
    begin
        return Integer (fl_graphics_driver_height (This.Void_Ptr));
    end Get_Line_Height;


    function Get_Width
           (This : in Graphics_Driver;
            Char : in Character)
        return Long_Float is
    begin
        return Long_Float (fl_graphics_driver_width (This.Void_Ptr, Character'Pos (Char)));
    end Get_Width;


    function Get_Width
           (This : in Graphics_Driver;
            Str  : in String)
        return Long_Float is
    begin
        return Long_Float (fl_graphics_driver_width2
           (This.Void_Ptr,
            Interfaces.C.To_C (Str),
            Str'Length));
    end Get_Width;


    function Get_Font_Kind
           (This : in Graphics_Driver)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_graphics_driver_get_font (This.Void_Ptr));
    end Get_Font_Kind;


    function Get_Font_Size
           (This : in Graphics_Driver)
        return Font_Size is
    begin
        return Font_Size (fl_graphics_driver_size (This.Void_Ptr));
    end Get_Font_Size;


    procedure Set_Font
           (This : in Graphics_Driver;
            Face : in Font_Kind;
            Size : in Font_Size) is
    begin
        fl_graphics_driver_set_font (This.Void_Ptr, Font_Kind'Pos (Face), Interfaces.C.int (Size));
    end Set_Font;




    procedure Draw_Scaled_Image
           (This       : in Graphics_Driver;
            Img        : in FLTK.Images.Image'Class;
            X, Y, W, H : in Integer) is
    begin
        fl_graphics_driver_draw_scaled
           (This.Void_Ptr,
            Wrapper (Img).Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H));
    end Draw_Scaled_Image;


end FLTK.Devices.Graphics;

