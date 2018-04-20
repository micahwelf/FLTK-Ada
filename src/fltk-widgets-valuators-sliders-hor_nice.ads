

package FLTK.Widgets.Valuators.Sliders.Hor_Nice is


    type Hor_Nice_Slider is new Slider with private;

    type Hor_Nice_Slider_Reference (Data : not null access Hor_Nice_Slider'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Hor_Nice_Slider;

    end Forge;




    procedure Draw
           (This : in out Hor_Nice_Slider);

    function Handle
           (This  : in out Hor_Nice_Slider;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Hor_Nice_Slider is new Slider with null record;

    overriding procedure Finalize
           (This : in out Hor_Nice_Slider);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Sliders.Hor_Nice;

