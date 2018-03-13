

package FLTK.Widgets.Valuators.Sliders.Fill is


    type Fill_Slider is new Slider with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Fill_Slider;

    end Forge;




    procedure Draw
           (This : in out Fill_Slider);

    function Handle
           (This  : in out Fill_Slider;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Fill_Slider is new Slider with null record;

    overriding procedure Finalize
           (This : in out Fill_Slider);


end FLTK.Widgets.Valuators.Sliders.Fill;

