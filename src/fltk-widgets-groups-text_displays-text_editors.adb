

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    procedure text_editor_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, text_editor_set_draw_hook, "text_editor_set_draw_hook");

    procedure text_editor_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, text_editor_set_handle_hook, "text_editor_set_handle_hook");




    function new_fl_text_editor
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_text_editor, "new_fl_text_editor");

    procedure free_fl_text_editor
           (TE : in System.Address);
    pragma Import (C, free_fl_text_editor, "free_fl_text_editor");




    procedure fl_text_editor_undo
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_undo, "fl_text_editor_undo");

    procedure fl_text_editor_cut
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_cut, "fl_text_editor_cut");

    procedure fl_text_editor_copy
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_copy, "fl_text_editor_copy");

    procedure fl_text_editor_paste
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_paste, "fl_text_editor_paste");

    procedure fl_text_editor_delete
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_delete, "fl_text_editor_delete");



    procedure fl_text_editor_backspace
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_backspace, "fl_text_editor_backspace");

    procedure fl_text_editor_home
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_home, "fl_text_editor_home");

    procedure fl_text_editor_end
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_end, "fl_text_editor_end");

    procedure fl_text_editor_insert
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_insert, "fl_text_editor_insert");

    procedure fl_text_editor_page_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_page_down, "fl_text_editor_page_down");

    procedure fl_text_editor_page_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_page_up, "fl_text_editor_page_up");

    procedure fl_text_editor_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_down, "fl_text_editor_down");

    procedure fl_text_editor_left
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_left, "fl_text_editor_left");

    procedure fl_text_editor_right
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_right, "fl_text_editor_right");

    procedure fl_text_editor_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_up, "fl_text_editor_up");




    procedure fl_text_editor_remove_key_binding
           (TE : in System.Address;
            K  : in Interfaces.C.unsigned;
            M  : in Interfaces.C.unsigned_long);
    pragma Import (C, fl_text_editor_remove_key_binding, "fl_text_editor_remove_key_binding");




    function fl_text_editor_get_insert_mode
           (TE : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_editor_get_insert_mode, "fl_text_editor_get_insert_mode");

    procedure fl_text_editor_set_insert_mode
           (TE : in System.Address;
            I  : in Interfaces.C.int);
    pragma Import (C, fl_text_editor_set_insert_mode, "fl_text_editor_set_insert_mode");




    --  function fl_text_editor_get_tab_nav
    --         (TE : in System.Address)
    --      return Interfaces.C.int;
    --  pragma Import (C, fl_text_editor_get_tab_nav, "fl_text_editor_get_tab_nav");

    --  procedure fl_text_editor_set_tab_nav
    --         (TE : in System.Address;
    --          T  : in Interfaces.C.int);
    --  pragma Import (C, fl_text_editor_set_tab_nav, "fl_text_editor_set_tab_nav");




    procedure fl_text_editor_draw
           (W : in System.Address);
    pragma Import (C, fl_text_editor_draw, "fl_text_editor_draw");

    function fl_text_editor_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_editor_handle, "fl_text_editor_handle");




    procedure Finalize
           (This : in out Text_Editor) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Text_Editor'Class
        then
            This.Clear;
            free_fl_text_editor (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Text_Display (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Text_Editor is
    begin
        return This : Text_Editor do
            This.Void_Ptr := new_fl_text_editor
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_group_end (This.Void_Ptr);
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            text_editor_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            text_editor_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    procedure Undo
           (This : in out Text_Editor) is
    begin
        fl_text_editor_undo (This.Void_Ptr);
    end Undo;


    procedure Cut
           (This : in out Text_Editor) is
    begin
        fl_text_editor_cut (This.Void_Ptr);
    end Cut;


    procedure Copy
           (This : in out Text_Editor) is
    begin
        fl_text_editor_copy (This.Void_Ptr);
    end Copy;


    procedure Paste
           (This : in out Text_Editor) is
    begin
        fl_text_editor_paste (This.Void_Ptr);
    end Paste;


    procedure Delete
           (This : in out Text_Editor) is
    begin
        fl_text_editor_delete (This.Void_Ptr);
    end Delete;




    procedure Backspace_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_backspace (This.Void_Ptr);
    end Backspace_Key;


    procedure Home_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_home (This.Void_Ptr);
    end Home_Key;


    procedure End_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_end (This.Void_Ptr);
    end End_Key;


    procedure Insert_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_insert (This.Void_Ptr);
    end Insert_Key;


    procedure Page_Down_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_page_down (This.Void_Ptr);
    end Page_Down_Key;


    procedure Page_Up_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_page_up (This.Void_Ptr);
    end Page_Up_Key;


    procedure Down_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_down (This.Void_Ptr);
    end Down_Key;


    procedure Left_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_left (This.Void_Ptr);
    end Left_Key;


    procedure Right_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_right (This.Void_Ptr);
    end Right_Key;


    procedure Up_Key
           (This : in out Text_Editor) is
    begin
        fl_text_editor_up (This.Void_Ptr);
    end Up_Key;




    procedure Remove_Key_Binding
           (This : in out Text_Editor;
            Key  : in     Shortcut_Key)
    is
        use type Interfaces.C.unsigned_long;
    begin
        fl_text_editor_remove_key_binding
               (This.Void_Ptr,
                Character'Pos (Key.Keypress),
                Interfaces.C.unsigned_long (Key.Modifier) * 65536);
    end Remove_Key_Binding;




    function Get_Insert_Mode
           (This : in Text_Editor)
        return Insert_Mode is
    begin
        return Insert_Mode'Val (fl_text_editor_get_insert_mode (This.Void_Ptr));
    end Get_Insert_Mode;


    procedure Set_Insert_Mode
           (This : in out Text_Editor;
            To   : in     Insert_Mode) is
    begin
        fl_text_editor_set_insert_mode (This.Void_Ptr, Insert_Mode'Pos (To));
    end Set_Insert_Mode;




    --  function Get_Tab_Nav_Mode
    --         (This : in Text_Editor)
    --      return Tab_Navigation is
    --  begin
    --      return Tab_Navigation'Val (fl_text_editor_get_tab_nav (This.Void_Ptr));
    --  end Get_Tab_Nav_Mode;


    --  procedure Set_Tab_Nav_Mode
    --         (This : in out Text_Editor;
    --          To   : in     Tab_Navigation) is
    --  begin
    --      fl_text_editor_set_tab_nav (This.Void_Ptr, Tab_Navigation'Pos (To));
    --  end Set_Tab_Nav_Mode;




    procedure Draw
           (This : in out Text_Editor) is
    begin
        fl_text_editor_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Text_Editor;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_text_editor_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Text_Displays.Text_Editors;

