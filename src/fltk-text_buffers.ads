

private with

    Ada.Containers.Vectors,
    System.Address_To_Access_Conversions,
    Interfaces.C.Strings;


package FLTK.Text_Buffers is


    type Text_Buffer is new Wrapper with private;

    type Text_Buffer_Reference (Data : access Text_Buffer'Class) is limited null record
        with Implicit_Dereference => Data;

    subtype Position is Natural;

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

    procedure Remove_Modify_Callback
           (This : in out Text_Buffer;
            Func : in     Modify_Callback);

    procedure Remove_Predelete_Callback
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
           (This   : in out Text_Buffer;
            Name   : in     String;
            Buffer : in     Natural := 128 * 1024);

    procedure Append_File
           (This   : in out Text_Buffer;
            Name   : in     String;
            Buffer : in     Natural := 128 * 1024);

    procedure Insert_File
           (This   : in out Text_Buffer;
            Name   : in     String;
            Place  : in     Position;
            Buffer : in     Natural := 128 * 1024);

    procedure Output_File
           (This          : in Text_Buffer;
            Name          : in String;
            Start, Finish : in Position;
            Buffer        : in Natural := 128 * 1024);

    procedure Save_File
           (This   : in Text_Buffer;
            Name   : in String;
            Buffer : in Natural := 128 * 1024);




    procedure Insert_Text
           (This  : in out Text_Buffer;
            Place : in     Position;
            Text  : in     String);

    procedure Append_Text
           (This : in out Text_Buffer;
            Text : in     String);

    procedure Replace_Text
           (This          : in out Text_Buffer;
            Start, Finish : in     Position;
            Text          : in     String);

    procedure Remove_Text
           (This          : in out Text_Buffer;
            Start, Finish : in     Position);

    function Get_Entire_Text
           (This : in Text_Buffer)
        return String;

    procedure Set_Entire_Text
           (This : in out Text_Buffer;
            Text : in     String);

    function Byte_At
           (This  : in Text_Buffer;
            Place : in Position)
        return Character;

    function Character_At
           (This  : in Text_Buffer;
            Place : in Position)
        return Character;

    function Text_At
           (This          : in Text_Buffer;
            Start, Finish : in Position)
        return String;

    function Next_Char
           (This  : in Text_Buffer;
            Place : in Position)
        return Character;

    function Prev_Char
           (This  : in Text_Buffer;
            Place : in Position)
        return Character;




    function Count_Displayed_Characters
           (This          : in Text_Buffer;
            Start, Finish : in Position)
        return Integer;

    function Count_Lines
           (This          : in Text_Buffer;
            Start, Finish : in Position)
        return Integer;

    function Length
           (This : in Text_Buffer)
        return Natural;

    function Get_Tab_Width
           (This : in Text_Buffer)
        return Natural;

    procedure Set_Tab_Width
           (This : in out Text_Buffer;
            To   : in     Natural);




    function Get_Selection
           (This          : in     Text_Buffer;
            Start, Finish :    out Position)
        return Boolean;

    function Get_Secondary_Selection
           (This          : in     Text_Buffer;
            Start, Finish :    out Position)
        return Boolean;

    procedure Set_Selection
           (This          : in out Text_Buffer;
            Start, Finish : in     Position);

    procedure Set_Secondary_Selection
           (This          : in out Text_Buffer;
            Start, Finish : in     Position);

    function Has_Selection
           (This : in Text_Buffer)
        return Boolean;

    function Has_Secondary_Selection
           (This : in Text_Buffer)
        return Boolean;

    function Selection_Text
           (This : in Text_Buffer)
        return String;

    function Secondary_Selection_Text
           (This : in Text_Buffer)
        return String;

    procedure Replace_Selection
           (This : in out Text_Buffer;
            Text : in     String);

    procedure Replace_Secondary_Selection
           (This : in out Text_Buffer;
            Text : in     String);

    procedure Remove_Selection
           (This : in out Text_Buffer);

    procedure Remove_Secondary_Selection
           (This : in out Text_Buffer);

    procedure Unselect
           (This : in out Text_Buffer);

    procedure Secondary_Unselect
           (This : in out Text_Buffer);




    procedure Get_Highlight
           (This          : in     Text_Buffer;
            Start, Finish :    out Position);

    procedure Set_Highlight
           (This          : in out Text_Buffer;
            Start, Finish : in     Position);

    function Get_Highlighted_Text
           (This : in Text_Buffer)
        return String;

    procedure Unhighlight
           (This : in out Text_Buffer);




    function Findchar_Forward
           (This     : in     Text_Buffer;
            Start_At : in     Position;
            Item     : in     Character;
            Found_At :    out Position)
        return Boolean;

    function Findchar_Backward
           (This     : in     Text_Buffer;
            Start_At : in     Position;
            Item     : in     Character;
            Found_At :    out Position)
        return Boolean;

    function Search_Forward
           (This       : in     Text_Buffer;
            Start_At   : in     Position;
            Item       : in     String;
            Found_At   :    out Position;
            Match_Case : in     Boolean := False)
        return Boolean;

    function Search_Backward
           (This       : in     Text_Buffer;
            Start_At   : in     Position;
            Item       : in     String;
            Found_At   :    out Position;
            Match_Case : in     Boolean := False)
        return Boolean;




    function Word_Start
           (This  : in Text_Buffer;
            Place : in Position)
        return Position;

    function Word_End
           (This  : in Text_Buffer;
            Place : in Position)
        return Position;

    function Line_Start
           (This  : in Text_Buffer;
            Place : in Position)
        return Position;

    function Line_End
           (This  : in Text_Buffer;
            Place : in Position)
        return Position;

    function Line_Text
           (This  : in Text_Buffer;
            Place : in Position)
        return String;

    --  only takes into account newline characters, not word wrap
    function Skip_Lines
           (This  : in out Text_Buffer;
            Start : in     Position;
            Lines : in     Natural)
        return Position;

    --  only takes into account newline characters, not word wrap
    function Rewind_Lines
           (This  : in out Text_Buffer;
            Start : in     Position;
            Lines : in     Natural)
        return Position;

    function Skip_Displayed_Characters
           (This  : in Text_Buffer;
            Start : in Position;
            Chars : in Natural)
        return Position;




    procedure Can_Undo
           (This : in out Text_Buffer;
            Flag : in     Boolean);

    procedure Copy
           (This          : in out Text_Buffer;
            From          : in     Text_Buffer;
            Start, Finish : in     Position;
            Insert_Pos    : in     Position);

    function UTF8_Align
           (This  : in Text_Buffer;
            Place : in Position)
        return Position;


private


    package Modify_Vectors is new Ada.Containers.Vectors
           (Index_Type => Positive,
            Element_Type => Modify_Callback);
    package Predelete_Vectors is new Ada.Containers.Vectors
           (Index_Type => Positive,
            Element_Type => Predelete_Callback);




    type Text_Buffer is new Wrapper with
        record
            CB_Active          : Boolean;
            Modify_CBs         : Modify_Vectors.Vector;
            Predelete_CBs      : Predelete_Vectors.Vector;
            High_From, High_To : Natural := 0;
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




    pragma Inline (Add_Modify_Callback);
    pragma Inline (Add_Predelete_Callback);
    pragma Inline (Remove_Modify_Callback);
    pragma Inline (Remove_Predelete_Callback);
    pragma Inline (Call_Modify_Callbacks);
    pragma Inline (Call_Predelete_Callbacks);
    pragma Inline (Enable_Callbacks);
    pragma Inline (Disable_Callbacks);


    pragma Inline (Load_File);
    pragma Inline (Append_File);
    pragma Inline (Insert_File);
    pragma Inline (Output_File);
    pragma Inline (Save_File);


    pragma Inline (Insert_Text);
    pragma Inline (Append_Text);
    pragma Inline (Replace_Text);
    pragma Inline (Remove_Text);
    pragma Inline (Get_Entire_Text);
    pragma Inline (Set_Entire_Text);
    pragma Inline (Byte_At);
    pragma Inline (Character_At);
    pragma Inline (Text_At);
    pragma Inline (Next_Char);
    pragma Inline (Prev_Char);


    pragma Inline (Count_Displayed_Characters);
    pragma Inline (Count_Lines);
    pragma Inline (Length);
    pragma Inline (Get_Tab_Width);
    pragma Inline (Set_Tab_Width);


    pragma Inline (Get_Selection);
    pragma Inline (Get_Secondary_Selection);
    pragma Inline (Set_Selection);
    pragma Inline (Set_Secondary_Selection);
    pragma Inline (Has_Selection);
    pragma Inline (Has_Secondary_Selection);
    pragma Inline (Selection_Text);
    pragma Inline (Secondary_Selection_Text);
    pragma Inline (Replace_Selection);
    pragma Inline (Replace_Secondary_Selection);
    pragma Inline (Remove_Selection);
    pragma Inline (Remove_Secondary_Selection);
    pragma Inline (Unselect);
    pragma Inline (Secondary_Unselect);


    pragma Inline (Get_Highlight);
    pragma Inline (Set_Highlight);
    pragma Inline (Get_Highlighted_Text);
    pragma Inline (Unhighlight);


    pragma Inline (Findchar_Forward);
    pragma Inline (Findchar_Backward);
    pragma Inline (Search_Forward);
    pragma Inline (Search_Backward);


    pragma Inline (Word_Start);
    pragma Inline (Word_End);
    pragma Inline (Line_Start);
    pragma Inline (Line_End);
    pragma Inline (Line_Text);
    pragma Inline (Skip_Lines);
    pragma Inline (Rewind_Lines);
    pragma Inline (Skip_Displayed_Characters);


    pragma Inline (Can_Undo);
    pragma Inline (Copy);
    pragma Inline (UTF8_Align);


end FLTK.Text_Buffers;

