

with

    Interfaces.C.Strings;

use type

    Interfaces.C.Strings.chars_ptr;


package body FLTK.Dialogs is


    procedure dialog_fl_alert
           (M : in Interfaces.C.char_array);
    pragma Import (C, dialog_fl_alert, "dialog_fl_alert");

    function dialog_fl_choice
           (M, A, B, C : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, dialog_fl_choice, "dialog_fl_choice");

    function dialog_fl_file_chooser
           (M, P, D : in Interfaces.C.char_array;
            R : in Interfaces.C.int)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, dialog_fl_file_chooser, "dialog_fl_file_chooser");

    function dialog_fl_input
           (M, D : in Interfaces.C.char_array)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, dialog_fl_input, "dialog_fl_input");

    procedure dialog_fl_message
           (M : in Interfaces.C.char_array);
    pragma Import (C, dialog_fl_message, "dialog_fl_message");




    procedure Alert
           (Message : String) is
    begin
        dialog_fl_alert (Interfaces.C.To_C (Message));
    end Alert;




    function Three_Way_Choice
           (Message, Button1, Button2, Button3 : in String)
        return Choice
    is
        Result : Interfaces.C.int := dialog_fl_choice
               (Interfaces.C.To_C (Message),
                Interfaces.C.To_C (Button1),
                Interfaces.C.To_C (Button2),
                Interfaces.C.To_C (Button3));
    begin
        return Choice'Val (Result);
    end Three_Way_Choice;




    function File_Chooser
           (Message, Filter_Pattern, Default : in String;
            Relative                         : in Boolean := False)
        return String
    is
        Result : Interfaces.C.Strings.chars_ptr := dialog_fl_file_chooser
               (Interfaces.C.To_C (Message),
                Interfaces.C.To_C (Filter_Pattern),
                Interfaces.C.To_C (Default),
                Boolean'Pos (Relative));
    begin
        if Result = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            return Interfaces.C.Strings.Value (Result);
        end if;
    end File_Chooser;




    function Text_Input
           (Message : in String;
            Default : in String := "")
        return String
    is
        Result : Interfaces.C.Strings.chars_ptr := dialog_fl_input
               (Interfaces.C.To_C (Message),
                Interfaces.C.To_C (Default));
    begin
        if Result = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            return Interfaces.C.Strings.Value (Result);
        end if;
    end Text_Input;




    procedure Message_Box
           (Message : in String) is
    begin
        dialog_fl_message (Interfaces.C.To_C (Message));
    end Message_Box;


end FLTK.Dialogs;

