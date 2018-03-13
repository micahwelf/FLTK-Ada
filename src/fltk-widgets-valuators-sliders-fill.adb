

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Sliders.Fill is


    procedure fill_slider_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, fill_slider_set_draw_hook, "fill_slider_set_draw_hook");

    procedure fill_slider_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, fill_slider_set_handle_hook, "fill_slider_set_handle_hook");




    function new_fl_fill_slider
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_fill_slider, "new_fl_fill_slider");

    procedure free_fl_fill_slider
           (D : in System.Address);
    pragma Import (C, free_fl_fill_slider, "free_fl_fill_slider");




    procedure fl_fill_slider_draw
           (W : in System.Address);
    pragma Import (C, fl_fill_slider_draw, "fl_fill_slider_draw");

    function fl_fill_slider_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_fill_slider_handle, "fl_fill_slider_handle");




    procedure Finalize
           (This : in out Fill_Slider) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Fill_Slider'Class
        then
            free_fl_fill_slider (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Slider (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Fill_Slider is
        begin
            return This : Fill_Slider do
                This.Void_Ptr := new_fl_fill_slider
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                fill_slider_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                fill_slider_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Fill_Slider) is
    begin
        fl_fill_slider_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Fill_Slider;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_fill_slider_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Sliders.Fill;

