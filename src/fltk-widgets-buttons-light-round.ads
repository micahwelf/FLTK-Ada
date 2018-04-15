

package FLTK.Widgets.Buttons.Light.Round is


    type Round_Button is new Light_Button with private;

    type Round_Button_Reference (Data : not null access Round_Button'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Round_Button;

    end Forge;




    procedure Draw
           (This : in out Round_Button);

    function Handle
           (This  : in out Round_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Round_Button is new Light_Button with null record;

    overriding procedure Finalize
           (This : in out Round_Button);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Buttons.Light.Round;

