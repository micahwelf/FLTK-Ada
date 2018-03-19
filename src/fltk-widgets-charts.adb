

with

    Interfaces.C,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Widgets.Charts is


    procedure chart_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, chart_set_draw_hook, "chart_set_draw_hook");

    procedure chart_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, chart_set_handle_hook, "chart_set_handle_hook");




    function new_fl_chart
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_chart, "new_fl_chart");

    procedure free_fl_chart
           (B : in System.Address);
    pragma Import (C, free_fl_chart, "free_fl_chart");




    procedure fl_chart_add
           (C : in System.Address;
            V : in Interfaces.C.double;
            L : in Interfaces.C.char_array;
            P : in Interfaces.C.unsigned);
    pragma Import (C, fl_chart_add, "fl_chart_add");

    procedure fl_chart_insert
           (C : in System.Address;
            I : in Interfaces.C.int;
            V : in Interfaces.C.double;
            L : in Interfaces.C.char_array;
            P : in Interfaces.C.unsigned);
    pragma Import (C, fl_chart_insert, "fl_chart_insert");

    procedure fl_chart_replace
           (C : in System.Address;
            I : in Interfaces.C.int;
            V : in Interfaces.C.double;
            L : in Interfaces.C.char_array;
            P : in Interfaces.C.unsigned);
    pragma Import (C, fl_chart_replace, "fl_chart_replace");

    procedure fl_chart_clear
           (C : in System.Address);
    pragma Import (C, fl_chart_clear, "fl_chart_clear");




    function fl_chart_get_autosize
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_chart_get_autosize, "fl_chart_get_autosize");

    procedure fl_chart_set_autosize
           (C : in System.Address;
            A : in Interfaces.C.int);
    pragma Import (C, fl_chart_set_autosize, "fl_chart_set_autosize");

    procedure fl_chart_get_bounds
           (C    : in     System.Address;
            L, U :    out Interfaces.C.double);
    pragma Import (C, fl_chart_get_bounds, "fl_chart_get_bounds");

    procedure fl_chart_set_bounds
           (C    : in System.Address;
            L, U : in Interfaces.C.double);
    pragma Import (C, fl_chart_set_bounds, "fl_chart_set_bounds");

    function fl_chart_get_maxsize
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_chart_get_maxsize, "fl_chart_get_maxsize");

    procedure fl_chart_set_maxsize
           (C : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_chart_set_maxsize, "fl_chart_set_maxsize");

    function fl_chart_size
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_chart_size, "fl_chart_size");




    function fl_chart_get_textcolor
           (C : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_chart_get_textcolor, "fl_chart_get_textcolor");

    procedure fl_chart_set_textcolor
           (C : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_chart_set_textcolor, "fl_chart_set_textcolor");

    function fl_chart_get_textfont
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_chart_get_textfont, "fl_chart_get_textfont");

    procedure fl_chart_set_textfont
           (C : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_chart_set_textfont, "fl_chart_set_textfont");

    function fl_chart_get_textsize
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_chart_get_textsize, "fl_chart_get_textsize");

    procedure fl_chart_set_textsize
           (C : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_chart_set_textsize, "fl_chart_set_textsize");




    procedure fl_chart_draw
           (W : in System.Address);
    pragma Import (C, fl_chart_draw, "fl_chart_draw");

    function fl_chart_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_chart_handle, "fl_chart_handle");




    procedure Finalize
           (This : in out Chart) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Chart'Class
        then
            free_fl_chart (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Widget (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Chart is
        begin
            return This : Chart do
                This.Void_Ptr := new_fl_chart
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                chart_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                chart_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Add
           (This       : in out Chart;
            Data_Value : in     Long_Float;
            Data_Label : in     String := "";
            Data_Color : in     Color := No_Color) is
    begin
        fl_chart_add
           (This.Void_Ptr,
            Interfaces.C.double (Data_Value),
            Interfaces.C.To_C (Data_Label),
            Interfaces.C.unsigned (Data_Color));
    end Add;


    procedure Insert
           (This       : in out Chart;
            Position   : in     Natural;
            Data_Value : in     Long_Float;
            Data_Label : in     String := "";
            Data_Color : in     Color := No_Color) is
    begin
        fl_chart_insert
           (This.Void_Ptr,
            Interfaces.C.int (Position),
            Interfaces.C.double (Data_Value),
            Interfaces.C.To_C (Data_Label),
            Interfaces.C.unsigned (Data_Color));
    end Insert;


    procedure Replace
           (This       : in out Chart;
            Position   : in     Natural;
            Data_Value : in     Long_Float;
            Data_Label : in     String := "";
            Data_Color : in     Color := No_Color) is
    begin
        fl_chart_replace
           (This.Void_Ptr,
            Interfaces.C.int (Position),
            Interfaces.C.double (Data_Value),
            Interfaces.C.To_C (Data_Label),
            Interfaces.C.unsigned (Data_Color));
    end Replace;


    procedure Clear
           (This : in out Chart) is
    begin
        fl_chart_clear (This.Void_Ptr);
    end Clear;




    function Will_Autosize
           (This : in Chart)
        return Boolean is
    begin
        return fl_chart_get_autosize (This.Void_Ptr) /= 0;
    end Will_Autosize;


    procedure Set_Autosize
           (This : in out Chart;
            To   : in     Boolean) is
    begin
        fl_chart_set_autosize (This.Void_Ptr, Boolean'Pos (To));
    end Set_Autosize;


    procedure Get_Bounds
           (This         : in     Chart;
            Lower, Upper :    out Long_Float)
    is
        L, U : Interfaces.C.double;
    begin
        fl_chart_get_bounds (This.Void_Ptr, L, U);
        Lower := Long_Float (L);
        Upper := Long_Float (U);
    end Get_Bounds;


    procedure Set_Bounds
           (This         : in out Chart;
            Lower, Upper : in     Long_Float) is
    begin
        fl_chart_set_bounds
           (This.Void_Ptr,
            Interfaces.C.double (Lower),
            Interfaces.C.double (Upper));
    end Set_Bounds;


    function Get_Maximum_Size
           (This : in Chart)
        return Natural is
    begin
        return Natural (fl_chart_get_maxsize (This.Void_Ptr));
    end Get_Maximum_Size;


    procedure Set_Maximum_Size
           (This : in out Chart;
            To   : in     Natural) is
    begin
        fl_chart_set_maxsize (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Maximum_Size;


    function Get_Size
           (This : in Chart)
        return Natural is
    begin
        return Natural (fl_chart_size (This.Void_Ptr));
    end Get_Size;




    function Get_Text_Color
           (This : in Chart)
        return Color is
    begin
        return Color (fl_chart_get_textcolor (This.Void_Ptr));
    end Get_Text_Color;


    procedure Set_Text_Color
           (This : in out Chart;
            To   : in     Color) is
    begin
        fl_chart_set_textcolor (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Text_Color;


    function Get_Text_Font
           (This : in Chart)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_chart_get_textfont (This.Void_Ptr));
    end Get_Text_Font;


    procedure Set_Text_Font
           (This : in out Chart;
            To   : in     Font_Kind) is
    begin
        fl_chart_set_textfont (This.Void_Ptr, Font_Kind'Pos (To));
    end Set_Text_Font;


    function Get_Text_Size
           (This : in Chart)
        return Font_Size is
    begin
        return Font_Size (fl_chart_get_textsize (This.Void_Ptr));
    end Get_Text_Size;


    procedure Set_Text_Size
           (This : in out Chart;
            To   : in     Font_Size) is
    begin
        fl_chart_set_textsize (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Text_Size;




    procedure Draw
           (This : in out Chart) is
    begin
        fl_chart_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Chart;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_chart_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Charts;

