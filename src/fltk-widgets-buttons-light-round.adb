

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Buttons.Light.Round is


    procedure round_button_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, round_button_set_draw_hook, "round_button_set_draw_hook");

    procedure fl_round_button_draw
           (W : in System.Address);
    pragma Import (C, fl_round_button_draw, "fl_round_button_draw");

    function new_fl_round_button
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_round_button, "new_fl_round_button");

    procedure free_fl_round_button
           (B : in System.Address);
    pragma Import (C, free_fl_round_button, "free_fl_round_button");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        Ada_Round_Button : access Round_Button'Class :=
            Round_Button_Convert.To_Pointer (U);
    begin
        Ada_Round_Button.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Round_Button) is
    begin
        fl_round_button_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Round_Button) is
    begin
        Finalize (Light_Button (This));
        if (This.Void_Ptr /= System.Null_Address) then
            if This in Round_Button then
                free_fl_round_button (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Round_Button is
    begin
        return This : Round_Button do
            This.Void_Ptr := new_fl_round_button
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            round_button_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;


end FLTK.Widgets.Buttons.Light.Round;
