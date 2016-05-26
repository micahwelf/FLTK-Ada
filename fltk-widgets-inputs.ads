

package FLTK.Widgets.Inputs is


    type Input is new Widget with private;
    type Input_Access is access all Input;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Input;


private


    type Input is new Widget with null record;


    overriding procedure Finalize
           (This : in out Input);


end FLTK.Widgets.Inputs;

