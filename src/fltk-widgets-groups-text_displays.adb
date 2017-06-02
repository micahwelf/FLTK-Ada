

with Interfaces.C;
with System;
with FLTK.Text_Buffers;
use type Interfaces.C.int;
use type System.Address;


package body FLTK.Widgets.Groups.Text_Displays is


    procedure text_display_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, text_display_set_draw_hook, "text_display_set_draw_hook");

    procedure text_display_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, text_display_set_handle_hook, "text_display_set_handle_hook");




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




    function fl_text_display_col_to_x
           (TD : in System.Address;
            C  : in Interfaces.C.double)
        return Interfaces.C.double;
    pragma Import (C, fl_text_display_col_to_x, "fl_text_display_col_to_x");

    function fl_text_display_x_to_col
           (TD : in System.Address;
            X  : in Interfaces.C.double)
        return Interfaces.C.double;
    pragma Import (C, fl_text_display_x_to_col, "fl_text_display_x_to_col");

    function fl_text_display_in_selection
           (TD   : in System.Address;
            X, Y : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_in_selection, "fl_text_display_in_selection");

    function fl_text_display_position_to_xy
           (TD   : in     System.Address;
            P    : in     Interfaces.C.int;
            X, Y :    out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_position_to_xy, "fl_text_display_position_to_xy");




    function fl_text_display_get_cursor_color
           (TD : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_text_display_get_cursor_color, "fl_text_display_get_cursor_color");

    procedure fl_text_display_set_cursor_color
           (TD : in System.Address;
            C  : in Interfaces.C.unsigned);
    pragma Import (C, fl_text_display_set_cursor_color, "fl_text_display_set_cursor_color");

    procedure fl_text_display_set_cursor_style
           (TD : in System.Address;
            S  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_cursor_style, "fl_text_display_set_cursor_style");

    procedure fl_text_display_hide_cursor
           (TD : in System.Address);
    pragma Import (C, fl_text_display_hide_cursor, "fl_text_display_hide_cursor");

    procedure fl_text_display_show_cursor
           (TD : in System.Address);
    pragma Import (C, fl_text_display_show_cursor, "fl_text_display_show_cursor");




    function fl_text_display_get_text_color
           (TD : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_text_display_get_text_color, "fl_text_display_get_text_color");

    procedure fl_text_display_set_text_color
           (TD : in System.Address;
            C  : in Interfaces.C.unsigned);
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




    procedure fl_text_display_insert
           (TD : in System.Address;
            I  : in Interfaces.C.char_array);
    pragma Import (C, fl_text_display_insert, "fl_text_display_insert");

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




    function fl_text_display_word_start
           (TD : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_word_start, "fl_text_display_word_start");

    function fl_text_display_word_end
           (TD : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_word_end, "fl_text_display_word_end");

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




    function fl_text_display_line_start
           (TD : in System.Address;
            S  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_line_start, "fl_text_display_line_start");

    function fl_text_display_line_end
           (TD   : in System.Address;
            S, P : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_line_end, "fl_text_display_line_end");

    function fl_text_display_count_lines
           (TD      : in System.Address;
            S, F, P : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_count_lines, "fl_text_display_count_lines");

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




    function fl_text_display_get_linenumber_align
           (TD : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_text_display_get_linenumber_align,
        "fl_text_display_get_linenumber_align");

    procedure fl_text_display_set_linenumber_align
           (TD : in System.Address;
            A  : in Interfaces.C.unsigned);
    pragma Import (C, fl_text_display_set_linenumber_align,
        "fl_text_display_set_linenumber_align");

    function fl_text_display_get_linenumber_bgcolor
           (TD : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_text_display_get_linenumber_bgcolor,
        "fl_text_display_get_linenumber_bgcolor");

    procedure fl_text_display_set_linenumber_bgcolor
           (TD : in System.Address;
            C  : in Interfaces.C.unsigned);
    pragma Import (C, fl_text_display_set_linenumber_bgcolor,
        "fl_text_display_set_linenumber_bgcolor");

    function fl_text_display_get_linenumber_fgcolor
           (TD : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_text_display_get_linenumber_fgcolor,
        "fl_text_display_get_linenumber_fgcolor");

    procedure fl_text_display_set_linenumber_fgcolor
           (TD : in System.Address;
            C  : in Interfaces.C.unsigned);
    pragma Import (C, fl_text_display_set_linenumber_fgcolor,
        "fl_text_display_set_linenumber_fgcolor");

    function fl_text_display_get_linenumber_font
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_linenumber_font,
        "fl_text_display_get_linenumber_font");

    procedure fl_text_display_set_linenumber_font
           (TD : in System.Address;
            F  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_linenumber_font,
        "fl_text_display_set_linenumber_font");

    function fl_text_display_get_linenumber_size
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_linenumber_size,
        "fl_text_display_get_linenumber_size");

    procedure fl_text_display_set_linenumber_size
           (TD : in System.Address;
            S  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_linenumber_size,
        "fl_text_display_set_linenumber_size");

    function fl_text_display_get_linenumber_width
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_linenumber_width,
        "fl_text_display_get_linenumber_width");

    procedure fl_text_display_set_linenumber_width
           (TD : in System.Address;
            W  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_linenumber_width,
        "fl_text_display_set_linenumber_width");




    function fl_text_display_move_down
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_move_down, "fl_text_display_move_down");

    function fl_text_display_move_left
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_move_left, "fl_text_display_move_left");

    function fl_text_display_move_right
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_move_right, "fl_text_display_move_right");

    function fl_text_display_move_up
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_move_up, "fl_text_display_move_up");




    procedure fl_text_display_scroll
           (TD : in System.Address;
            L  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_scroll, "fl_text_display_scroll");

    function fl_text_display_get_scrollbar_align
           (TD : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_text_display_get_scrollbar_align, "fl_text_display_get_scrollbar_align");

    procedure fl_text_display_set_scrollbar_align
           (TD : in System.Address;
            A  : in Interfaces.C.unsigned);
    pragma Import (C, fl_text_display_set_scrollbar_align, "fl_text_display_set_scrollbar_align");

    function fl_text_display_get_scrollbar_width
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_scrollbar_width, "fl_text_display_get_scrollbar_width");

    procedure fl_text_display_set_scrollbar_width
           (TD : in System.Address;
            W  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_scrollbar_width, "fl_text_display_set_scrollbar_width");




    procedure fl_text_display_draw
           (W : in System.Address);
    pragma Import (C, fl_text_display_draw, "fl_text_display_draw");

    function fl_text_display_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_handle, "fl_text_display_handle");




    procedure Finalize
           (This : in out Text_Display) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Text_Display'Class
        then
            This.Clear;
            free_fl_text_display (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Group (This));
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
            text_display_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            text_display_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
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




    function Col_To_X
           (This    : in Text_Display;
            Col_Num : in Integer)
        return Integer is
    begin
        return Integer (Interfaces.C.double'Rounding
               (fl_text_display_col_to_x (This.Void_Ptr, Interfaces.C.double (Col_Num))));
    end Col_To_X;


    function X_To_Col
           (This  : in Text_Display;
            X_Pos : in Integer)
        return Integer is
    begin
        return Integer (Interfaces.C.double'Rounding
               (fl_text_display_x_to_col (This.Void_Ptr, Interfaces.C.double (X_Pos))));
    end X_To_Col;


    function In_Selection
           (This : in Text_Display;
            X, Y : in Integer)
        return Boolean is
    begin
        return fl_text_display_in_selection
               (This.Void_Ptr, Interfaces.C.int (X), Interfaces.C.int (Y)) /= 0;
    end In_Selection;


    procedure Position_To_XY
           (This     : in     Text_Display;
            Pos      : in     Integer;
            X, Y     :    out Integer;
            Vert_Out :    out Boolean)
    is
        Raw_X, Raw_Y : Interfaces.C.int;
    begin
        Vert_Out := fl_text_display_position_to_xy
               (This.Void_Ptr,
                Interfaces.C.int (Pos),
                Raw_X, Raw_Y) /= 0;
        X := Integer (Raw_X);
        Y := Integer (Raw_Y);
    end Position_To_XY;




    function Get_Cursor_Color
           (This : in Text_Display)
        return Color is
    begin
        return Color (fl_text_display_get_cursor_color (This.Void_Ptr));
    end Get_Cursor_Color;


    procedure Set_Cursor_Color
           (This : in out Text_Display;
            Col  : in     Color) is
    begin
        fl_text_display_set_cursor_color (This.Void_Ptr, Interfaces.C.unsigned (Col));
    end Set_Cursor_Color;


    procedure Set_Cursor_Style
           (This  : in out Text_Display;
            Style : in     Cursor_Style) is
    begin
        fl_text_display_set_cursor_style (This.Void_Ptr, Cursor_Style'Pos (Style));
    end Set_Cursor_Style;


    procedure Hide_Cursor
           (This : in out Text_Display) is
    begin
        fl_text_display_hide_cursor (This.Void_Ptr);
    end Hide_Cursor;


    procedure Show_Cursor
           (This : in out Text_Display) is
    begin
        fl_text_display_show_cursor (This.Void_Ptr);
    end Show_Cursor;




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
        fl_text_display_set_text_color (This.Void_Ptr, Interfaces.C.unsigned (Col));
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




    procedure Insert_Text
           (This : in out Text_Display;
            Item : in     String) is
    begin
        fl_text_display_insert (This.Void_Ptr, Interfaces.C.To_C (Item));
    end Insert_Text;


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




    function Word_Start
           (This : in out Text_Display;
            Pos  : in     Natural)
        return Natural is
    begin
        return Natural (fl_text_display_word_start
               (This.Void_Ptr,
                Interfaces.C.int (Pos)));
    end Word_Start;


    function Word_End
           (This : in out Text_Display;
            Pos  : in     Natural)
        return Natural is
    begin
        return Natural (fl_text_display_word_end
               (This.Void_Ptr,
                Interfaces.C.int (Pos)));
    end Word_End;


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




    function Line_Start
           (This : in Text_Display;
            Pos  : in Natural)
        return Natural is
    begin
        return Natural (fl_text_display_line_start
               (This.Void_Ptr,
                Interfaces.C.int (Pos)));
    end Line_Start;


    function Line_End
           (This                    : in Text_Display;
            Pos                     : in Natural;
            Start_Pos_Is_Line_Start : in Boolean := False)
        return Natural is
    begin
        return Natural (fl_text_display_line_end
               (This.Void_Ptr,
                Interfaces.C.int (Pos),
                Boolean'Pos (Start_Pos_Is_Line_Start)));
    end Line_End;


    function Count_Lines
           (This                    : in Text_Display;
            Start, Finish           : in Natural;
            Start_Pos_Is_Line_Start : in Boolean := False)
        return Natural is
    begin
        return Natural (fl_text_display_count_lines
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Finish),
                Boolean'Pos (Start_Pos_Is_Line_Start)));
    end Count_Lines;


    function Skip_Lines
           (This                    : in Text_Display;
            Start, Lines            : in Natural;
            Start_Pos_Is_Line_Start : in Boolean := False)
        return Natural is
    begin
        return Natural (fl_text_display_skip_lines
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Lines),
                Boolean'Pos (Start_Pos_Is_Line_Start)));
    end Skip_Lines;


    function Rewind_Lines
           (This         : in Text_Display;
            Start, Lines : in Natural)
        return Natural is
    begin
        return Natural (fl_text_display_rewind_lines
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Lines)));
    end Rewind_Lines;




    function Get_Linenumber_Alignment
           (This : in Text_Display)
        return Alignment is
    begin
        return Alignment (fl_text_display_get_linenumber_align (This.Void_Ptr));
    end Get_Linenumber_Alignment;


    procedure Set_Linenumber_Alignment
           (This : in out Text_Display;
            To   : in     Alignment) is
    begin
        fl_text_display_set_linenumber_align
               (This.Void_Ptr,
                Interfaces.C.unsigned (To));
    end Set_Linenumber_Alignment;


    function Get_Linenumber_Back_Color
           (This : in Text_Display)
        return Color is
    begin
        return Color (fl_text_display_get_linenumber_bgcolor (This.Void_Ptr));
    end Get_Linenumber_Back_Color;


    procedure Set_Linenumber_Back_Color
           (This : in out Text_Display;
            To   : in     Color) is
    begin
        fl_text_display_set_linenumber_bgcolor
               (This.Void_Ptr,
                Interfaces.C.unsigned (To));
    end Set_Linenumber_Back_Color;


    function Get_Linenumber_Fore_Color
           (This : in Text_Display)
        return Color is
    begin
        return Color (fl_text_display_get_linenumber_fgcolor (This.Void_Ptr));
    end Get_Linenumber_Fore_Color;


    procedure Set_Linenumber_Fore_Color
           (This : in out Text_Display;
            To   : in     Color) is
    begin
        fl_text_display_set_linenumber_fgcolor
               (This.Void_Ptr,
                Interfaces.C.unsigned (To));
    end Set_Linenumber_Fore_Color;


    function Get_Linenumber_Font
           (This : in Text_Display)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_text_display_get_linenumber_font (This.Void_Ptr));
    end Get_Linenumber_Font;


    procedure Set_Linenumber_Font
           (This : in out Text_Display;
            To   : in     Font_Kind) is
    begin
        fl_text_display_set_linenumber_font
               (This.Void_Ptr,
                Font_Kind'Pos (To));
    end Set_Linenumber_Font;


    function Get_Linenumber_Size
           (This : in Text_Display)
        return Font_Size is
    begin
        return Font_Size (fl_text_display_get_linenumber_size (This.Void_Ptr));
    end Get_Linenumber_Size;


    procedure Set_Linenumber_Size
           (This : in out Text_Display;
            To   : in     Font_Size) is
    begin
        fl_text_display_set_linenumber_size
               (This.Void_Ptr,
                Interfaces.C.int (To));
    end Set_Linenumber_Size;


    function Get_Linenumber_Width
           (This : in Text_Display)
        return Natural is
    begin
        return Natural (fl_text_display_get_linenumber_width (This.Void_Ptr));
    end Get_Linenumber_Width;


    procedure Set_Linenumber_Width
           (This  : in out Text_Display;
            Width : in     Natural) is
    begin
        fl_text_display_set_linenumber_width
               (This.Void_Ptr,
                Interfaces.C.int (Width));
    end Set_Linenumber_Width;




    procedure Move_Down
           (This : in out Text_Display) is
    begin
        if fl_text_display_move_down (This.Void_Ptr) = 0 then
            raise Bounds_Error;
        end if;
    end Move_Down;


    procedure Move_Left
           (This : in out Text_Display) is
    begin
        if fl_text_display_move_left (This.Void_Ptr) = 0 then
            raise Bounds_Error;
        end if;
    end Move_Left;


    procedure Move_Right
           (This : in out Text_Display) is
    begin
        if fl_text_display_move_right (This.Void_Ptr) = 0 then
            raise Bounds_Error;
        end if;
    end Move_Right;


    procedure Move_Up
           (This : in out Text_Display) is
    begin
        if fl_text_display_move_up (This.Void_Ptr) = 0 then
            raise Bounds_Error;
        end if;
    end Move_Up;




    procedure Scroll_To
           (This : in out Text_Display;
            Line : in     Natural) is
    begin
        fl_text_display_scroll (This.Void_Ptr, Interfaces.C.int (Line));
    end Scroll_To;


    function Get_Scrollbar_Alignment
           (This : in Text_Display)
        return Alignment is
    begin
        return Alignment (fl_text_display_get_scrollbar_align (This.Void_Ptr));
    end Get_Scrollbar_Alignment;


    procedure Set_Scrollbar_Alignment
           (This  : in out Text_Display;
            Align : in     Alignment) is
    begin
        fl_text_display_set_scrollbar_align
               (This.Void_Ptr,
                Interfaces.C.unsigned (Align));
    end Set_Scrollbar_Alignment;


    function Get_Scrollbar_Width
           (This : in Text_Display)
        return Natural is
    begin
        return Natural (fl_text_display_get_scrollbar_width (This.Void_Ptr));
    end Get_Scrollbar_Width;


    procedure Set_Scrollbar_Width
           (This  : in out Text_Display;
            Width : in     Natural) is
    begin
        fl_text_display_set_scrollbar_width
               (This.Void_Ptr,
                Interfaces.C.int (Width));
    end Set_Scrollbar_Width;




    procedure Draw
           (This : in out Text_Display) is
    begin
        fl_text_display_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Text_Display;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_text_display_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Text_Displays;

