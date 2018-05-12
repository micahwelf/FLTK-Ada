

with

    Interfaces.C.Strings,
    System.Address_To_Access_Conversions,
    FLTK.Widgets.Groups.Windows,
    FLTK.Images;

use type

    Interfaces.C.int,
    Interfaces.C.unsigned,
    System.Address;


package body FLTK.Widgets is


    function "+"
           (Left, Right : in Callback_Flag)
        return Callback_Flag is
    begin
        return Left or Right;
    end "+";




    package Group_Convert is new
        System.Address_To_Access_Conversions (FLTK.Widgets.Groups.Group'Class);

    package Window_Convert is new
        System.Address_To_Access_Conversions (FLTK.Widgets.Groups.Windows.Window'Class);




    procedure widget_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, widget_set_draw_hook, "widget_set_draw_hook");
    pragma Inline (widget_set_draw_hook);

    procedure widget_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, widget_set_handle_hook, "widget_set_handle_hook");
    pragma Inline (widget_set_handle_hook);




    function new_fl_widget
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_widget, "new_fl_widget");
    pragma Inline (new_fl_widget);

    procedure free_fl_widget
           (F : in System.Address);
    pragma Import (C, free_fl_widget, "free_fl_widget");
    pragma Inline (free_fl_widget);




    procedure fl_widget_activate
           (W : in System.Address);
    pragma Import (C, fl_widget_activate, "fl_widget_activate");
    pragma Inline (fl_widget_activate);

    procedure fl_widget_deactivate
           (W : in System.Address);
    pragma Import (C, fl_widget_deactivate, "fl_widget_deactivate");
    pragma Inline (fl_widget_deactivate);

    function fl_widget_active
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_active, "fl_widget_active");
    pragma Inline (fl_widget_active);

    function fl_widget_active_r
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_active_r, "fl_widget_active_r");
    pragma Inline (fl_widget_active_r);

    procedure fl_widget_set_active
           (W : in System.Address);
    pragma Import (C, fl_widget_set_active, "fl_widget_set_active");
    pragma Inline (fl_widget_set_active);

    procedure fl_widget_clear_active
           (W : in System.Address);
    pragma Import (C, fl_widget_clear_active, "fl_widget_clear_active");
    pragma Inline (fl_widget_clear_active);




    function fl_widget_changed
           (W : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_widget_changed, "fl_widget_changed");
    pragma Inline (fl_widget_changed);

    procedure fl_widget_set_changed
           (W : in System.Address);
    pragma Import (C, fl_widget_set_changed, "fl_widget_set_changed");
    pragma Inline (fl_widget_set_changed);

    procedure fl_widget_clear_changed
           (W : in System.Address);
    pragma Import (C, fl_widget_clear_changed, "fl_widget_clear_changed");
    pragma Inline (fl_widget_clear_changed);

    function fl_widget_output
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_output, "fl_widget_output");
    pragma Inline (fl_widget_output);

    procedure fl_widget_set_output
           (W : in System.Address);
    pragma Import (C, fl_widget_set_output, "fl_widget_set_output");
    pragma Inline (fl_widget_set_output);

    procedure fl_widget_clear_output
           (W : in System.Address);
    pragma Import (C, fl_widget_clear_output, "fl_widget_clear_output");
    pragma Inline (fl_widget_clear_output);

    function fl_widget_visible
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_visible, "fl_widget_visible");
    pragma Inline (fl_widget_visible);

    function fl_widget_visible_r
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_visible_r, "fl_widget_visible_r");
    pragma Inline (fl_widget_visible_r);

    procedure fl_widget_set_visible
           (W : in System.Address);
    pragma Import (C, fl_widget_set_visible, "fl_widget_set_visible");
    pragma Inline (fl_widget_set_visible);

    procedure fl_widget_clear_visible
           (W : in System.Address);
    pragma Import (C, fl_widget_clear_visible, "fl_widget_clear_visible");
    pragma Inline (fl_widget_clear_visible);




    function fl_widget_get_visible_focus
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_visible_focus, "fl_widget_get_visible_focus");
    pragma Inline (fl_widget_get_visible_focus);

    procedure fl_widget_set_visible_focus
           (W : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_visible_focus, "fl_widget_set_visible_focus");
    pragma Inline (fl_widget_set_visible_focus);

    function fl_widget_take_focus
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_take_focus, "fl_widget_take_focus");
    pragma Inline (fl_widget_take_focus);

    function fl_widget_takesevents
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_takesevents, "fl_widget_takesevents");
    pragma Inline (fl_widget_takesevents);




    function fl_widget_get_color
           (W : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_widget_get_color, "fl_widget_get_color");
    pragma Inline (fl_widget_get_color);

    procedure fl_widget_set_color
           (W : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_widget_set_color, "fl_widget_set_color");
    pragma Inline (fl_widget_set_color);

    function fl_widget_get_selection_color
           (W : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_widget_get_selection_color, "fl_widget_get_selection_color");
    pragma Inline (fl_widget_get_selection_color);

    procedure fl_widget_set_selection_color
           (W : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_widget_set_selection_color, "fl_widget_set_selection_color");
    pragma Inline (fl_widget_set_selection_color);




    function fl_widget_get_parent
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_get_parent, "fl_widget_get_parent");
    pragma Inline (fl_widget_get_parent);

    function fl_widget_contains
           (W, I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_contains, "fl_widget_contains");
    pragma Inline (fl_widget_contains);

    function fl_widget_inside
           (W, P : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_inside, "fl_widget_inside");
    pragma Inline (fl_widget_inside);

    function fl_widget_window
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_window, "fl_widget_window");
    pragma Inline (fl_widget_window);

    function fl_widget_top_window
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_top_window, "fl_widget_top_window");
    pragma Inline (fl_widget_top_window);

    function fl_widget_top_window_offset
           (W    : in     System.Address;
            X, Y :    out Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_widget_top_window_offset, "fl_widget_top_window_offset");
    pragma Inline (fl_widget_top_window_offset);




    function fl_widget_get_align
           (W : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_widget_get_align, "fl_widget_get_align");
    pragma Inline (fl_widget_get_align);

    procedure fl_widget_set_align
           (W : in System.Address;
            A : in Interfaces.C.unsigned);
    pragma Import (C, fl_widget_set_align, "fl_widget_set_align");
    pragma Inline (fl_widget_set_align);

    function fl_widget_get_box
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_box, "fl_widget_get_box");
    pragma Inline (fl_widget_get_box);

    procedure fl_widget_set_box
           (W : in System.Address;
            B : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_box, "fl_widget_set_box");
    pragma Inline (fl_widget_set_box);

    function fl_widget_tooltip
           (W : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_widget_tooltip, "fl_widget_tooltip");
    pragma Inline (fl_widget_tooltip);

    procedure fl_widget_copy_tooltip
           (W : in System.Address;
            T : in Interfaces.C.char_array);
    pragma Import (C, fl_widget_copy_tooltip, "fl_widget_copy_tooltip");
    pragma Inline (fl_widget_copy_tooltip);




    function fl_widget_get_label
           (W : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_widget_get_label, "fl_widget_get_label");
    pragma Inline (fl_widget_get_label);

    procedure fl_widget_set_label
           (W : in System.Address;
            T : in Interfaces.C.char_array);
    pragma Import (C, fl_widget_set_label, "fl_widget_set_label");
    pragma Inline (fl_widget_set_label);

    function fl_widget_get_labelcolor
           (W : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_widget_get_labelcolor, "fl_widget_get_labelcolor");
    pragma Inline (fl_widget_get_labelcolor);

    procedure fl_widget_set_labelcolor
           (W : in System.Address;
            V : in Interfaces.C.unsigned);
    pragma Import (C, fl_widget_set_labelcolor, "fl_widget_set_labelcolor");
    pragma Inline (fl_widget_set_labelcolor);

    function fl_widget_get_labelfont
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_labelfont, "fl_widget_get_labelfont");
    pragma Inline (fl_widget_get_labelfont);

    procedure fl_widget_set_labelfont
           (W : in System.Address;
            F : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_labelfont, "fl_widget_set_labelfont");
    pragma Inline (fl_widget_set_labelfont);

    function fl_widget_get_labelsize
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_labelsize, "fl_widget_get_labelsize");
    pragma Inline (fl_widget_get_labelsize);

    procedure fl_widget_set_labelsize
           (W : in System.Address;
            S : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_labelsize, "fl_widget_set_labelsize");
    pragma Inline (fl_widget_set_labelsize);

    function fl_widget_get_labeltype
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_labeltype, "fl_widget_get_labeltype");
    pragma Inline (fl_widget_get_labeltype);

    procedure fl_widget_set_labeltype
           (W : in System.Address;
            L : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_labeltype, "fl_widget_set_labeltype");
    pragma Inline (fl_widget_set_labeltype);

    procedure fl_widget_measure_label
           (W    : in     System.Address;
            D, H :    out Interfaces.C.int);
    pragma Import (C, fl_widget_measure_label, "fl_widget_measure_label");
    pragma Inline (fl_widget_measure_label);




    procedure fl_widget_set_callback
           (W, C : in System.Address);
    pragma Import (C, fl_widget_set_callback, "fl_widget_set_callback");
    pragma Inline (fl_widget_set_callback);

    function fl_widget_get_when
           (W : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_widget_get_when, "fl_widget_get_when");
    pragma Inline (fl_widget_get_when);

    procedure fl_widget_set_when
           (W : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_widget_set_when, "fl_widget_set_when");
    pragma Inline (fl_widget_set_when);




    function fl_widget_get_x
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_x, "fl_widget_get_x");
    pragma Inline (fl_widget_get_x);

    function fl_widget_get_y
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_y, "fl_widget_get_y");
    pragma Inline (fl_widget_get_y);

    function fl_widget_get_w
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_w, "fl_widget_get_w");
    pragma Inline (fl_widget_get_w);

    function fl_widget_get_h
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_get_h, "fl_widget_get_h");
    pragma Inline (fl_widget_get_h);

    procedure fl_widget_size
           (W    : in System.Address;
            D, H : in Interfaces.C.int);
    pragma Import (C, fl_widget_size, "fl_widget_size");
    pragma Inline (fl_widget_size);

    procedure fl_widget_position
           (W    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_widget_position, "fl_widget_position");
    pragma Inline (fl_widget_position);




    procedure fl_widget_set_image
           (W, I : in System.Address);
    pragma Import (C, fl_widget_set_image, "fl_widget_set_image");
    pragma Inline (fl_widget_set_image);

    procedure fl_widget_set_deimage
           (W, I : in System.Address);
    pragma Import (C, fl_widget_set_deimage, "fl_widget_set_deimage");
    pragma Inline (fl_widget_set_deimage);




    function fl_widget_damage
           (W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_widget_damage, "fl_widget_damage");
    pragma Inline (fl_widget_damage);

    procedure fl_widget_set_damage
           (W : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_damage, "fl_widget_set_damage");
    pragma Inline (fl_widget_set_damage);

    procedure fl_widget_set_damage2
           (W : in System.Address;
            T : in Interfaces.C.int;
            X, Y, D, H : in Interfaces.C.int);
    pragma Import (C, fl_widget_set_damage2, "fl_widget_set_damage2");
    pragma Inline (fl_widget_set_damage2);

    procedure fl_widget_draw_label
           (W          : in System.Address;
            X, Y, D, H : in Interfaces.C.int;
            A          : in Interfaces.C.unsigned);
    pragma Import (C, fl_widget_draw_label, "fl_widget_draw_label");
    pragma Inline (fl_widget_draw_label);

    procedure fl_widget_redraw
           (W : in System.Address);
    pragma Import (C, fl_widget_redraw, "fl_widget_redraw");
    pragma Inline (fl_widget_redraw);

    procedure fl_widget_redraw_label
           (W : in System.Address);
    pragma Import (C, fl_widget_redraw_label, "fl_widget_redraw_label");
    pragma Inline (fl_widget_redraw_label);




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




    package body Forge is

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

    end Forge;




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


    procedure Set_Active
           (This : in out Widget;
            To   : in     Boolean) is
    begin
        if To then
            fl_widget_set_active (This.Void_Ptr);
        else
            fl_widget_clear_active (This.Void_Ptr);
        end if;
    end Set_Active;




    function Has_Changed
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_changed (This.Void_Ptr) /= 0;
    end Has_Changed;


    procedure Set_Changed
           (This : in out Widget;
            To   : in     Boolean) is
    begin
        if To then
            fl_widget_set_changed (This.Void_Ptr);
        else
            fl_widget_clear_changed (This.Void_Ptr);
        end if;
    end Set_Changed;


    function Is_Output_Only
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_output (This.Void_Ptr) /= 0;
    end Is_Output_Only;


    procedure Set_Output_Only
           (This : in out Widget;
            To   : in     Boolean) is
    begin
        if To then
            fl_widget_set_output (This.Void_Ptr);
        else
            fl_widget_clear_output (This.Void_Ptr);
        end if;
    end Set_Output_Only;


    function Is_Visible
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_visible (This.Void_Ptr) /= 0;
    end Is_Visible;


    function Is_Tree_Visible
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_visible_r (This.Void_Ptr) /= 0;
    end Is_Tree_Visible;


    procedure Set_Visible
           (This : in out Widget;
            To   : in     Boolean) is
    begin
        if To then
            fl_widget_set_visible (This.Void_Ptr);
        else
            fl_widget_clear_visible (This.Void_Ptr);
        end if;
    end Set_Visible;




    function Has_Visible_Focus
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_get_visible_focus (This.Void_Ptr) /= 0;
    end Has_Visible_Focus;


    procedure Set_Visible_Focus
           (This : in out Widget;
            To   : in     Boolean) is
    begin
        fl_widget_set_visible_focus (This.Void_Ptr, Boolean'Pos (To));
    end Set_Visible_Focus;


    function Take_Focus
           (This : in out Widget)
        return Boolean is
    begin
        return fl_widget_take_focus (This.Void_Ptr) /= 0;
    end Take_Focus;


    function Takes_Events
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_takesevents (This.Void_Ptr) /= 0;
    end Takes_Events;




    function Get_Background_Color
           (This : in Widget)
        return Color is
    begin
        return Color (fl_widget_get_color (This.Void_Ptr));
    end Get_Background_Color;


    procedure Set_Background_Color
           (This : in out Widget;
            To   : in     Color) is
    begin
        fl_widget_set_color (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Background_Color;


    function Get_Selection_Color
           (This : in Widget)
        return Color is
    begin
        return Color (fl_widget_get_selection_color (This.Void_Ptr));
    end Get_Selection_Color;


    procedure Set_Selection_Color
           (This : in out Widget;
            To   : in     Color) is
    begin
        fl_widget_set_selection_color (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Selection_Color;




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


    function Inside
           (This   : in Widget;
            Parent : in Widget'Class)
        return Boolean is
    begin
        return fl_widget_inside (This.Void_Ptr, Parent.Void_Ptr) /= 0;
    end Inside;


    function Nearest_Window
           (This : in Widget)
        return access FLTK.Widgets.Groups.Windows.Window'Class
    is
        Window_Ptr : System.Address;
        Actual_Window : access FLTK.Widgets.Groups.Windows.Window'Class;
    begin
        Window_Ptr := fl_widget_window (This.Void_Ptr);
        if Window_Ptr /= System.Null_Address then
            Actual_Window := Window_Convert.To_Pointer (fl_widget_get_user_data (Window_Ptr));
        end if;
        return Actual_Window;
    end Nearest_Window;


    function Top_Window
           (This : in Widget)
        return access FLTK.Widgets.Groups.Windows.Window'Class
    is
        Window_Ptr : System.Address;
        Actual_Window : access FLTK.Widgets.Groups.Windows.Window'Class;
    begin
        Window_Ptr := fl_widget_top_window (This.Void_Ptr);
        if Window_Ptr /= System.Null_Address then
            Actual_Window := Window_Convert.To_Pointer (fl_widget_get_user_data (Window_Ptr));
        end if;
        return Actual_Window;
    end Top_Window;


    function Top_Window_Offset
           (This : in Widget;
            Offset_X, Offset_Y : out Integer)
        return access FLTK.Widgets.Groups.Windows.Window'Class
    is
        Window_Ptr : System.Address;
        Actual_Window : access FLTK.Widgets.Groups.Windows.Window'Class;
    begin
        Window_Ptr := fl_widget_top_window_offset
           (This.Void_Ptr,
            Interfaces.C.int (Offset_X),
            Interfaces.C.int (Offset_Y));
        if Window_Ptr /= System.Null_Address then
            Actual_Window := Window_Convert.To_Pointer (fl_widget_get_user_data (Window_Ptr));
        end if;
        return Actual_Window;
    end Top_Window_Offset;




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


    function Get_Tooltip
           (This : in Widget)
        return String is
    begin
        --  no need for dealloc
        return Interfaces.C.Strings.Value (fl_widget_tooltip (This.Void_Ptr));
    end Get_Tooltip;


    procedure Set_Tooltip
           (This : in out Widget;
            Text : in     String) is
    begin
        fl_widget_copy_tooltip (This.Void_Ptr, Interfaces.C.To_C (Text));
    end Set_Tooltip;




    function Get_Label
           (This : in Widget)
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


    function Get_Label_Color
           (This : in Widget)
        return Color is
    begin
        return Color (fl_widget_get_labelcolor (This.Void_Ptr));
    end Get_Label_Color;


    procedure Set_Label_Color
           (This  : in out Widget;
            Value : in     Color) is
    begin
        fl_widget_set_labelcolor (This.Void_Ptr, Interfaces.C.unsigned (Value));
    end Set_Label_Color;


    function Get_Label_Font
           (This : in Widget)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_widget_get_labelfont (This.Void_Ptr));
    end Get_Label_Font;


    procedure Set_Label_Font
           (This : in out Widget;
            Font : in     Font_Kind) is
    begin
        fl_widget_set_labelfont (This.Void_Ptr, Font_Kind'Pos (Font));
    end Set_Label_Font;


    function Get_Label_Size
           (This : in Widget)
        return Font_Size is
    begin
        return Font_Size (fl_widget_get_labelsize (This.Void_Ptr));
    end Get_Label_Size;


    procedure Set_Label_Size
           (This : in out Widget;
            Size : in     Font_Size) is
    begin
        fl_widget_set_labelsize (This.Void_Ptr, Interfaces.C.int (Size));
    end Set_Label_Size;


    function Get_Label_Type
           (This : in Widget)
        return Label_Kind is
    begin
        return Label_Kind'Val (fl_widget_get_labeltype (This.Void_Ptr));
    end Get_Label_Type;


    procedure Set_Label_Type
           (This  : in out Widget;
            Label : in     Label_Kind) is
    begin
        fl_widget_set_labeltype (This.Void_Ptr, Label_Kind'Pos (Label));
    end Set_Label_Type;


    procedure Measure_Label
           (This : in     Widget;
            W, H :    out Integer) is
    begin
        fl_widget_measure_label
           (This.Void_Ptr,
            Interfaces.C.int (W),
            Interfaces.C.int (H));
    end Measure_Label;




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


    procedure Do_Callback
           (This : in out Widget) is
    begin
        if This.Callback /= null then
            This.Callback.all (This);
        end if;
    end Do_Callback;


    function Get_When
           (This : in Widget)
        return Callback_Flag is
    begin
        return Callback_Flag (fl_widget_get_when (This.Void_Ptr));
    end Get_When;


    procedure Set_When
           (This : in out Widget;
            To   : in     Callback_Flag) is
    begin
        fl_widget_set_when (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_When;




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


    function Get_Inactive_Image
           (This : in Widget)
        return access FLTK.Images.Image'Class is
    begin
        return This.Inactive_Image;
    end Get_Inactive_Image;


    procedure Set_Inactive_Image
           (This : in out Widget;
            Pic  : in out FLTK.Images.Image'Class) is
    begin
        This.Inactive_Image := Pic'Unchecked_Access;
        fl_widget_set_deimage
           (This.Void_Ptr,
            Wrapper (Pic).Void_Ptr);
    end Set_Inactive_Image;




    function Is_Damaged
           (This : in Widget)
        return Boolean is
    begin
        return fl_widget_damage (This.Void_Ptr) /= 0;
    end Is_Damaged;


    procedure Set_Damaged
           (This : in out Widget;
            To   : in     Boolean) is
    begin
        fl_widget_set_damage (This.Void_Ptr, Boolean'Pos (To));
    end Set_Damaged;


    procedure Set_Damaged
           (This       : in out Widget;
            To         : in     Boolean;
            X, Y, W, H : in     Integer) is
    begin
        fl_widget_set_damage2
           (This.Void_Ptr,
            Boolean'Pos (To),
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H));
    end Set_Damaged;


    procedure Draw_Label
           (This       : in Widget;
            X, Y, W, H : in Integer;
            Align      : in Alignment) is
    begin
        fl_widget_draw_label
           (This.Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.unsigned (Align));
    end Draw_Label;


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

