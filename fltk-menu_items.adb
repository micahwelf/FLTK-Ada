

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Menu_Items is


    procedure Finalize
           (This : in out Menu_Item) is
    begin
        null;
    end Finalize;




    function Create
           (Text : in String;
            Shortcut : in Shortcut_Key;
            Action : in FLTK.Callbacks.Callback;
            Flags : Menu_Flag)
        return Menu_Item is
    begin
        return This : Menu_Item do
            null;
        end return;
    end Create;


end FLTK.Menu_Items;

