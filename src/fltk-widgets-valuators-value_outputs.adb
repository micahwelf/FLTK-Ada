

with

    Interfaces.C.Strings,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Widgets.Valuators.Value_Outputs is


    procedure value_output_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, value_output_set_draw_hook, "value_output_set_draw_hook");
    pragma Inline (value_output_set_draw_hook);

    procedure value_output_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, value_output_set_handle_hook, "value_output_set_handle_hook");
    pragma Inline (value_output_set_handle_hook);




    function new_fl_value_output
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_value_output, "new_fl_value_output");
    pragma Inline (new_fl_value_output);

    procedure free_fl_value_output
           (A : in System.Address);
    pragma Import (C, free_fl_value_output, "free_fl_value_output");
    pragma Inline (free_fl_value_output);




    function fl_value_output_is_soft
           (A : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_value_output_is_soft, "fl_value_output_is_soft");
    pragma Inline (fl_value_output_is_soft);

    procedure fl_value_output_set_soft
           (A : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_value_output_set_soft, "fl_value_output_set_soft");
    pragma Inline (fl_value_output_set_soft);




    function fl_value_output_get_text_color
           (TD : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_value_output_get_text_color, "fl_value_output_get_text_color");
    pragma Inline (fl_value_output_get_text_color);

    procedure fl_value_output_set_text_color
           (TD : in System.Address;
            C  : in Interfaces.C.unsigned);
    pragma Import (C, fl_value_output_set_text_color, "fl_value_output_set_text_color");
    pragma Inline (fl_value_output_set_text_color);

    function fl_value_output_get_text_font
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_value_output_get_text_font, "fl_value_output_get_text_font");
    pragma Inline (fl_value_output_get_text_font);

    procedure fl_value_output_set_text_font
           (TD : in System.Address;
            F  : in Interfaces.C.int);
    pragma Import (C, fl_value_output_set_text_font, "fl_value_output_set_text_font");
    pragma Inline (fl_value_output_set_text_font);

    function fl_value_output_get_text_size
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_value_output_get_text_size, "fl_value_output_get_text_size");
    pragma Inline (fl_value_output_get_text_size);

    procedure fl_value_output_set_text_size
           (TD : in System.Address;
            S  : in Interfaces.C.int);
    pragma Import (C, fl_value_output_set_text_size, "fl_value_output_set_text_size");
    pragma Inline (fl_value_output_set_text_size);




    procedure fl_value_output_draw
           (W : in System.Address);
    pragma Import (C, fl_value_output_draw, "fl_value_output_draw");
    pragma Inline (fl_value_output_draw);

    function fl_value_output_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_value_output_handle, "fl_value_output_handle");
    pragma Inline (fl_value_output_handle);




    procedure Finalize
           (This : in out Value_Output) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Value_Output'Class
        then
            free_fl_value_output (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Valuator (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Value_Output is
        begin
            return This : Value_Output do
                This.Void_Ptr := new_fl_value_output
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                value_output_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                value_output_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Is_Soft
           (This : in Value_Output)
        return Boolean is
    begin
        return fl_value_output_is_soft (This.Void_Ptr) /= 0;
    end Is_Soft;


    procedure Set_Soft
           (This : in out Value_Output;
            To   : in     Boolean) is
    begin
        fl_value_output_set_soft (This.Void_Ptr, Boolean'Pos (To));
    end Set_Soft;




    function Get_Text_Color
           (This : in Value_Output)
        return Color is
    begin
        return Color (fl_value_output_get_text_color (This.Void_Ptr));
    end Get_Text_Color;


    procedure Set_Text_Color
           (This : in out Value_Output;
            Col  : in     Color) is
    begin
        fl_value_output_set_text_color (This.Void_Ptr, Interfaces.C.unsigned (Col));
    end Set_Text_Color;


    function Get_Text_Font
           (This : in Value_Output)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_value_output_get_text_font (This.Void_Ptr));
    end Get_Text_Font;


    procedure Set_Text_Font
           (This : in out Value_Output;
            Font : in     Font_Kind) is
    begin
        fl_value_output_set_text_font (This.Void_Ptr, Font_Kind'Pos (Font));
    end Set_Text_Font;


    function Get_Text_Size
           (This : in Value_Output)
        return Font_Size is
    begin
        return Font_Size (fl_value_output_get_text_size (This.Void_Ptr));
    end Get_Text_Size;


    procedure Set_Text_Size
           (This : in out Value_Output;
            Size : in     Font_Size) is
    begin
        fl_value_output_set_text_size (This.Void_Ptr, Interfaces.C.int (Size));
    end Set_Text_Size;




    procedure Draw
           (This : in out Value_Output) is
    begin
        fl_value_output_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Value_Output;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_value_output_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Value_Outputs;

