

package FLTK.Widgets.Inputs.Multiline is


    type Multiline_Input is new Input with private;

    type Multiline_Input_Reference (Data : not null access Multiline_Input'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Multiline_Input;

    end Forge;




    procedure Draw
           (This : in out Multiline_Input);

    function Handle
           (This  : in out Multiline_Input;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Multiline_Input is new Input with null record;

    overriding procedure Finalize
           (This : in out Multiline_Input);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Inputs.Multiline;

