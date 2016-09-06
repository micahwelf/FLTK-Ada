

with Interfaces.C;
with System;
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
        return Text_Buffer_Cursor is
    begin
        return Ref : Text_Buffer_Cursor (This.Buffer);
    end Get_Buffer;




    procedure Set_Buffer
           (This : in out Text_Display;
            Buff : in out Text_Buffer) is
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


end FLTK.Widgets.Groups.Text_Displays;

