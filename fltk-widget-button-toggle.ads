

package FLTK.Widget.Button.Toggle is


    type Toggle_Type is new Button_Type with private;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Toggle_Type;


private


    type Toggle_Type is new Button_Type with null record;


    overriding procedure Finalize (This : in out Toggle_Type);


end FLTK.Widget.Button.Toggle;

