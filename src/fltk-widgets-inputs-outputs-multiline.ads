

package FLTK.Widgets.Inputs.Outputs.Multiline is


    type Multiline_Output is new Output with private;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Multiline_Output;




    procedure Draw
           (This : in out Multiline_Output);

    function Handle
           (This  : in out Multiline_Output;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Multiline_Output is new Output with null record;

    overriding procedure Finalize
           (This : in out Multiline_Output);


end FLTK.Widgets.Inputs.Outputs.Multiline;

