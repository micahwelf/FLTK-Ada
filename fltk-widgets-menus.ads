

private with Ada.Containers.Vectors;
private with FLTK.Menu_Items;


package FLTK.Widgets.Menus is


    type Menu is abstract new Widget with private;
    type Index is new Positive;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Menu is abstract;


private


    type Menu_Item_Access is access all FLTK.Menu_Items.Menu_Item;
    package Menu_Vectors is new Ada.Containers.Vectors (Index, Menu_Item_Access);


    type Menu is abstract new Widget with
        record
            Menu_Item_List : Menu_Vectors.Vector;
        end record;


    overriding procedure Initialize
           (This : in out Menu);


end FLTK.Widgets.Menus;

