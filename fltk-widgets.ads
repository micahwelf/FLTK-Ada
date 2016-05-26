

with FLTK.Enums; use FLTK.Enums;


package FLTK.Widgets is


    type Widget is abstract new Wrapper with private;
    type Widget_Access is access all Widget;


    type Font_Size is new Natural;
    Normal_Size : constant Font_Size := 14;


    type Color is new Natural;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Widget is abstract;


    function Get_Box
           (W : in Widget'Class)
        return Box_Kind;


    procedure Set_Box
           (W : in out Widget'Class;
            B : in     Box_Kind);


    function Get_Label_Font
           (W : in Widget'Class)
        return Font_Kind;


    procedure Set_Label_Font
           (W : in out Widget'Class;
            F : in     Font_Kind);


    function Get_Label_Size
           (W : in Widget'Class)
        return Font_Size;


    procedure Set_Label_Size
           (W : in out Widget'Class;
            S : in     Font_Size);


    function Get_Label_Type
           (W : in Widget'Class)
        return Label_Kind;


    procedure Set_Label_Type
           (W : in out Widget'Class;
            L : in     Label_Kind);


private


    type Widget is abstract new Wrapper with null record;


end FLTK.Widgets;

