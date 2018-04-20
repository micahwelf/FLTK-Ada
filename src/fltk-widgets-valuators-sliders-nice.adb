

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Sliders.Nice is


    procedure nice_slider_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, nice_slider_set_draw_hook, "nice_slider_set_draw_hook");
    pragma Inline (nice_slider_set_draw_hook);

    procedure nice_slider_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, nice_slider_set_handle_hook, "nice_slider_set_handle_hook");
    pragma Inline (nice_slider_set_handle_hook);




    function new_fl_nice_slider
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_nice_slider, "new_fl_nice_slider");
    pragma Inline (new_fl_nice_slider);

    procedure free_fl_nice_slider
           (D : in System.Address);
    pragma Import (C, free_fl_nice_slider, "free_fl_nice_slider");
    pragma Inline (free_fl_nice_slider);




    procedure fl_nice_slider_draw
           (W : in System.Address);
    pragma Import (C, fl_nice_slider_draw, "fl_nice_slider_draw");
    pragma Inline (fl_nice_slider_draw);

    function fl_nice_slider_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_nice_slider_handle, "fl_nice_slider_handle");
    pragma Inline (fl_nice_slider_handle);




    procedure Finalize
           (This : in out Nice_Slider) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Nice_Slider'Class
        then
            free_fl_nice_slider (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Slider (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Nice_Slider is
        begin
            return This : Nice_Slider do
                This.Void_Ptr := new_fl_nice_slider
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                nice_slider_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                nice_slider_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Draw
           (This : in out Nice_Slider) is
    begin
        fl_nice_slider_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Nice_Slider;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_nice_slider_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Sliders.Nice;

