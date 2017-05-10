

package FLTK.Widgets.Inputs.File is


    type File_Input is new Input with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return File_Input;


    procedure Draw
           (This : in out File_Input);


private


    type File_Input is new Input with null record;


    overriding procedure Finalize
           (This : in out File_Input);


end FLTK.Widgets.Inputs.File;

