

package FLTK.Widgets.Valuators.Sliders.Value.Horizontal is


    type Hor_Value_Slider is new Value_Slider with private;

    type Hor_Value_Slider_Reference (Data : not null access Hor_Value_Slider'Class) is
        limited null record with Implicit_Dereference => Data;




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




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Sliders.Value.Horizontal;

