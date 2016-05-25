

with Interfaces.C;
with System;


package body FLTK.Widgets is


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

    function fl_widget_get_label_size
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_label_size, "fl_widget_get_label_size");

    procedure fl_widget_set_label_size
           (W : in System.Address;
            S : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_label_size, "fl_widget_set_label_size");

    function fl_widget_get_label_type
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_label_type, "fl_widget_get_label_type");

    procedure fl_widget_set_label_type
           (W : in System.Address;
            L : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_label_type, "fl_widget_set_label_type");




    procedure Initialize
           (This : in out Widget) is
    begin
        This.Void_Ptr := System.Null_Address;
    end Initialize;




    function Get_Box
           (W : in Widget'Class)
        return Box_Kind is
    begin
        return Box_Kind'Val (fl_widget_get_box (W.Void_Ptr));
    end Get_Box;




    procedure Set_Box
           (W : in out Widget'Class;
            B : in     Box_Kind) is
    begin
        fl_widget_set_box (W.Void_Ptr, Box_Kind'Pos (B));
    end Set_Box;




    function Get_Label_Font
           (W : in Widget'Class)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_widget_get_label_font (W.Void_Ptr));
    end Get_Label_Font;




    procedure Set_Label_Font
           (W : in out Widget'Class;
            F : in     Font_Kind) is
    begin
        fl_widget_set_label_font (W.Void_Ptr, Font_Kind'Pos (F));
    end Set_Label_Font;




    function Get_Label_Size
           (W : in Widget'Class)
        return Font_Size is
    begin
        return Font_Size (fl_widget_get_label_size (W.Void_Ptr));
    end Get_Label_Size;




    procedure Set_Label_Size
           (W : in out Widget'Class;
            S : in     Font_Size) is
    begin
        fl_widget_set_label_size (W.Void_Ptr, Interfaces.C.int (S));
    end Set_Label_Size;




    function Get_Label_Type
           (W : in Widget'Class)
        return Label_Kind is
    begin
        return Label_Kind'Val (fl_widget_get_label_type (W.Void_Ptr));
    end Get_Label_Type;




    procedure Set_Label_Type
           (W : in out Widget'Class;
            L : in     Label_Kind) is
    begin
        fl_widget_set_label_type (W.Void_Ptr, Label_Kind'Pos (L));
    end Set_Label_Type;


end FLTK.Widgets;

