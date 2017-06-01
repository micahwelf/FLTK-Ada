

with Interfaces.C;
use type Interfaces.C.int;


package body FLTK.Menu_Items is


    function fl_menuitem_value
           (MI : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_menuitem_value, "fl_menuitem_value");

    procedure fl_menuitem_activate
           (MI : in System.Address);
    pragma Import (C, fl_menuitem_activate, "fl_menuitem_activate");

    procedure fl_menuitem_deactivate
           (MI : in System.Address);
    pragma Import (C, fl_menuitem_deactivate, "fl_menuitem_deactivate");




    function Value
           (Item : in Menu_Item)
        return Boolean is
    begin
        return fl_menuitem_value (Item.Void_Ptr) /= 0;
    end Value;




    procedure Activate
           (Item : in Menu_Item) is
    begin
        fl_menuitem_activate (Item.Void_Ptr);
    end Activate;




    procedure Deactivate
           (Item : in Menu_Item) is
    begin
        fl_menuitem_deactivate (Item.Void_Ptr);
    end Deactivate;


end FLTK.Menu_Items;

