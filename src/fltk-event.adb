

with

    Interfaces.C.Strings;

use type

    Interfaces.C.int;


package body FLTK.Event is


    procedure fl_event_add_handler
           (F : in System.Address);
    pragma Import (C, fl_event_add_handler, "fl_event_add_handler");
    pragma Inline (fl_event_add_handler);

    procedure fl_event_set_event_dispatch
           (F : in System.Address);
    pragma Import (C, fl_event_set_event_dispatch, "fl_event_set_event_dispatch");
    pragma Inline (fl_event_set_event_dispatch);

    --  actually handle_ but can't have an underscore on the end of an identifier
    function fl_event_handle
           (E : in Interfaces.C.int;
            W : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_event_handle, "fl_event_handle");
    pragma Inline (fl_event_handle);




    function fl_event_get_grab
        return System.Address;
    pragma Import (C, fl_event_get_grab, "fl_event_get_grab");
    pragma Inline (fl_event_get_grab);

    procedure fl_event_set_grab
           (T : in System.Address);
    pragma Import (C, fl_event_set_grab, "fl_event_set_grab");
    pragma Inline (fl_event_set_grab);

    function fl_event_get_pushed
        return System.Address;
    pragma Import (C, fl_event_get_pushed, "fl_event_get_pushed");
    pragma Inline (fl_event_get_pushed);

    procedure fl_event_set_pushed
           (T : in System.Address);
    pragma Import (C, fl_event_set_pushed, "fl_event_set_pushed");
    pragma Inline (fl_event_set_pushed);

    function fl_event_get_belowmouse
        return System.Address;
    pragma Import (C, fl_event_get_belowmouse, "fl_event_get_belowmouse");
    pragma Inline (fl_event_get_belowmouse);

    procedure fl_event_set_belowmouse
           (T : in System.Address);
    pragma Import (C, fl_event_set_belowmouse, "fl_event_set_belowmouse");
    pragma Inline (fl_event_set_belowmouse);

    function fl_event_get_focus
        return System.Address;
    pragma Import (C, fl_event_get_focus, "fl_event_get_focus");
    pragma Inline (fl_event_get_focus);

    procedure fl_event_set_focus
           (To : in System.Address);
    pragma Import (C, fl_event_set_focus, "fl_event_set_focus");
    pragma Inline (fl_event_set_focus);




    function fl_event_compose
           (D : out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_event_compose, "fl_event_compose");
    pragma Inline (fl_event_compose);

    procedure fl_event_compose_reset;
    pragma Import (C, fl_event_compose_reset, "fl_event_compose_reset");
    pragma Inline (fl_event_compose_reset);

    function fl_event_text
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_event_text, "fl_event_text");
    pragma Inline (fl_event_text);

    function fl_event_length
        return Interfaces.C.int;
    pragma Import (C, fl_event_length, "fl_event_length");
    pragma Inline (fl_event_length);




    function fl_event_get
        return Interfaces.C.int;
    pragma Import (C, fl_event_get, "fl_event_get");
    pragma Inline (fl_event_get);

    function fl_event_state
        return Interfaces.C.unsigned_long;
    pragma Import (C, fl_event_state, "fl_event_state");
    pragma Inline (fl_event_state);

    function fl_event_check_state
           (S : in Interfaces.C.unsigned_long)
        return Interfaces.C.int;
    pragma Import (C, fl_event_check_state, "fl_event_check_state");
    pragma Inline (fl_event_check_state);




    function fl_event_x
        return Interfaces.C.int;
    pragma Import (C, fl_event_x, "fl_event_x");
    pragma Inline (fl_event_x);

    function fl_event_x_root
        return Interfaces.C.int;
    pragma Import (C, fl_event_x_root, "fl_event_x_root");
    pragma Inline (fl_event_x_root);

    function fl_event_y
        return Interfaces.C.int;
    pragma Import (C, fl_event_y, "fl_event_y");
    pragma Inline (fl_event_y);

    function fl_event_y_root
        return Interfaces.C.int;
    pragma Import (C, fl_event_y_root, "fl_event_y_root");
    pragma Inline (fl_event_y_root);

    function fl_event_dx
        return Interfaces.C.int;
    pragma Import (C, fl_event_dx, "fl_event_dx");
    pragma Inline (fl_event_dx);

    function fl_event_dy
        return Interfaces.C.int;
    pragma Import (C, fl_event_dy, "fl_event_dy");
    pragma Inline (fl_event_dy);

    procedure fl_event_get_mouse
           (X, Y : out Interfaces.C.int);
    pragma Import (C, fl_event_get_mouse, "fl_event_get_mouse");
    pragma Inline (fl_event_get_mouse);

    function fl_event_is_click
        return Interfaces.C.int;
    pragma Import (C, fl_event_is_click, "fl_event_is_click");
    pragma Inline (fl_event_is_click);

    function fl_event_is_clicks
        return Interfaces.C.int;
    pragma Import (C, fl_event_is_clicks, "fl_event_is_clicks");
    pragma Inline (fl_event_is_clicks);

    procedure fl_event_set_clicks
           (C : in Interfaces.C.int);
    pragma Import (C, fl_event_set_clicks, "fl_event_set_clicks");
    pragma Inline (fl_event_set_clicks);

    function fl_event_button
        return Interfaces.C.int;
    pragma Import (C, fl_event_button, "fl_event_button");
    pragma Inline (fl_event_button);

    function fl_event_button1
        return Interfaces.C.int;
    pragma Import (C, fl_event_button1, "fl_event_button1");
    pragma Inline (fl_event_button1);

    function fl_event_button2
        return Interfaces.C.int;
    pragma Import (C, fl_event_button2, "fl_event_button2");
    pragma Inline (fl_event_button2);

    function fl_event_button3
        return Interfaces.C.int;
    pragma Import (C, fl_event_button3, "fl_event_button3");
    pragma Inline (fl_event_button3);

    function fl_event_inside
           (X, Y, W, H : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_event_inside, "fl_event_inside");
    pragma Inline (fl_event_inside);




    function fl_event_key
        return Interfaces.C.unsigned_long;
    pragma Import (C, fl_event_key, "fl_event_key");
    pragma Inline (fl_event_key);

    function fl_event_original_key
        return Interfaces.C.unsigned_long;
    pragma Import (C, fl_event_original_key, "fl_event_original_key");
    pragma Inline (fl_event_original_key);

    function fl_event_key_during
           (K : in Interfaces.C.unsigned_long)
        return Interfaces.C.int;
    pragma Import (C, fl_event_key_during, "fl_event_key_during");
    pragma Inline (fl_event_key_during);

    function fl_event_get_key
           (K : in Interfaces.C.unsigned_long)
        return Interfaces.C.int;
    pragma Import (C, fl_event_get_key, "fl_event_get_key");
    pragma Inline (fl_event_get_key);

    function fl_event_ctrl
        return Interfaces.C.int;
    pragma Import (C, fl_event_ctrl, "fl_event_ctrl");
    pragma Inline (fl_event_ctrl);

    function fl_event_alt
        return Interfaces.C.int;
    pragma Import (C, fl_event_alt, "fl_event_alt");
    pragma Inline (fl_event_alt);

    function fl_event_command
        return Interfaces.C.int;
    pragma Import (C, fl_event_command, "fl_event_command");
    pragma Inline (fl_event_command);

    function fl_event_shift
        return Interfaces.C.int;
    pragma Import (C, fl_event_shift, "fl_event_shift");
    pragma Inline (fl_event_shift);




    function Event_Handler_Hook
           (Num : in Interfaces.C.int)
        return Interfaces.C.int
    is
        Ret_Val : Event_Outcome;
    begin
        for Func of reverse Handlers loop
            Ret_Val := Func (Event_Kind'Val (Num));
            if Ret_Val /= Not_Handled then
                return Event_Outcome'Pos (Ret_Val);
            end if;
        end loop;
        return Event_Outcome'Pos (Not_Handled);
    end Event_Handler_Hook;


    function Dispatch_Hook
           (Num : in Interfaces.C.int;
            Ptr : in System.Address)
        return Interfaces.C.int
    is
        Ret_Val : Event_Outcome;
        Actual_Window : access FLTK.Widgets.Groups.Windows.Window'Class :=
                Window_Convert.To_Pointer (fl_widget_get_user_data (Ptr));
    begin
        if Current_Dispatch = null then
            Ret_Val := Default_Dispatch (Event_Kind'Val (Num), Actual_Window.all);
        else
            Ret_Val := Current_Dispatch (Event_Kind'Val (Num), Actual_Window.all);
        end if;
        return Event_Outcome'Pos (Ret_Val);
    end Dispatch_Hook;




    procedure Add_Handler
           (Func : in Event_Handler) is
    begin
        Handlers.Append (Func);
    end Add_Handler;


    procedure Remove_Handler
           (Func : in Event_Handler) is
    begin
        for I in reverse Handlers.First_Index .. Handlers.Last_Index loop
            if Handlers (I) = Func then
                Handlers.Delete (I);
                return;
            end if;
        end loop;
    end Remove_Handler;


    function Get_Dispatch
        return Event_Dispatch is
    begin
        if Current_Dispatch = null then
            return Default_Dispatch'Access;
        else
            return Current_Dispatch;
        end if;
    end Get_Dispatch;


    procedure Set_Dispatch
           (Func : in Event_Dispatch) is
    begin
        Current_Dispatch := Func;
    end Set_Dispatch;


    function Default_Dispatch
           (Event : in     Event_Kind;
            Win   : in out FLTK.Widgets.Groups.Windows.Window'Class)
        return Event_Outcome is
    begin
        return Event_Outcome'Val (fl_event_handle
           (Event_Kind'Pos (Event),
            Wrapper (Win).Void_Ptr));
    end Default_Dispatch;




    function Get_Grab
        return access FLTK.Widgets.Groups.Windows.Window'Class is
    begin
        return Window_Convert.To_Pointer (fl_widget_get_user_data (fl_event_get_grab));
    end Get_Grab;


    procedure Set_Grab
           (To : in FLTK.Widgets.Groups.Windows.Window'Class) is
    begin
        fl_event_set_grab (Wrapper (To).Void_Ptr);
    end Set_Grab;


    procedure Release_Grab is
    begin
        fl_event_set_grab (System.Null_Address);
    end Release_Grab;


    function Get_Pushed
        return access FLTK.Widgets.Widget'Class is
    begin
        return Widget_Convert.To_Pointer (fl_widget_get_user_data (fl_event_get_pushed));
    end Get_Pushed;


    procedure Set_Pushed
           (To : in FLTK.Widgets.Widget'Class) is
    begin
        fl_event_set_pushed (Wrapper (To).Void_Ptr);
    end Set_Pushed;


    function Get_Below_Mouse
        return access FLTK.Widgets.Widget'Class is
    begin
        return Widget_Convert.To_Pointer (fl_widget_get_user_data (fl_event_get_belowmouse));
    end Get_Below_Mouse;


    procedure Set_Below_Mouse
           (To : in FLTK.Widgets.Widget'Class) is
    begin
        fl_event_set_belowmouse (Wrapper (To).Void_Ptr);
    end Set_Below_Mouse;


    function Get_Focus
        return access FLTK.Widgets.Widget'Class is
    begin
        return Widget_Convert.To_Pointer (fl_widget_get_user_data (fl_event_get_focus));
    end Get_Focus;


    procedure Set_Focus
           (To : in FLTK.Widgets.Widget'Class) is
    begin
        fl_event_set_focus (Wrapper (To).Void_Ptr);
    end Set_Focus;




    function Compose
           (Del : out Natural)
        return Boolean is
    begin
        return fl_event_compose (Interfaces.C.int (Del)) /= 0;
    end Compose;

    procedure Compose_Reset is
    begin
        fl_event_compose_reset;
    end Compose_Reset;


    function Text
        return String is
    begin
        return Interfaces.C.Strings.Value (fl_event_text, Interfaces.C.size_t (fl_event_length));
    end Text;


    function Text_Length
        return Natural is
    begin
        return Natural (fl_event_length);
    end Text_Length;




    function Last
        return Event_Kind is
    begin
        return Event_Kind'Val (fl_event_get);
    end Last;


    function Last_Modifier
        return Modifier is
    begin
        return To_Ada (fl_event_state);
    end Last_Modifier;


    function Last_Modifier
           (Had : in Modifier)
        return Boolean is
    begin
        return fl_event_check_state (To_C (Had)) /= 0;
    end Last_Modifier;




    function Mouse_X
        return Integer is
    begin
        return Integer (fl_event_x);
    end Mouse_X;


    function Mouse_X_Root
        return Integer is
    begin
        return Integer (fl_event_x_root);
    end Mouse_X_Root;


    function Mouse_Y
        return Integer is
    begin
        return Integer (fl_event_y);
    end Mouse_Y;


    function Mouse_Y_Root
        return Integer is
    begin
        return Integer (fl_event_y_root);
    end Mouse_Y_Root;



    function Mouse_DX
        return Integer is
    begin
        return Integer (fl_event_dx);
    end Mouse_DX;


    function Mouse_DY
        return Integer is
    begin
        return Integer (fl_event_dy);
    end Mouse_DY;


    procedure Get_Mouse
           (X, Y : out Integer) is
    begin
        fl_event_get_mouse (Interfaces.C.int (X), Interfaces.C.int (Y));
    end Get_Mouse;


    function Is_Click
        return Boolean is
    begin
        return fl_event_is_click /= 0;
    end Is_Click;


    function Is_Multi_Click
        return Boolean is
    begin
        return fl_event_is_clicks /= 0;
    end Is_Multi_Click;


    procedure Set_Clicks
           (To : in Natural) is
    begin
        fl_event_set_clicks (Interfaces.C.int (To));
    end Set_Clicks;


    function Last_Button
        return Mouse_Button is
    begin
        return Mouse_Button'Val (fl_event_button);
    end Last_Button;


    function Mouse_Left
        return Boolean is
    begin
        return fl_event_button1 /= 0;
    end Mouse_Left;


    function Mouse_Middle
        return Boolean is
    begin
        return fl_event_button2 /= 0;
    end Mouse_Middle;


    function Mouse_Right
        return Boolean is
    begin
        return fl_event_button3 /= 0;
    end Mouse_Right;


    function Is_Inside
           (X, Y, W, H : in Integer)
        return Boolean is
    begin
        return fl_event_inside
           (Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H)) /= 0;
    end Is_Inside;




    function Last_Key
        return Keypress is
    begin
        return To_Ada (fl_event_key);
    end Last_Key;


    function Original_Last_Key
        return Keypress is
    begin
        return To_Ada (fl_event_original_key);
    end Original_Last_Key;


    function Pressed_During
           (Key : in Keypress)
        return Boolean is
    begin
        return fl_event_key_during (To_C (Key)) /= 0;
    end Pressed_During;


    function Key_Now
           (Key : in Keypress)
        return Boolean is
    begin
        return fl_event_get_key (To_C (Key)) /= 0;
    end Key_Now;


    function Key_Ctrl
        return Boolean is
    begin
        return fl_event_ctrl /= 0;
    end Key_Ctrl;


    function Key_Alt
        return Boolean is
    begin
        return fl_event_alt /= 0;
    end Key_Alt;


    function Key_Command
        return Boolean is
    begin
        return fl_event_command /= 0;
    end Key_Command;


    function Key_Shift
        return Boolean is
    begin
        return fl_event_shift /= 0;
    end Key_Shift;


begin


    fl_event_add_handler (Event_Handler_Hook'Address);
    fl_event_set_event_dispatch (Dispatch_Hook'Address);


end FLTK.Event;

