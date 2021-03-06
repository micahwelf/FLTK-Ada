

with

    Interfaces.C.Strings,
    System;

use type

    Interfaces.C.Strings.chars_ptr,
    System.Address;


package body FLTK.Widgets.Inputs.File is


    procedure file_input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, file_input_set_draw_hook, "file_input_set_draw_hook");
    pragma Inline (file_input_set_draw_hook);

    procedure file_input_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, file_input_set_handle_hook, "file_input_set_handle_hook");
    pragma Inline (file_input_set_handle_hook);




    function new_fl_file_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_file_input, "new_fl_file_input");
    pragma Inline (new_fl_file_input);

    procedure free_fl_file_input
           (F : in System.Address);
    pragma Import (C, free_fl_file_input, "free_fl_file_input");
    pragma Inline (free_fl_file_input);




    function fl_file_input_get_down_box
           (F : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_file_input_get_down_box, "fl_file_input_get_down_box");
    pragma Inline (fl_file_input_get_down_box);

    procedure fl_file_input_set_down_box
           (F : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_file_input_set_down_box, "fl_file_input_set_down_box");
    pragma Inline (fl_file_input_set_down_box);

    function fl_file_input_get_errorcolor
           (F : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_file_input_get_errorcolor, "fl_file_input_get_errorcolor");
    pragma Inline (fl_file_input_get_errorcolor);

    procedure fl_file_input_set_errorcolor
           (F : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_file_input_set_errorcolor, "fl_file_input_set_errorcolor");
    pragma Inline (fl_file_input_set_errorcolor);




    function fl_file_input_get_value
           (F : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_file_input_get_value, "fl_file_input_get_value");
    pragma Inline (fl_file_input_get_value);

    procedure fl_file_input_set_value
           (I : in System.Address;
            T : in Interfaces.C.char_array;
            L : in Interfaces.C.int);
    pragma Import (C, fl_file_input_set_value, "fl_file_input_set_value");
    pragma Inline (fl_file_input_set_value);




    procedure fl_file_input_draw
           (W : in System.Address);
    pragma Import (C, fl_file_input_draw, "fl_file_input_draw");
    pragma Inline (fl_file_input_draw);

    function fl_file_input_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_file_input_handle, "fl_file_input_handle");
    pragma Inline (fl_file_input_handle);




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




    package body Forge is

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

    end Forge;




    function Get_Down_Box
           (This : in File_Input)
        return Box_Kind is
    begin
        return Box_Kind'Val (fl_file_input_get_down_box (This.Void_Ptr));
    end Get_Down_Box;


    procedure Set_Down_Box
           (This : in out File_Input;
            To   : in     Box_Kind) is
    begin
        fl_file_input_set_down_box (This.Void_Ptr, Box_Kind'Pos (To));
    end Set_Down_Box;


    function Get_Error_Color
           (This : in File_Input)
        return Color is
    begin
        return Color (fl_file_input_get_errorcolor (This.Void_Ptr));
    end Get_Error_Color;


    procedure Set_Error_Color
           (This : in out File_Input;
            To   : in     Color) is
    begin
        fl_file_input_set_errorcolor (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Error_Color;




    function Get_Value
           (This : in Input)
        return String
    is
        Ptr : Interfaces.C.Strings.chars_ptr := fl_file_input_get_value (This.Void_Ptr);
    begin
        if Ptr = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            --  pointer to internal buffer only, so no Free required
            return Interfaces.C.Strings.Value (Ptr);
        end if;
    end Get_Value;


    procedure Set_Value
           (This : in out Input;
            To   : in     String) is
    begin
        fl_file_input_set_value (This.Void_Ptr, Interfaces.C.To_C (To), To'Length);
    end Set_Value;




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

