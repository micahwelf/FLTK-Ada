

package FLTK.Widgets.Valuators.Sliders.Horizontal is


    type Horizontal_Slider is new Slider with private;

    type Horizontal_Slider_Reference (Data : not null access Horizontal_Slider'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Horizontal_Slider;

    end Forge;




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




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Sliders.Horizontal;

