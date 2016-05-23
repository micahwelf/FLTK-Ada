

with Interfaces.C;
with System;


package body FLTK.Widget is


    function fl_widget_get_box
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_box, "fl_widget_get_box");

    procedure fl_widget_set_box
           (W : in System.Address;
            B : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_box, "fl_widget_set_box");

    function fl_widget_get_label_font
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_label_font, "fl_widget_get_label_font");

    procedure fl_widget_set_label_font
           (W : in System.Address;
            F : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_label_font, "fl_widget_set_label_font");




    procedure Initialize (This : in out Widget_Type) is
    begin
        This.Void_Ptr := System.Null_Address;
    end Initialize;




    function Get_Box
           (W : in Widget_Type'Class)
        return Box_Kind is
    begin
        return Box_Kind'Val (fl_widget_get_box (W.Void_Ptr));
    end Get_Box;




    procedure Set_Box
           (W : in Widget_Type'Class;
            B : in Box_Kind) is
    begin
        fl_widget_set_box (W.Void_Ptr, Box_Kind'Pos (B));
    end Set_Box;




    function Get_Label_Font
           (W : in Widget_Type'Class)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_widget_get_label_font (W.Void_Ptr));
    end Get_Label_Font;




    procedure Set_Label_Font
           (W : in Widget_Type'Class;
            F : in Font_Kind) is
    begin
        fl_widget_set_label_font (W.Void_Ptr, Font_Kind'Pos (F));
    end Set_Label_Font;


end FLTK.Widget;

