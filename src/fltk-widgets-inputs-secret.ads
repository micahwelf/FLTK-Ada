

package FLTK.Widgets.Inputs.Secret is


    type Secret_Input is new Input with private;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Secret_Input;




    procedure Draw
           (This : in out Secret_Input);

    function Handle
           (This  : in out Secret_Input;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Secret_Input is new Input with null record;

    overriding procedure Finalize
           (This : in out Secret_Input);


end FLTK.Widgets.Inputs.Secret;

