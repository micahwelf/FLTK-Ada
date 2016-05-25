

with FLTK.Enums; use FLTK.Enums;


package FLTK.Widget.Group.Text_Display is


    type Text_Display_Type is new Group_Type with private;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Text_Display_Type;


    function Get_Text_Color
           (TD : in Text_Display_Type)
        return Color;


    procedure Set_Text_Color
           (TD : in Text_Display_Type;
            C : in Color);


    function Get_Text_Font
           (TD : in Text_Display_Type)
        return Font_Kind;


    procedure Set_Text_Font
           (TD : in Text_Display_Type;
            F : in Font_Kind);


    function Get_Text_Size
           (TD : in Text_Display_Type)
        return Font_Size;


    procedure Set_Text_Size
           (TD : in Text_Display_Type;
            S : in Font_Size);


private


    type Text_Display_Type is new Group_Type with null record;


    overriding procedure Finalize (This : in out Text_Display_Type);


end FLTK.Widget.Group.Text_Display;

