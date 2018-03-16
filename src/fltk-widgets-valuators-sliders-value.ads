

package FLTK.Widgets.Valuators.Sliders.Value is


    type Value_Slider is new Slider with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Value_Slider;

    end Forge;




    function Get_Text_Color
           (This : in Value_Slider)
        return Color;

    procedure Set_Text_Color
           (This : in out Value_Slider;
            To   : in     Color);

    function Get_Text_Font
           (This : in Value_Slider)
        return Font_Kind;

    procedure Set_Text_Font
           (This : in out Value_Slider;
            To   : in     Font_Kind);

    function Get_Text_Size
           (This : in Value_Slider)
        return Font_Size;

    procedure Set_Text_Size
           (This : in out Value_Slider;
            To   : in     Font_Size);




    procedure Draw
           (This : in out Value_Slider);

    function Handle
           (This  : in out Value_Slider;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Value_Slider is new Slider with null record;

    overriding procedure Finalize
           (This : in out Value_Slider);


end FLTK.Widgets.Valuators.Sliders.Value;

