

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons.Light.Round.Radio is


    function new_fl_radio_round_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_radio_round_button, "new_fl_radio_round_button");

    procedure free_fl_radio_round_button
           (B : in System.Address);
    pragma Import (C, free_fl_radio_round_button, "free_fl_radio_round_button");




    procedure Finalize
           (This : in out Radio_Round_Button) is
    begin
        Finalize (Round_Button (This));
        if (This.Void_Ptr /= System.Null_Address) then
            if This in Radio_Round_Button then
                free_fl_radio_round_button (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Radio_Round_Button is
    begin
        return This : Radio_Round_Button do
            This.Void_Ptr := new_fl_radio_round_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
        end return;
    end Create;


end FLTK.Widgets.Buttons.Light.Round.Radio;

