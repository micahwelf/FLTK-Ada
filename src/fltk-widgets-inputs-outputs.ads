

package FLTK.Widgets.Inputs.Outputs is


    type Output is new Input with private;

    type Output_Reference (Data : not null access Output'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Output;

    end Forge;




    procedure Draw
           (This : in out Output);

    function Handle
           (This  : in out Output;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Output is new Input with null record;

    overriding procedure Finalize
           (This : in out Output);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Inputs.Outputs;

