

with FLTK.Enums; use FLTK.Enums;


package FLTK.Widgets.Groups.Text_Displays is


    type Text_Display is new Group with private;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Text_Display;


    function Get_Text_Color
           (TD : in Text_Display'Class)
        return Color;


    procedure Set_Text_Color
           (TD : in out Text_Display'Class;
            C  : in     Color);


    function Get_Text_Font
           (TD : in Text_Display'Class)
        return Font_Kind;


    procedure Set_Text_Font
           (TD : in out Text_Display'Class;
            F  : in     Font_Kind);


    function Get_Text_Size
           (TD : in Text_Display'Class)
        return Font_Size;


    procedure Set_Text_Size
           (TD : in out Text_Display'Class;
            S  : in     Font_Size);


private


    type Text_Display is new Group with null record;


    overriding procedure Finalize
           (This : in out Text_Display);


end FLTK.Widgets.Groups.Text_Displays;

