

with FLTK.Text_Buffers;
with FLTK.Enums; use FLTK.Enums;


package FLTK.Widgets.Groups.Text_Displays is


    type Text_Display is new Group with private;


    type Wrap_Mode is (Wrap_None, Wrap_At_Column, Wrap_At_Pixel, Wrap_At_Bounds);


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Text_Display;


    function Get_Buffer
           (This : in Text_Display)
        return FLTK.Text_Buffers.Text_Buffer_Cursor;


    procedure Set_Buffer
           (This : in out Text_Display;
            Buff : in out FLTK.Text_Buffers.Text_Buffer);


    function Get_Text_Color
           (This : in Text_Display)
        return Color;


    procedure Set_Text_Color
           (This : in out Text_Display;
            Col  : in     Color);


    function Get_Text_Font
           (This : in Text_Display)
        return Font_Kind;


    procedure Set_Text_Font
           (This : in out Text_Display;
            Font : in     Font_Kind);


    function Get_Text_Size
           (This : in Text_Display)
        return Font_Size;


    procedure Set_Text_Size
           (This : in out Text_Display;
            Size : in     Font_Size);


    function Get_Insert_Position
           (This : in Text_Display)
        return Natural;


    procedure Set_Insert_Position
           (This : in out Text_Display;
            Pos  : in     Natural);


    procedure Show_Insert_Position
           (This : in out Text_Display);


    procedure Next_Word
           (This : in out Text_Display);


    procedure Previous_Word
           (This : in out Text_Display);


    procedure Set_Wrap_Mode
           (This   : in out Text_Display;
            Mode   : in     Wrap_Mode;
            Margin : in     Natural := 0);


    --  takes into account word wrap as well as newline characters
    function Skip_Lines
           (This                    : in out Text_Display;
            Start, Lines            : in     Natural;
            Start_Pos_Is_Line_Start : in     Boolean := False)
        return Natural;


    --  takes into account word wrap as well as newline characters
    function Rewind_Lines
           (This         : in out Text_Display;
            Start, Lines : in     Natural)
        return Natural;


    procedure Set_Linenumber_Width
           (This  : in out Text_Display;
            Width : in     Natural);


    procedure Draw
           (This : in out Text_Display);


private


    type Text_Display is new Group with
        record
            Buffer : access FLTK.Text_Buffers.Text_Buffer;
        end record;


    overriding procedure Finalize
           (This : in out Text_Display);


    package Text_Display_Convert is new System.Address_To_Access_Conversions
           (Text_Display'Class);


end FLTK.Widgets.Groups.Text_Displays;

