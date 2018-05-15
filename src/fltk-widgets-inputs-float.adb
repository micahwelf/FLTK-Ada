

with

    Interfaces.C.Strings,
    System;

use type

    Interfaces.C.Strings.chars_ptr,
    System.Address;


package body FLTK.Widgets.Inputs.Float is


    procedure float_input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, float_input_set_draw_hook, "float_input_set_draw_hook");
    pragma Inline (float_input_set_draw_hook);

    procedure float_input_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, float_input_set_handle_hook, "float_input_set_handle_hook");
    pragma Inline (float_input_set_handle_hook);




    function new_fl_float_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_float_input, "new_fl_float_input");
    pragma Inline (new_fl_float_input);

    procedure free_fl_float_input
           (F : in System.Address);
    pragma Import (C, free_fl_float_input, "free_fl_float_input");
    pragma Inline (free_fl_float_input);




    procedure fl_float_input_draw
           (W : in System.Address);
    pragma Import (C, fl_float_input_draw, "fl_float_input_draw");
    pragma Inline (fl_float_input_draw);

    function fl_float_input_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_float_input_handle, "fl_float_input_handle");
    pragma Inline (fl_float_input_handle);




    procedure Finalize
           (This : in out Float_Input) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Float_Input'Class
        then
            free_fl_float_input (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Input (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Float_Input is
        begin
            return This : Float_Input do
                This.Void_Ptr := new_fl_float_input
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                float_input_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                float_input_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_Value
           (This : in Float_Input)
        return Standard.Float
    is
        Ptr : Interfaces.C.Strings.chars_ptr := fl_input_get_value (This.Void_Ptr);
    begin
        if Ptr = Interfaces.C.Strings.Null_Ptr then
            return 0.0;
        else
            return Standard.Float'Value (Interfaces.C.Strings.Value (Ptr));
        end if;
    end Get_Value;




    procedure Draw
           (This : in out Float_Input) is
    begin
        fl_float_input_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Float_Input;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_float_input_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Inputs.Float;

