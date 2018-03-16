

package FLTK.Widgets.Valuators.Sliders.Value.Horizontal is


    type Hor_Value_Slider is new Value_Slider with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Hor_Value_Slider;

    end Forge;




    procedure Draw
           (This : in out Hor_Value_Slider);

    function Handle
           (This  : in out Hor_Value_Slider;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Hor_Value_Slider is new Value_Slider with null record;

    overriding procedure Finalize
           (This : in out Hor_Value_Slider);


end FLTK.Widgets.Valuators.Sliders.Value.Horizontal;

