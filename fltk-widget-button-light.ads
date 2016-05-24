

package FLTK.Widget.Button.Light is


    type Light_Type is new Button_Type with private;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Light_Type;


private


    type Light_Type is new Button_Type with null record;


    overriding procedure Finalize (This : in out Light_Type);


end FLTK.Widget.Button.Light;

