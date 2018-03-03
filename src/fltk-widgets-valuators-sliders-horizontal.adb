

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Sliders.Horizontal is


    procedure horizontal_slider_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, horizontal_slider_set_draw_hook, "horizontal_slider_set_draw_hook");

    procedure horizontal_slider_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, horizontal_slider_set_handle_hook, "horizontal_slider_set_handle_hook");




    function new_fl_horizontal_slider
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_horizontal_slider, "new_fl_horizontal_slider");

    procedure free_fl_horizontal_slider
           (D : in System.Address);
    pragma Import (C, free_fl_horizontal_slider, "free_fl_horizontal_slider");




    procedure fl_horizontal_slider_draw
           (W : in System.Address);
    pragma Import (C, fl_horizontal_slider_draw, "fl_horizontal_slider_draw");

    function fl_horizontal_slider_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_horizontal_slider_handle, "fl_horizontal_slider_handle");




    procedure Finalize
           (This : in out Horizontal_Slider) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Horizontal_Slider'Class
        then
            free_fl_horizontal_slider (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Valuator (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Horizontal_Slider is
    begin
        return This : Horizontal_Slider do
            This.Void_Ptr := new_fl_horizontal_slider
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            horizontal_slider_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            horizontal_slider_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Draw
           (This : in out Horizontal_Slider) is
    begin
        fl_horizontal_slider_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Horizontal_Slider;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_horizontal_slider_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Sliders.Horizontal;

