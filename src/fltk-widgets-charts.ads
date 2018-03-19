

package FLTK.Widgets.Charts is


    type Chart is new Widget with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Chart;

    end Forge;




    procedure Add
           (This       : in out Chart;
            Data_Value : in     Long_Float;
            Data_Label : in     String := "";
            Data_Color : in     Color := No_Color);

    procedure Insert
           (This       : in out Chart;
            Position   : in     Natural;
            Data_Value : in     Long_Float;
            Data_Label : in     String := "";
            Data_Color : in     Color := No_Color);

    procedure Replace
           (This       : in out Chart;
            Position   : in     Natural;
            Data_Value : in     Long_Float;
            Data_Label : in     String := "";
            Data_Color : in     Color := No_Color);

    procedure Clear
           (This : in out Chart);




    function Will_Autosize
           (This : in Chart)
        return Boolean;

    procedure Set_Autosize
           (This : in out Chart;
            To   : in     Boolean);

    procedure Get_Bounds
           (This         : in     Chart;
            Lower, Upper :    out Long_Float);

    procedure Set_Bounds
           (This         : in out Chart;
            Lower, Upper : in     Long_Float);

    function Get_Maximum_Size
           (This : in Chart)
        return Natural;

    procedure Set_Maximum_Size
           (This : in out Chart;
            To   : in     Natural);

    function Get_Size
           (This : in Chart)
        return Natural;




    function Get_Text_Color
           (This : in Chart)
        return Color;

    procedure Set_Text_Color
           (This : in out Chart;
            To   : in     Color);

    function Get_Text_Font
           (This : in Chart)
        return Font_Kind;

    procedure Set_Text_Font
           (This : in out Chart;
            To   : in     Font_Kind);

    function Get_Text_Size
           (This : in Chart)
        return Font_Size;

    procedure Set_Text_Size
           (This : in out Chart;
            To   : in     Font_Size);




    procedure Draw
           (This : in out Chart);

    function Handle
           (This  : in out Chart;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Chart is new Widget with null record;

    overriding procedure Finalize
           (This : in out Chart);


end FLTK.Widgets.Charts;

