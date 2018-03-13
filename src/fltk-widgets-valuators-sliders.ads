

package FLTK.Widgets.Valuators.Sliders is


    type Slider is new Valuator with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Slider;

    end Forge;




    procedure Set_Bounds
           (This : in out Slider;
            A, B : in     Long_Float);

    function Get_Box
           (This : in Slider)
        return Box_Kind;

    procedure Set_Box
           (This : in out Slider;
            To   : in     Box_Kind);

    function Get_Slide_Size
           (This : in Slider)
        return Float;

    procedure Set_Slide_Size
           (This : in out Slider;
            To   : in     Float);




    procedure Draw
           (This : in out Slider);

    function Handle
           (This  : in out Slider;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Slider is new Valuator with null record;

    overriding procedure Finalize
           (This : in out Slider);


end FLTK.Widgets.Valuators.Sliders;

