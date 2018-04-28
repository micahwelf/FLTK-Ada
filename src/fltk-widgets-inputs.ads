

private with

    Interfaces.C.Strings,
    System;


package FLTK.Widgets.Inputs is


    type Input is new Widget with private;

    type Input_Reference (Data : not null access Input'Class) is limited null record
        with Implicit_Dereference => Data;

    type Input_Kind is
       (Normal_Kind, Float_Kind, Integer_Kind, Multiline_Kind,
        Secret_Kind, Readonly_Kind, Wrap_Kind);




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Input;

    end Forge;




    procedure Copy
           (This : in out Input);

    procedure Cut
           (This : in out Input);

    procedure Cut
           (This      : in out Input;
            Num_Bytes : in     Integer);

    procedure Cut
           (This          : in out Input;
            Start, Finish : in     Integer);

    procedure Copy_Cuts
           (This : in out Input);

    procedure Undo
           (This : in out Input);




    function Has_Changed
           (This : in Input)
        return Boolean;

    procedure Clear_Changed
           (This : in out Input);

    function Is_Readonly
           (This : in Input)
        return Boolean;

    procedure Set_Readonly
           (This : in out Input;
            To   : in     Boolean);

    function Is_Tab_Nav
           (This : in Input)
        return Boolean;

    procedure Set_Tab_Nav
           (This : in out Input;
            To   : in     Boolean);

    function Is_Wrap
           (This : in Input)
        return Boolean;

    procedure Set_Wrap
           (This : in out Input;
            To   : in     Boolean);




    function Get_Input_Type
           (This : in Input)
        return Input_Kind;

    function Get_Shortcut_Key
           (This : in Input)
        return Key_Combo;

    procedure Set_Shortcut_Key
           (This : in out Input;
            To   : in     Key_Combo);

    function Get_Mark
           (This : in Input)
        return Natural;

    procedure Set_Mark
           (This : in out Input;
            To   : in     Natural);

    function Get_Position
           (This : in Input)
        return Natural;

    procedure Set_Position
           (This : in out Input;
            To   : in     Natural);




    function Index
           (This  : in Input;
            Place : in Integer)
        return Character;

    procedure Insert
           (This : in out Input;
            Str  : in     String);

    procedure Replace
           (This     : in out Input;
            From, To : in     Natural;
            New_Text : in     String);

    function Get_Value
           (This : in Input)
        return String;

    procedure Set_Value
           (This : in out Input;
            To   : in     String);




    function Get_Maximum_Size
           (This : in Input)
        return Natural;

    procedure Set_Maximum_Size
           (This : in out Input;
            To   : in     Natural);

    function Size
           (This : in Input)
        return Natural;




    function Get_Cursor_Color
           (This : in Input)
        return Color;

    procedure Set_Cursor_Color
           (This : in out Input;
            To   : in     Color);

    function Get_Text_Color
           (This : in Input)
        return Color;

    procedure Set_Text_Color
           (This : in out Input;
            To   : in     Color);

    function Get_Text_Font
           (This : in Input)
        return Font_Kind;

    procedure Set_Text_Font
           (This : in out Input;
            To   : in     Font_Kind);

    function Get_Text_Size
           (This : in Input)
        return Font_Size;

    procedure Set_Text_Size
           (This : in out Input;
            To   : in     Font_Size);




    procedure Resize
           (This : in out Input;
            W, H : in     Integer);




    procedure Draw
           (This : in out Input);

    function Handle
           (This  : in out Input;
            Event : in     Event_Kind)
        return Event_Outcome;




    package Extra is

        procedure Set_Input_Type
               (This : in out Input;
                To   : in     Input_Kind);

    end Extra;


private


    type Input is new Widget with record
        Was_Changed : Boolean := False;
    end record;

    overriding procedure Finalize
           (This : in out Input);




    pragma Inline (Copy);
    pragma Inline (Cut);
    pragma Inline (Copy_Cuts);
    pragma Inline (Undo);


    pragma Inline (Has_Changed);
    pragma Inline (Clear_Changed);
    pragma Inline (Is_Readonly);
    pragma Inline (Set_Readonly);
    pragma Inline (Is_Tab_Nav);
    pragma Inline (Set_Tab_Nav);
    pragma Inline (Is_Wrap);
    pragma Inline (Set_Wrap);


    pragma Inline (Get_Input_Type);
    pragma Inline (Get_Shortcut_Key);
    pragma Inline (Set_Shortcut_Key);
    pragma Inline (Get_Mark);
    pragma Inline (Set_Mark);
    pragma Inline (Get_Position);
    pragma Inline (Set_Position);


    pragma Inline (Index);
    pragma Inline (Insert);
    pragma Inline (Replace);
    pragma Inline (Get_Value);
    pragma Inline (Set_Value);


    pragma Inline (Get_Maximum_Size);
    pragma Inline (Set_Maximum_Size);
    pragma Inline (Size);


    pragma Inline (Get_Cursor_Color);
    pragma Inline (Set_Cursor_Color);
    pragma Inline (Get_Text_Color);
    pragma Inline (Set_Text_Color);
    pragma Inline (Get_Text_Font);
    pragma Inline (Set_Text_Font);
    pragma Inline (Get_Text_Size);
    pragma Inline (Set_Text_Size);


    pragma Inline (Resize);


    pragma Inline (Draw);
    pragma Inline (Handle);




    Input_Kind_Values : array (Input_Kind) of Interfaces.C.int :=
       (Normal_Kind    => 0,
        Float_Kind     => 1,
        Integer_Kind   => 2,
        Multiline_Kind => 4,
        Secret_Kind    => 5,
        Readonly_Kind  => 8,
        Wrap_Kind      => 16);




    function fl_input_get_value
           (F : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_input_get_value, "fl_input_get_value");
    pragma Inline (fl_input_get_value);


end FLTK.Widgets.Inputs;

