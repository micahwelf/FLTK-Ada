

with

    FLTK.Text_Buffers;

private with

    Interfaces.C,
    System.Address_To_Access_Conversions;


package FLTK.Widgets.Groups.Text_Displays is


    type Text_Display is new Group with private;

    type Text_Display_Reference (Data : not null access Text_Display'Class) is
        limited null record with Implicit_Dereference => Data;

    type Wrap_Mode is (None, Column, Pixel, Bounds);

    type Cursor_Style is (Normal, Caret, Dim, Block, Heavy, Simple);

    Bounds_Error : exception;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Text_Display;

    end Forge;




    package Styles is

        type Style_Entry is private;
        type Style_Index is new Character range 'A' .. '~';
        type Style_Array is array (Style_Index range <>) of Style_Entry;

        type Unfinished_Style_Callback is access procedure
               (Char    : in     Character;
                Display : in out Text_Display);

        function Item
               (Tint : in Color;
                Font : in Font_Kind;
                Size : in Font_Size)
            return Style_Entry;

    private

        type Style_Entry is record
            Attr : Interfaces.C.unsigned;
            Col  : Interfaces.C.unsigned;
            Font : Interfaces.C.int;
            Size : Interfaces.C.int;
        end record;

        pragma Convention (C, Style_Entry);
        pragma Convention (C, Style_Array);

    end Styles;




    function Get_Buffer
           (This : in Text_Display)
        return FLTK.Text_Buffers.Text_Buffer_Reference;

    procedure Set_Buffer
           (This : in out Text_Display;
            Buff : in out FLTK.Text_Buffers.Text_Buffer);




    procedure Highlight_Data
           (This  : in out Text_Display;
            Buff  : in out FLTK.Text_Buffers.Text_Buffer;
            Table : in     Styles.Style_Array);

    procedure Highlight_Data
           (This       : in out Text_Display;
            Buff       : in out FLTK.Text_Buffers.Text_Buffer;
            Table      : in     Styles.Style_Array;
            Unfinished : in     Styles.Style_Index;
            Callback   : in     Styles.Unfinished_Style_Callback);




    function Col_To_X
           (This    : in Text_Display;
            Col_Num : in Integer)
        return Integer;

    function X_To_Col
           (This  : in Text_Display;
            X_Pos : in Integer)
        return Integer;

    function In_Selection
           (This : in Text_Display;
            X, Y : in Integer)
        return Boolean;

    procedure Position_To_XY
           (This     : in     Text_Display;
            Pos      : in     Integer;
            X, Y     :    out Integer;
            Vert_Out :    out Boolean);




    function Get_Cursor_Color
           (This : in Text_Display)
        return Color;

    procedure Set_Cursor_Color
           (This : in out Text_Display;
            Col  : in     Color);

    procedure Set_Cursor_Style
           (This  : in out Text_Display;
            Style : in     Cursor_Style);

    procedure Hide_Cursor
           (This : in out Text_Display);

    procedure Show_Cursor
           (This : in out Text_Display);




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




    procedure Insert_Text
           (This : in out Text_Display;
            Item : in     String);

    procedure Overstrike
           (This : in out Text_Display;
            Text : in     String);

    function Get_Insert_Position
           (This : in Text_Display)
        return Natural;

    procedure Set_Insert_Position
           (This : in out Text_Display;
            Pos  : in     Natural);

    procedure Show_Insert_Position
           (This : in out Text_Display);




    function Word_Start
           (This : in out Text_Display;
            Pos  : in     Natural)
        return Natural;

    function Word_End
           (This : in out Text_Display;
            Pos  : in     Natural)
        return Natural;

    procedure Next_Word
           (This : in out Text_Display);

    procedure Previous_Word
           (This : in out Text_Display);

    procedure Set_Wrap_Mode
           (This   : in out Text_Display;
            Mode   : in     Wrap_Mode;
            Margin : in     Natural := 0);




    --  takes into account word wrap
    function Line_Start
           (This : in Text_Display;
            Pos  : in Natural)
        return Natural;

    --  takes into account word wrap
    function Line_End
           (This                    : in Text_Display;
            Pos                     : in Natural;
            Start_Pos_Is_Line_Start : in Boolean := False)
        return Natural;

    function Count_Lines
           (This                    : in Text_Display;
            Start, Finish           : in Natural;
            Start_Pos_Is_Line_Start : in Boolean := False)
        return Natural;

    --  takes into account word wrap as well as newline characters
    function Skip_Lines
           (This                    : in Text_Display;
            Start, Lines            : in Natural;
            Start_Pos_Is_Line_Start : in Boolean := False)
        return Natural;

    --  takes into account word wrap as well as newline characters
    function Rewind_Lines
           (This         : in Text_Display;
            Start, Lines : in Natural)
        return Natural;




    function Get_Linenumber_Alignment
           (This : in Text_Display)
        return Alignment;

    procedure Set_Linenumber_Alignment
           (This : in out Text_Display;
            To   : in     Alignment);

    function Get_Linenumber_Back_Color
           (This : in Text_Display)
        return Color;

    procedure Set_Linenumber_Back_Color
           (This : in out Text_Display;
            To   : in     Color);

    function Get_Linenumber_Fore_Color
           (This : in Text_Display)
        return Color;

    procedure Set_Linenumber_Fore_Color
           (This : in out Text_Display;
            To   : in     Color);

    function Get_Linenumber_Font
           (This : in Text_Display)
        return Font_Kind;

    procedure Set_Linenumber_Font
           (This : in out Text_Display;
            To   : in     Font_Kind);

    function Get_Linenumber_Size
           (This : in Text_Display)
        return Font_Size;

    procedure Set_Linenumber_Size
           (This : in out Text_Display;
            To   : in     Font_Size);

    function Get_Linenumber_Width
           (This : in Text_Display)
        return Natural;

    procedure Set_Linenumber_Width
           (This  : in out Text_Display;
            Width : in     Natural);




    procedure Move_Down
           (This : in out Text_Display);

    procedure Move_Left
           (This : in out Text_Display);

    procedure Move_Right
           (This : in out Text_Display);

    procedure Move_Up
           (This : in out Text_Display);




    procedure Scroll_To
           (This : in out Text_Display;
            Line : in     Natural);

    function Get_Scrollbar_Alignment
           (This : in Text_Display)
        return Alignment;

    procedure Set_Scrollbar_Alignment
           (This  : in out Text_Display;
            Align : in     Alignment);

    function Get_Scrollbar_Width
           (This : in Text_Display)
        return Natural;

    procedure Set_Scrollbar_Width
           (This  : in out Text_Display;
            Width : in     Natural);




    procedure Redisplay_Range
           (This          : in out Text_Display;
            Start, Finish : in     Natural);

    procedure Draw
           (This : in out Text_Display);

    function Handle
           (This  : in out Text_Display;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Text_Display is new Group with
        record
            Buffer         : access FLTK.Text_Buffers.Text_Buffer;
            Style_Callback : Styles.Unfinished_Style_Callback;
        end record;

    overriding procedure Finalize
           (This : in out Text_Display);




    package Text_Display_Convert is new System.Address_To_Access_Conversions (Text_Display'Class);




    pragma Inline (Get_Buffer);
    pragma Inline (Set_Buffer);


    pragma Inline (Highlight_Data);


    pragma Inline (Col_To_X);
    pragma Inline (X_To_Col);
    pragma Inline (In_Selection);
    pragma Inline (Position_To_XY);


    pragma Inline (Get_Cursor_Color);
    pragma Inline (Set_Cursor_Color);
    pragma Inline (Set_Cursor_Style);
    pragma Inline (Hide_Cursor);
    pragma Inline (Show_Cursor);


    pragma Inline (Get_Text_Color);
    pragma Inline (Set_Text_Color);
    pragma Inline (Get_Text_Font);
    pragma Inline (Set_Text_Font);
    pragma Inline (Get_Text_Size);
    pragma Inline (Set_Text_Size);


    pragma Inline (Insert_Text);
    pragma Inline (Overstrike);
    pragma Inline (Get_Insert_Position);
    pragma Inline (Set_Insert_Position);
    pragma Inline (Show_Insert_Position);


    pragma Inline (Word_Start);
    pragma Inline (Word_End);
    pragma Inline (Next_Word);
    pragma Inline (Previous_Word);
    pragma Inline (Set_Wrap_Mode);


    pragma Inline (Line_Start);
    pragma Inline (Line_End);
    pragma Inline (Count_Lines);
    pragma Inline (Skip_Lines);
    pragma Inline (Rewind_Lines);


    pragma Inline (Get_Linenumber_Alignment);
    pragma Inline (Set_Linenumber_Alignment);
    pragma Inline (Get_Linenumber_Back_Color);
    pragma Inline (Set_Linenumber_Back_Color);
    pragma Inline (Get_Linenumber_Fore_Color);
    pragma Inline (Set_Linenumber_Fore_Color);
    pragma Inline (Get_Linenumber_Font);
    pragma Inline (Set_Linenumber_Font);
    pragma Inline (Get_Linenumber_Size);
    pragma Inline (Set_Linenumber_Size);
    pragma Inline (Get_Linenumber_Width);
    pragma Inline (Set_Linenumber_Width);


    pragma Inline (Move_Down);
    pragma Inline (Move_Left);
    pragma Inline (Move_Right);
    pragma Inline (Move_Up);


    pragma Inline (Scroll_To);
    pragma Inline (Get_Scrollbar_Alignment);
    pragma Inline (Set_Scrollbar_Alignment);
    pragma Inline (Get_Scrollbar_Width);
    pragma Inline (Set_Scrollbar_Width);


    pragma Inline (Redisplay_Range);
    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups.Text_Displays;

