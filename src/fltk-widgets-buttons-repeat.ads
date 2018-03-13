

package FLTK.Widgets.Buttons.Repeat is


    type Repeat_Button is new Button with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Repeat_Button;

    end Forge;




    procedure Draw
           (This : in out Repeat_Button);

    function Handle
           (This  : in out Repeat_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Repeat_Button is new Button with null record;

    overriding procedure Finalize
           (This : in out Repeat_Button);


end FLTK.Widgets.Buttons.Repeat;

