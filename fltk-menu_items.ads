

with FLTK.Callbacks;


package FLTK.Menu_Items is


    type Menu_Item is new Wrapper with private;


    type Shortcut_Key is Integer;
    type Menu_Flag is Integer;


    function Create
           (Text : in String;
            Shortcut : in Shortcut_Key;
            Action : in FLTK.Callbacks.Callback;
            Flags : in Menu_Flag)
        return Menu_Item;


private


    type Menu_Item is new Wrapper with null record;


    overriding procedure Finalize
           (This : in out Menu_Item);


end FLTK.Menu_Items;

