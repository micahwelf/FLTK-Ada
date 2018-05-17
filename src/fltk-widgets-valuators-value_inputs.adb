

with

    Ada.Unchecked_Deallocation,
    Interfaces.C.Strings,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Widgets.Valuators.Value_Inputs is


    procedure value_input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, value_input_set_draw_hook, "value_input_set_draw_hook");
    pragma Inline (value_input_set_draw_hook);

    procedure value_input_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, value_input_set_handle_hook, "value_input_set_handle_hook");
    pragma Inline (value_input_set_handle_hook);




    function new_fl_value_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_value_input, "new_fl_value_input");
    pragma Inline (new_fl_value_input);

    procedure free_fl_value_input
           (A : in System.Address);
    pragma Import (C, free_fl_value_input, "free_fl_value_input");
    pragma Inline (free_fl_value_input);




    function fl_value_input_get_input
           (V : in System.Address)
        return System.Address;
    pragma Import (C, fl_value_input_get_input, "fl_value_input_get_input");
    pragma Inline (fl_value_input_get_input);




    function fl_value_input_get_cursor_color
           (TD : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_value_input_get_cursor_color, "fl_value_input_get_cursor_color");
    pragma Inline (fl_value_input_get_cursor_color);

    procedure fl_value_input_set_cursor_color
           (TD : in System.Address;
            C  : in Interfaces.C.unsigned);
    pragma Import (C, fl_value_input_set_cursor_color, "fl_value_input_set_cursor_color");
    pragma Inline (fl_value_input_set_cursor_color);




    function fl_value_input_get_shortcut
           (B : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_value_input_get_shortcut, "fl_value_input_get_shortcut");
    pragma Inline (fl_value_input_get_shortcut);

    procedure fl_value_input_set_shortcut
           (B : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_value_input_set_shortcut, "fl_value_input_set_shortcut");
    pragma Inline (fl_value_input_set_shortcut);




    function fl_value_input_is_soft
           (A : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_value_input_is_soft, "fl_value_input_is_soft");
    pragma Inline (fl_value_input_is_soft);

    procedure fl_value_input_set_soft
           (A : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_value_input_set_soft, "fl_value_input_set_soft");
    pragma Inline (fl_value_input_set_soft);




    function fl_value_input_get_text_color
           (TD : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_value_input_get_text_color, "fl_value_input_get_text_color");
    pragma Inline (fl_value_input_get_text_color);

    procedure fl_value_input_set_text_color
           (TD : in System.Address;
            C  : in Interfaces.C.unsigned);
    pragma Import (C, fl_value_input_set_text_color, "fl_value_input_set_text_color");
    pragma Inline (fl_value_input_set_text_color);

    function fl_value_input_get_text_font
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_value_input_get_text_font, "fl_value_input_get_text_font");
    pragma Inline (fl_value_input_get_text_font);

    procedure fl_value_input_set_text_font
           (TD : in System.Address;
            F  : in Interfaces.C.int);
    pragma Import (C, fl_value_input_set_text_font, "fl_value_input_set_text_font");
    pragma Inline (fl_value_input_set_text_font);

    function fl_value_input_get_text_size
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_value_input_get_text_size, "fl_value_input_get_text_size");
    pragma Inline (fl_value_input_get_text_size);

    procedure fl_value_input_set_text_size
           (TD : in System.Address;
            S  : in Interfaces.C.int);
    pragma Import (C, fl_value_input_set_text_size, "fl_value_input_set_text_size");
    pragma Inline (fl_value_input_set_text_size);




    procedure fl_value_input_draw
           (W : in System.Address);
    pragma Import (C, fl_value_input_draw, "fl_value_input_draw");
    pragma Inline (fl_value_input_draw);

    function fl_value_input_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_value_input_handle, "fl_value_input_handle");
    pragma Inline (fl_value_input_handle);




    procedure Free is new Ada.Unchecked_Deallocation
        (INP.Input, Input_Access);




    procedure Finalize
           (This : in out Value_Input) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Value_Input'Class
        then
            free_fl_value_input (This.Void_Ptr);
            Free (This.My_Input);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Valuator (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Value_Input is
        begin
            return This : Value_Input do
                This.Void_Ptr := new_fl_value_input
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                value_input_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                value_input_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);

                This.My_Input := new INP.Input;
                Wrapper (This.My_Input.all).Void_Ptr :=
                    fl_value_input_get_input (This.Void_Ptr);
                Wrapper (This.My_Input.all).Needs_Dealloc := False;
            end return;
        end Create;

    end Forge;




    function Input
           (This : in Value_Input)
        return FLTK.Widgets.Inputs.Input_Reference is
    begin
        return (Data => This.My_Input);
    end Input;




    function Get_Cursor_Color
           (This : in Value_Input)
        return Color is
    begin
        return Color (fl_value_input_get_cursor_color (This.Void_Ptr));
    end Get_Cursor_Color;


    procedure Set_Cursor_Color
           (This : in out Value_Input;
            Col  : in     Color) is
    begin
        fl_value_input_set_cursor_color (This.Void_Ptr, Interfaces.C.unsigned (Col));
    end Set_Cursor_Color;




    function Get_Shortcut
           (This : in Value_Input)
        return Key_Combo is
    begin
        return To_Ada (Interfaces.C.unsigned_long (fl_value_input_get_shortcut (This.Void_Ptr)));
    end Get_Shortcut;


    procedure Set_Shortcut
           (This : in out Value_Input;
            Key  : in     Key_Combo) is
    begin
        fl_value_input_set_shortcut (This.Void_Ptr, Interfaces.C.int (To_C (Key)));
    end Set_Shortcut;




    function Is_Soft
           (This : in Value_Input)
        return Boolean is
    begin
        return fl_value_input_is_soft (This.Void_Ptr) /= 0;
    end Is_Soft;


    procedure Set_Soft
           (This : in out Value_Input;
            To   : in     Boolean) is
    begin
        fl_value_input_set_soft (This.Void_Ptr, Boolean'Pos (To));
    end Set_Soft;




    function Get_Text_Color
           (This : in Value_Input)
        return Color is
    begin
        return Color (fl_value_input_get_text_color (This.Void_Ptr));
    end Get_Text_Color;


    procedure Set_Text_Color
           (This : in out Value_Input;
            Col  : in     Color) is
    begin
        fl_value_input_set_text_color (This.Void_Ptr, Interfaces.C.unsigned (Col));
    end Set_Text_Color;


    function Get_Text_Font
           (This : in Value_Input)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_value_input_get_text_font (This.Void_Ptr));
    end Get_Text_Font;


    procedure Set_Text_Font
           (This : in out Value_Input;
            Font : in     Font_Kind) is
    begin
        fl_value_input_set_text_font (This.Void_Ptr, Font_Kind'Pos (Font));
    end Set_Text_Font;


    function Get_Text_Size
           (This : in Value_Input)
        return Font_Size is
    begin
        return Font_Size (fl_value_input_get_text_size (This.Void_Ptr));
    end Get_Text_Size;


    procedure Set_Text_Size
           (This : in out Value_Input;
            Size : in     Font_Size) is
    begin
        fl_value_input_set_text_size (This.Void_Ptr, Interfaces.C.int (Size));
    end Set_Text_Size;




    procedure Draw
           (This : in out Value_Input) is
    begin
        fl_value_input_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Value_Input;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_value_input_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Value_Inputs;

