

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Sliders is


    procedure slider_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, slider_set_draw_hook, "slider_set_draw_hook");
    pragma Inline (slider_set_draw_hook);

    procedure slider_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, slider_set_handle_hook, "slider_set_handle_hook");
    pragma Inline (slider_set_handle_hook);




    function new_fl_slider
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_slider, "new_fl_slider");
    pragma Inline (new_fl_slider);

    procedure free_fl_slider
           (D : in System.Address);
    pragma Import (C, free_fl_slider, "free_fl_slider");
    pragma Inline (free_fl_slider);




    function fl_slider_get_type
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_slider_get_type, "fl_slider_get_type");
    pragma Inline (fl_slider_get_type);

    procedure fl_slider_set_type
           (S : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_slider_set_type, "fl_slider_set_type");
    pragma Inline (fl_slider_set_type);




    procedure fl_slider_set_bounds
           (S    : in System.Address;
            A, B : in Interfaces.C.double);
    pragma Import (C, fl_slider_set_bounds, "fl_slider_set_bounds");
    pragma Inline (fl_slider_set_bounds);

    function fl_slider_get_slider
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_slider_get_slider, "fl_slider_get_slider");
    pragma Inline (fl_slider_get_slider);

    procedure fl_slider_set_slider
           (S : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_slider_set_slider, "fl_slider_set_slider");
    pragma Inline (fl_slider_set_slider);

    function fl_slider_get_slider_size
           (S : in System.Address)
        return Interfaces.C.C_float;
    pragma Import (C, fl_slider_get_slider_size, "fl_slider_get_slider_size");
    pragma Inline (fl_slider_get_slider_size);

    procedure fl_slider_set_slider_size
           (S : in System.Address;
            T : in Interfaces.C.C_float);
    pragma Import (C, fl_slider_set_slider_size, "fl_slider_set_slider_size");
    pragma Inline (fl_slider_set_slider_size);

    function fl_slider_scrollvalue
           (S          : in System.Address;
            P, Z, F, T : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_slider_scrollvalue, "fl_slider_scrollvalue");
    pragma Inline (fl_slider_scrollvalue);




    procedure fl_slider_draw
           (W : in System.Address);
    pragma Import (C, fl_slider_draw, "fl_slider_draw");
    pragma Inline (fl_slider_draw);

    function fl_slider_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_slider_handle, "fl_slider_handle");
    pragma Inline (fl_slider_handle);




    procedure Finalize
           (This : in out Slider) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Slider'Class
        then
            free_fl_slider (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Valuator (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Slider is
        begin
            return This : Slider do
                This.Void_Ptr := new_fl_slider
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                slider_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                slider_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_Slider_Type
           (This : in Slider)
        return Slider_Kind is
    begin
        return Slider_Kind'Val (fl_slider_get_type (This.Void_Ptr));
    end Get_Slider_Type;


    procedure Set_Bounds
           (This     : in out Slider;
            Min, Max : in     Long_Float) is
    begin
        fl_slider_set_bounds
           (This.Void_Ptr,
            Interfaces.C.double (Min),
            Interfaces.C.double (Max));
    end Set_Bounds;


    function Get_Box
           (This : in Slider)
        return Box_Kind is
    begin
        return Box_Kind'Val (fl_slider_get_slider (This.Void_Ptr));
    end Get_Box;


    procedure Set_Box
           (This : in out Slider;
            To   : in     Box_Kind) is
    begin
        fl_slider_set_slider (This.Void_Ptr, Box_Kind'Pos (To));
    end Set_Box;


    function Get_Slide_Size
           (This : in Slider)
        return Float is
    begin
        return Float (fl_slider_get_slider_size (This.Void_Ptr));
    end Get_Slide_Size;


    procedure Set_Slide_Size
           (This : in out Slider;
            To   : in     Float) is
    begin
        fl_slider_set_slider_size (This.Void_Ptr, Interfaces.C.C_float (To));
    end Set_Slide_Size;


    procedure Set_Scrollvalue
           (This            : in out Slider;
            Pos_First_Line  : in     Natural;
            Lines_In_Window : in     Natural;
            First_Line_Num  : in     Natural;
            Total_Lines     : in     Natural)
    is
        Ignore_Me : Interfaces.C.int;
    begin
        Ignore_Me := fl_slider_scrollvalue
           (This.Void_Ptr,
            Interfaces.C.int (Pos_First_Line),
            Interfaces.C.int (Lines_In_Window),
            Interfaces.C.int (First_Line_Num),
            Interfaces.C.int (Total_Lines));
    end Set_Scrollvalue;




    procedure Draw
           (This : in out Slider) is
    begin
        fl_slider_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Slider;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_slider_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;




    package body Extra is

        procedure Set_Slider_Type
               (This : in out Slider;
                To   : in     Slider_Kind) is
        begin
            fl_slider_set_type (This.Void_Ptr, Slider_Kind'Pos (To));
        end Set_Slider_Type;

        pragma Inline (Set_Slider_Type);

    end Extra;


end FLTK.Widgets.Valuators.Sliders;

