

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Boxes is


    function new_fl_box
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_box, "new_fl_box");

    procedure free_fl_box
           (B : in System.Address);
    pragma Import (C, free_fl_box, "free_fl_box");




    procedure Finalize
           (This : in out Box) is
    begin
        Finalize (Widget (This));
        if (This.Void_Ptr /= System.Null_Address) then
            if This in Box then
                free_fl_box (This.Void_Ptr);
            end if;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Box is
    begin
        return This : Box do
            This.Void_Ptr := new_fl_box
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


end FLTK.Widgets.Boxes;

