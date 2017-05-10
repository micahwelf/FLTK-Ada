

package FLTK.Widgets.Inputs.Outputs is


    type Output is new Input with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Output;


    procedure Draw
           (This : in out Output);


private


    type Output is new Input with null record;


    overriding procedure Finalize
           (This : in out Output);


end FLTK.Widgets.Inputs.Outputs;

