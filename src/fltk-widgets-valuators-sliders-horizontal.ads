

package FLTK.Widgets.Valuators.Sliders.Horizontal is


    type Horizontal_Slider is new Slider with private;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Horizontal_Slider;




    procedure Draw
           (This : in out Horizontal_Slider);

    function Handle
           (This  : in out Horizontal_Slider;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Horizontal_Slider is new Slider with null record;

    overriding procedure Finalize
           (This : in out Horizontal_Slider);


end FLTK.Widgets.Valuators.Sliders.Horizontal;

