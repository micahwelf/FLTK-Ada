

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Sliders.Value is


    procedure value_slider_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, value_slider_set_draw_hook, "value_slider_set_draw_hook");

    procedure value_slider_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, value_slider_set_handle_hook, "value_slider_set_handle_hook");




    function new_fl_value_slider
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_value_slider, "new_fl_value_slider");

    procedure free_fl_value_slider
           (D : in System.Address);
    pragma Import (C, free_fl_value_slider, "free_fl_value_slider");




    function fl_value_slider_get_textcolor
           (S : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_value_slider_get_textcolor, "fl_value_slider_get_textcolor");

    procedure fl_value_slider_set_textcolor
           (S : in System.Address;
            C : in Interfaces.C.unsigned);
    pragma Import (C, fl_value_slider_set_textcolor, "fl_value_slider_set_textcolor");

    function fl_value_slider_get_textfont
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_value_slider_get_textfont, "fl_value_slider_get_textfont");

    procedure fl_value_slider_set_textfont
           (S : in System.Address;
            F : in Interfaces.C.int);
    pragma Import (C, fl_value_slider_set_textfont, "fl_value_slider_set_textfont");

    function fl_value_slider_get_textsize
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_value_slider_get_textsize, "fl_value_slider_get_textsize");

    procedure fl_value_slider_set_textsize
           (S : in System.Address;
            F : in Interfaces.C.int);
    pragma Import (C, fl_value_slider_set_textsize, "fl_value_slider_set_textsize");




    procedure fl_value_slider_draw
           (W : in System.Address);
    pragma Import (C, fl_value_slider_draw, "fl_value_slider_draw");

    function fl_value_slider_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_value_slider_handle, "fl_value_slider_handle");




    procedure Finalize
           (This : in out Value_Slider) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Value_Slider'Class
        then
            free_fl_value_slider (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Slider (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Value_Slider is
        begin
            return This : Value_Slider do
                This.Void_Ptr := new_fl_value_slider
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                value_slider_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                value_slider_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_Text_Color
           (This : in Value_Slider)
        return Color is
    begin
        return Color (fl_value_slider_get_textcolor (This.Void_Ptr));
    end Get_Text_Color;


    procedure Set_Text_Color
           (This : in out Value_Slider;
            To   : in     Color) is
    begin
        fl_value_slider_set_textcolor (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Text_Color;


    function Get_Text_Font
           (This : in Value_Slider)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_value_slider_get_textfont (This.Void_Ptr));
    end Get_Text_Font;


    procedure Set_Text_Font
           (This : in out Value_Slider;
            To   : in     Font_Kind) is
    begin
        fl_value_slider_set_textfont (This.Void_Ptr, Font_Kind'Pos (To));
    end Set_Text_Font;


    function Get_Text_Size
           (This : in Value_Slider)
        return Font_Size is
    begin
        return Font_Size (fl_value_slider_get_textsize (This.Void_Ptr));
    end Get_Text_Size;


    procedure Set_Text_Size
           (This : in out Value_Slider;
            To   : in     Font_Size) is
    begin
        fl_value_slider_set_textsize (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Text_Size;




    procedure Draw
           (This : in out Value_Slider) is
    begin
        fl_value_slider_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Value_Slider;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_value_slider_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Sliders.Value;

