

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons.Toggle is


    function new_fl_toggle_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_toggle_button, "new_fl_toggle_button");

    procedure free_fl_toggle_button
           (B : in System.Address);
    pragma Import (C, free_fl_toggle_button, "free_fl_toggle_button");




    procedure Finalize
           (This : in out Toggle_Button) is
    begin
        Finalize (Button (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Toggle_Button then
                free_fl_toggle_button (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Toggle_Button is
    begin
        return This : Toggle_Button do
            This.Void_Ptr := new_fl_toggle_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
        end return;
    end Create;


end FLTK.Widgets.Buttons.Toggle;

