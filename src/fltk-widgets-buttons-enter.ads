

--  Return Buttons, but return is a reserved word, so they're Enter Buttons instead


package FLTK.Widgets.Buttons.Enter is


    type Enter_Button is new Button with private;

    type Enter_Button_Reference (Data : not null access Enter_Button'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Enter_Button;

    end Forge;




    procedure Draw
           (This : in out Enter_Button);

    function Handle
           (This  : in out Enter_Button;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Enter_Button is new Button with null record;

    overriding procedure Finalize
           (This : in out Enter_Button);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Buttons.Enter;

