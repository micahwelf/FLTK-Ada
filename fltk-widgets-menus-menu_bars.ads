

package FLTK.Widgets.Menus.Menu_Bars is


    type Menu_Bar is new Menu with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Menu_Bar;


private


    type Menu_Bar is new Menu with null record;


    overriding procedure Finalize
           (This : in out Menu_Bar);


end FLTK.Widgets.Menus.Menu_Bars;

