

with

    FLTK.Widgets;


package FLTK.Tooltips is


    function Get_Target
        return access FLTK.Widgets.Widget'Class;

    procedure Set_Target
           (To : in FLTK.Widgets.Widget'Class);

    function Is_Enabled
        return Boolean;

    procedure Set_Enabled
           (To : in Boolean);

    procedure Enter_Area
           (Item       : in FLTK.Widgets.Widget'Class;
            X, Y, W, H : in Integer;
            Tip        : in String);




    function Get_Delay
        return Float;

    procedure Set_Delay
           (To : in Float);

    function Get_Hover_Delay
        return Float;

    procedure Set_Hover_Delay
           (To : in Float);




    function Get_Background_Color
        return Color;

    procedure Set_Background_Color
           (To : in Color);

    function Get_Margin_Height
        return Natural;

    --  procedure Set_Margin_Height
    --         (To : in Natural);

    function Get_Margin_Width
        return Natural;

    --  procedure Set_Margin_Width
    --         (To : in Natural);

    function Get_Wrap_Width
        return Natural;

    --  procedure Set_Wrap_Width
    --         (To : in Natural);




    function Get_Text_Color
        return Color;

    procedure Set_Text_Color
           (To : in Color);

    function Get_Text_Font
        return Font_Kind;

    procedure Set_Text_Font
           (To : in Font_Kind);

    function Get_Text_Size
        return Font_Size;

    procedure Set_Text_Size
           (To : in Font_Size);


private


    pragma Inline (Get_Target);
    pragma Inline (Set_Target);
    pragma Inline (Is_Enabled);
    pragma Inline (Set_Enabled);
    pragma Inline (Enter_Area);


    pragma Inline (Get_Delay);
    pragma Inline (Set_Delay);
    pragma Inline (Get_Hover_Delay);
    pragma Inline (Set_Hover_Delay);


    pragma Inline (Get_Background_Color);
    pragma Inline (Set_Background_Color);
    pragma Inline (Get_Margin_Height);
    --  pragma Inline (Set_Margin_Height);
    pragma Inline (Get_Margin_Width);
    --  pragma Inline (Set_Margin_Width);
    pragma Inline (Get_Wrap_Width);
    --  pragma Inline (Set_Wrap_Width);


    pragma Inline (Get_Text_Color);
    pragma Inline (Set_Text_Color);
    pragma Inline (Get_Text_Font);
    pragma Inline (Set_Text_Font);
    pragma Inline (Get_Text_Size);
    pragma Inline (Set_Text_Size);


end FLTK.Tooltips;

