

package FLTK.Widgets.Buttons.Light is


    type Light_Button is new Button with private;

    type Light_Button_Reference (Data : not null access Light_Button'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Light_Button;

    end Forge;




    procedure Draw
           (This : in out Light_Button);

    function Handle
           (This  : in out Light_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Light_Button is new Button with null record;

    overriding procedure Finalize
           (This : in out Light_Button);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Buttons.Light;

