

--  FLTK.Widget.Button.Return, but return is a reserved word
package FLTK.Widget.Button.Ret is


    type Return_Type is new Button_Type with private;


    function Create
           (X, Y, W, H : Integer;
            Label      : String)
        return Return_Type;


private


    type Return_Type is new Button_Type with null record;


    overriding procedure Finalize (This : in out Return_Type);


end FLTK.Widget.Button.Ret;

