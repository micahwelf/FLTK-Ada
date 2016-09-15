

with Interfaces.C;
with Interfaces.C.Strings;
with Ada.Strings.Unbounded;
with Ada.Containers;
with System;
use type System.Address;
use type Interfaces.C.int;
use type Interfaces.C.Strings.chars_ptr;
use type Ada.Containers.Count_Type;


with Ada.Text_IO;


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
            Text : in Interfaces.C.Strings.chars_ptr;
            UD : in System.Address);
    pragma Convention (C, Modify_Callback_Hook);

    procedure Modify_Callback_Hook
           (Pos                         : in Interfaces.C.int;
            Inserted, Deleted, Restyled : in Interfaces.C.int;
            Text                        : in Interfaces.C.Strings.chars_ptr;
            UD                          : in System.Address) is

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
            raise Program_Error;
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
            UD           : in System.Address) is

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


end FLTK.Text_Buffers;

