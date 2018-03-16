

with

    Interfaces.C,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Widgets.Groups.Spinners is


    procedure spinner_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, spinner_set_draw_hook, "spinner_set_draw_hook");

    procedure spinner_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, spinner_set_handle_hook, "spinner_set_handle_hook");




    function new_fl_spinner
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_spinner, "new_fl_spinner");

    procedure free_fl_spinner
           (W : in System.Address);
    pragma Import (C, free_fl_spinner, "free_fl_spinner");




    function fl_spinner_get_color
           (S : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_spinner_get_color, "fl_spinner_get_color");

    procedure fl_spinner_set_color
           (S : in System.Address;
            C : in Interfaces.C.unsigned);
    pragma Import (C, fl_spinner_set_color, "fl_spinner_set_color");

    function fl_spinner_get_selection_color
           (S : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_spinner_get_selection_color, "fl_spinner_get_selection_color");

    procedure fl_spinner_set_selection_color
           (S : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_spinner_set_selection_color, "fl_spinner_set_selection_color");

    function fl_spinner_get_textcolor
           (S : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_spinner_get_textcolor, "fl_spinner_get_textcolor");

    procedure fl_spinner_set_textcolor
           (S : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_spinner_set_textcolor, "fl_spinner_set_textcolor");

    function fl_spinner_get_textfont
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_spinner_get_textfont, "fl_spinner_get_textfont");

    procedure fl_spinner_set_textfont
           (S : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_spinner_set_textfont, "fl_spinner_set_textfont");

    function fl_spinner_get_textsize
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_spinner_get_textsize, "fl_spinner_get_textsize");

    procedure fl_spinner_set_textsize
           (S : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_spinner_set_textsize, "fl_spinner_set_textsize");




    function fl_spinner_get_minimum
           (S : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_spinner_get_minimum, "fl_spinner_get_minimum");

    procedure fl_spinner_set_minimum
           (S : in System.Address;
            T : in Interfaces.C.double);
    pragma Import (C, fl_spinner_set_minimum, "fl_spinner_set_minimum");

    function fl_spinner_get_maximum
           (S : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_spinner_get_maximum, "fl_spinner_get_maximum");

    procedure fl_spinner_set_maximum
           (S : in System.Address;
            T : in Interfaces.C.double);
    pragma Import (C, fl_spinner_set_maximum, "fl_spinner_set_maximum");

    procedure fl_spinner_range
           (S    : in System.Address;
            A, B : in Interfaces.C.double);
    pragma Import (C, fl_spinner_range, "fl_spinner_range");

    function fl_spinner_get_step
           (S : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_spinner_get_step, "fl_spinner_get_step");

    procedure fl_spinner_set_step
           (S : in System.Address;
            T : in Interfaces.C.double);
    pragma Import (C, fl_spinner_set_step, "fl_spinner_set_step");

    function fl_spinner_get_type
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_spinner_get_type, "fl_spinner_get_type");

    procedure fl_spinner_set_type
           (S : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_spinner_set_type, "fl_spinner_set_type");

    function fl_spinner_get_value
           (S : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_spinner_get_value, "fl_spinner_get_value");

    procedure fl_spinner_set_value
           (S : in System.Address;
            T : in Interfaces.C.double);
    pragma Import (C, fl_spinner_set_value, "fl_spinner_set_value");




    procedure fl_spinner_draw
           (W : in System.Address);
    pragma Import (C, fl_spinner_draw, "fl_spinner_draw");

    function fl_spinner_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_spinner_handle, "fl_spinner_handle");




    procedure Finalize
           (This : in out Spinner) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Spinner'Class
        then
            This.Clear;
            free_fl_spinner (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Group (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Spinner is
        begin
            return This : Spinner do
                This.Void_Ptr := new_fl_spinner
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_group_end (This.Void_Ptr);
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                spinner_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                spinner_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_Background_Color
           (This : in Spinner)
        return Color is
    begin
        return Color (fl_spinner_get_color (This.Void_Ptr));
    end Get_Background_Color;


    procedure Set_Background_Color
           (This : in out Spinner;
            To   : in     Color) is
    begin
        fl_spinner_set_color (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Background_Color;


    function Get_Select_Color
           (This : in Spinner)
        return Color is
    begin
        return Color (fl_spinner_get_selection_color (This.Void_Ptr));
    end Get_Select_Color;


    procedure Set_Select_Color
           (This : in out Spinner;
            To   : in     Color) is
    begin
        fl_spinner_set_selection_color (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Select_Color;


    function Get_Text_Color
           (This : in Spinner)
        return Color is
    begin
        return Color (fl_spinner_get_textcolor (This.Void_Ptr));
    end Get_Text_Color;


    procedure Set_Text_Color
           (This : in out Spinner;
            To   : in     Color) is
    begin
        fl_spinner_set_textcolor (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Text_Color;


    function Get_Text_Font
           (This : in Spinner)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_spinner_get_textfont (This.Void_Ptr));
    end Get_Text_Font;


    procedure Set_Text_Font
           (This : in out Spinner;
            To   : in     Font_Kind) is
    begin
        fl_spinner_set_textfont (This.Void_Ptr, Font_Kind'Pos (To));
    end Set_Text_Font;


    function Get_Text_Size
           (This : in Spinner)
        return Font_Size is
    begin
        return Font_Size (fl_spinner_get_textsize (This.Void_Ptr));
    end Get_Text_Size;


    procedure Set_Text_Size
           (This : in out Spinner;
            To   : in     Font_Size) is
    begin
        fl_spinner_set_textsize (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Text_Size;




    function Get_Minimum
           (This : in Spinner)
        return Long_Float is
    begin
        return Long_Float (fl_spinner_get_minimum (This.Void_Ptr));
    end Get_Minimum;


    procedure Set_Minimum
           (This : in out Spinner;
            To   : in     Long_Float) is
    begin
        fl_spinner_set_minimum (This.Void_Ptr, Interfaces.C.double (To));
    end Set_Minimum;


    function Get_Maximum
           (This : in Spinner)
        return Long_Float is
    begin
        return Long_Float (fl_spinner_get_maximum (This.Void_Ptr));
    end Get_Maximum;


    procedure Set_Maximum
           (This : in out Spinner;
            To   : in     Long_Float) is
    begin
        fl_spinner_set_maximum (This.Void_Ptr, Interfaces.C.double (To));
    end Set_Maximum;


    procedure Set_Range
           (This     : in out Spinner;
            Min, Max : in     Long_Float) is
    begin
        fl_spinner_range
           (This.Void_Ptr,
            Interfaces.C.double (Min),
            Interfaces.C.double (Max));
    end Set_Range;


    function Get_Step
           (This : in Spinner)
        return Long_Float is
    begin
        return Long_Float (fl_spinner_get_step (This.Void_Ptr));
    end Get_Step;


    procedure Set_Step
           (This : in out Spinner;
            To   : in     Long_Float) is
    begin
        fl_spinner_set_step (This.Void_Ptr, Interfaces.C.double (To));
    end Set_Step;


    function Get_Type
           (This : in Spinner)
        return Spinner_Kind is
    begin
        return Spinner_Kind'Val (fl_spinner_get_type (This.Void_Ptr) - 1);
    end Get_Type;


    procedure Set_Type
           (This : in out Spinner;
            To   : in     Spinner_Kind) is
    begin
        fl_spinner_set_type (This.Void_Ptr, Spinner_Kind'Pos (To) + 1);
    end Set_Type;


    function Get_Value
           (This : in Spinner)
        return Long_Float is
    begin
        return Long_Float (fl_spinner_get_value (This.Void_Ptr));
    end Get_Value;


    procedure Set_Value
           (This : in out Spinner;
            To   : in     Long_Float) is
    begin
        fl_spinner_set_value (This.Void_Ptr, Interfaces.C.double (To));
    end Set_Value;




    procedure Draw
           (This : in out Spinner) is
    begin
        fl_spinner_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Spinner;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_spinner_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Spinners;

