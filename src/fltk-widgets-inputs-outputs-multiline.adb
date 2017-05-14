

with Interfaces.C.Strings;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs.Outputs.Multiline is


    procedure multiline_output_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, multiline_output_set_draw_hook, "multiline_output_set_draw_hook");

    procedure multiline_output_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, multiline_output_set_handle_hook, "multiline_output_set_handle_hook");


    function new_fl_multiline_output
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_multiline_output, "new_fl_multiline_output");

    procedure free_fl_multiline_output
           (F : in System.Address);
    pragma Import (C, free_fl_multiline_output, "free_fl_multiline_output");


    procedure fl_multiline_output_draw
           (W : in System.Address);
    pragma Import (C, fl_multiline_output_draw, "fl_multiline_output_draw");

    function fl_multiline_output_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_multiline_output_handle, "fl_multiline_output_handle");




    procedure Finalize
           (This : in out Multiline_Output) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Multiline_Output'Class
        then
            free_fl_multiline_output (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Output (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Multiline_Output is
    begin
        return This : Multiline_Output do
            This.Void_Ptr := new_fl_multiline_output
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            multiline_output_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            multiline_output_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Draw
           (This : in out Multiline_Output) is
    begin
        fl_multiline_output_draw (This.Void_Ptr);
    end Draw;




    function Handle
           (This  : in out Multiline_Output;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_multiline_output_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Inputs.Outputs.Multiline;

