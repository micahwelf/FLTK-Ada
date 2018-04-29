

with

    Interfaces.C,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Widgets.Groups.Color_Choosers is


    procedure color_chooser_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, color_chooser_set_draw_hook, "color_chooser_set_draw_hook");
    pragma Inline (color_chooser_set_draw_hook);

    procedure color_chooser_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, color_chooser_set_handle_hook, "color_chooser_set_handle_hook");
    pragma Inline (color_chooser_set_handle_hook);




    function new_fl_color_chooser
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_color_chooser, "new_fl_color_chooser");
    pragma Inline (new_fl_color_chooser);

    procedure free_fl_color_chooser
           (W : in System.Address);
    pragma Import (C, free_fl_color_chooser, "free_fl_color_chooser");
    pragma Inline (free_fl_color_chooser);




    function fl_color_chooser_r
           (N : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_color_chooser_r, "fl_color_chooser_r");
    pragma Inline (fl_color_chooser_r);

    function fl_color_chooser_g
           (N : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_color_chooser_g, "fl_color_chooser_g");
    pragma Inline (fl_color_chooser_g);

    function fl_color_chooser_b
           (N : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_color_chooser_b, "fl_color_chooser_b");
    pragma Inline (fl_color_chooser_b);

    function fl_color_chooser_rgb
           (N       : in System.Address;
            R, G, B : in Interfaces.C.double)
        return Interfaces.C.int;
    pragma Import (C, fl_color_chooser_rgb, "fl_color_chooser_rgb");
    pragma Inline (fl_color_chooser_rgb);




    function fl_color_chooser_hue
           (N : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_color_chooser_hue, "fl_color_chooser_hue");
    pragma Inline (fl_color_chooser_hue);

    function fl_color_chooser_saturation
           (N : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_color_chooser_saturation, "fl_color_chooser_saturation");
    pragma Inline (fl_color_chooser_saturation);

    function fl_color_chooser_value
           (N : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_color_chooser_value, "fl_color_chooser_value");
    pragma Inline (fl_color_chooser_value);

    function fl_color_chooser_hsv
           (N       : in System.Address;
            H, S, V : in Interfaces.C.double)
        return Interfaces.C.int;
    pragma Import (C, fl_color_chooser_hsv, "fl_color_chooser_hsv");
    pragma Inline (fl_color_chooser_hsv);




    procedure fl_color_chooser_hsv2rgb
           (H, S, V : in     Interfaces.C.double;
            R, G, B :    out Interfaces.C.double);
    pragma Import (C, fl_color_chooser_hsv2rgb, "fl_color_chooser_hsv2rgb");
    pragma Inline (fl_color_chooser_hsv2rgb);

    procedure fl_color_chooser_rgb2hsv
           (R, G, B : in     Interfaces.C.double;
            H, S, V :    out Interfaces.C.double);
    pragma Import (C, fl_color_chooser_rgb2hsv, "fl_color_chooser_rgb2hsv");
    pragma Inline (fl_color_chooser_rgb2hsv);




    function fl_color_chooser_get_mode
           (N : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_color_chooser_get_mode, "fl_color_chooser_get_mode");
    pragma Inline (fl_color_chooser_get_mode);

    procedure fl_color_chooser_set_mode
           (N : in System.Address;
            M : in Interfaces.C.int);
    pragma Import (C, fl_color_chooser_set_mode, "fl_color_chooser_set_mode");
    pragma Inline (fl_color_chooser_set_mode);




    procedure fl_color_chooser_draw
           (W : in System.Address);
    pragma Import (C, fl_color_chooser_draw, "fl_color_chooser_draw");
    pragma Inline (fl_color_chooser_draw);

    function fl_color_chooser_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_color_chooser_handle, "fl_color_chooser_handle");
    pragma Inline (fl_color_chooser_handle);




    procedure Finalize
           (This : in out Color_Chooser) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Color_Chooser'Class
        then
            This.Clear;
            free_fl_color_chooser (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Group (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Color_Chooser is
        begin
            return This : Color_Chooser do
                This.Void_Ptr := new_fl_color_chooser
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_group_end (This.Void_Ptr);
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                color_chooser_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                color_chooser_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_Red
           (This : in Color_Chooser)
        return Long_Float is
    begin
        return Long_Float (fl_color_chooser_r (This.Void_Ptr));
    end Get_Red;


    function Get_Green
           (This : in Color_Chooser)
        return Long_Float is
    begin
        return Long_Float (fl_color_chooser_g (This.Void_Ptr));
    end Get_Green;


    function Get_Blue
           (This : in Color_Chooser)
        return Long_Float is
    begin
        return Long_Float (fl_color_chooser_b (This.Void_Ptr));
    end Get_Blue;


    procedure Set_RGB
           (This    : in out Color_Chooser;
            R, G, B : in     Long_Float) is
    begin
        This.Was_Changed := fl_color_chooser_rgb
           (This.Void_Ptr,
            Interfaces.C.double (R),
            Interfaces.C.double (G),
            Interfaces.C.double (B)) /= 0;
    end Set_RGB;




    function Get_Hue
           (This : in Color_Chooser)
        return Long_Float is
    begin
        return Long_Float (fl_color_chooser_hue (This.Void_Ptr));
    end Get_Hue;


    function Get_Saturation
           (This : in Color_Chooser)
        return Long_Float is
    begin
        return Long_Float (fl_color_chooser_saturation (This.Void_Ptr));
    end Get_Saturation;


    function Get_Value
           (This : in Color_Chooser)
        return Long_Float is
    begin
        return Long_Float (fl_color_chooser_value (This.Void_Ptr));
    end Get_Value;


    procedure Set_HSV
           (This    : in out Color_Chooser;
            H, S, V : in     Long_Float) is
    begin
        This.Was_Changed := fl_color_chooser_hsv
           (This.Void_Ptr,
            Interfaces.C.double (H),
            Interfaces.C.double (S),
            Interfaces.C.double (V)) /= 0;
    end Set_HSV;




    procedure HSV_To_RGB
           (H, S, V : in     Long_Float;
            R, G, B :    out Long_Float) is
    begin
        fl_color_chooser_hsv2rgb
           (Interfaces.C.double (H),
            Interfaces.C.double (S),
            Interfaces.C.double (V),
            Interfaces.C.double (R),
            Interfaces.C.double (G),
            Interfaces.C.double (B));
    end HSV_To_RGB;


    procedure RGB_To_HSV
           (R, G, B : in     Long_Float;
            H, S, V :    out Long_Float) is
    begin
        fl_color_chooser_rgb2hsv
           (Interfaces.C.double (R),
            Interfaces.C.double (G),
            Interfaces.C.double (B),
            Interfaces.C.double (H),
            Interfaces.C.double (S),
            Interfaces.C.double (V));
    end RGB_To_HSV;




    function Color_Was_Changed
           (This : in Color_Chooser)
        return Boolean is
    begin
        return This.Was_Changed;
    end Color_Was_Changed;


    procedure Clear_Changed
           (This : in out Color_Chooser) is
    begin
        This.Was_Changed := False;
    end Clear_Changed;




    function Get_Mode
           (This : in Color_Chooser)
        return Color_Mode is
    begin
        return Color_Mode'Val (fl_color_chooser_get_mode (This.Void_Ptr));
    end Get_Mode;


    procedure Set_Mode
           (This : in out Color_Chooser;
            To   : in     Color_Mode) is
    begin
        fl_color_chooser_set_mode (This.Void_Ptr, Color_Mode'Pos (To));
    end Set_Mode;




    procedure Draw
           (This : in out Color_Chooser) is
    begin
        fl_color_chooser_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Color_Chooser;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_color_chooser_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Color_Choosers;

