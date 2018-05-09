

package FLTK.Environment is


    type Preferences is new Wrapper with private;

    type Preferences_Reference (Data : not null access Preferences'Class) is
        limited null record with Implicit_Dereference => Data;

    type Scope is (Root, User);




    Preference_Error : exception;




    package Forge is

        function From_Filesystem
               (Path, Vendor, Application : in String)
            return Preferences;

    end Forge;




    function Number_Of_Entries
           (This : in Preferences)
        return Natural;

    function Get_Key
           (This  : in Preferences;
            Index : in Natural)
        return String;

    function Entry_Exists
           (This : in Preferences;
            Key  : in String)
        return Boolean;

    function Entry_Size
           (This : in Preferences;
            Key  : in String)
        return Natural;




    function Get
           (This : in Preferences;
            Key  : in String)
        return Integer;

    function Get
           (This : in Preferences;
            Key  : in String)
        return Float;

    function Get
           (This : in Preferences;
            Key  : in String)
        return Long_Float;

    function Get
           (This : in Preferences;
            Key  : in String)
        return String;




    function Get
           (This    : in Preferences;
            Key     : in String;
            Default : in Integer)
        return Integer;

    function Get
           (This    : in Preferences;
            Key     : in String;
            Default : in Float)
        return Float;

    function Get
           (This    : in Preferences;
            Key     : in String;
            Default : in Long_Float)
        return Long_Float;

    function Get
           (This    : in Preferences;
            Key     : in String;
            Default : in String)
        return String;




    procedure Set
           (This  : in out Preferences;
            Key   : in     String;
            Value : in     Integer);

    procedure Set
           (This  : in out Preferences;
            Key   : in     String;
            Value : in     Float);

    procedure Set
           (This      : in out Preferences;
            Key       : in     String;
            Value     : in     Float;
            Precision : in     Natural);

    procedure Set
           (This  : in out Preferences;
            Key   : in     String;
            Value : in     Long_Float);

    procedure Set
           (This      : in out Preferences;
            Key       : in     String;
            Value     : in     Long_Float;
            Precision : in     Natural);

    procedure Set
           (This  : in out Preferences;
            Key   : in     String;
            Value : in     String);




    procedure Delete_Entry
           (This : in out Preferences;
            Key  : in     String);

    procedure Delete_All_Entries
           (This : in out Preferences);

    procedure Clear
           (This : in out Preferences);




    procedure Flush
           (This : in Preferences);


private


    type Preferences is new Wrapper with null record;

    overriding procedure Finalize
           (This : in out Preferences);




    pragma Inline (Number_Of_Entries);
    pragma Inline (Get_Key);
    pragma Inline (Entry_Exists);
    pragma Inline (Entry_Size);


    pragma Inline (Get);
    pragma Inline (Set);


    pragma Inline (Delete_Entry);
    pragma Inline (Delete_All_Entries);
    pragma Inline (Clear);


    pragma Inline (Flush);


end FLTK.Environment;

