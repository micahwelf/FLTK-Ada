

with

    Interfaces.C.Strings,
    System.Address_To_Access_Conversions,
    FLTK.Widgets.Groups,
    FLTK.Images;

use type

    Interfaces.C.int,
    Interfaces.C.unsigned,
    System.Address;


package body FLTK.Widgets is


    package Group_Convert is new
        System.Address_To_Access_Conversions (FLTK.Widgets.Groups.Group'Class);




    procedure widget_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, widget_set_draw_hook, "widget_set_draw_hook");

    procedure widget_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, widget_set_handle_hook, "widget_set_handle_hook");




    function new_fl_widget
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_widget, "new_fl_widget");

    procedure free_fl_widget
           (F : in System.Address);
    pragma Import (C, free_fl_widget, "free_fl_widget");




    procedure fl_widget_activate
           (W : in System.Address);
    pragma Import (C, fl_widget_activate, "fl_widget_activate");

    procedure fl_widget_deactivate
           (W : in System.Address);
    pragma Import (C, fl_widget_deactivate, "fl_widget_deactivate");

    function fl_widget_active
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_active, "fl_widget_active");

    function fl_widget_active_r
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_active_r, "fl_widget_active_r");

    procedure fl_widget_clear_active
           (W : in System.Address);
    pragma Import (C, fl_widget_clear_active, "fl_widget_clear_active");




    function fl_widget_changed
           (W : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_widget_changed, "fl_widget_changed");

    procedure fl_widget_clear_changed
           (W : in System.Address);
    pragma Import (C, fl_widget_clear_changed, "fl_widget_clear_changed");




    function fl_widget_get_parent
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_get_parent, "fl_widget_get_parent");

    function fl_widget_contains
           (W, I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_contains, "fl_widget_contains");




    function fl_widget_get_align
           (W : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_widget_get_align, "fl_widget_get_align");

    procedure fl_widget_set_align
           (W : in System.Address;
            A : in Interfaces.C.unsigned);
    pragma Import (C, fl_widget_set_align, "fl_widget_set_align");

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

    procedure fl_widget_set_callback
           (W, C : in System.Address);
    pragma Import (C, fl_widget_set_callback, "fl_widget_set_callback");




    function fl_widget_get_x
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_x, "fl_widget_get_x");

    function fl_widget_get_y
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_y, "fl_widget_get_y");

    function fl_widget_get_w
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_w, "fl_widget_get_w");

    function fl_widget_get_h
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_h, "fl_widget_get_h");

    procedure fl_widget_size
           (W    : in System.Address;
            D, H : in Interfaces.C.int);
    pragma Import (C, fl_widget_size, "fl_widget_size");

    procedure fl_widget_position
           (W    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_widget_position, "fl_widget_position");




    procedure fl_widget_set_image
           (W, I : in System.Address);
    pragma Import (C, fl_widget_set_image, "fl_widget_set_image");




    procedure fl_widget_redraw
           (W : in System.Address);
    pragma Import (C, fl_widget_redraw, "fl_widget_redraw");

    procedure fl_widget_redraw_label
           (W : in System.Address);
    pragma Import (C, fl_widget_redraw_label, "fl_widget_redraw_label");




    procedure Callback_Hook
           (W, U : in System.Address)
    is
        Ada_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (U);
    begin
        Ada_Widget.Callback.all (Ada_Widget.all);
    end Callback_Hook;


    procedure Draw_Hook
           (U : in System.Address)
    is
        Ada_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (U);
    begin
        Ada_Widget.Draw;
    end Draw_Hook;


    function Handle_Hook
           (U : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int
    is
        Ada_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (U);
    begin
        return Event_Outcome'Pos (Ada_Widget.Handle (Event_Kind'Val (E)));
    end Handle_Hook;




    procedure Finalize
           (This : in out Widget) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Widget'Class
        then
            free_fl_widget (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Widget is
    begin
        return This : Widget do
            This.Void_Ptr := new_fl_widget
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            widget_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            widget_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Activate
           (This : in out Widget) is
    begin
        fl_widget_activate (This.Void_Ptr);
    end Activate;


    procedure Deactivate
           (This : in out Widget) is
    begin
        fl_widget_deactivate (This.Void_Ptr);
    end Deactivate;


    function Is_Active
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_active (This.Void_Ptr) /= 0;
    end Is_Active;


    function Is_Tree_Active
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_active_r (This.Void_Ptr) /= 0;
    end Is_Tree_Active;


    procedure Clear_Active
           (This : in out Widget) is
    begin
        fl_widget_clear_active (This.Void_Ptr);
    end Clear_Active;




    function Has_Changed
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_changed (This.Void_Ptr) /= 0;
    end Has_Changed;


    procedure Clear_Changed
           (This : in out Widget) is
    begin
        fl_widget_clear_changed (This.Void_Ptr);
    end Clear_Changed;




    function Parent
           (This : in Widget)
        return access FLTK.Widgets.Groups.Group'Class
    is
        Parent_Ptr : System.Address;
        Actual_Parent : access FLTK.Widgets.Groups.Group'Class;
    begin
        Parent_Ptr := fl_widget_get_parent (This.Void_Ptr);
        if Parent_Ptr /= System.Null_Address then
            Actual_Parent := Group_Convert.To_Pointer (fl_widget_get_user_data (Parent_Ptr));
        end if;
        return Actual_Parent;
    end Parent;


    function Contains
           (This : in Widget;
            Item : in Widget'Class)
        return Boolean is
    begin
        return fl_widget_contains (This.Void_Ptr, Item.Void_Ptr) /= 0;
    end Contains;




    function Get_Alignment
           (This : in Widget)
        return Alignment is
    begin
        return Alignment (fl_widget_get_align (This.Void_Ptr));
    end Get_Alignment;


    procedure Set_Alignment
           (This      : in out Widget;
            New_Align : in     Alignment) is
    begin
        fl_widget_set_align (This.Void_Ptr, Interfaces.C.unsigned (New_Align));
    end Set_Alignment;


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


    function Get_Callback
           (This : in Widget)
        return Widget_Callback is
    begin
        return This.Callback;
    end Get_Callback;


    procedure Set_Callback
           (This : in out Widget;
            Func : in     Widget_Callback) is
    begin
        if Func /= null then
            This.Callback := Func;
            fl_widget_set_callback (This.Void_Ptr, Callback_Hook'Address);
        end if;
    end Set_Callback;




    function Get_X
           (This : in Widget)
        return Integer is
    begin
        return Integer (fl_widget_get_x (This.Void_Ptr));
    end Get_X;


    function Get_Y
           (This : in Widget)
        return Integer is
    begin
        return Integer (fl_widget_get_y (This.Void_Ptr));
    end Get_Y;


    function Get_W
           (This : in Widget)
        return Integer is
    begin
        return Integer (fl_widget_get_w (This.Void_Ptr));
    end Get_W;


    function Get_H
           (This : in Widget)
        return Integer is
    begin
        return Integer (fl_widget_get_h (This.Void_Ptr));
    end Get_H;


    procedure Resize
           (This : in out Widget;
            W, H : in     Integer) is
    begin
        fl_widget_size
               (This.Void_Ptr,
                Interfaces.C.int (W),
                Interfaces.C.int (H));
    end Resize;


    procedure Reposition
           (This : in out Widget;
            X, Y : in     Integer) is
    begin
        fl_widget_position
               (This.Void_Ptr,
                Interfaces.C.int (X),
                Interfaces.C.int (Y));
    end Reposition;




    function Get_Image
           (This : in Widget)
        return access FLTK.Images.Image'Class is
    begin
        return This.Current_Image;
    end Get_Image;


    procedure Set_Image
           (This : in out Widget;
            Pic  : in out FLTK.Images.Image'Class) is
    begin
        This.Current_Image := Pic'Unchecked_Access;
        fl_widget_set_image
               (This.Void_Ptr,
                Wrapper (Pic).Void_Ptr);
    end Set_Image;




    procedure Redraw
           (This : in out Widget) is
    begin
        fl_widget_redraw (This.Void_Ptr);
    end Redraw;


    procedure Redraw_Label
           (This : in out Widget) is
    begin
        fl_widget_redraw_label (This.Void_Ptr);
    end Redraw_Label;


    function Handle
           (This  : in out Widget;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Not_Handled;
    end Handle;


end FLTK.Widgets;

