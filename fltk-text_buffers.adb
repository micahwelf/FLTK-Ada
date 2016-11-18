

with Interfaces.C.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers;
with System;
use type System.Address;
use type Interfaces.C.int;
use type Interfaces.C.Strings.chars_ptr;
use type Ada.Containers.Count_Type;


package body FLTK.Text_Buffers is


    function new_fl_text_buffer
           (RS, PGS : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_text_buffer, "new_fl_text_buffer");

    procedure free_fl_text_buffer
           (TB : in System.Address);
    pragma Import (C, free_fl_text_buffer, "free_fl_text_buffer");

    procedure fl_text_buffer_add_modify_callback
           (TB, CB, UD : in System.Address);
    pragma Import (C, fl_text_buffer_add_modify_callback,
                    "fl_text_buffer_add_modify_callback");

    procedure fl_text_buffer_add_predelete_callback
           (TB, CB, UD : in System.Address);
    pragma Import (C, fl_text_buffer_add_predelete_callback,
                    "fl_text_buffer_add_predelete_callback");

    procedure fl_text_buffer_call_modify_callbacks
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_call_modify_callbacks,
                    "fl_text_buffer_call_modify_callbacks");

    procedure fl_text_buffer_call_predelete_callbacks
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_call_predelete_callbacks,
                    "fl_text_buffer_call_predelete_callbacks");

    procedure fl_text_buffer_insert
           (TB : in System.Address;
            P  : in Interfaces.C.int;
            I  : in Interfaces.C.char_array);
    pragma Import (C, fl_text_buffer_insert, "fl_text_buffer_insert");

    procedure fl_text_buffer_remove
           (TB   : in System.Address;
            S, F : in Interfaces.C.int);
    pragma Import (C, fl_text_buffer_remove, "fl_text_buffer_remove");

    function fl_text_buffer_length
           (TB : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_length, "fl_text_buffer_length");

    function fl_text_buffer_loadfile
           (TB : in System.Address;
            N  : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_loadfile, "fl_text_buffer_loadfile");

    procedure fl_text_buffer_remove_selection
           (TB : in System.Address);
    pragma Import (C, fl_text_buffer_remove_selection, "fl_text_buffer_remove_selection");

    function fl_text_buffer_savefile
           (TB : in System.Address;
            N  : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_savefile, "fl_text_buffer_savefile");

    function fl_text_buffer_search_forward
           (TB : in     System.Address;
            SP : in     Interfaces.C.int;
            IT : in     Interfaces.C.char_array;
            FP :    out Interfaces.C.int;
            CA : in     Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_search_forward, "fl_text_buffer_search_forward");

    function fl_text_buffer_search_backward
           (TB : in     System.Address;
            SP : in     Interfaces.C.int;
            IT : in     Interfaces.C.char_array;
            FP :    out Interfaces.C.int;
            CA : in     Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_search_backward, "fl_text_buffer_search_backward");

    procedure fl_text_buffer_select
           (TB   : in System.Address;
            S, E : in Interfaces.C.int);
    pragma Import (C, fl_text_buffer_select, "fl_text_buffer_select");

    function fl_text_buffer_selection_position
           (TB   : in     System.Address;
            S, E :    out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_selection_position, "fl_text_buffer_selection_position");

    function fl_text_buffer_selected
           (TB : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_selected, "fl_text_buffer_selected");

    function fl_text_buffer_skip_lines
           (TB   : in System.Address;
            S, L : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_skip_lines, "fl_text_buffer_skip_lines");

    function fl_text_buffer_rewind_lines
           (TB   : in System.Address;
            S, L : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_buffer_rewind_lines, "fl_text_buffer_rewind_lines");

    function fl_text_buffer_char_at
           (TB : in System.Address;
            P  : in Interfaces.C.int)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_text_buffer_char_at, "fl_text_buffer_char_at");

    function fl_text_buffer_text_range
           (TB   : in System.Address;
            S, F : in Interfaces.C.int)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_text_buffer_text_range, "fl_text_buffer_text_range");




    procedure Finalize
           (This : in out Text_Buffer) is
    begin
        if This.Void_Ptr /= System.Null_Address then
            if This in Text_Buffer then
                free_fl_text_buffer (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    procedure Modify_Callback_Hook
           (Pos, Inserted, Deleted, Restyled : in Interfaces.C.int;
            Text                             : in Interfaces.C.Strings.chars_ptr;
            UD                               : in System.Address);
    pragma Convention (C, Modify_Callback_Hook);

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
            UD : in System.Address);
    pragma Convention (C, Predelete_Callback_Hook);

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
        end return;
    end Create;




    procedure Add_Modify_Callback
           (This : in out Text_Buffer;
            Func : in     Modify_Callback) is
    begin
        if This.Modify_CBs.Length = 0 then
            fl_text_buffer_add_modify_callback
                   (This.Void_Ptr,
                    Modify_Callback_Hook'Address,
                    This'Address);
        end if;
        This.Modify_CBs.Append (Func);
    end Add_Modify_Callback;




    procedure Add_Predelete_Callback
           (This : in out Text_Buffer;
            Func : in     Predelete_Callback) is
    begin
        if This.Predelete_CBs.Length = 0 then
            fl_text_buffer_add_predelete_callback
                   (This.Void_Ptr,
                    Predelete_Callback_Hook'Address,
                    This'Address);
        end if;
        This.Predelete_CBs.Append (Func);
    end Add_Predelete_Callback;




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




    procedure Insert_Text
           (This : in out Text_Buffer;
            Pos  : in     Natural;
            Item : in     String) is
    begin
        fl_text_buffer_insert
               (This.Void_Ptr,
                Interfaces.C.int (Pos),
                Interfaces.C.To_C (Item));
    end Insert_Text;




    procedure Remove_Text
           (This          : in out Text_Buffer;
            Start, Finish : in     Natural) is
    begin
        fl_text_buffer_remove
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Finish));
    end Remove_Text;




    function Length
           (This : in Text_Buffer)
        return Natural is
    begin
        return Natural (fl_text_buffer_length (This.Void_Ptr));
    end Length;




    procedure Load_File
           (This : in Text_Buffer;
            Name : in String)
    is
        Err_No : Interfaces.C.int := fl_text_buffer_loadfile
               (This.Void_Ptr,
                Interfaces.C.To_C (Name));
    begin
        if Err_No /= 0 then
            raise Storage_Error;
        end if;
    end Load_File;




    procedure Remove_Selected_Text
           (This : in out Text_Buffer) is
    begin
        fl_text_buffer_remove_selection (This.Void_Ptr);
    end Remove_Selected_Text;




    procedure Save_File
           (This : in Text_Buffer;
            Name : in String)
    is
        Err_No : Interfaces.C.int := fl_text_buffer_savefile
               (This.Void_Ptr,
                Interfaces.C.To_C (Name));
    begin
        if Err_No /= 0 then
            raise Storage_Error;
        end if;
    end Save_File;




    function Search_Forward
           (This       : in     Text_Buffer;
            Start_At   : in     Natural;
            Item       : in     String;
            Found_At   :    out Natural;
            Match_Case : in     Boolean)
        return Boolean
    is
        Found_Raw, Result : Interfaces.C.int;
    begin
        Result := fl_text_buffer_search_forward
               (This.Void_Ptr,
                Interfaces.C.int (Start_At),
                Interfaces.C.To_C (Item),
                Found_Raw,
                Boolean'Pos (Match_Case));
        if Result /= 0 then
            Found_At := Natural (Found_Raw);
        end if;
        return Result /= 0;
    end Search_Forward;




    function Search_Backward
           (This       : in     Text_Buffer;
            Start_At   : in     Natural;
            Item       : in     String;
            Found_At   :    out Natural;
            Match_Case : in     Boolean)
        return Boolean
    is
        Found_Raw, Result : Interfaces.C.int;
    begin
        Result := fl_text_buffer_search_backward
               (This.Void_Ptr,
                Interfaces.C.int (Start_At),
                Interfaces.C.To_C (Item),
                Found_Raw,
                Boolean'Pos (Match_Case));
        if Result /= 0 then
            Found_At := Natural (Found_Raw);
        end if;
        return Result /= 0;
    end Search_Backward;




    procedure Set_Selection
           (This          : in out Text_Buffer;
            Start, Finish : in     Natural) is
    begin
        fl_text_buffer_select
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Finish));
    end Set_Selection;




    function Get_Selection
           (This          : in     Text_Buffer;
            Start, Finish :    out Natural)
        return Boolean
    is
        Result, Start_Raw, Finish_Raw : Interfaces.C.int;
    begin
        Result := fl_text_buffer_selection_position
               (This.Void_Ptr,
                Start_Raw,
                Finish_Raw);
        if Result /= 0 then
            Start := Natural (Start_Raw);
            Finish := Natural (Finish_Raw);
        end if;
        return Result /= 0;
    end Get_Selection;




    function Has_Selection
           (This : in Text_Buffer)
        return Boolean is
    begin
        return fl_text_buffer_selected (This.Void_Ptr) /= 0;
    end Has_Selection;




    function Skip_Lines
           (This         : in out Text_Buffer;
            Start, Lines : in     Natural)
        return Natural is
    begin
        return Natural (fl_text_buffer_skip_lines
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Lines)));
    end Skip_Lines;




    function Rewind_Lines
           (This         : in out Text_Buffer;
            Start, Lines : in     Natural)
        return Natural is
    begin
        return Natural (fl_text_buffer_rewind_lines
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Lines)));
    end Rewind_Lines;




    function Character_At
           (This : in Text_Buffer;
            Pos  : in Natural)
        return Character is
    begin
        return Character'Val (fl_text_buffer_char_at
               (This.Void_Ptr,
                Interfaces.C.int (Pos)));
    end Character_At;




    function Text_At
           (This          : in Text_Buffer;
            Start, Finish : in Natural)
        return String
    is
        C_Str : Interfaces.C.Strings.chars_ptr := fl_text_buffer_text_range
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Finish));
        The_Text : String := Interfaces.C.Strings.Value (C_Str);
    begin
        Interfaces.C.Strings.Free (C_Str);
        return The_Text;
    end Text_At;


end FLTK.Text_Buffers;

