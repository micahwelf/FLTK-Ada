

with Interfaces.C.Strings;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs.Outputs is


    procedure output_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, output_set_draw_hook, "output_set_draw_hook");

    procedure output_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, output_set_handle_hook, "output_set_handle_hook");


    function new_fl_output
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_output, "new_fl_output");

    procedure free_fl_output
           (F : in System.Address);
    pragma Import (C, free_fl_output, "free_fl_output");


    procedure fl_output_draw
           (W : in System.Address);
    pragma Import (C, fl_output_draw, "fl_output_draw");

    function fl_output_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_output_handle, "fl_output_handle");




    procedure Finalize
           (This : in out Output) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Output'Class
        then
            free_fl_output (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Input (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Output is
    begin
        return This : Output do
            This.Void_Ptr := new_fl_output
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            output_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            output_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Draw
           (This : in out Output) is
    begin
        fl_output_draw (This.Void_Ptr);
    end Draw;




    function Handle
           (This  : in out Output;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_output_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Inputs.Outputs;

