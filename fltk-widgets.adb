

with Interfaces.C;
with System;
with FLTK.Widgets.Groups;


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




    procedure Finalize
           (This : in out Widget) is
    begin
        if This.Parent /= null then
            This.Parent.Remove (This);
        end if;
    end Finalize;




    function Parent
           (This : in Widget)
        return Group_Cursor is
    begin
        return Ref : Group_Cursor (Data => This.Parent);
    end Parent;




    function Get_Box
           (This : in Widget)
        return Box_Kind is
    begin
        return Box_Kind'Val (fl_widget_get_box (This.Void_Ptr));
    end Get_Box;




    procedure Set_Box
           (This : in out Widget;
            Box  : in     Box_Kind) is
    begin
        fl_widget_set_box (This.Void_Ptr, Box_Kind'Pos (Box));
    end Set_Box;




    function Get_Label_Font
           (This : in Widget)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_widget_get_label_font (This.Void_Ptr));
    end Get_Label_Font;




    procedure Set_Label_Font
           (This : in out Widget;
            Font : in     Font_Kind) is
    begin
        fl_widget_set_label_font (This.Void_Ptr, Font_Kind'Pos (Font));
    end Set_Label_Font;




    function Get_Label_Size
           (This : in Widget)
        return Font_Size is
    begin
        return Font_Size (fl_widget_get_label_size (This.Void_Ptr));
    end Get_Label_Size;




    procedure Set_Label_Size
           (This : in out Widget;
            Size : in     Font_Size) is
    begin
        fl_widget_set_label_size (This.Void_Ptr, Interfaces.C.int (Size));
    end Set_Label_Size;




    function Get_Label_Type
           (This : in Widget)
        return Label_Kind is
    begin
        return Label_Kind'Val (fl_widget_get_label_type (This.Void_Ptr));
    end Get_Label_Type;




    procedure Set_Label_Type
           (This  : in out Widget;
            Label : in     Label_Kind) is
    begin
        fl_widget_set_label_type (This.Void_Ptr, Label_Kind'Pos (Label));
    end Set_Label_Type;


end FLTK.Widgets;

