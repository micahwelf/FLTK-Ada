

with

    Interfaces.C.Strings,
    System;

use type

    Interfaces.C.int,
    Interfaces.C.Strings.chars_ptr,
    System.Address;


package body FLTK.Environment is


    function new_fl_preferences
           (P, V, A : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_preferences, "new_fl_preferences");
    pragma Inline (new_fl_preferences);

    procedure free_fl_preferences
           (E : in System.Address);
    pragma Import (C, free_fl_preferences, "free_fl_preferences");
    pragma Inline (free_fl_preferences);




    function fl_preferences_entries
           (E : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_entries, "fl_preferences_entries");
    pragma Inline (fl_preferences_entries);

    function fl_preferences_entry
           (E : in System.Address;
            I : in Interfaces.C.int)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_preferences_entry, "fl_preferences_entry");
    pragma Inline (fl_preferences_entry);

    function fl_preferences_entryexists
           (E : in System.Address;
            K : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_entryexists, "fl_preferences_entryexists");
    pragma Inline (fl_preferences_entryexists);

    function fl_preferences_size
           (E : in System.Address;
            K : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_size, "fl_preferences_size");
    pragma Inline (fl_preferences_size);




    function fl_preferences_get_int
           (E : in     System.Address;
            K : in     Interfaces.C.char_array;
            V :    out Interfaces.C.int;
            D : in     Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_get_int, "fl_preferences_get_int");
    pragma Inline (fl_preferences_get_int);

    function fl_preferences_get_float
           (E : in     System.Address;
            K : in     Interfaces.C.char_array;
            V :    out Interfaces.C.C_float;
            D : in     Interfaces.C.C_float)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_get_float, "fl_preferences_get_float");
    pragma Inline (fl_preferences_get_float);

    function fl_preferences_get_double
           (E : in     System.Address;
            K : in     Interfaces.C.char_array;
            V :    out Interfaces.C.double;
            D : in     Interfaces.C.double)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_get_double, "fl_preferences_get_double");
    pragma Inline (fl_preferences_get_double);

    function fl_preferences_get_str
           (E : in     System.Address;
            K : in     Interfaces.C.char_array;
            V :    out Interfaces.C.Strings.chars_ptr;
            D : in     Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_get_str, "fl_preferences_get_str");
    pragma Inline (fl_preferences_get_str);




    function fl_preferences_set_int
           (E : in System.Address;
            K : in Interfaces.C.char_array;
            V : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_set_int, "fl_preferences_set_int");
    pragma Inline (fl_preferences_set_int);

    function fl_preferences_set_float
           (E : in System.Address;
            K : in Interfaces.C.char_array;
            V : in Interfaces.C.C_float)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_set_float, "fl_preferences_set_float");
    pragma Inline (fl_preferences_set_float);

    function fl_preferences_set_float_prec
           (E : in System.Address;
            K : in Interfaces.C.char_array;
            V : in Interfaces.C.C_float;
            P : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_set_float_prec, "fl_preferences_set_float_prec");
    pragma Inline (fl_preferences_set_float_prec);

    function fl_preferences_set_double
           (E : in System.Address;
            K : in Interfaces.C.char_array;
            V : in Interfaces.C.double)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_set_double, "fl_preferences_set_double");
    pragma Inline (fl_preferences_set_double);

    function fl_preferences_set_double_prec
           (E : in System.Address;
            K : in Interfaces.C.char_array;
            V : in Interfaces.C.double;
            P : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_set_double_prec, "fl_preferences_set_double_prec");
    pragma Inline (fl_preferences_set_double_prec);

    function fl_preferences_set_str
           (E : in System.Address;
            K : in Interfaces.C.char_array;
            V : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_set_str, "fl_preferences_set_str");
    pragma Inline (fl_preferences_set_str);




    function fl_preferences_deleteentry
           (E : in System.Address;
            K : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_deleteentry, "fl_preferences_deleteentry");
    pragma Inline (fl_preferences_deleteentry);

    function fl_preferences_deleteallentries
           (E : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_deleteallentries, "fl_preferences_deleteallentries");
    pragma Inline (fl_preferences_deleteallentries);

    function fl_preferences_clear
           (E : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_preferences_clear, "fl_preferences_clear");
    pragma Inline (fl_preferences_clear);




    procedure fl_preferences_flush
           (E : in System.Address);
    pragma Import (C, fl_preferences_flush, "fl_preferences_flush");
    pragma Inline (fl_preferences_flush);




    procedure Finalize
           (This : in out Preferences) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Preferences'Class
        then
            free_fl_preferences (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
    end Finalize;




    package body Forge is

        function From_Filesystem
               (Path, Vendor, Application : in String)
            return Preferences is
        begin
            return This : Preferences do
                This.Void_Ptr := new_fl_preferences
                   (Interfaces.C.To_C (Path),
                    Interfaces.C.To_C (Vendor),
                    Interfaces.C.To_C (Application));
            end return;
        end From_Filesystem;

    end Forge;




    function Number_Of_Entries
           (This : in Preferences)
        return Natural is
    begin
        return Natural (fl_preferences_entries (This.Void_Ptr));
    end Number_Of_Entries;


    function Get_Key
           (This  : in Preferences;
            Index : in Natural)
        return String
    is
        Key : Interfaces.C.Strings.chars_ptr :=
            fl_preferences_entry (This.Void_Ptr, Interfaces.C.int (Index));
    begin
        --  no need for dealloc?
        if Key = Interfaces.C.Strings.Null_Ptr then
            raise Constraint_Error;
        else
            return Interfaces.C.Strings.Value (Key);
        end if;
    end Get_Key;


    function Entry_Exists
           (This : in Preferences;
            Key  : in String)
        return Boolean is
    begin
        return fl_preferences_entryexists (This.Void_Ptr, Interfaces.C.To_C (Key)) /= 0;
    end Entry_Exists;


    function Entry_Size
           (This : in Preferences;
            Key  : in String)
        return Natural is
    begin
        return Natural (fl_preferences_size (This.Void_Ptr, Interfaces.C.To_C (Key)));
    end Entry_Size;




    function Get
           (This : in Preferences;
            Key  : in String)
        return Integer
    is
        Value : Interfaces.C.int;
    begin
        if fl_preferences_get_int
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Value, 0) = 0
        then
            raise Preference_Error;
        end if;
        return Integer (Value);
    end Get;


    function Get
           (This : in Preferences;
            Key  : in String)
        return Float
    is
        Value : Interfaces.C.C_float;
    begin
        if fl_preferences_get_float
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Value, 0.0) = 0
        then
            raise Preference_Error;
        end if;
        return Float (Value);
    end Get;


    function Get
           (This : in Preferences;
            Key  : in String)
        return Long_Float
    is
        Value : Interfaces.C.double;
    begin
        if fl_preferences_get_double
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Value, 0.0) = 0
        then
            raise Preference_Error;
        end if;
        return Long_Float (Value);
    end Get;


    function Get
           (This : in Preferences;
            Key  : in String)
        return String
    is
        Value : Interfaces.C.Strings.chars_ptr;
        Check : Interfaces.C.int := fl_preferences_get_str
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Value,
            Interfaces.C.To_C ("default"));
    begin
        if Check = 0 then
            raise Preference_Error;
        end if;
        if Value = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            declare
                Str : String := Interfaces.C.Strings.Value (Value);
            begin
                Interfaces.C.Strings.Free (Value);
                return Str;
            end;
        end if;
    end Get;




    function Get
           (This    : in Preferences;
            Key     : in String;
            Default : in Integer)
        return Integer
    is
        Value, X : Interfaces.C.int;
    begin
        X := fl_preferences_get_int
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Value,
            Interfaces.C.int (Default));
        return Integer (Value);
    end Get;


    function Get
           (This    : in Preferences;
            Key     : in String;
            Default : in Float)
        return Float
    is
        Value : Interfaces.C.C_float;
        X : Interfaces.C.int;
    begin
        X := fl_preferences_get_float
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Value,
            Interfaces.C.C_float (Default));
        return Float (Value);
    end Get;


    function Get
           (This    : in Preferences;
            Key     : in String;
            Default : in Long_Float)
        return Long_Float
    is
        Value : Interfaces.C.double;
        X : Interfaces.C.int;
    begin
        X := fl_preferences_get_double
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Value,
            Interfaces.C.double (Default));
        return Long_Float (Value);
    end Get;


    function Get
           (This    : in Preferences;
            Key     : in String;
            Default : in String)
        return String
    is
        Value : Interfaces.C.Strings.chars_ptr;
        X : Interfaces.C.int := fl_preferences_get_str
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Value,
            Interfaces.C.To_C (Default));
    begin
        if Value = Interfaces.C.Strings.Null_Ptr then
            return "";
        else
            declare
                Str : String := Interfaces.C.Strings.Value (Value);
            begin
                Interfaces.C.Strings.Free (Value);
                return Str;
            end;
        end if;
    end Get;




    procedure Set
           (This  : in out Preferences;
            Key   : in     String;
            Value : in     Integer) is
    begin
        if fl_preferences_set_int
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Interfaces.C.int (Value)) = 0
        then
            raise Preference_Error;
        end if;
    end Set;


    procedure Set
           (This  : in out Preferences;
            Key   : in     String;
            Value : in     Float) is
    begin
        if fl_preferences_set_float
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Interfaces.C.C_float (Value)) = 0
        then
            raise Preference_Error;
        end if;
    end Set;


    procedure Set
           (This      : in out Preferences;
            Key       : in     String;
            Value     : in     Float;
            Precision : in     Natural) is
    begin
        if fl_preferences_set_float_prec
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Interfaces.C.C_float (Value),
            Interfaces.C.int (Precision)) = 0
        then
            raise Preference_Error;
        end if;
    end Set;


    procedure Set
           (This  : in out Preferences;
            Key   : in     String;
            Value : in     Long_Float) is
    begin
        if fl_preferences_set_double
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Interfaces.C.double (Value)) = 0
        then
            raise Preference_Error;
        end if;
    end Set;


    procedure Set
           (This      : in out Preferences;
            Key       : in     String;
            Value     : in     Long_Float;
            Precision : in     Natural) is
    begin
        if fl_preferences_set_double_prec
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Interfaces.C.double (Value),
            Interfaces.C.int (Precision)) = 0
        then
            raise Preference_Error;
        end if;
    end Set;


    procedure Set
           (This  : in out Preferences;
            Key   : in     String;
            Value : in     String) is
    begin
        if fl_preferences_set_str
           (This.Void_Ptr,
            Interfaces.C.To_C (Key),
            Interfaces.C.To_C (Value)) = 0
        then
            raise Preference_Error;
        end if;
    end Set;




    procedure Delete_Entry
           (This : in out Preferences;
            Key  : in     String) is
    begin
        if fl_preferences_deleteentry (This.Void_Ptr, Interfaces.C.To_C (Key)) = 0 then
            raise Preference_Error;
        end if;
    end Delete_Entry;


    procedure Delete_All_Entries
           (This : in out Preferences) is
    begin
        if fl_preferences_deleteallentries (This.Void_Ptr) = 0 then
            raise Preference_Error;
        end if;
    end Delete_All_Entries;


    procedure Clear
           (This : in out Preferences) is
    begin
        if fl_preferences_clear (This.Void_Ptr) = 0 then
            raise Preference_Error;
        end if;
    end Clear;




    procedure Flush
           (This : in Preferences) is
    begin
        fl_preferences_flush (This.Void_Ptr);
    end Flush;


end FLTK.Environment;

