

with

    Interfaces.C.Strings,
    System;

use type

    Interfaces.C.int,
    Interfaces.C.Strings.chars_ptr;


package body FLTK.Dialogs is


    procedure dialog_fl_alert
           (M : in Interfaces.C.char_array);
    pragma Import (C, dialog_fl_alert, "dialog_fl_alert");
    pragma Inline (dialog_fl_alert);

    --  function dialog_fl_ask
    --         (M : in Interfaces.C.char_array)
    --      return Interfaces.C.int;
    --  pragma Import (C, dialog_fl_ask, "dialog_fl_ask");
    --  pragma Inline (dialog_fl_ask);

    procedure dialog_fl_beep
           (B : in Interfaces.C.int);
    pragma Import (C, dialog_fl_beep, "dialog_fl_beep");
    pragma Inline (dialog_fl_beep);

    function dialog_fl_choice
           (M, A, B, C : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, dialog_fl_choice, "dialog_fl_choice");
    pragma Inline (dialog_fl_choice);

    function dialog_fl_input
           (M, D : in Interfaces.C.char_array)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, dialog_fl_input, "dialog_fl_input");
    pragma Inline (dialog_fl_input);

    procedure dialog_fl_message
           (M : in Interfaces.C.char_array);
    pragma Import (C, dialog_fl_message, "dialog_fl_message");
    pragma Inline (dialog_fl_message);

    function dialog_fl_password
           (M, D : in Interfaces.C.char_array)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, dialog_fl_password, "dialog_fl_password");
    pragma Inline (dialog_fl_password);




    function dialog_fl_color_chooser
           (N       : in     Interfaces.C.char_array;
            R, G, B : in out Interfaces.C.double;
            M       : in     Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, dialog_fl_color_chooser, "dialog_fl_color_chooser");
    pragma Inline (dialog_fl_color_chooser);

    function dialog_fl_color_chooser2
           (N       : in     Interfaces.C.char_array;
            R, G, B : in out Interfaces.C.unsigned_char;
            M       : in     Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, dialog_fl_color_chooser2, "dialog_fl_color_chooser2");
    pragma Inline (dialog_fl_color_chooser2);

    function dialog_fl_dir_chooser
           (M, D : in Interfaces.C.char_array;
            R    : in Interfaces.C.int)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, dialog_fl_dir_chooser, "dialog_fl_dir_chooser");
    pragma Inline (dialog_fl_dir_chooser);

    function dialog_fl_file_chooser
           (M, P, D : in Interfaces.C.char_array;
            R       : in Interfaces.C.int)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, dialog_fl_file_chooser, "dialog_fl_file_chooser");
    pragma Inline (dialog_fl_file_chooser);




    function dialog_fl_get_message_hotspot
        return Interfaces.C.int;
    pragma Import (C, dialog_fl_get_message_hotspot, "dialog_fl_get_message_hotspot");
    pragma Inline (dialog_fl_get_message_hotspot);

    procedure dialog_fl_set_message_hotspot
           (V : in Interfaces.C.int);
    pragma Import (C, dialog_fl_set_message_hotspot, "dialog_fl_set_message_hotspot");
    pragma Inline (dialog_fl_set_message_hotspot);

    procedure dialog_fl_message_font
           (F, S : in Interfaces.C.int);
    pragma Import (C, dialog_fl_message_font, "dialog_fl_message_font");
    pragma Inline (dialog_fl_message_font);

    function dialog_fl_message_icon
        return System.Address;
    pragma Import (C, dialog_fl_message_icon, "dialog_fl_message_icon");
    pragma Inline (dialog_fl_message_icon);

    procedure dialog_fl_message_title
           (T : in Interfaces.C.char_array);
    pragma Import (C, dialog_fl_message_title, "dialog_fl_message_title");
    pragma Inline (dialog_fl_message_title);

    procedure dialog_fl_message_title_default
           (T : in Interfaces.C.char_array);
    pragma Import (C, dialog_fl_message_title_default, "dialog_fl_message_title_default");
    pragma Inline (dialog_fl_message_title_default);




    procedure Alert
           (Message : String) is
    begin
        dialog_fl_alert (Interfaces.C.To_C (Message));
    end Alert;


    --  function Ask
    --         (Message : in String)
    --      return Boolean is
    --  begin
    --      return dialog_fl_ask (Interfaces.C.To_C (Message)) /= 0;
    --  end Ask;


    procedure Beep
           (Kind : in Beep_Kind) is
    begin
        dialog_fl_beep (Beep_Kind'Pos (Kind));
    end Beep;


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


    function Text_Input
           (Message : in String;
            Default : in String := "")
        return String
    is
        Result : Interfaces.C.Strings.chars_ptr := dialog_fl_input
               (Interfaces.C.To_C (Message),
                Interfaces.C.To_C (Default));
    begin
        --  string does not need dealloc
        return Interfaces.C.Strings.Value (Result);
    end Text_Input;


    procedure Message_Box
           (Message : in String) is
    begin
        dialog_fl_message (Interfaces.C.To_C (Message));
    end Message_Box;


    function Password
           (Message : in String;
            Default : in String := "")
        return String
    is
        Result : Interfaces.C.Strings.chars_ptr := dialog_fl_password
               (Interfaces.C.To_C (Message),
                Interfaces.C.To_C (Default));
    begin
        --  string does not need dealloc
        return Interfaces.C.Strings.Value (Result);
    end Password;




    function Color_Chooser
           (Title   : in     String;
            R, G, B : in out RGB_Float;
            Mode    : in     FLTK.Widgets.Groups.Color_Choosers.Color_Mode :=
                FLTK.Widgets.Groups.Color_Choosers.RGB)
        return Boolean
    is
        C_R : Interfaces.C.double := Interfaces.C.double (R);
        C_G : Interfaces.C.double := Interfaces.C.double (G);
        C_B : Interfaces.C.double := Interfaces.C.double (B);
        M : Interfaces.C.int := FLTK.Widgets.Groups.Color_Choosers.Color_Mode'Pos (Mode);
        Result : Boolean := dialog_fl_color_chooser
                (Interfaces.C.To_C (Title), C_R, C_G, C_B, M) /= 0;
    begin
        R := RGB_Float (C_R);
        G := RGB_Float (C_G);
        B := RGB_Float (C_B);
        return Result;
    end Color_Chooser;


    function Color_Chooser
           (Title   : in     String;
            R, G, B : in out RGB_Int;
            Mode    : in     FLTK.Widgets.Groups.Color_Choosers.Color_Mode :=
                FLTK.Widgets.Groups.Color_Choosers.RGB)
        return Boolean
    is
        C_R : Interfaces.C.unsigned_char := Interfaces.C.unsigned_char (R);
        C_G : Interfaces.C.unsigned_char := Interfaces.C.unsigned_char (G);
        C_B : Interfaces.C.unsigned_char := Interfaces.C.unsigned_char (B);
        M : Interfaces.C.int := FLTK.Widgets.Groups.Color_Choosers.Color_Mode'Pos (Mode);
        Result : Boolean := dialog_fl_color_chooser2
               (Interfaces.C.To_C (Title), C_R, C_G, C_B, M) /= 0;
    begin
        R := RGB_Int (C_R);
        G := RGB_Int (C_G);
        B := RGB_Int (C_B);
        return Result;
    end Color_Chooser;


    function Dir_Chooser
           (Message, Default : in String;
            Relative         : in Boolean := False)
        return String
    is
        Result : Interfaces.C.Strings.chars_ptr := dialog_fl_dir_chooser
               (Interfaces.C.To_C (Message),
                Interfaces.C.To_C (Default),
                Boolean'Pos (Relative));
    begin
        --  I'm... fairly sure the string does not need dealloc?
        return Interfaces.C.Strings.Value (Result);
    end Dir_Chooser;


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
        --  I'm... fairly sure the string does not need dealloc?
        return Interfaces.C.Strings.Value (Result);
    end File_Chooser;




    function Get_Hotspot
        return Boolean is
    begin
        return dialog_fl_get_message_hotspot /= 0;
    end Get_Hotspot;


    procedure Set_Hotspot
           (To : in Boolean) is
    begin
        dialog_fl_set_message_hotspot (Boolean'Pos (To));
    end Set_Hotspot;


    procedure Set_Message_Font
           (Font : in Font_Kind;
            Size : in Font_Size) is
    begin
        dialog_fl_message_font (Font_Kind'Pos (Font), Interfaces.C.int (Size));
    end Set_Message_Font;


    function Get_Message_Icon
        return FLTK.Widgets.Boxes.Box_Reference is
    begin
        return (Data => Icon_Box'Access);
    end Get_Message_Icon;


    procedure Set_Message_Title
           (To : in String) is
    begin
        dialog_fl_message_title (Interfaces.C.To_C (To));
    end Set_Message_Title;


    procedure Set_Message_Title_Default
           (To : in String) is
    begin
        dialog_fl_message_title_default (Interfaces.C.To_C (To));
    end Set_Message_Title_Default;




begin


    Wrapper (Icon_Box).Void_Ptr := dialog_fl_message_icon;
    Wrapper (Icon_Box).Needs_Dealloc := False;


end FLTK.Dialogs;

