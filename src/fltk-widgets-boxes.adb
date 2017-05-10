

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Boxes is


    procedure box_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, box_set_draw_hook, "box_set_draw_hook");

    procedure fl_box_draw
           (W : in System.Address);
    pragma Import (C, fl_box_draw, "fl_box_draw");

    function new_fl_box
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_box, "new_fl_box");

    procedure free_fl_box
           (B : in System.Address);
    pragma Import (C, free_fl_box, "free_fl_box");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        package Box_Convert is new System.Address_To_Access_Conversions (Box'Class);

        Ada_Box : access Box'Class :=
            Box_Convert.To_Pointer (U);
    begin
        Ada_Box.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Box) is
    begin
        fl_box_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Box) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Box'Class
        then
            free_fl_box (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Widget (This));
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
            box_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
        end return;
    end Create;


end FLTK.Widgets.Boxes;

