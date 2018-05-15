

with

    Interfaces.C.Strings,
    Ada.Strings.Unbounded,
    Ada.Containers,
    System;

use

    Ada.Strings.Unbounded;

use type

    System.Address,
    Interfaces.C.int,
    Interfaces.C.Strings.chars_ptr,
    Ada.Containers.Count_Type;


package body FLTK.Text_Buffers is


    function new_fl_text_buffer
           (RS, PGS : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_text_buffer, "new_fl_text_buffer");
    pragma Inline (new_fl_text_buffer);

    procedure free_fl_text_buffer
           (TB : in System.Address);
    pragma Import (C, free_fl_text_buffer, "free_fl_text_buffer");
    pragma Inline (free_fl_text_buffer);




    procedure fl_text_buffer_add_modify_callback
           (TB, CB, UD : in System.Address);
    pragma Import (C, fl_text_buffer_add_modify_callback,
                    "fl_text_buffer_add_modify_callback");
    pragma Inline (fl_text_buffer_add_modify_callback);

    procedure fl_text_buffer_add_predelete_callback
           (TB, CB, UD : in System.Address);
    pragma Import (C, fl_text_buffer_add_predelete_callback,
                    "fl_text_buffer_add_predelete_callback");
    pragma Inline (fl_text_buffer_add_predelete_callback);

    procedure fl_text_buffer_call_modify_callbacks
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_call_modify_callbacks,
                    "fl_text_buffer_call_modify_callbacks");
    pragma Inline (fl_text_buffer_call_modify_callbacks);

    procedure fl_text_buffer_call_predelete_callbacks
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_call_predelete_callbacks,
                    "fl_text_buffer_call_predelete_callbacks");
    pragma Inline (fl_text_buffer_call_predelete_callbacks);




    function fl_text_buffer_loadfile
           (TB : in System.Address;
            N  : in Interfaces.C.char_array;
            B  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_loadfile, "fl_text_buffer_loadfile");
    pragma Inline (fl_text_buffer_loadfile);

    function fl_text_buffer_appendfile
           (TB : in System.Address;
            N  : in Interfaces.C.char_array;
            B  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_appendfile, "fl_text_buffer_appendfile");
    pragma Inline (fl_text_buffer_appendfile);

    function fl_text_buffer_insertfile
           (TB   : in System.Address;
            N    : in Interfaces.C.char_array;
            P, B : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_insertfile, "fl_text_buffer_insertfile");
    pragma Inline (fl_text_buffer_insertfile);

    function fl_text_buffer_outputfile
           (TB   : in System.Address;
            N    : in Interfaces.C.char_array;
            F, T : in Interfaces.C.int;
            B    : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_outputfile, "fl_text_buffer_outputfile");
    pragma Inline (fl_text_buffer_outputfile);

    function fl_text_buffer_savefile
           (TB : in System.Address;
            N  : in Interfaces.C.char_array;
            B  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_savefile, "fl_text_buffer_savefile");
    pragma Inline (fl_text_buffer_savefile);




    procedure fl_text_buffer_insert
           (TB : in System.Address;
            P  : in Interfaces.C.int;
            I  : in Interfaces.C.char_array);
    pragma Import (C, fl_text_buffer_insert, "fl_text_buffer_insert");
    pragma Inline (fl_text_buffer_insert);

    procedure fl_text_buffer_append
           (TB : in System.Address;
            I  : in Interfaces.C.char_array);
    pragma Import (C, fl_text_buffer_append, "fl_text_buffer_append");
    pragma Inline (fl_text_buffer_append);

    procedure fl_text_buffer_replace
           (TB   : in System.Address;
            S, F : in Interfaces.C.int;
            T    : in Interfaces.C.char_array);
    pragma Import (C, fl_text_buffer_replace, "fl_text_buffer_replace");
    pragma Inline (fl_text_buffer_replace);

    procedure fl_text_buffer_remove
           (TB   : in System.Address;
            S, F : in Interfaces.C.int);
    pragma Import (C, fl_text_buffer_remove, "fl_text_buffer_remove");
    pragma Inline (fl_text_buffer_remove);

    function fl_text_buffer_get_text
           (TB : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_text_buffer_get_text, "fl_text_buffer_get_text");
    pragma Inline (fl_text_buffer_get_text);

    procedure fl_text_buffer_set_text
           (TB : in System.Address;
            T  : in Interfaces.C.char_array);
    pragma Import (C, fl_text_buffer_set_text, "fl_text_buffer_set_text");
    pragma Inline (fl_text_buffer_set_text);

    function fl_text_buffer_byte_at
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.char;
    pragma Import (C, fl_text_buffer_byte_at, "fl_text_buffer_byte_at");
    pragma Inline (fl_text_buffer_byte_at);

    function fl_text_buffer_char_at
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_text_buffer_char_at, "fl_text_buffer_char_at");
    pragma Inline (fl_text_buffer_char_at);

    function fl_text_buffer_text_range
           (TB   : in System.Address;
            S, F : in Interfaces.C.int)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_text_buffer_text_range, "fl_text_buffer_text_range");
    pragma Inline (fl_text_buffer_text_range);

    function fl_text_buffer_next_char
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_next_char, "fl_text_buffer_next_char");
    pragma Inline (fl_text_buffer_next_char);

    function fl_text_buffer_prev_char
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_prev_char, "fl_text_buffer_prev_char");
    pragma Inline (fl_text_buffer_prev_char);




    function fl_text_buffer_count_displayed_characters
           (TB   : in System.Address;
            S, F : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_count_displayed_characters,
        "fl_text_buffer_count_displayed_characters");
    pragma Inline (fl_text_buffer_count_displayed_characters);

    function fl_text_buffer_count_lines
           (TB   : in System.Address;
            S, F : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_count_lines, "fl_text_buffer_count_lines");
    pragma Inline (fl_text_buffer_count_lines);

    function fl_text_buffer_length
           (TB : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_length, "fl_text_buffer_length");
    pragma Inline (fl_text_buffer_length);

    function fl_text_buffer_get_tab_distance
           (TB : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_get_tab_distance, "fl_text_buffer_get_tab_distance");
    pragma Inline (fl_text_buffer_get_tab_distance);

    procedure fl_text_buffer_set_tab_distance
           (TB : in System.Address;
            T  : in Interfaces.C.int);
    pragma Import (C, fl_text_buffer_set_tab_distance, "fl_text_buffer_set_tab_distance");
    pragma Inline (fl_text_buffer_set_tab_distance);




    function fl_text_buffer_selection_position
           (TB   : in     System.Address;
            S, E :    out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_selection_position, "fl_text_buffer_selection_position");
    pragma Inline (fl_text_buffer_selection_position);

    function fl_text_buffer_secondary_selection_position
           (TB   : in     System.Address;
            S, E :    out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_secondary_selection_position,
        "fl_text_buffer_secondary_selection_position");
    pragma Inline (fl_text_buffer_secondary_selection_position);

    procedure fl_text_buffer_select
           (TB   : in System.Address;
            S, E : in Interfaces.C.int);
    pragma Import (C, fl_text_buffer_select, "fl_text_buffer_select");
    pragma Inline (fl_text_buffer_select);

    procedure fl_text_buffer_secondary_select
           (TB   : in System.Address;
            S, E : in Interfaces.C.int);
    pragma Import (C, fl_text_buffer_secondary_select, "fl_text_buffer_secondary_select");
    pragma Inline (fl_text_buffer_secondary_select);

    function fl_text_buffer_selected
           (TB : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_selected, "fl_text_buffer_selected");
    pragma Inline (fl_text_buffer_selected);

    function fl_text_buffer_secondary_selected
           (TB : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_secondary_selected, "fl_text_buffer_secondary_selected");
    pragma Inline (fl_text_buffer_secondary_selected);

    function fl_text_buffer_selection_text
           (TB : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_text_buffer_selection_text, "fl_text_buffer_selection_text");
    pragma Inline (fl_text_buffer_selection_text);

    function fl_text_buffer_secondary_selection_text
           (TB : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_text_buffer_secondary_selection_text,
        "fl_text_buffer_secondary_selection_text");
    pragma Inline (fl_text_buffer_secondary_selection_text);

    procedure fl_text_buffer_replace_selection
           (TB : in System.Address;
            T  : in Interfaces.C.char_array);
    pragma Import (C, fl_text_buffer_replace_selection, "fl_text_buffer_replace_selection");
    pragma Inline (fl_text_buffer_replace_selection);

    procedure fl_text_buffer_replace_secondary_selection
           (TB : in System.Address;
            T  : in Interfaces.C.char_array);
    pragma Import (C, fl_text_buffer_replace_secondary_selection,
        "fl_text_buffer_replace_secondary_selection");
    pragma Inline (fl_text_buffer_replace_secondary_selection);

    procedure fl_text_buffer_remove_selection
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_remove_selection, "fl_text_buffer_remove_selection");
    pragma Inline (fl_text_buffer_remove_selection);

    procedure fl_text_buffer_remove_secondary_selection
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_remove_secondary_selection,
        "fl_text_buffer_remove_secondary_selection");
    pragma Inline (fl_text_buffer_remove_secondary_selection);

    procedure fl_text_buffer_unselect
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_unselect, "fl_text_buffer_unselect");
    pragma Inline (fl_text_buffer_unselect);

    procedure fl_text_buffer_secondary_unselect
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_secondary_unselect, "fl_text_buffer_secondary_unselect");
    pragma Inline (fl_text_buffer_secondary_unselect);




    procedure fl_text_buffer_highlight
           (TB   : in System.Address;
            F, T : in Interfaces.C.int);
    pragma Import (C, fl_text_buffer_highlight, "fl_text_buffer_highlight");
    pragma Inline (fl_text_buffer_highlight);

    function fl_text_buffer_highlight_text
           (TB : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_text_buffer_highlight_text, "fl_text_buffer_highlight_text");
    pragma Inline (fl_text_buffer_highlight_text);

    procedure fl_text_buffer_unhighlight
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_unhighlight, "fl_text_buffer_unhighlight");
    pragma Inline (fl_text_buffer_unhighlight);




    function fl_text_buffer_findchar_forward
           (TB : in     System.Address;
            SP : in     Interfaces.C.int;
            IT : in     Interfaces.C.unsigned;
            FP :    out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_findchar_forward, "fl_text_buffer_findchar_forward");
    pragma Inline (fl_text_buffer_findchar_forward);

    function fl_text_buffer_findchar_backward
           (TB : in     System.Address;
            SP : in     Interfaces.C.int;
            IT : in     Interfaces.C.unsigned;
            FP :    out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_findchar_backward, "fl_text_buffer_findchar_backward");
    pragma Inline (fl_text_buffer_findchar_backward);

    function fl_text_buffer_search_forward
           (TB : in     System.Address;
            SP : in     Interfaces.C.int;
            IT : in     Interfaces.C.char_array;
            FP :    out Interfaces.C.int;
            CA : in     Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_search_forward, "fl_text_buffer_search_forward");
    pragma Inline (fl_text_buffer_search_forward);

    function fl_text_buffer_search_backward
           (TB : in     System.Address;
            SP : in     Interfaces.C.int;
            IT : in     Interfaces.C.char_array;
            FP :    out Interfaces.C.int;
            CA : in     Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_search_backward, "fl_text_buffer_search_backward");
    pragma Inline (fl_text_buffer_search_backward);




    function fl_text_buffer_word_start
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_word_start, "fl_text_buffer_word_start");
    pragma Inline (fl_text_buffer_word_start);

    function fl_text_buffer_word_end
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_word_end, "fl_text_buffer_word_end");
    pragma Inline (fl_text_buffer_word_end);

    function fl_text_buffer_line_start
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_line_start, "fl_text_buffer_line_start");
    pragma Inline (fl_text_buffer_line_start);

    function fl_text_buffer_line_end
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_line_end, "fl_text_buffer_line_end");
    pragma Inline (fl_text_buffer_line_end);

    function fl_text_buffer_line_text
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_text_buffer_line_text, "fl_text_buffer_line_text");
    pragma Inline (fl_text_buffer_line_text);

    function fl_text_buffer_skip_lines
           (TB   : in System.Address;
            S, L : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_skip_lines, "fl_text_buffer_skip_lines");
    pragma Inline (fl_text_buffer_skip_lines);

    function fl_text_buffer_rewind_lines
           (TB   : in System.Address;
            S, L : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_rewind_lines, "fl_text_buffer_rewind_lines");
    pragma Inline (fl_text_buffer_rewind_lines);

    function fl_text_buffer_skip_displayed_characters
           (TB   : in System.Address;
            S, N : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_skip_displayed_characters,
        "fl_text_buffer_skip_displayed_characters");
    pragma Inline (fl_text_buffer_skip_displayed_characters);




    procedure fl_text_buffer_canundo
           (TB : in System.Address;
            F  : in Interfaces.C.char);
    pragma Import (C, fl_text_buffer_canundo, "fl_text_buffer_canundo");
    pragma Inline (fl_text_buffer_canundo);

    procedure fl_text_buffer_copy
           (TB, TB2 : in System.Address;
            S, F, I : in Interfaces.C.int);
    pragma Import (C, fl_text_buffer_copy, "fl_text_buffer_copy");
    pragma Inline (fl_text_buffer_copy);

    function fl_text_buffer_utf8_align
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_utf8_align, "fl_text_buffer_utf8_align");
    pragma Inline (fl_text_buffer_utf8_align);




    procedure Modify_Callback_Hook
           (Pos                         : in Interfaces.C.int;
            Inserted, Deleted, Restyled : in Interfaces.C.int;
            Text                        : in Interfaces.C.Strings.chars_ptr;
            UD                          : in System.Address)
    is
        Action : Modification;
        Place : Position := Position (Pos);
        Length : Natural;
        Deleted_Text : Unbounded_String := To_Unbounded_String ("");

        Ada_Text_Buffer : access Text_Buffer :=
            Text_Buffer_Convert.To_Pointer (UD);
    begin
        if Ada_Text_Buffer.CB_Active then
            if Inserted > 0 then
                Length := Natural (Inserted);
                Action := Insert;
            elsif Deleted > 0 then
                Length := Natural (Deleted);
                Action := Delete;
                if Text /= Interfaces.C.Strings.Null_Ptr then
                    Deleted_Text := To_Unbounded_String (Interfaces.C.Strings.Value (Text));
                end if;
            elsif Restyled > 0 then
                Length := Natural (Restyled);
                Action := Restyle;
            else
                Length := 0;
                Action := None;
            end if;

            for CB of Ada_Text_Buffer.Modify_CBs loop
                CB.all (Action, Place, Length, To_String (Deleted_Text));
            end loop;
        end if;
    end Modify_Callback_Hook;


    procedure Predelete_Callback_Hook
           (Pos, Deleted : in Interfaces.C.int;
            UD           : in System.Address)
    is
        Place : Position := Position (Pos);
        Length : Natural := Natural (Deleted);

        Ada_Text_Buffer : access Text_Buffer :=
            Text_Buffer_Convert.To_Pointer (UD);
    begin
        if Ada_Text_Buffer.CB_Active then
            for CB of Ada_Text_Buffer.Predelete_CBs loop
                CB.all (Place, Length);
            end loop;
        end if;
    end Predelete_Callback_Hook;




    procedure Finalize
           (This : in out Text_Buffer) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Text_Buffer'Class
        then
            free_fl_text_buffer (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
    end Finalize;




    package body Forge is

        function Create
               (Requested_Size     : in Natural := 0;
                Preferred_Gap_Size : in Natural := 1024)
            return Text_Buffer is
        begin
            return This : Text_Buffer do
                This.Void_Ptr := new_fl_text_buffer
                       (Interfaces.C.int (Requested_Size),
                        Interfaces.C.int (Preferred_Gap_Size));

                This.Modify_CBs := Modify_Vectors.Empty_Vector;
                This.Predelete_CBs := Predelete_Vectors.Empty_Vector;
                This.CB_Active := True;

                fl_text_buffer_add_modify_callback
                   (This.Void_Ptr,
                    Modify_Callback_Hook'Address,
                    This'Address);
                fl_text_buffer_add_predelete_callback
                   (This.Void_Ptr,
                    Predelete_Callback_Hook'Address,
                    This'Address);
            end return;
        end Create;

    end Forge;




    procedure Add_Modify_Callback
           (This : in out Text_Buffer;
            Func : in     Modify_Callback) is
    begin
        This.Modify_CBs.Append (Func);
    end Add_Modify_Callback;


    procedure Add_Predelete_Callback
           (This : in out Text_Buffer;
            Func : in     Predelete_Callback) is
    begin
        This.Predelete_CBs.Append (Func);
    end Add_Predelete_Callback;


    procedure Remove_Modify_Callback
           (This : in out Text_Buffer;
            Func : in     Modify_Callback) is
    begin
        for I in reverse This.Modify_CBs.First_Index .. This.Modify_CBs.Last_Index loop
            if This.Modify_CBs.Element (I) = Func then
                This.Modify_CBs.Delete (I);
                return;
            end if;
        end loop;
    end Remove_Modify_Callback;


    procedure Remove_Predelete_Callback
           (This : in out Text_Buffer;
            Func : in     Predelete_Callback) is
    begin
        for I in reverse This.Predelete_CBs.First_Index .. This.Predelete_CBs.Last_Index loop
            if This.Predelete_CBs.Element (I) = Func then
                This.Predelete_CBs.Delete (I);
                return;
            end if;
        end loop;
    end Remove_Predelete_Callback;


    procedure Call_Modify_Callbacks
           (This : in out Text_Buffer) is
    begin
        fl_text_buffer_call_modify_callbacks (This.Void_Ptr);
    end Call_Modify_Callbacks;


    procedure Call_Predelete_Callbacks
           (This : in out Text_Buffer) is
    begin
        fl_text_buffer_call_predelete_callbacks (This.Void_Ptr);
    end Call_Predelete_Callbacks;


    procedure Enable_Callbacks
           (This : in out Text_Buffer) is
    begin
        This.CB_Active := True;
    end Enable_Callbacks;


    procedure Disable_Callbacks
           (This : in out Text_Buffer) is
    begin
        This.CB_Active := False;
    end Disable_Callbacks;




    procedure Load_File
           (This   : in out Text_Buffer;
            Name   : in     String;
            Buffer : in     Natural := 128 * 1024)
    is
        Err_No : Interfaces.C.int := fl_text_buffer_loadfile
               (This.Void_Ptr,
                Interfaces.C.To_C (Name),
                Interfaces.C.int (Buffer));
    begin
        if Err_No /= 0 then
            raise Storage_Error;
        end if;
    end Load_File;


    procedure Append_File
           (This   : in out Text_Buffer;
            Name   : in     String;
            Buffer : in     Natural := 128 * 1024)
    is
        Err_No : Interfaces.C.int := fl_text_buffer_appendfile
           (This.Void_Ptr,
            Interfaces.C.To_C (Name),
            Interfaces.C.int (Buffer));
    begin
        if Err_No /= 0 then
            raise Storage_Error;
        end if;
    end Append_File;


    procedure Insert_File
           (This   : in out Text_Buffer;
            Name   : in     String;
            Place  : in     Position;
            Buffer : in     Natural := 128 * 1024)
    is
        Err_No : Interfaces.C.int := fl_text_buffer_insertfile
           (This.Void_Ptr,
            Interfaces.C.To_C (Name),
            Interfaces.C.int (Place),
            Interfaces.C.int (Buffer));
    begin
        if Err_No /= 0 then
            raise Storage_Error;
        end if;
    end Insert_File;


    procedure Output_File
           (This          : in Text_Buffer;
            Name          : in String;
            Start, Finish : in Position;
            Buffer        : in Natural := 128 * 1024)
    is
        Err_No : Interfaces.C.int := fl_text_buffer_outputfile
           (This.Void_Ptr,
            Interfaces.C.To_C (Name),
            Interfaces.C.int (Start),
            Interfaces.C.int (Finish),
            Interfaces.C.int (Buffer));
    begin
        if Err_No /= 0 then
            raise Storage_Error;
        end if;
    end Output_File;


    procedure Save_File
           (This   : in Text_Buffer;
            Name   : in String;
            Buffer : in Natural := 128 * 1024)
    is
        Err_No : Interfaces.C.int := fl_text_buffer_savefile
               (This.Void_Ptr,
                Interfaces.C.To_C (Name),
                Interfaces.C.int (Buffer));
    begin
        if Err_No /= 0 then
            raise Storage_Error;
        end if;
    end Save_File;




    procedure Insert_Text
           (This  : in out Text_Buffer;
            Place : in     Position;
            Text  : in     String) is
    begin
        fl_text_buffer_insert
               (This.Void_Ptr,
                Interfaces.C.int (Place),
                Interfaces.C.To_C (Text));
    end Insert_Text;


    procedure Append_Text
           (This : in out Text_Buffer;
            Text : in     String) is
    begin
        fl_text_buffer_append
           (This.Void_Ptr,
            Interfaces.C.To_C (Text));
    end Append_Text;


    procedure Replace_Text
           (This          : in out Text_Buffer;
            Start, Finish : in     Position;
            Text          : in     String) is
    begin
        fl_text_buffer_replace
           (This.Void_Ptr,
            Interfaces.C.int (Start),
            Interfaces.C.int (Finish),
            Interfaces.C.To_C (Text));
    end Replace_Text;


    procedure Remove_Text
           (This          : in out Text_Buffer;
            Start, Finish : in     Position) is
    begin
        fl_text_buffer_remove
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Finish));
    end Remove_Text;


    function Get_Entire_Text
           (This : in Text_Buffer)
        return String
    is
        Raw : Interfaces.C.Strings.chars_ptr :=
            fl_text_buffer_get_text (This.Void_Ptr);
    begin
        if Raw = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            declare
                Ada_String : String := Interfaces.C.Strings.Value (Raw);
            begin
                Interfaces.C.Strings.Free (Raw);
                return Ada_String;
            end;
        end if;
    end Get_Entire_Text;


    procedure Set_Entire_Text
           (This : in out Text_Buffer;
            Text : in     String) is
    begin
        fl_text_buffer_set_text (This.Void_Ptr, Interfaces.C.To_C (Text));
    end Set_Entire_Text;


    function Byte_At
           (This  : in Text_Buffer;
            Place : in Position)
        return Character is
    begin
        return Character'Val (Interfaces.C.char'Pos
           (fl_text_buffer_byte_at (This.Void_Ptr, Interfaces.C.int (Place))));
    end Byte_At;


    function Character_At
           (This : in Text_Buffer;
            Place : in Position)
        return Character is
    begin
        return Character'Val (fl_text_buffer_char_at
               (This.Void_Ptr,
                Interfaces.C.int (Place)));
    end Character_At;


    function Text_At
           (This          : in Text_Buffer;
            Start, Finish : in Position)
        return String
    is
        C_Str : Interfaces.C.Strings.chars_ptr := fl_text_buffer_text_range
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Finish));
    begin
        if C_Str = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            declare
                The_Text : String := Interfaces.C.Strings.Value (C_Str);
            begin
                Interfaces.C.Strings.Free (C_Str);
                return The_Text;
            end;
        end if;
    end Text_At;


    function Next_Char
           (This  : in Text_Buffer;
            Place : in Position)
        return Character is
    begin
        return Character'Val (fl_text_buffer_next_char
           (This.Void_Ptr,
            Interfaces.C.int (Place)));
    end Next_Char;


    function Prev_Char
           (This  : in Text_Buffer;
            Place : in Position)
        return Character is
    begin
        return Character'Val (fl_text_buffer_prev_char
           (This.Void_Ptr,
            Interfaces.C.int (Place)));
    end Prev_Char;




    function Count_Displayed_Characters
           (This          : in Text_Buffer;
            Start, Finish : in Position)
        return Integer is
    begin
        return Integer (fl_text_buffer_count_displayed_characters
           (This.Void_Ptr,
            Interfaces.C.int (Start),
            Interfaces.C.int (Finish)));
    end Count_Displayed_Characters;


    function Count_Lines
           (This          : in Text_Buffer;
            Start, Finish : in Position)
        return Integer is
    begin
        return Integer (fl_text_buffer_count_lines
           (This.Void_Ptr,
            Interfaces.C.int (Start),
            Interfaces.C.int (Finish)));
    end Count_Lines;


    function Length
           (This : in Text_Buffer)
        return Natural is
    begin
        return Natural (fl_text_buffer_length (This.Void_Ptr));
    end Length;


    function Get_Tab_Width
           (This : in Text_Buffer)
        return Natural is
    begin
        return Natural (fl_text_buffer_get_tab_distance (This.Void_Ptr));
    end Get_Tab_Width;


    procedure Set_Tab_Width
           (This : in out Text_Buffer;
            To   : in     Natural) is
    begin
        fl_text_buffer_set_tab_distance (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Tab_Width;




    function Get_Selection
           (This          : in     Text_Buffer;
            Start, Finish :    out Position)
        return Boolean is
    begin
        return fl_text_buffer_selection_position
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Finish)) /= 0;
    end Get_Selection;


    function Get_Secondary_Selection
           (This          : in     Text_Buffer;
            Start, Finish :    out Position)
        return Boolean is
    begin
        return fl_text_buffer_secondary_selection_position
           (This.Void_Ptr,
            Interfaces.C.int (Start),
            Interfaces.C.int (Finish)) /= 0;
    end Get_Secondary_Selection;


    procedure Set_Selection
           (This          : in out Text_Buffer;
            Start, Finish : in     Position) is
    begin
        fl_text_buffer_select
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Finish));
    end Set_Selection;


    procedure Set_Secondary_Selection
           (This          : in out Text_Buffer;
            Start, Finish : in     Position) is
    begin
        fl_text_buffer_secondary_select
           (This.Void_Ptr,
            Interfaces.C.int (Start),
            Interfaces.C.int (Finish));
    end Set_Secondary_Selection;


    function Has_Selection
           (This : in Text_Buffer)
        return Boolean is
    begin
        return fl_text_buffer_selected (This.Void_Ptr) /= 0;
    end Has_Selection;


    function Has_Secondary_Selection
           (This : in Text_Buffer)
        return Boolean is
    begin
        return fl_text_buffer_secondary_selected (This.Void_Ptr) /= 0;
    end Has_Secondary_Selection;


    function Selection_Text
           (This : in Text_Buffer)
        return String
    is
        Raw : Interfaces.C.Strings.chars_ptr :=
            fl_text_buffer_selection_text (This.Void_Ptr);
    begin
        if Raw = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            declare
                Ada_String : String := Interfaces.C.Strings.Value (Raw);
            begin
                Interfaces.C.Strings.Free (Raw);
                return Ada_String;
            end;
        end if;
    end Selection_Text;


    function Secondary_Selection_Text
           (This : in Text_Buffer)
        return String
    is
        Raw : Interfaces.C.Strings.chars_ptr :=
            fl_text_buffer_secondary_selection_text (This.Void_Ptr);
    begin
        if Raw = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            declare
                Ada_String : String := Interfaces.C.Strings.Value (Raw);
            begin
                Interfaces.C.Strings.Free (Raw);
                return Ada_String;
            end;
        end if;
    end Secondary_Selection_Text;


    procedure Replace_Selection
           (This : in out Text_Buffer;
            Text : in     String) is
    begin
        fl_text_buffer_replace_selection (This.Void_Ptr, Interfaces.C.To_C (Text));
    end Replace_Selection;


    procedure Replace_Secondary_Selection
           (This : in out Text_Buffer;
            Text : in     String) is
    begin
        fl_text_buffer_replace_secondary_selection (This.Void_Ptr, Interfaces.C.To_C (Text));
    end Replace_Secondary_Selection;


    procedure Remove_Selection
           (This : in out Text_Buffer) is
    begin
        fl_text_buffer_remove_selection (This.Void_Ptr);
    end Remove_Selection;


    procedure Remove_Secondary_Selection
           (This : in out Text_Buffer) is
    begin
        fl_text_buffer_remove_secondary_selection (This.Void_Ptr);
    end Remove_Secondary_Selection;


    procedure Unselect
           (This : in out Text_Buffer) is
    begin
        fl_text_buffer_unselect (This.Void_Ptr);
    end Unselect;


    procedure Secondary_Unselect
           (This : in out Text_Buffer) is
    begin
        fl_text_buffer_secondary_unselect (This.Void_Ptr);
    end Secondary_Unselect;




    procedure Get_Highlight
           (This          : in     Text_Buffer;
            Start, Finish :    out Position) is
    begin
        Start := This.High_From;
        Finish := This.High_To;
    end Get_Highlight;


    procedure Set_Highlight
           (This          : in out Text_Buffer;
            Start, Finish : in     Position) is
    begin
        This.High_From := Start;
        This.High_To := Finish;
        fl_text_buffer_highlight
           (This.Void_Ptr,
            Interfaces.C.int (Start),
            Interfaces.C.int (Finish));
    end Set_Highlight;


    function Get_Highlighted_Text
           (This : in Text_Buffer)
        return String
    is
        Raw : Interfaces.C.Strings.chars_ptr :=
            fl_text_buffer_highlight_text (This.Void_Ptr);
    begin
        if Raw = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            declare
                Ada_String : String := Interfaces.C.Strings.Value (Raw);
            begin
                Interfaces.C.Strings.Free (Raw);
                return Ada_String;
            end;
        end if;
    end Get_Highlighted_Text;


    procedure Unhighlight
           (This : in out Text_Buffer) is
    begin
        fl_text_buffer_unhighlight (This.Void_Ptr);
    end Unhighlight;




    function Findchar_Forward
           (This     : in     Text_Buffer;
            Start_At : in     Position;
            Item     : in     Character;
            Found_At :    out Position)
        return Boolean is
    begin
        return fl_text_buffer_findchar_forward
           (This.Void_Ptr,
            Interfaces.C.int (Start_At),
            Character'Pos (Item),
            Interfaces.C.int (Found_At)) /= 0;
    end Findchar_Forward;


    function Findchar_Backward
           (This     : in     Text_Buffer;
            Start_At : in     Position;
            Item     : in     Character;
            Found_At :    out Position)
        return Boolean is
    begin
        return fl_text_buffer_findchar_backward
           (This.Void_Ptr,
            Interfaces.C.int (Start_At),
            Character'Pos (Item),
            Interfaces.C.int (Found_At)) /= 0;
    end Findchar_Backward;


    function Search_Forward
           (This       : in     Text_Buffer;
            Start_At   : in     Position;
            Item       : in     String;
            Found_At   :    out Position;
            Match_Case : in     Boolean := False)
        return Boolean is
    begin
        return fl_text_buffer_search_forward
               (This.Void_Ptr,
                Interfaces.C.int (Start_At),
                Interfaces.C.To_C (Item),
                Interfaces.C.int (Found_At),
                Boolean'Pos (Match_Case)) /= 0;
    end Search_Forward;


    function Search_Backward
           (This       : in     Text_Buffer;
            Start_At   : in     Position;
            Item       : in     String;
            Found_At   :    out Position;
            Match_Case : in     Boolean := False)
        return Boolean is
    begin
        return fl_text_buffer_search_backward
               (This.Void_Ptr,
                Interfaces.C.int (Start_At),
                Interfaces.C.To_C (Item),
                Interfaces.C.int (Found_At),
                Boolean'Pos (Match_Case)) /= 0;
    end Search_Backward;




    function Word_Start
           (This  : in Text_Buffer;
            Place : in Position)
        return Position is
    begin
        return Position (fl_text_buffer_word_start (This.Void_Ptr, Interfaces.C.int (Place)));
    end Word_Start;


    function Word_End
           (This  : in Text_Buffer;
            Place : in Position)
        return Position is
    begin
        return Position (fl_text_buffer_word_end (This.Void_Ptr, Interfaces.C.int (Place)));
    end Word_End;


    function Line_Start
           (This  : in Text_Buffer;
            Place : in Position)
        return Position is
    begin
        return Position (fl_text_buffer_line_start (This.Void_Ptr, Interfaces.C.int (Place)));
    end Line_Start;


    function Line_End
           (This  : in Text_Buffer;
            Place : in Position)
        return Position is
    begin
        return Position (fl_text_buffer_line_end (This.Void_Ptr, Interfaces.C.int (Place)));
    end Line_End;


    function Line_Text
           (This  : in Text_Buffer;
            Place : in Position)
        return String
    is
        Raw : Interfaces.C.Strings.chars_ptr := fl_text_buffer_line_text
           (This.Void_Ptr,
            Interfaces.C.int (Place));
    begin
        if Raw = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            declare
                Ada_String : String := Interfaces.C.Strings.Value (Raw);
            begin
                Interfaces.C.Strings.Free (Raw);
                return Ada_String;
            end;
        end if;
    end Line_Text;


    function Skip_Lines
           (This  : in out Text_Buffer;
            Start : in     Position;
            Lines : in     Natural)
        return Position is
    begin
        return Natural (fl_text_buffer_skip_lines
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Lines)));
    end Skip_Lines;


    function Rewind_Lines
           (This  : in out Text_Buffer;
            Start : in     Position;
            Lines : in     Natural)
        return Position is
    begin
        return Natural (fl_text_buffer_rewind_lines
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Lines)));
    end Rewind_Lines;


    function Skip_Displayed_Characters
           (This  : in Text_Buffer;
            Start : in Position;
            Chars : in Natural)
        return Position is
    begin
        return Natural (fl_text_buffer_skip_displayed_characters
           (This.Void_Ptr,
            Interfaces.C.int (Start),
            Interfaces.C.int (Chars)));
    end Skip_Displayed_Characters;




    procedure Can_Undo
           (This : in out Text_Buffer;
            Flag : in     Boolean) is
    begin
        fl_text_buffer_canundo (This.Void_Ptr, Interfaces.C.char'Val (Boolean'Pos (Flag)));
    end Can_Undo;


    procedure Copy
           (This          : in out Text_Buffer;
            From          : in     Text_Buffer;
            Start, Finish : in     Position;
            Insert_Pos    : in     Position) is
    begin
        fl_text_buffer_copy
           (This.Void_Ptr,
            From.Void_Ptr,
            Interfaces.C.int (Start),
            Interfaces.C.int (Finish),
            Interfaces.C.int (Insert_Pos));
    end Copy;


    function UTF8_Align
           (This  : in Text_Buffer;
            Place : in Position)
        return Position is
    begin
        return Position (fl_text_buffer_utf8_align (This.Void_Ptr, Interfaces.C.int (Place)));
    end UTF8_Align;


end FLTK.Text_Buffers;

