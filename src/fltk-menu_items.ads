

package FLTK.Menu_Items is


    type Menu_Item is new Wrapper with private;


    function Value
           (Item : in Menu_Item)
        return Boolean;


    procedure Activate
           (Item : in Menu_Item);


    procedure Deactivate
           (Item : in Menu_Item);


private


    type Menu_Item is new Wrapper with null record;


end FLTK.Menu_Items;

