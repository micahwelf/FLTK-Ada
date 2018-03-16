

package FLTK.Widgets.Groups.Spinners is


    type Spinner is new Group with private;

    type Spinner_Kind is (Float_Spin, Int_Spin);




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Spinner;

    end Forge;




    function Get_Background_Color
           (This : in Spinner)
        return Color;

    procedure Set_Background_Color
           (This : in out Spinner;
            To   : in     Color);

    function Get_Select_Color
           (This : in Spinner)
        return Color;

    procedure Set_Select_Color
           (This : in out Spinner;
            To   : in     Color);

    function Get_Text_Color
           (This : in Spinner)
        return Color;

    procedure Set_Text_Color
           (This : in out Spinner;
            To   : in     Color);

    function Get_Text_Font
           (This : in Spinner)
        return Font_Kind;

    procedure Set_Text_Font
           (This : in out Spinner;
            To   : in     Font_Kind);

    function Get_Text_Size
           (This : in Spinner)
        return Font_Size;

    procedure Set_Text_Size
           (This : in out Spinner;
            To   : in     Font_Size);




    function Get_Minimum
           (This : in Spinner)
        return Long_Float;

    procedure Set_Minimum
           (This : in out Spinner;
            To   : in     Long_Float);

    function Get_Maximum
           (This : in Spinner)
        return Long_Float;

    procedure Set_Maximum
           (This : in out Spinner;
            To   : in     Long_Float);

    procedure Set_Range
           (This     : in out Spinner;
            Min, Max : in     Long_Float);

    function Get_Step
           (This : in Spinner)
        return Long_Float;

    procedure Set_Step
           (This : in out Spinner;
            To   : in     Long_Float);

    function Get_Type
           (This : in Spinner)
        return Spinner_Kind;

    procedure Set_Type
           (This : in out Spinner;
            To   : in     Spinner_Kind);

    function Get_Value
           (This : in Spinner)
        return Long_Float;

    procedure Set_Value
           (This : in out Spinner;
            To   : in     Long_Float);




    procedure Draw
           (This : in out Spinner);

    function Handle
           (This  : in out Spinner;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Spinner is new Group with null record;

    overriding procedure Finalize
           (This : in out Spinner);


end FLTK.Widgets.Groups.Spinners;

