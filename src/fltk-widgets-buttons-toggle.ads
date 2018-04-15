

package FLTK.Widgets.Buttons.Toggle is


    type Toggle_Button is new Button with private;

    type Toggle_Button_Reference (Data : not null access Toggle_Button'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Toggle_Button;

    end Forge;




    procedure Draw
           (This : in out Toggle_Button);

    function Handle
           (This  : in out Toggle_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Toggle_Button is new Button with null record;

    overriding procedure Finalize
           (This : in out Toggle_Button);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Buttons.Toggle;

