

with Interfaces.C.Strings;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs.Int is


    function new_fl_int_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_int_input, "new_fl_int_input");

    procedure free_fl_int_input
           (F : in System.Address);
    pragma Import (C, free_fl_int_input, "free_fl_int_input");

    function fl_int_input_get_value
           (F : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_int_input_get_value, "fl_int_input_get_value");




    procedure Finalize
           (This : in out Integer_Input) is
    begin
        Finalize (Input (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Integer_Input then
                free_fl_int_input (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Integer_Input is
    begin
        return This : Integer_Input do
            This.Void_Ptr := new_fl_int_input
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
        end return;
    end Create;




    function Get_Value
           (This : in Integer_Input)
        return Integer is
    begin
        return Integer'Value
               (Interfaces.C.Strings.Value
                       (fl_int_input_get_value (This.Void_Ptr)));
    end Get_Value;


end FLTK.Widgets.Inputs.Int;

