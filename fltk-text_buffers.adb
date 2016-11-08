

with Interfaces.C;
with Interfaces.C.Strings;
with Ada.Strings.Unbounded;
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

    procedure fl_text_buffer_select
           (TB   : in System.Address;
            S, E : in Interfaces.C.int);
    pragma Import (C, fl_text_buffer_select, "fl_text_buffer_select");




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
        package UStr renames Ada.Strings.Unbounded;

        Action : Modification;
        Place : Position := Position (Pos);
        Length : Natural;
        Deleted_Text : UStr.Unbounded_String := UStr.To_Unbounded_String ("");

        Ada_Text_Buffer : access Text_Buffer :=
            Text_Buffer_Convert.To_Pointer (UD);
    begin
        if Inserted > 0 then
            Length := Natural (Inserted);
            Action := Insert;
        elsif Deleted > 0 then
            Length := Natural (Deleted);
            Action := Delete;
            if Text /= Interfaces.C.Strings.Null_Ptr then
                Deleted_Text := UStr.To_Unbounded_String (Interfaces.C.Strings.Value (Text));
            end if;
        elsif Restyled > 0 then
            Length := Natural (Restyled);
            Action := Restyle;
        else
            Length := 0;
            Action := None;
        end if;

        for CB of Ada_Text_Buffer.Modify_CBs loop
            CB.Call (Action, Place, Length, UStr.To_String (Deleted_Text));
        end loop;
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
        for CB of Ada_Text_Buffer.Predelete_CBs loop
            CB.Call (Place, Length);
        end loop;
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
        end return;
    end Create;




    procedure Add_Modify_Callback
           (This : in out Text_Buffer;
            Func : not null access Modify_Callback'Class) is
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
            Func : not null access Predelete_Callback'Class) is
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
        Found_Raw : Interfaces.C.int;
        Result : Interfaces.C.int;
    begin
        Result := fl_text_buffer_search_forward
               (This.Void_Ptr,
                Interfaces.C.int (Start_At),
                Interfaces.C.To_C (Item),
                Found_Raw,
                Boolean'Pos (Match_Case));
        Found_At := Natural (Found_Raw);
        return Boolean'Val (Result);
    end Search_Forward;




    procedure Set_Selection
           (This          : in out Text_Buffer;
            Start, Finish : in     Natural) is
    begin
        fl_text_buffer_select
               (This.Void_Ptr,
                Interfaces.C.int (Start),
                Interfaces.C.int (Finish));
    end Set_Selection;


end FLTK.Text_Buffers;

