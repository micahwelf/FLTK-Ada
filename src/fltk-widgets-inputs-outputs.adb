

with Interfaces.C.Strings;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs.Outputs is


    procedure output_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, output_set_draw_hook, "output_set_draw_hook");

    procedure fl_output_draw
           (W : in System.Address);
    pragma Import (C, fl_output_draw, "fl_output_draw");

    function new_fl_output
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_output, "new_fl_output");

    procedure free_fl_output
           (F : in System.Address);
    pragma Import (C, free_fl_output, "free_fl_output");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Output_Convert is new
            System.Address_To_Access_Conversions (Output'Class);

        Ada_Output : access Output'Class :=
            Output_Convert.To_Pointer (U);
    begin
        Ada_Output.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Output) is
    begin
        fl_output_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Output) is
    begin
        if  This in Output and then
            This.Void_Ptr /= System.Null_Address
        then
            free_fl_output (This.Void_Ptr);
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
        end return;
    end Create;


end FLTK.Widgets.Inputs.Outputs;

