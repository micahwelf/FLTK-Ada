

with

    Interfaces.C.Strings,
    System.Address_To_Access_Conversions,
    Ada.Unchecked_Conversion;

use type

    Interfaces.C.int;


package body FLTK.Static is


    procedure fl_static_add_awake_handler
           (H, F : in System.Address);
    pragma Import (C, fl_static_add_awake_handler, "fl_static_add_awake_handler");
    pragma Inline (fl_static_add_awake_handler);

    procedure fl_static_get_awake_handler
           (H, F : out System.Address);
    pragma Import (C, fl_static_get_awake_handler, "fl_static_get_awake_handler");
    pragma Inline (fl_static_get_awake_handler);




    procedure fl_static_add_check
           (H, F : in System.Address);
    pragma Import (C, fl_static_add_check, "fl_static_add_check");
    pragma Inline (fl_static_add_check);

    function fl_static_has_check
           (H, F : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_static_has_check, "fl_static_has_check");
    pragma Inline (fl_static_has_check);

    procedure fl_static_remove_check
           (H, F : in System.Address);
    pragma Import (C, fl_static_remove_check, "fl_static_remove_check");
    pragma Inline (fl_static_remove_check);




    procedure fl_static_add_timeout
           (S    : in Interfaces.C.double;
            H, F : in System.Address);
    pragma Import (C, fl_static_add_timeout, "fl_static_add_timeout");
    pragma Inline (fl_static_add_timeout);

    function fl_static_has_timeout
           (H, F : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_static_has_timeout, "fl_static_has_timeout");
    pragma Inline (fl_static_has_timeout);

    procedure fl_static_remove_timeout
           (H, F : in System.Address);
    pragma Import (C, fl_static_remove_timeout, "fl_static_remove_timeout");
    pragma Inline (fl_static_remove_timeout);

    procedure fl_static_repeat_timeout
           (S    : in Interfaces.C.double;
            H, F : in System.Address);
    pragma Import (C, fl_static_repeat_timeout, "fl_static_repeat_timeout");
    pragma Inline (fl_static_repeat_timeout);




    procedure fl_static_add_clipboard_notify
           (H, F : in System.Address);
    pragma Import (C, fl_static_add_clipboard_notify, "fl_static_add_clipboard_notify");
    pragma Inline (fl_static_add_clipboard_notify);




    procedure fl_static_add_fd
           (D    : in Interfaces.C.int;
            H, F : in System.Address);
    pragma Import (C, fl_static_add_fd, "fl_static_add_fd");
    pragma Inline (fl_static_add_fd);

    procedure fl_static_add_fd2
           (D, M : in Interfaces.C.int;
            H, F : in System.Address);
    pragma Import (C, fl_static_add_fd2, "fl_static_add_fd2");
    pragma Inline (fl_static_add_fd2);

    procedure fl_static_remove_fd
           (D : in Interfaces.C.int);
    pragma Import (C, fl_static_remove_fd, "fl_static_remove_fd");
    pragma Inline (fl_static_remove_fd);

    procedure fl_static_remove_fd2
           (D, M : in Interfaces.C.int);
    pragma Import (C, fl_static_remove_fd2, "fl_static_remove_fd2");
    pragma Inline (fl_static_remove_fd2);




    procedure fl_static_add_idle
           (H, F : in System.Address);
    pragma Import (C, fl_static_add_idle, "fl_static_add_idle");
    pragma Inline (fl_static_add_idle);

    function fl_static_has_idle
           (H, F : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_static_has_idle, "fl_static_has_idle");
    pragma Inline (fl_static_has_idle);

    procedure fl_static_remove_idle
           (H, F : in System.Address);
    pragma Import (C, fl_static_remove_idle, "fl_static_remove_idle");
    pragma Inline (fl_static_remove_idle);




    procedure fl_static_get_color
           (C       : in     Interfaces.C.unsigned;
            R, G, B :    out Interfaces.C.unsigned_char);
    pragma Import (C, fl_static_get_color, "fl_static_get_color");
    pragma Inline (fl_static_get_color);

    procedure fl_static_set_color
           (C       : in Interfaces.C.unsigned;
            R, G, B : in Interfaces.C.unsigned_char);
    pragma Import (C, fl_static_set_color, "fl_static_set_color");
    pragma Inline (fl_static_set_color);

    procedure fl_static_free_color
           (C : in Interfaces.C.unsigned;
            B : in Interfaces.C.int);
    pragma Import (C, fl_static_free_color, "fl_static_free_color");
    pragma Inline (fl_static_free_color);

    procedure fl_static_foreground
           (R, G, B : in Interfaces.C.unsigned_char);
    pragma Import (C, fl_static_foreground, "fl_static_foreground");
    pragma Inline (fl_static_foreground);

    procedure fl_static_background
           (R, G, B : in Interfaces.C.unsigned_char);
    pragma Import (C, fl_static_background, "fl_static_background");
    pragma Inline (fl_static_background);

    procedure fl_static_background2
           (R, G, B : in Interfaces.C.unsigned_char);
    pragma Import (C, fl_static_background2, "fl_static_background2");
    pragma Inline (fl_static_background2);




    function fl_static_get_font
           (K : in Interfaces.C.int)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_static_get_font, "fl_static_get_font");
    pragma Inline (fl_static_get_font);

    function fl_static_get_font_name
           (K : in Interfaces.C.int)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_static_get_font_name, "fl_static_get_font_name");
    pragma Inline (fl_static_get_font_name);

    procedure fl_static_set_font
           (T, F : in Interfaces.C.int);
    pragma Import (C, fl_static_set_font, "fl_static_set_font");
    pragma Inline (fl_static_set_font);

    function fl_static_get_font_sizes
           (F : in     Interfaces.C.int;
            A :    out System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_static_get_font_sizes, "fl_static_get_font_sizes");
    pragma Inline (fl_static_get_font_sizes);

    function fl_static_font_size_array_get
           (A : in System.Address;
            I : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_static_font_size_array_get, "fl_static_font_size_array_get");
    pragma Inline (fl_static_font_size_array_get);

    function fl_static_set_fonts
        return Interfaces.C.int;
    pragma Import (C, fl_static_set_fonts, "fl_static_set_fonts");
    pragma Inline (fl_static_set_fonts);




    function fl_static_box_dh
           (B : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_static_box_dh, "fl_static_box_dh");
    pragma Inline (fl_static_box_dh);

    function fl_static_box_dw
           (B : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_static_box_dw, "fl_static_box_dw");
    pragma Inline (fl_static_box_dw);

    function fl_static_box_dx
           (B : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_static_box_dx, "fl_static_box_dx");
    pragma Inline (fl_static_box_dx);

    function fl_static_box_dy
           (B : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_static_box_dy, "fl_static_box_dy");
    pragma Inline (fl_static_box_dy);

    procedure fl_static_set_boxtype
           (T, F : in Interfaces.C.int);
    pragma Import (C, fl_static_set_boxtype, "fl_static_set_boxtype");
    pragma Inline (fl_static_set_boxtype);

    function fl_static_draw_box_active
        return Interfaces.C.int;
    pragma Import (C, fl_static_draw_box_active, "fl_static_draw_box_active");
    pragma Inline (fl_static_draw_box_active);




    procedure fl_static_copy
           (T    : in Interfaces.C.char_array;
            L, K : in Interfaces.C.int);
    pragma Import (C, fl_static_copy, "fl_static_copy");
    pragma Inline (fl_static_copy);

    procedure fl_static_paste
           (R : in System.Address;
            S : in Interfaces.C.int);
    pragma Import (C, fl_static_paste, "fl_static_paste");
    pragma Inline (fl_static_paste);

    procedure fl_static_selection
           (O : in System.Address;
            T : in Interfaces.C.char_array;
            L : in Interfaces.C.int);
    pragma Import (C, fl_static_selection, "fl_static_selection");
    pragma Inline (fl_static_selection);




    function fl_static_get_dnd_text_ops
        return Interfaces.C.int;
    pragma Import (C, fl_static_get_dnd_text_ops, "fl_static_get_dnd_text_ops");
    pragma Inline (fl_static_get_dnd_text_ops);

    procedure fl_static_set_dnd_text_ops
           (T : in Interfaces.C.int);
    pragma Import (C, fl_static_set_dnd_text_ops, "fl_static_set_dnd_text_ops");
    pragma Inline (fl_static_set_dnd_text_ops);




    function fl_static_get_visible_focus
        return Interfaces.C.int;
    pragma Import (C, fl_static_get_visible_focus, "fl_static_get_visible_focus");
    pragma Inline (fl_static_get_visible_focus);

    procedure fl_static_set_visible_focus
           (T : in Interfaces.C.int);
    pragma Import (C, fl_static_set_visible_focus, "fl_static_set_visible_focus");
    pragma Inline (fl_static_set_visible_focus);




    procedure fl_static_default_atclose
           (W : in System.Address);
    pragma Import (C, fl_static_default_atclose, "fl_static_default_atclose");
    pragma Inline (fl_static_default_atclose);

    function fl_static_get_first_window
        return System.Address;
    pragma Import (C, fl_static_get_first_window, "fl_static_get_first_window");
    pragma Inline (fl_static_get_first_window);

    procedure fl_static_set_first_window
           (T : in System.Address);
    pragma Import (C, fl_static_set_first_window, "fl_static_set_first_window");
    pragma Inline (fl_static_set_first_window);

    function fl_static_next_window
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_static_next_window, "fl_static_next_window");
    pragma Inline (fl_static_next_window);

    function fl_static_modal
        return System.Address;
    pragma Import (C, fl_static_modal, "fl_static_modal");
    pragma Inline (fl_static_modal);




    function fl_static_readqueue
        return System.Address;
    pragma Import (C, fl_static_readqueue, "fl_static_readqueue");
    pragma Inline (fl_static_readqueue);




    function fl_static_get_scheme
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_static_get_scheme, "fl_static_get_scheme");
    pragma Inline (fl_static_get_scheme);

    procedure fl_static_set_scheme
           (S : in Interfaces.C.char_array);
    pragma Import (C, fl_static_set_scheme, "fl_static_set_scheme");
    pragma Inline (fl_static_set_scheme);

    function fl_static_is_scheme
           (S : in Interfaces.C.char_array)
        return Interfaces.C.int;
    pragma Import (C, fl_static_is_scheme, "fl_static_is_scheme");
    pragma Inline (fl_static_is_scheme);




    function fl_static_get_option
           (O : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_static_get_option, "fl_static_get_option");
    pragma Inline (fl_static_get_option);

    procedure fl_static_set_option
           (O, T : in Interfaces.C.int);
    pragma Import (C, fl_static_set_option, "fl_static_set_option");
    pragma Inline (fl_static_set_option);




    function fl_static_get_scrollbar_size
        return Interfaces.C.int;
    pragma Import (C, fl_static_get_scrollbar_size, "fl_static_get_scrollbar_size");
    pragma Inline (fl_static_get_scrollbar_size);

    procedure fl_static_set_scrollbar_size
           (S : in Interfaces.C.int);
    pragma Import (C, fl_static_set_scrollbar_size, "fl_static_set_scrollbar_size");
    pragma Inline (fl_static_set_scrollbar_size);




    package Widget_Convert is new System.Address_To_Access_Conversions
        (FLTK.Widgets.Widget'Class);
    package Window_Convert is new System.Address_To_Access_Conversions
        (FLTK.Widgets.Groups.Windows.Window'Class);

    function fl_widget_get_user_data
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_get_user_data, "fl_widget_get_user_data");




    package Awake_Convert is
        function To_Pointer is new Ada.Unchecked_Conversion (System.Address, Awake_Handler);
        function To_Address is new Ada.Unchecked_Conversion (Awake_Handler, System.Address);
    end Awake_Convert;

    procedure Awake_Hook
           (U : in System.Address);
    pragma Convention (C, Awake_Hook);

    procedure Awake_Hook
           (U : in System.Address) is
    begin
        Awake_Convert.To_Pointer (U).all;
    end Awake_Hook;


    procedure Add_Awake_Handler
           (Func : in Awake_Handler) is
    begin
        fl_static_add_awake_handler
           (Awake_Hook'Address,
            Awake_Convert.To_Address (Func));
    end Add_Awake_Handler;


    function Get_Awake_Handler
        return Awake_Handler
    is
        Hook, Func : System.Address;
    begin
        fl_static_get_awake_handler (Hook, Func);
        return Awake_Convert.To_Pointer (Func);
    end Get_Awake_Handler;




    package Timeout_Convert is
        function To_Pointer is new Ada.Unchecked_Conversion (System.Address, Timeout_Handler);
        function To_Address is new Ada.Unchecked_Conversion (Timeout_Handler, System.Address);
    end Timeout_Convert;

    procedure Timeout_Hook
           (U : in System.Address);
    pragma Convention (C, Timeout_Hook);

    procedure Timeout_Hook
           (U : in System.Address) is
    begin
        Timeout_Convert.To_Pointer (U).all;
    end Timeout_Hook;


    procedure Add_Check
           (Func : in Timeout_Handler) is
    begin
        fl_static_add_check
           (Timeout_Hook'Address,
            Timeout_Convert.To_Address (Func));
    end Add_Check;


    function Has_Check
           (Func : in Timeout_Handler)
        return Boolean is
    begin
        return fl_static_has_check
           (Timeout_Hook'Address,
            Timeout_Convert.To_Address (Func)) /= 0;
    end Has_Check;


    procedure Remove_Check
           (Func : in Timeout_Handler) is
    begin
        fl_static_remove_check
           (Timeout_Hook'Address,
            Timeout_Convert.To_Address (Func));
    end Remove_Check;




    procedure Add_Timeout
           (Seconds : in Long_Float;
            Func    : in Timeout_Handler) is
    begin
        fl_static_add_timeout
           (Interfaces.C.double (Seconds),
            Timeout_Hook'Address,
            Timeout_Convert.To_Address (Func));
    end Add_Timeout;


    function Has_Timeout
           (Func : in Timeout_Handler)
        return Boolean is
    begin
        return fl_static_has_timeout
           (Timeout_Hook'Address,
            Timeout_Convert.To_Address (Func)) /= 0;
    end Has_Timeout;


    procedure Remove_Timeout
           (Func : in Timeout_Handler) is
    begin
        fl_static_remove_timeout
           (Timeout_Hook'Address,
            Timeout_Convert.To_Address (Func));
    end Remove_Timeout;


    procedure Repeat_Timeout
           (Seconds : in Long_Float;
            Func    : in Timeout_Handler) is
    begin
        fl_static_repeat_timeout
           (Interfaces.C.double (Seconds),
            Timeout_Hook'Address,
            Timeout_Convert.To_Address (Func));
    end Repeat_Timeout;




    package Clipboard_Convert is
        function To_Pointer is new Ada.Unchecked_Conversion
            (System.Address, Clipboard_Notify_Handler);
        function To_Address is new Ada.Unchecked_Conversion
            (Clipboard_Notify_Handler, System.Address);
    end Clipboard_Convert;

    Current_Clipboard_Notify : Clipboard_Notify_Handler;

    procedure Clipboard_Notify_Hook
           (S : in Interfaces.C.int;
            U : in System.Address);
    pragma Convention (C, Clipboard_Notify_Hook);

    procedure Clipboard_Notify_Hook
           (S : in Interfaces.C.int;
            U : in System.Address) is
    begin
        if Current_Clipboard_Notify /= null then
            Current_Clipboard_Notify.all (Buffer_Kind'Val (S));
        end if;
    end Clipboard_Notify_Hook;


    procedure Add_Clipboard_Notify
           (Func : in Clipboard_Notify_Handler) is
    begin
        Current_Clipboard_Notify := Func;
    end Add_Clipboard_Notify;


    procedure Remove_Clipboard_Notify
           (Func : in Clipboard_Notify_Handler) is
    begin
        Current_Clipboard_Notify := null;
    end Remove_Clipboard_Notify;




    package FD_Convert is
        function To_Pointer is new Ada.Unchecked_Conversion (System.Address, File_Handler);
        function To_Address is new Ada.Unchecked_Conversion (File_Handler, System.Address);
    end FD_Convert;

    procedure FD_Hook
           (FD : in Interfaces.C.int;
            U  : in System.Address);
    pragma Convention (C, FD_Hook);

    procedure FD_Hook
           (FD : in Interfaces.C.int;
            U  : in System.Address) is
    begin
        FD_Convert.To_Pointer (U).all (File_Descriptor (FD));
    end FD_Hook;


    procedure Add_File_Descriptor
           (FD   : in File_Descriptor;
            Func : in File_Handler) is
    begin
        fl_static_add_fd
           (Interfaces.C.int (FD),
            FD_Hook'Address,
            FD_Convert.To_Address (Func));
    end Add_File_Descriptor;


    procedure Add_File_Descriptor
           (FD   : in File_Descriptor;
            Mode : in File_Mode;
            Func : in File_Handler) is
    begin
        fl_static_add_fd2
           (Interfaces.C.int (FD),
            File_Mode_Codes (Mode),
            FD_Hook'Address,
            FD_Convert.To_Address (Func));
    end Add_File_Descriptor;


    procedure Remove_File_Descriptor
           (FD : in File_Descriptor) is
    begin
        fl_static_remove_fd (Interfaces.C.int (FD));
    end Remove_File_Descriptor;


    procedure Remove_File_Descriptor
           (FD   : in File_Descriptor;
            Mode : in File_Mode) is
    begin
        fl_static_remove_fd2 (Interfaces.C.int (FD), File_Mode_Codes (Mode));
    end Remove_File_Descriptor;




    package Idle_Convert is
        function To_Pointer is new Ada.Unchecked_Conversion (System.Address, Idle_Handler);
        function To_Address is new Ada.Unchecked_Conversion (Idle_Handler, System.Address);
    end Idle_Convert;

    procedure Idle_Hook
           (U : in System.Address);
    pragma Convention (C, Idle_Hook);

    procedure Idle_Hook
           (U : in System.Address) is
    begin
        Idle_Convert.To_Pointer (U).all;
    end Idle_Hook;


    procedure Add_Idle
           (Func : in Idle_Handler) is
    begin
        fl_static_add_idle
           (Idle_Hook'Address,
            Idle_Convert.To_Address (Func));
    end Add_Idle;


    function Has_Idle
           (Func : in Idle_Handler)
        return Boolean is
    begin
        return fl_static_has_idle
           (Idle_Hook'Address,
            Idle_Convert.To_Address (Func)) /= 0;
    end Has_Idle;


    procedure Remove_Idle
           (Func : in Idle_Handler) is
    begin
        fl_static_remove_idle
           (Idle_Hook'Address,
            Idle_Convert.To_Address (Func));
    end Remove_Idle;




    procedure Get_Color
           (From    : in     Color;
            R, G, B :    out Color_Component) is
    begin
        fl_static_get_color
           (Interfaces.C.unsigned (From),
            Interfaces.C.unsigned_char (R),
            Interfaces.C.unsigned_char (G),
            Interfaces.C.unsigned_char (B));
    end Get_Color;


    procedure Set_Color
           (To      : in Color;
            R, G, B : in Color_Component) is
    begin
        fl_static_set_color
           (Interfaces.C.unsigned (To),
            Interfaces.C.unsigned_char (R),
            Interfaces.C.unsigned_char (G),
            Interfaces.C.unsigned_char (B));
    end Set_Color;


    procedure Free_Color
           (Value   : in Color;
            Overlay : in Boolean := False) is
    begin
        fl_static_free_color
           (Interfaces.C.unsigned (Value),
            Boolean'Pos (Overlay));
    end Free_Color;


    procedure Set_Foreground
           (R, G, B : in Color_Component) is
    begin
        fl_static_foreground
           (Interfaces.C.unsigned_char (R),
            Interfaces.C.unsigned_char (G),
            Interfaces.C.unsigned_char (B));
    end Set_Foreground;


    procedure Set_Background
           (R, G, B : in Color_Component) is
    begin
        fl_static_background
           (Interfaces.C.unsigned_char (R),
            Interfaces.C.unsigned_char (G),
            Interfaces.C.unsigned_char (B));
    end Set_Background;


    procedure Set_Alt_Background
           (R, G, B : in Color_Component) is
    begin
        fl_static_background2
           (Interfaces.C.unsigned_char (R),
            Interfaces.C.unsigned_char (G),
            Interfaces.C.unsigned_char (B));
    end Set_Alt_Background;




    function Font_Image
           (Kind : in Font_Kind)
        return String is
    begin
        return Interfaces.C.Strings.Value (fl_static_get_font (Font_Kind'Pos (Kind)));
    end Font_Image;


    function Font_Family_Image
           (Kind : in Font_Kind)
        return String is
    begin
        return Interfaces.C.Strings.Value (fl_static_get_font_name (Font_Kind'Pos (Kind)));
    end Font_Family_Image;


    procedure Set_Font_Kind
           (To, From : in Font_Kind) is
    begin
        fl_static_set_font (Font_Kind'Pos (To), Font_Kind'Pos (From));
    end Set_Font_Kind;


    function Font_Sizes
           (Kind : in Font_Kind)
        return Font_Size_Array
    is
        Ptr : System.Address;
        Arr : Font_Size_Array
            (1 .. Integer (fl_static_get_font_sizes (Font_Kind'Pos (Kind), Ptr)));
    begin
        --  This array copying avoids any worry that the static buffer will be overwritten.
        for I in 1 .. Arr'Length loop
            Arr (I) := Font_Size (fl_static_font_size_array_get (Ptr, Interfaces.C.int (I)));
        end loop;
        return Arr;
    end Font_Sizes;


    procedure Setup_Fonts
           (How_Many_Set_Up : out Natural) is
    begin
        How_Many_Set_Up := Natural (fl_static_set_fonts);
    end Setup_Fonts;




    function Get_Box_Height_Offset
           (Kind : in Box_Kind)
        return Integer is
    begin
        return Integer (fl_static_box_dh (Box_Kind'Pos (Kind)));
    end Get_Box_Height_Offset;


    function Get_Box_Width_Offset
           (Kind : in Box_Kind)
        return Integer is
    begin
        return Integer (fl_static_box_dw (Box_Kind'Pos (Kind)));
    end Get_Box_Width_Offset;


    function Get_Box_X_Offset
           (Kind : in Box_Kind)
        return Integer is
    begin
        return Integer (fl_static_box_dx (Box_Kind'Pos (Kind)));
    end Get_Box_X_Offset;


    function Get_Box_Y_Offset
           (Kind : in Box_Kind)
        return Integer is
    begin
        return Integer (fl_static_box_dy (Box_Kind'Pos (Kind)));
    end Get_Box_Y_Offset;


    procedure Set_Box_Kind
           (To, From : in Box_Kind) is
    begin
        fl_static_set_boxtype (Box_Kind'Pos (To), Box_Kind'Pos (From));
    end Set_Box_Kind;


    function Draw_Box_Active
        return Boolean is
    begin
        return fl_static_draw_box_active /= 0;
    end Draw_Box_Active;


    --  function Get_Box_Draw_Function
    --         (Kind : in Box_Kind)
    --      return Box_Draw_Function is
    --  begin
    --      return null;
    --  end Get_Box_Draw_Function;


    --  procedure Set_Box_Draw_Function
    --         (Kind               : in Box_Kind;
    --          Func               : in Box_Draw_Function;
    --          Offset_X, Offset_Y : in Integer := 0;
    --          Offset_W, Offset_H : in Integer := 0) is
    --  begin
    --      null;
    --  end Set_Box_Draw_Function;




    procedure Copy
           (Text : in String;
            Dest : in Buffer_Kind) is
    begin
        fl_static_copy
           (Interfaces.C.To_C (Text),
            Text'Length,
            Buffer_Kind'Pos (Dest));
    end Copy;


    procedure Paste
           (Receiver : in FLTK.Widgets.Widget'Class;
            Source   : in Buffer_Kind) is
    begin
        fl_static_paste
           (Wrapper (Receiver).Void_Ptr,
            Buffer_Kind'Pos (Source));
    end Paste;


    procedure Selection
           (Owner : in FLTK.Widgets.Widget'Class;
            Text  : in String) is
    begin
        fl_static_selection
           (Wrapper (Owner).Void_Ptr,
            Interfaces.C.To_C (Text),
            Text'Length);
    end Selection;




    function Get_Drag_Drop_Text_Support
        return Boolean is
    begin
        return fl_static_get_dnd_text_ops /= 0;
    end Get_Drag_Drop_Text_Support;


    procedure Set_Drag_Drop_Text_Support
           (To : in Boolean) is
    begin
        fl_static_set_dnd_text_ops (Boolean'Pos (To));
    end Set_Drag_Drop_Text_Support;




    function Has_Visible_Focus
        return Boolean is
    begin
        return fl_static_get_visible_focus /= 0;
    end Has_Visible_Focus;


    procedure Set_Visible_Focus
           (To : in Boolean) is
    begin
        fl_static_set_visible_focus (Boolean'Pos (To));
    end Set_Visible_Focus;




    procedure Default_Window_Close
           (Item : in out FLTK.Widgets.Widget'Class) is
    begin
        fl_static_default_atclose (Wrapper (Item).Void_Ptr);
    end Default_Window_Close;


    function Get_First_Window
        return access FLTK.Widgets.Groups.Windows.Window'Class is
    begin
        return Window_Convert.To_Pointer
            (fl_widget_get_user_data (fl_static_get_first_window));
    end Get_First_Window;


    procedure Set_First_Window
           (To : in FLTK.Widgets.Groups.Windows.Window'Class) is
    begin
        fl_static_set_first_window (Wrapper (To).Void_Ptr);
    end Set_First_Window;


    function Get_Next_Window
           (From : in FLTK.Widgets.Groups.Windows.Window'Class)
        return access FLTK.Widgets.Groups.Windows.Window'Class is
    begin
        return Window_Convert.To_Pointer
            (fl_widget_get_user_data (fl_static_next_window (Wrapper (From).Void_Ptr)));
    end Get_Next_Window;


    function Get_Top_Modal
        return access FLTK.Widgets.Groups.Windows.Window'Class is
    begin
        return Window_Convert.To_Pointer (fl_widget_get_user_data (fl_static_modal));
    end Get_Top_Modal;




    function Read_Queue
        return access FLTK.Widgets.Widget'Class is
    begin
        return Widget_Convert.To_Pointer (fl_widget_get_user_data (fl_static_readqueue));
    end Read_Queue;




    function Get_Scheme
        return String is
    begin
        return Interfaces.C.Strings.Value (fl_static_get_scheme);
    end Get_Scheme;


    procedure Set_Scheme
           (To : in String) is
    begin
        fl_static_set_scheme (Interfaces.C.To_C (To));
    end Set_Scheme;


    function Is_Scheme
           (Scheme : in String)
        return Boolean is
    begin
        return fl_static_is_scheme (Interfaces.C.To_C (Scheme)) /= 0;
    end Is_Scheme;




    function Get_Option
           (Opt : in Option)
        return Boolean is
    begin
        return fl_static_get_option (Option'Pos (Opt)) /= 0;
    end Get_Option;


    procedure Set_Option
           (Opt : in Option;
            To  : in Boolean) is
    begin
        fl_static_set_option (Option'Pos (Opt), Boolean'Pos (To));
    end Set_Option;




    function Get_Default_Scrollbar_Size
        return Natural is
    begin
        return Natural (fl_static_get_scrollbar_size);
    end Get_Default_Scrollbar_Size;


    procedure Set_Default_Scrollbar_Size
           (To : in Natural) is
    begin
        fl_static_set_scrollbar_size (Interfaces.C.int (To));
    end Set_Default_Scrollbar_Size;


begin


    fl_static_add_clipboard_notify (Clipboard_Notify_Hook'Address, System.Null_Address);


end FLTK.Static;

