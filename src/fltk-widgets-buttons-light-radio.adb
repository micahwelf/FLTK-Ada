

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons.Light.Radio is


    function new_fl_radio_light_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_radio_light_button, "new_fl_radio_light_button");

    procedure free_fl_radio_light_button
           (B : in System.Address);
    pragma Import (C, free_fl_radio_light_button, "free_fl_radio_light_button");




    procedure Finalize
           (This : in out Radio_Light_Button) is
    begin
        Finalize (Light_Button (This));
        if (This.Void_Ptr /= System.Null_Address) then
            if This in Radio_Light_Button then
                free_fl_radio_light_button (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Radio_Light_Button is
    begin
        return This : Radio_Light_Button do
            This.Void_Ptr := new_fl_radio_light_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
        end return;
    end Create;


end FLTK.Widgets.Buttons.Light.Radio;

