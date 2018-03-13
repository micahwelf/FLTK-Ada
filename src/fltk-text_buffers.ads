

private with

    Ada.Containers.Vectors,
    System.Address_To_Access_Conversions,
    Interfaces.C.Strings;


package FLTK.Text_Buffers is


    type Text_Buffer is new Wrapper with private;

    type Text_Buffer_Cursor (Data : access Text_Buffer'Class) is limited null record
        with Implicit_Dereference => Data;

    type Position is new Natural;

    type Modification is (Insert, Restyle, Delete, None);

    type Modify_Callback is access procedure
           (Action       : in Modification;
            Place        : in Position;
            Length       : in Natural;
            Deleted_Text : in String);

    type Predelete_Callback is access procedure
           (Place  : in Position;
            Length : in Natural);




    package Forge is

        function Create
               (Requested_Size     : in Natural := 0;
                Preferred_Gap_Size : in Natural := 1024)
            return Text_Buffer;

    end Forge;




    procedure Add_Modify_Callback
           (This : in out Text_Buffer;
            Func : in     Modify_Callback);

    procedure Add_Predelete_Callback
           (This : in out Text_Buffer;
            Func : in     Predelete_Callback);

    procedure Call_Modify_Callbacks
           (This : in out Text_Buffer);

    procedure Call_Predelete_Callbacks
           (This : in out Text_Buffer);

    procedure Enable_Callbacks
           (This : in out Text_Buffer);

    procedure Disable_Callbacks
           (This : in out Text_Buffer);




    procedure Load_File
           (This : in Text_Buffer;
            Name : in String);

    procedure Save_File
           (This : in Text_Buffer;
            Name : in String);




    procedure Insert_Text
           (This : in out Text_Buffer;
            Pos  : in     Natural;
            Item : in     String);

    procedure Remove_Text
           (This          : in out Text_Buffer;
            Start, Finish : in     Natural);

    function Character_At
           (This : in Text_Buffer;
            Pos  : in Natural)
        return Character;

    function Text_At
           (This          : in Text_Buffer;
            Start, Finish : in Natural)
        return String;

    function Length
           (This : in Text_Buffer)
        return Natural;




    function Get_Selection
           (This          : in     Text_Buffer;
            Start, Finish :    out Natural)
        return Boolean;

    procedure Set_Selection
           (This          : in out Text_Buffer;
            Start, Finish : in     Natural);

    function Has_Selection
           (This : in Text_Buffer)
        return Boolean;

    procedure Remove_Selected_Text
           (This : in out Text_Buffer);




    function Search_Forward
           (This       : in     Text_Buffer;
            Start_At   : in     Natural;
            Item       : in     String;
            Found_At   :    out Natural;
            Match_Case : in     Boolean)
        return Boolean;

    function Search_Backward
           (This       : in     Text_Buffer;
            Start_At   : in     Natural;
            Item       : in     String;
            Found_At   :    out Natural;
            Match_Case : in     Boolean)
        return Boolean;

    --  only takes into account newline characters, not word wrap
    function Skip_Lines
           (This         : in out Text_Buffer;
            Start, Lines : in     Natural)
        return Natural;

    --  only takes into account newline characters, not word wrap
    function Rewind_Lines
           (This         : in out Text_Buffer;
            Start, Lines : in     Natural)
        return Natural;


private


    package Modify_Vectors is new Ada.Containers.Vectors
           (Index_Type => Positive,
            Element_Type => Modify_Callback);
    package Predelete_Vectors is new Ada.Containers.Vectors
           (Index_Type => Positive,
            Element_Type => Predelete_Callback);




    type Text_Buffer is new Wrapper with
        record
            CB_Active     : Boolean;
            Modify_CBs    : Modify_Vectors.Vector;
            Predelete_CBs : Predelete_Vectors.Vector;
        end record;

    overriding procedure Finalize
           (This : in out Text_Buffer);




    procedure Modify_Callback_Hook
           (Pos, Inserted, Deleted, Restyled : in Interfaces.C.int;
            Text                             : in Interfaces.C.Strings.chars_ptr;
            UD                               : in System.Address);
    pragma Convention (C, Modify_Callback_Hook);

    procedure Predelete_Callback_Hook
           (Pos, Deleted : in Interfaces.C.int;
            UD           : in System.Address);
    pragma Convention (C, Predelete_Callback_Hook);




    package Text_Buffer_Convert is new System.Address_To_Access_Conversions (Text_Buffer);


end FLTK.Text_Buffers;

