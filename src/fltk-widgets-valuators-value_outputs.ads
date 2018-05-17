

package FLTK.Widgets.Valuators.Value_Outputs is


    type Value_Output is new Valuator with private;

    type Value_Output_Reference (Data : not null access Value_Output'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Value_Output;

    end Forge;




    function Is_Soft
           (This : in Value_Output)
        return Boolean;

    procedure Set_Soft
           (This : in out Value_Output;
            To   : in     Boolean);




    function Get_Text_Color
           (This : in Value_Output)
        return Color;

    procedure Set_Text_Color
           (This : in out Value_Output;
            Col  : in     Color);

    function Get_Text_Font
           (This : in Value_Output)
        return Font_Kind;

    procedure Set_Text_Font
           (This : in out Value_Output;
            Font : in     Font_Kind);

    function Get_Text_Size
           (This : in Value_Output)
        return Font_Size;

    procedure Set_Text_Size
           (This : in out Value_Output;
            Size : in     Font_Size);




    procedure Draw
           (This : in out Value_Output);

    function Handle
           (This  : in out Value_Output;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Value_Output is new Valuator with null record;

    overriding procedure Finalize
           (This : in out Value_Output);




    pragma Inline (Is_Soft);
    pragma Inline (Set_Soft);


    pragma Inline (Get_Text_Color);
    pragma Inline (Set_Text_Color);
    pragma Inline (Get_Text_Font);
    pragma Inline (Set_Text_Font);
    pragma Inline (Get_Text_Size);
    pragma Inline (Set_Text_Size);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Value_Outputs;

