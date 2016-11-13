

with Interfaces.C;
with System;
with FLTK.Text_Buffers;
use type System.Address;


package body FLTK.Widgets.Groups.Text_Displays is


    function new_fl_text_display
           (X, Y, W, H : in Interfaces.C.int;
            Label      : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_text_display, "new_fl_text_display");

    procedure free_fl_text_display
           (TD : in System.Address);
    pragma Import (C, free_fl_text_display, "free_fl_text_display");

    function fl_text_display_get_buffer
           (TD : in System.Address)
        return System.Address;
    pragma Import (C, fl_text_display_get_buffer, "fl_text_display_get_buffer");

    procedure fl_text_display_set_buffer
           (TD, TB : in System.Address);
    pragma Import (C, fl_text_display_set_buffer, "fl_text_display_set_buffer");

    function fl_text_display_get_text_color
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_text_color, "fl_text_display_get_text_color");

    procedure fl_text_display_set_text_color
           (TD : in System.Address;
            C  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_text_color, "fl_text_display_set_text_color");

    function fl_text_display_get_text_font
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_text_font, "fl_text_display_get_text_font");

    procedure fl_text_display_set_text_font
           (TD : in System.Address;
            F  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_text_font, "fl_text_display_set_text_font");

    function fl_text_display_get_text_size
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_text_size, "fl_text_display_get_text_size");

    procedure fl_text_display_set_text_size
           (TD : in System.Address;
            S  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_text_size, "fl_text_display_set_text_size");

    function fl_text_display_get_insert_pos
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_insert_pos, "fl_text_display_get_insert_pos");

    procedure fl_text_display_set_insert_pos
           (TD : in System.Address;
            P  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_insert_pos, "fl_text_display_set_insert_pos");

    procedure fl_text_display_show_insert_pos
           (TD : in System.Address);
    pragma Import (C, fl_text_display_show_insert_pos, "fl_text_display_show_insert_pos");

    procedure fl_text_display_next_word
           (TD : in System.Address);
    pragma Import (C, fl_text_display_next_word, "fl_text_display_next_word");

    procedure fl_text_display_previous_word
           (TD : in System.Address);
    pragma Import (C, fl_text_display_previous_word, "fl_text_display_previous_word");

    procedure fl_text_display_wrap_mode
           (TD    : in System.Address;
            W, M  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_wrap_mode, "fl_text_display_wrap_mode");

    function fl_text_display_skip_lines
           (TD      : in System.Address;
            S, L, P : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_skip_lines, "fl_text_display_skip_lines");

    function fl_text_display_rewind_lines
           (TD   : in System.Address;
            S, L : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_rewind_lines, "fl_text_display_rewind_lines");

    procedure fl_text_display_linenumber_width
           (TD : in System.Address;
            W  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_linenumber_width, "fl_text_display_linenumber_width");




    procedure Finalize
           (This : in out Text_Display) is
    begin
        Finalize (Group (This));
        if (This.Void_Ptr /= System.Null_Address) then
            if This in Text_Display then
                free_fl_text_display (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Text_Display is
    begin
        return This : Text_Display do
            This.Void_Ptr := new_fl_text_display
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_group_end (This.Void_Ptr);
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
        end return;
    end Create;




    function Get_Buffer
           (This : in Text_Display)
        return FLTK.Text_Buffers.Text_Buffer_Cursor is
    begin
        return Ref : FLTK.Text_Buffers.Text_Buffer_Cursor (This.Buffer);
    end Get_Buffer;




    procedure Set_Buffer
           (This : in out Text_Display;
            Buff : in out FLTK.Text_Buffers.Text_Buffer) is
    begin
        This.Buffer := Buff'Unchecked_Access;
        fl_text_display_set_buffer (This.Void_Ptr, Wrapper (Buff).Void_Ptr);
    end Set_Buffer;




    function Get_Text_Color
           (This : in Text_Display)
        return Color is
    begin
        return Color (fl_text_display_get_text_color (This.Void_Ptr));
    end Get_Text_Color;




    procedure Set_Text_Color
           (This : in out Text_Display;
            Col  : in     Color) is
    begin
        fl_text_display_set_text_color (This.Void_Ptr, Interfaces.C.int (Col));
    end Set_Text_Color;




    function Get_Text_Font
           (This : in Text_Display)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_text_display_get_text_font (This.Void_Ptr));
    end Get_Text_Font;




    procedure Set_Text_Font
           (This : in out Text_Display;
            Font : in     Font_Kind) is
    begin
        fl_text_display_set_text_font (This.Void_Ptr, Font_Kind'Pos (Font));
    end Set_Text_Font;




    function Get_Text_Size
           (This : in Text_Display)
        return Font_Size is
    begin
        return Font_Size (fl_text_display_get_text_size (This.Void_Ptr));
    end Get_Text_Size;




    procedure Set_Text_Size
           (This : in out Text_Display;
            Size : in     Font_Size) is
    begin
        fl_text_display_set_text_size (This.Void_Ptr, Interfaces.C.int (Size));
    end Set_Text_Size;




    function Get_Insert_Position
           (This : in Text_Display)
        return Natural is
    begin
        return Natural (fl_text_display_get_insert_pos (This.Void_Ptr));
    end Get_Insert_Position;




    procedure Set_Insert_Position
           (This : in out Text_Display;
            Pos  : in     Natural) is
    begin
        fl_text_display_set_insert_pos (This.Void_Ptr, Interfaces.C.int (Pos));
    end Set_Insert_Position;




    procedure Show_Insert_Position
           (This : in out Text_Display) is
    begin
        fl_text_display_show_insert_pos (This.Void_Ptr);
    end Show_Insert_Position;




    procedure Next_Word
           (This : in out Text_Display) is
    begin
        fl_text_display_next_word (This.Void_Ptr);
    end Next_Word;




    procedure Previous_Word
           (This : in out Text_Display) is
    begin
        fl_text_display_previous_word (This.Void_Ptr);
    end Previous_Word;




    procedure Set_Wrap_Mode
           (This   : in out Text_Display;
            Mode   : in     Wrap_Mode;
            Margin : in     Natural := 0) is
    begin
        fl_text_display_wrap_mode
               (This.Void_Ptr,
                Wrap_Mode'Pos (Mode),
                Interfaces.C.int (Margin));
    end Set_Wrap_Mode;




    function Skip_Lines
           (This                    : in out Text_Display;
            Start, Lines            : in     Natural;
            Start_Pos_Is_Line_Start : in     Boolean := False)
        return Natural is
    begin
        return Natural (fl_text_display_skip_lines
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Lines),
                Boolean'Pos (Start_Pos_Is_Line_Start)));
    end Skip_Lines;




    function Rewind_Lines
           (This         : in out Text_Display;
            Start, Lines : in     Natural)
        return Natural is
    begin
        return Natural (fl_text_display_rewind_lines
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Lines)));
    end Rewind_Lines;




    procedure Set_Linenumber_Width
           (This  : in out Text_Display;
            Width : in     Natural) is
    begin
        fl_text_display_linenumber_width
               (This.Void_Ptr,
                Interfaces.C.int (Width));
    end Set_Linenumber_Width;


end FLTK.Widgets.Groups.Text_Displays;

