

with Interfaces.C;
with Interfaces.C.Strings;
with System;
with System.Address_To_Access_Conversions;
with FLTK.Widgets.Groups; use FLTK.Widgets.Groups;
use type System.Address;


package body FLTK.Widgets is


    package Group_Convert is new System.Address_To_Access_Conversions (Group'Class);




    function fl_widget_get_box
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_box, "fl_widget_get_box");

    procedure fl_widget_set_box
           (W : in System.Address;
            B : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_box, "fl_widget_set_box");

    function fl_widget_get_label
           (W : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_widget_get_label, "fl_widget_get_label");

    procedure fl_widget_set_label
           (W : in System.Address;
            T : in Interfaces.C.char_array);
    pragma Import (C, fl_widget_set_label, "fl_widget_set_label");

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

    function fl_widget_get_parent
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_get_parent, "fl_widget_get_parent");

    procedure fl_widget_set_callback
           (W, C : in System.Address);
    pragma Import (C, fl_widget_set_callback, "fl_widget_set_callback");




    function Parent
           (This : in Widget)
        return Group_Cursor is

        Parent_Ptr : System.Address;
        Actual_Parent : access Group'Class;

    begin
        Parent_Ptr := fl_widget_get_parent (This.Void_Ptr);
        if Parent_Ptr /= System.Null_Address then
            Actual_Parent := Group_Convert.To_Pointer (fl_widget_get_user_data (Parent_Ptr));
        end if;
        return Ref : Group_Cursor (Data => Actual_Parent);
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




    function Get_Label
           (This : in out Widget)
        return String is
    begin
        return Interfaces.C.Strings.Value (fl_widget_get_label (This.Void_Ptr));
    end Get_Label;




    procedure Set_Label
           (This : in out Widget;
            Text : in     String) is
    begin
        fl_widget_set_label (This.Void_Ptr, Interfaces.C.To_C (Text));
    end Set_Label;




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




    --  this is the part called by FLTK callbacks
    --  note that the user data portion is a reference back to the Ada binding
    procedure Callback_Hook (W, U : in System.Address);
    pragma Convention (C, Callback_Hook);

    procedure Callback_Hook
           (W, U : in System.Address) is

        Ada_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (U);

    begin
        Ada_Widget.Callback.Call (Ada_Widget.all);
    end Callback_Hook;




    procedure Set_Callback
           (This : in out Widget;
            Func : not null access Widget_Callback'Class) is
    begin
        This.Callback := Func;
        fl_widget_set_callback (This.Void_Ptr, Callback_Hook'Address);
    end Set_Callback;


end FLTK.Widgets;

