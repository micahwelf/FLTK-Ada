

package FLTK.Widget.Button.Repeat is


    type Repeat_Type is new Button_Type with private;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Repeat_Type;


private


    type Repeat_Type is new Button_Type with null record;


    overriding procedure Finalize (This : in out Repeat_Type);


end FLTK.Widget.Button.Repeat;

