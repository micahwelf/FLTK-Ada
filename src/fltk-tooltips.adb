

with

    Interfaces.C,
    System.Address_To_Access_Conversions;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Tooltips is


    function fl_tooltip_get_current
        return System.Address;
    pragma Import (C, fl_tooltip_get_current, "fl_tooltip_get_current");
    pragma Inline (fl_tooltip_get_current);

    procedure fl_tooltip_set_current
           (I : in System.Address);
    pragma Import (C, fl_tooltip_set_current, "fl_tooltip_set_current");
    pragma Inline (fl_tooltip_set_current);

    function fl_tooltip_enabled
        return Interfaces.C.int;
    pragma Import (C, fl_tooltip_enabled, "fl_tooltip_enabled");
    pragma Inline (fl_tooltip_enabled);

    procedure fl_tooltip_enable
           (V : in Interfaces.C.int);
    pragma Import (C, fl_tooltip_enable, "fl_tooltip_enable");
    pragma Inline (fl_tooltip_enable);

    procedure fl_tooltip_enter_area
           (I          : in System.Address;
            X, Y, W, H : in Interfaces.C.int;
            T          : in Interfaces.C.char_array);
    pragma Import (C, fl_tooltip_enter_area, "fl_tooltip_enter_area");
    pragma Inline (fl_tooltip_enter_area);




    function fl_tooltip_get_delay
        return Interfaces.C.C_float;
    pragma Import (C, fl_tooltip_get_delay, "fl_tooltip_get_delay");
    pragma Inline (fl_tooltip_get_delay);

    procedure fl_tooltip_set_delay
           (V : in Interfaces.C.C_float);
    pragma Import (C, fl_tooltip_set_delay, "fl_tooltip_set_delay");
    pragma Inline (fl_tooltip_set_delay);

    function fl_tooltip_get_hoverdelay
        return Interfaces.C.C_float;
    pragma Import (C, fl_tooltip_get_hoverdelay, "fl_tooltip_get_hoverdelay");
    pragma Inline (fl_tooltip_get_hoverdelay);

    procedure fl_tooltip_set_hoverdelay
           (V : in Interfaces.C.C_float);
    pragma Import (C, fl_tooltip_set_hoverdelay, "fl_tooltip_set_hoverdelay");
    pragma Inline (fl_tooltip_set_hoverdelay);




    function fl_tooltip_get_color
        return Interfaces.C.unsigned;
    pragma Import (C, fl_tooltip_get_color, "fl_tooltip_get_color");
    pragma Inline (fl_tooltip_get_color);

    procedure fl_tooltip_set_color
           (V : in Interfaces.C.unsigned);
    pragma Import (C, fl_tooltip_set_color, "fl_tooltip_set_color");
    pragma Inline (fl_tooltip_set_color);

    function fl_tooltip_get_margin_height
        return Interfaces.C.int;
    pragma Import (C, fl_tooltip_get_margin_height, "fl_tooltip_get_margin_height");
    pragma Inline (fl_tooltip_get_margin_height);

    --  procedure fl_tooltip_set_margin_height
    --         (V : in Interfaces.C.int);
    --  pragma Import (C, fl_tooltip_set_margin_height, "fl_tooltip_set_margin_height");
    --  pragma Inline (fl_tooltip_set_margin_height);

    function fl_tooltip_get_margin_width
        return Interfaces.C.int;
    pragma Import (C, fl_tooltip_get_margin_width, "fl_tooltip_get_margin_width");
    pragma Inline (fl_tooltip_get_margin_width);

    --  procedure fl_tooltip_set_margin_width
    --         (V : in Interfaces.C.int);
    --  pragma Import (C, fl_tooltip_set_margin_width, "fl_tooltip_set_margin_width");
    --  pragma Inline (fl_tooltip_set_margin_width);

    function fl_tooltip_get_wrap_width
        return Interfaces.C.int;
    pragma Import (C, fl_tooltip_get_wrap_width, "fl_tooltip_get_wrap_width");
    pragma Inline (fl_tooltip_get_wrap_width);

    --  procedure fl_tooltip_set_wrap_width
    --         (V : in Interfaces.C.int);
    --  pragma Import (C, fl_tooltip_set_wrap_width, "fl_tooltip_set_wrap_width");
    --  pragma Inline (fl_tooltip_set_wrap_width);




    function fl_tooltip_get_textcolor
        return Interfaces.C.unsigned;
    pragma Import (C, fl_tooltip_get_textcolor, "fl_tooltip_get_textcolor");
    pragma Inline (fl_tooltip_get_textcolor);

    procedure fl_tooltip_set_textcolor
           (V : in Interfaces.C.unsigned);
    pragma Import (C, fl_tooltip_set_textcolor, "fl_tooltip_set_textcolor");
    pragma Inline (fl_tooltip_set_textcolor);

    function fl_tooltip_get_font
        return Interfaces.C.int;
    pragma Import (C, fl_tooltip_get_font, "fl_tooltip_get_font");
    pragma Inline (fl_tooltip_get_font);

    procedure fl_tooltip_set_font
           (V : in Interfaces.C.int);
    pragma Import (C, fl_tooltip_set_font, "fl_tooltip_set_font");
    pragma Inline (fl_tooltip_set_font);

    function fl_tooltip_get_size
        return Interfaces.C.int;
    pragma Import (C, fl_tooltip_get_size, "fl_tooltip_get_size");
    pragma Inline (fl_tooltip_get_size);

    procedure fl_tooltip_set_size
           (V : in Interfaces.C.int);
    pragma Import (C, fl_tooltip_set_size, "fl_tooltip_set_size");
    pragma Inline (fl_tooltip_set_size);




    function fl_widget_get_user_data
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_get_user_data, "fl_widget_get_user_data");
    pragma Inline (fl_widget_get_user_data);

    package Widget_Convert is new
        System.Address_To_Access_Conversions (FLTK.Widgets.Widget'Class);




    function Get_Target
        return access FLTK.Widgets.Widget'Class
    is
        Widget_Ptr : System.Address := fl_tooltip_get_current;
    begin
        if Widget_Ptr /= System.Null_Address then
            return Widget_Convert.To_Pointer (fl_widget_get_user_data (Widget_Ptr));
        else
            return null;
        end if;
    end Get_Target;


    procedure Set_Target
           (To : in FLTK.Widgets.Widget'Class) is
    begin
        fl_tooltip_set_current (Wrapper (To).Void_Ptr);
    end Set_Target;


    function Is_Enabled
        return Boolean is
    begin
        return fl_tooltip_enabled /= 0;
    end Is_Enabled;


    procedure Set_Enabled
           (To : in Boolean) is
    begin
        fl_tooltip_enable (Boolean'Pos (To));
    end Set_Enabled;


    procedure Enter_Area
           (Item       : in FLTK.Widgets.Widget'Class;
            X, Y, W, H : in Integer;
            Tip        : in String) is
    begin
        fl_tooltip_enter_area
           (Wrapper (Item).Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.To_C (Tip));
    end Enter_Area;




    function Get_Delay
        return Float is
    begin
        return Float (fl_tooltip_get_delay);
    end Get_Delay;


    procedure Set_Delay
           (To : in Float) is
    begin
        fl_tooltip_set_delay (Interfaces.C.C_float (To));
    end Set_Delay;


    function Get_Hover_Delay
        return Float is
    begin
        return Float (fl_tooltip_get_hoverdelay);
    end Get_Hover_Delay;


    procedure Set_Hover_Delay
           (To : in Float) is
    begin
        fl_tooltip_set_hoverdelay (Interfaces.C.C_float (To));
    end Set_Hover_Delay;




    function Get_Background_Color
        return Color is
    begin
        return Color (fl_tooltip_get_color);
    end Get_Background_Color;


    procedure Set_Background_Color
           (To : in Color) is
    begin
        fl_tooltip_set_color (Interfaces.C.unsigned (To));
    end Set_Background_Color;


    function Get_Margin_Height
        return Natural is
    begin
        return Natural (fl_tooltip_get_margin_height);
    end Get_Margin_Height;


    --  procedure Set_Margin_Height
    --         (To : in Natural) is
    --  begin
    --      fl_tooltip_set_margin_height (Interfaces.C.int (To));
    --  end Set_Margin_Height;


    function Get_Margin_Width
        return Natural is
    begin
        return Natural (fl_tooltip_get_margin_width);
    end Get_Margin_Width;


    --  procedure Set_Margin_Width
    --         (To : in Natural) is
    --  begin
    --      fl_tooltip_set_margin_width (Interfaces.C.int (To));
    --  end Set_Margin_Width;


    function Get_Wrap_Width
        return Natural is
    begin
        return Natural (fl_tooltip_get_wrap_width);
    end Get_Wrap_Width;


    --  procedure Set_Wrap_Width
    --         (To : in Natural) is
    --  begin
    --      fl_tooltip_set_wrap_width (Interfaces.C.int (To));
    --  end Set_Wrap_Width;




    function Get_Text_Color
        return Color is
    begin
        return Color (fl_tooltip_get_textcolor);
    end Get_Text_Color;


    procedure Set_Text_Color
           (To : in Color) is
    begin
        fl_tooltip_set_textcolor (Interfaces.C.unsigned (To));
    end Set_Text_Color;


    function Get_Text_Font
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_tooltip_get_font);
    end Get_Text_Font;


    procedure Set_Text_Font
           (To : in Font_Kind) is
    begin
        fl_tooltip_set_font (Font_Kind'Pos (To));
    end Set_Text_Font;


    function Get_Text_Size
        return Font_Size is
    begin
        return Font_Size (fl_tooltip_get_size);
    end Get_Text_Size;


    procedure Set_Text_Size
           (To : in Font_Size) is
    begin
        fl_tooltip_set_size (Interfaces.C.int (To));
    end Set_Text_Size;


end FLTK.Tooltips;

