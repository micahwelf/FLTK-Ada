

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Menus is


    procedure Initialize
           (This : in out Menu) is
    begin
        Initialize (Widget (This));
        This.Menu_Item_List := Menu_Vectors.Empty_Vector;
    end Initialize;


end FLTK.Widgets.Menus;

