

private with Ada.Containers.Vectors;
private with System.Address_To_Access_Conversions;


package FLTK.Text_Buffers is


    type Text_Buffer is new Wrapper with private;
    type Text_Buffer_Cursor (Data : access Text_Buffer'Class) is limited null record
        with Implicit_Dereference => Data;


    type Position is new Natural;


    type Modification is (Insert, Restyle, Delete, None);
    type Modify_Callback is interface;
    procedure Call
           (This         : in Modify_Callback;
            Action       : in Modification;
            Place        : in Position;
            Length       : in Natural;
            Deleted_Text : in String) is abstract;


    type Predelete_Callback is interface;
    procedure Call
           (This   : in Predelete_Callback;
            Place  : in Position;
            Length : in Natural) is abstract;


    function Create
           (Requested_Size     : in Natural := 0;
            Preferred_Gap_Size : in Natural := 1024)
        return Text_Buffer;


    procedure Add_Modify_Callback
           (This : in out Text_Buffer;
            Func : not null access Modify_Callback'Class);


    procedure Add_Predelete_Callback
           (This : in out Text_Buffer;
            Func : not null access Predelete_Callback'Class);


    procedure Call_Modify_Callbacks
           (This : in out Text_Buffer);


    procedure Call_Predelete_Callbacks
           (This : in out Text_Buffer);


    procedure Insert_Text
           (This : in out Text_Buffer;
            Pos  : in     Natural;
            Item : in     String);


    function Length
           (This : in Text_Buffer)
        return Natural;


    procedure Load_File
           (This : in Text_Buffer;
            Name : in String);


    procedure Remove_Selected_Text
           (This : in out Text_Buffer);


    procedure Save_File
           (This : in Text_Buffer;
            Name : in String);


    function Search_Forward
           (This       : in     Text_Buffer;
            Start_At   : in     Natural;
            Item       : in     String;
            Found_At   :    out Natural;
            Match_Case : in     Boolean)
        return Boolean;


    procedure Set_Selection
           (This          : in out Text_Buffer;
            Start, Finish : in     Natural);


private


    type Modify_Access is access all Modify_Callback'Class;
    type Predelete_Access is access all Predelete_Callback'Class;


    package Modify_Vectors is new Ada.Containers.Vectors
           (Index_Type => Positive,
            Element_Type => Modify_Access);
    package Predelete_Vectors is new Ada.Containers.Vectors
           (Index_Type => Positive,
            Element_Type => Predelete_Access);


    type Text_Buffer is new Wrapper with
        record
            Modify_CBs : Modify_Vectors.Vector;
            Predelete_CBs : Predelete_Vectors.Vector;
        end record;


    overriding procedure Finalize
           (This : in out Text_Buffer);


    package Text_Buffer_Convert is new System.Address_To_Access_Conversions (Text_Buffer);


end FLTK.Text_Buffers;

