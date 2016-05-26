

with FLTK.Text_Buffers; use FLTK.Text_Buffers;
with FLTK.Enums; use FLTK.Enums;


package FLTK.Widgets.Groups.Text_Displays is


    type Text_Display is new Group with private;
    type Text_Display_Access is access all Text_Display;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Text_Display;


    function Get_Buffer
           (TD : in Text_Display'Class)
        return Text_Buffer_Access;


    procedure Set_Buffer
           (TD : in out Text_Display'Class;
            TB : in     Text_Buffer_Access);


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


    type Text_Display is new Group with
        record
            Buffer : Text_Buffer_Access;
        end record;


    overriding procedure Finalize
           (This : in out Text_Display);


end FLTK.Widgets.Groups.Text_Displays;

