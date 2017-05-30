

with Interfaces.C.Strings;
with System;
use type System.Address;


package body FLTK.Widgets.Inputs.File is


    procedure file_input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, file_input_set_draw_hook, "file_input_set_draw_hook");

    procedure file_input_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, file_input_set_handle_hook, "file_input_set_handle_hook");


    function new_fl_file_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_file_input, "new_fl_file_input");

    procedure free_fl_file_input
           (F : in System.Address);
    pragma Import (C, free_fl_file_input, "free_fl_file_input");


    procedure fl_file_input_draw
           (W : in System.Address);
    pragma Import (C, fl_file_input_draw, "fl_file_input_draw");

    function fl_file_input_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_file_input_handle, "fl_file_input_handle");




    procedure Finalize
           (This : in out File_Input) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in File_Input'Class
        then
            free_fl_file_input (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Input (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return File_Input is
    begin
        return This : File_Input do
            This.Void_Ptr := new_fl_file_input
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            file_input_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            file_input_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Draw
           (This : in out File_Input) is
    begin
        fl_file_input_draw (This.Void_Ptr);
    end Draw;




    function Handle
           (This  : in out File_Input;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_file_input_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Inputs.File;
