

package FLTK.Widgets.Inputs.Multiline is


    type Multiline_Input is new Input with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Multiline_Input;


    procedure Draw
           (This : in out Multiline_Input);


private


    type Multiline_Input is new Input with null record;


    overriding procedure Finalize
           (This : in out Multiline_Input);


end FLTK.Widgets.Inputs.Multiline;

