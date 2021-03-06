

with

    FLTK.Event,
    Interfaces.C,
    System;

use type

    Interfaces.C.unsigned_long,
    System.Address;


package body FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    procedure text_editor_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, text_editor_set_draw_hook, "text_editor_set_draw_hook");
    pragma Inline (text_editor_set_draw_hook);

    procedure text_editor_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, text_editor_set_handle_hook, "text_editor_set_handle_hook");
    pragma Inline (text_editor_set_handle_hook);




    function new_fl_text_editor
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_text_editor, "new_fl_text_editor");
    pragma Inline (new_fl_text_editor);

    procedure free_fl_text_editor
           (TE : in System.Address);
    pragma Import (C, free_fl_text_editor, "free_fl_text_editor");
    pragma Inline (free_fl_text_editor);




    procedure fl_text_editor_default
           (TE : in System.Address;
            K  : in Interfaces.C.int);
    pragma Import (C, fl_text_editor_default, "fl_text_editor_default");
    pragma Inline (fl_text_editor_default);




    procedure fl_text_editor_undo
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_undo, "fl_text_editor_undo");
    pragma Inline (fl_text_editor_undo);

    procedure fl_text_editor_cut
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_cut, "fl_text_editor_cut");
    pragma Inline (fl_text_editor_cut);

    procedure fl_text_editor_copy
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_copy, "fl_text_editor_copy");
    pragma Inline (fl_text_editor_copy);

    procedure fl_text_editor_paste
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_paste, "fl_text_editor_paste");
    pragma Inline (fl_text_editor_paste);

    procedure fl_text_editor_delete
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_delete, "fl_text_editor_delete");
    pragma Inline (fl_text_editor_delete);

    procedure fl_text_editor_select_all
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_select_all, "fl_text_editor_select_all");
    pragma Inline (fl_text_editor_select_all);




    procedure fl_text_editor_backspace
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_backspace, "fl_text_editor_backspace");
    pragma Inline (fl_text_editor_backspace);

    procedure fl_text_editor_insert
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_insert, "fl_text_editor_insert");
    pragma Inline (fl_text_editor_insert);

    procedure fl_text_editor_enter
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_enter, "fl_text_editor_enter");
    pragma Inline (fl_text_editor_enter);

    procedure fl_text_editor_ignore
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ignore, "fl_text_editor_ignore");
    pragma Inline (fl_text_editor_ignore);




    procedure fl_text_editor_home
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_home, "fl_text_editor_home");
    pragma Inline (fl_text_editor_home);

    procedure fl_text_editor_end
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_end, "fl_text_editor_end");
    pragma Inline (fl_text_editor_end);

    procedure fl_text_editor_page_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_page_down, "fl_text_editor_page_down");
    pragma Inline (fl_text_editor_page_down);

    procedure fl_text_editor_page_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_page_up, "fl_text_editor_page_up");
    pragma Inline (fl_text_editor_page_up);

    procedure fl_text_editor_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_down, "fl_text_editor_down");
    pragma Inline (fl_text_editor_down);

    procedure fl_text_editor_left
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_left, "fl_text_editor_left");
    pragma Inline (fl_text_editor_left);

    procedure fl_text_editor_right
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_right, "fl_text_editor_right");
    pragma Inline (fl_text_editor_right);

    procedure fl_text_editor_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_up, "fl_text_editor_up");
    pragma Inline (fl_text_editor_up);




    procedure fl_text_editor_shift_home
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_shift_home, "fl_text_editor_shift_home");
    pragma Inline (fl_text_editor_shift_home);

    procedure fl_text_editor_shift_end
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_shift_end, "fl_text_editor_shift_end");
    pragma Inline (fl_text_editor_shift_end);

    procedure fl_text_editor_shift_page_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_shift_page_down, "fl_text_editor_shift_page_down");
    pragma Inline (fl_text_editor_shift_page_down);

    procedure fl_text_editor_shift_page_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_shift_page_up, "fl_text_editor_shift_page_up");
    pragma Inline (fl_text_editor_shift_page_up);

    procedure fl_text_editor_shift_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_shift_down, "fl_text_editor_shift_down");
    pragma Inline (fl_text_editor_shift_down);

    procedure fl_text_editor_shift_left
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_shift_left, "fl_text_editor_shift_left");
    pragma Inline (fl_text_editor_shift_left);

    procedure fl_text_editor_shift_right
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_shift_right, "fl_text_editor_shift_right");
    pragma Inline (fl_text_editor_shift_right);

    procedure fl_text_editor_shift_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_shift_up, "fl_text_editor_shift_up");
    pragma Inline (fl_text_editor_shift_up);




    procedure fl_text_editor_ctrl_home
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_home, "fl_text_editor_ctrl_home");
    pragma Inline (fl_text_editor_ctrl_home);

    procedure fl_text_editor_ctrl_end
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_end, "fl_text_editor_ctrl_end");
    pragma Inline (fl_text_editor_ctrl_end);

    procedure fl_text_editor_ctrl_page_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_page_down, "fl_text_editor_ctrl_page_down");
    pragma Inline (fl_text_editor_ctrl_page_down);

    procedure fl_text_editor_ctrl_page_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_page_up, "fl_text_editor_ctrl_page_up");
    pragma Inline (fl_text_editor_ctrl_page_up);

    procedure fl_text_editor_ctrl_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_down, "fl_text_editor_ctrl_down");
    pragma Inline (fl_text_editor_ctrl_down);

    procedure fl_text_editor_ctrl_left
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_left, "fl_text_editor_ctrl_left");
    pragma Inline (fl_text_editor_ctrl_left);

    procedure fl_text_editor_ctrl_right
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_right, "fl_text_editor_ctrl_right");
    pragma Inline (fl_text_editor_ctrl_right);

    procedure fl_text_editor_ctrl_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_up, "fl_text_editor_ctrl_up");
    pragma Inline (fl_text_editor_ctrl_up);




    procedure fl_text_editor_ctrl_shift_home
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_shift_home, "fl_text_editor_ctrl_shift_home");
    pragma Inline (fl_text_editor_ctrl_shift_home);

    procedure fl_text_editor_ctrl_shift_end
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_shift_end, "fl_text_editor_ctrl_shift_end");
    pragma Inline (fl_text_editor_ctrl_shift_end);

    procedure fl_text_editor_ctrl_shift_page_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_shift_page_down, "fl_text_editor_ctrl_shift_page_down");
    pragma Inline (fl_text_editor_ctrl_shift_page_down);

    procedure fl_text_editor_ctrl_shift_page_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_shift_page_up, "fl_text_editor_ctrl_shift_page_up");
    pragma Inline (fl_text_editor_ctrl_shift_page_up);

    procedure fl_text_editor_ctrl_shift_down
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_shift_down, "fl_text_editor_ctrl_shift_down");
    pragma Inline (fl_text_editor_ctrl_shift_down);

    procedure fl_text_editor_ctrl_shift_left
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_shift_left, "fl_text_editor_ctrl_shift_left");
    pragma Inline (fl_text_editor_ctrl_shift_left);

    procedure fl_text_editor_ctrl_shift_right
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_shift_right, "fl_text_editor_ctrl_shift_right");
    pragma Inline (fl_text_editor_ctrl_shift_right);

    procedure fl_text_editor_ctrl_shift_up
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_ctrl_shift_up, "fl_text_editor_ctrl_shift_up");
    pragma Inline (fl_text_editor_ctrl_shift_up);




    procedure fl_text_editor_add_key_binding
           (TE : in System.Address;
            K, S : in Interfaces.C.int;
            F : in System.Address);
    pragma Import (C, fl_text_editor_add_key_binding, "fl_text_editor_add_key_binding");
    pragma Inline (fl_text_editor_add_key_binding);

    --  this particular procedure won't be necessary when FLTK keybindings fixed
    procedure fl_text_editor_remove_key_binding
           (TE   : in System.Address;
            K, S : in Interfaces.C.int);
    pragma Import (C, fl_text_editor_remove_key_binding, "fl_text_editor_remove_key_binding");
    pragma Inline (fl_text_editor_remove_key_binding);

    procedure fl_text_editor_remove_all_key_bindings
           (TE : in System.Address);
    pragma Import (C, fl_text_editor_remove_all_key_bindings,
            "fl_text_editor_remove_all_key_bindings");
    pragma Inline (fl_text_editor_remove_all_key_bindings);

    procedure fl_text_editor_set_default_key_function
           (TE, F : in System.Address);
    pragma Import (C, fl_text_editor_set_default_key_function,
            "fl_text_editor_set_default_key_function");
    pragma Inline (fl_text_editor_set_default_key_function);




    function fl_text_editor_get_insert_mode
           (TE : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_editor_get_insert_mode, "fl_text_editor_get_insert_mode");
    pragma Inline (fl_text_editor_get_insert_mode);

    procedure fl_text_editor_set_insert_mode
           (TE : in System.Address;
            I  : in Interfaces.C.int);
    pragma Import (C, fl_text_editor_set_insert_mode, "fl_text_editor_set_insert_mode");
    pragma Inline (fl_text_editor_set_insert_mode);




    --  function fl_text_editor_get_tab_nav
    --         (TE : in System.Address)
    --      return Interfaces.C.int;
    --  pragma Import (C, fl_text_editor_get_tab_nav, "fl_text_editor_get_tab_nav");
    --  pragma Inline (fl_text_editor_get_tab_nav);

    --  procedure fl_text_editor_set_tab_nav
    --         (TE : in System.Address;
    --          T  : in Interfaces.C.int);
    --  pragma Import (C, fl_text_editor_set_tab_nav, "fl_text_editor_set_tab_nav");
    --  pragma Inline (fl_text_editor_set_tab_nav);




    procedure fl_text_editor_draw
           (W : in System.Address);
    pragma Import (C, fl_text_editor_draw, "fl_text_editor_draw");
    pragma Inline (fl_text_editor_draw);

    function fl_text_editor_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_text_editor_handle, "fl_text_editor_handle");
    pragma Inline (fl_text_editor_handle);




    function Key_Func_Hook
           (K : in Interfaces.C.int;
            E : in System.Address)
        return Interfaces.C.int
    is
        Ada_Editor : access Text_Editor'Class :=
            Editor_Convert.To_Pointer (fl_widget_get_user_data (E));
        Modi : Modifier := FLTK.Event.Last_Modifier;
        Ada_Key : Key_Combo :=
            To_Ada (Interfaces.C.unsigned_long (K) + To_C (Modi));

        Found_Binding : Boolean := False;
    begin
        for B of Ada_Editor.Bindings loop
            if B.Key = Ada_Key then
                B.Func (Ada_Editor.all);
                Found_Binding := True;
            end if;
        end loop;
        if not Found_Binding and then Ada_Editor.Default_Func /= null then
            Ada_Editor.Default_Func (Ada_Editor.all, Ada_Key);
        end if;
        return 1;
    end Key_Func_Hook;




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




    --  remove this type and array once FLTK keybindings fixed
    --  type To_Remove is record
    --      Press : Keypress;
    --      Modif : Interfaces.C.int;
    --  end record;

    --  To_Remove_List : array (Positive range <>) of To_Remove :=
    --         ((Home_Key,      0),
    --          (End_Key,       0),
    --          (Page_Down_Key, 0),
    --          (Page_Up_Key,   0),
    --          (Down_Key,      0),
    --          (Left_Key,      0),
    --          (Right_Key,     0),
    --          (Up_Key,        0),
    --          (Character'Pos ('/'),    Interfaces.C.int (Mod_Ctrl)),
    --          (Delete_Key,    Interfaces.C.int (Mod_Shift)),
    --          (Insert_Key,    Interfaces.C.int (Mod_Ctrl)),
    --          (Insert_Key,    Interfaces.C.int (Mod_Shift)));

    --  use type Interfaces.C.int;
    --  To_Remove_Weird : array (Positive range <>) of To_Remove :=
    --         ((Enter_Key,        -1),
    --          (Keypad_Enter_Key, -1),
    --          (Backspace_Key,    -1),
    --          (Insert_Key,       -1),
    --          (Delete_Key,       -1),
    --          (Escape_Key,       -1));




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Text_Editor
        is
            use type Interfaces.C.int;
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

                --  change things over so key bindings are all handled from the Ada side
                This.Bindings := Binding_Vectors.Empty_Vector;
                for B of Default_Key_Bindings loop
                    This.Bindings.Append (B);
                end loop;
                This.Default_Func := Default'Access;

                --  remove these loops and uncomment subsequent "remove_all_key_bindings"
                --  when FLTK keybindings fixed
                --  for B of To_Remove_List loop
                --      fl_text_editor_remove_key_binding
                --             (This.Void_Ptr,
                --              Interfaces.C.int (B.Press),
                --              B.Modif * 65536);
                --  end loop;
                --  for B of To_Remove_Weird loop
                --      fl_text_editor_remove_key_binding
                --             (This.Void_Ptr,
                --              Interfaces.C.int (B.Press),
                --              B.Modif);
                --  end loop;
                fl_text_editor_remove_all_key_bindings (This.Void_Ptr);

                fl_text_editor_set_default_key_function (This.Void_Ptr, Key_Func_Hook'Address);

                --  this is irritatingly required due to how FLTK handles certain keys
                --  for B of Default_Key_Bindings loop
                --      --  remove this conditional once FLTK keybindings fixed
                --      if B.Key.Modcode = Mod_None then
                --          fl_text_editor_add_key_binding
                --                 (This.Void_Ptr,
                --                  Interfaces.C.int (B.Key.Keycode),
                --                  Interfaces.C.int (B.Key.Modcode) * 65536,
                --                  Key_Func_Hook'Address);
                --      end if;
                --  end loop;
            end return;
        end Create;

    end Forge;




    procedure Default
           (This : in out Text_Editor'Class;
            Key  : in     Key_Combo) is
    begin
        fl_text_editor_default
               (This.Void_Ptr,
                Interfaces.C.int (Key.Keycode));
    end Default;




    procedure Undo
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_undo (This.Void_Ptr);
    end Undo;


    procedure Cut
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_cut (This.Void_Ptr);
    end Cut;


    procedure Copy
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_copy (This.Void_Ptr);
    end Copy;


    procedure Paste
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_paste (This.Void_Ptr);
    end Paste;


    procedure Delete
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_delete (This.Void_Ptr);
    end Delete;


    procedure Select_All
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_select_all (This.Void_Ptr);
    end Select_All;




    procedure KF_Backspace
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_backspace (This.Void_Ptr);
    end KF_Backspace;


    procedure KF_Insert
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_insert (This.Void_Ptr);
    end KF_Insert;


    procedure KF_Enter
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_enter (This.Void_Ptr);
    end KF_Enter;


    procedure KF_Ignore
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ignore (This.Void_Ptr);
    end KF_Ignore;




    procedure KF_Home
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_home (This.Void_Ptr);
    end KF_Home;


    procedure KF_End
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_end (This.Void_Ptr);
    end KF_End;


    procedure KF_Page_Down
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_page_down (This.Void_Ptr);
    end KF_Page_Down;


    procedure KF_Page_Up
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_page_up (This.Void_Ptr);
    end KF_Page_Up;


    procedure KF_Down
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_down (This.Void_Ptr);
    end KF_Down;


    procedure KF_Left
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_left (This.Void_Ptr);
    end KF_Left;


    procedure KF_Right
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_right (This.Void_Ptr);
    end KF_Right;


    procedure KF_Up
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_up (This.Void_Ptr);
    end KF_Up;




    procedure KF_Shift_Home
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_shift_home (This.Void_Ptr);
    end KF_Shift_Home;


    procedure KF_Shift_End
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_shift_end (This.Void_Ptr);
    end KF_Shift_End;


    procedure KF_Shift_Page_Down
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_shift_page_down (This.Void_Ptr);
    end KF_Shift_Page_Down;


    procedure KF_Shift_Page_Up
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_shift_page_up (This.Void_Ptr);
    end KF_Shift_Page_Up;


    procedure KF_Shift_Down
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_shift_down (This.Void_Ptr);
    end KF_Shift_Down;


    procedure KF_Shift_Left
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_shift_left (This.Void_Ptr);
    end KF_Shift_Left;


    procedure KF_Shift_Right
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_shift_right (This.Void_Ptr);
    end KF_Shift_Right;


    procedure KF_Shift_Up
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_shift_up (This.Void_Ptr);
    end KF_Shift_Up;




    procedure KF_Ctrl_Home
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_home (This.Void_Ptr);
    end KF_Ctrl_Home;


    procedure KF_Ctrl_End
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_end (This.Void_Ptr);
    end KF_Ctrl_End;


    procedure KF_Ctrl_Page_Down
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_page_down (This.Void_Ptr);
    end KF_Ctrl_Page_Down;


    procedure KF_Ctrl_Page_Up
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_page_up (This.Void_Ptr);
    end KF_Ctrl_Page_Up;


    procedure KF_Ctrl_Down
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_down (This.Void_Ptr);
    end KF_Ctrl_Down;


    procedure KF_Ctrl_Left
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_left (This.Void_Ptr);
    end KF_Ctrl_Left;


    procedure KF_Ctrl_Right
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_right (This.Void_Ptr);
    end KF_Ctrl_Right;


    procedure KF_Ctrl_Up
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_up (This.Void_Ptr);
    end KF_Ctrl_Up;




    procedure KF_Ctrl_Shift_Home
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_shift_home (This.Void_Ptr);
    end KF_Ctrl_Shift_Home;


    procedure KF_Ctrl_Shift_End
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_shift_end (This.Void_Ptr);
    end KF_Ctrl_Shift_End;


    procedure KF_Ctrl_Shift_Page_Down
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_shift_page_down (This.Void_Ptr);
    end KF_Ctrl_Shift_Page_Down;


    procedure KF_Ctrl_Shift_Page_Up
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_shift_page_up (This.Void_Ptr);
    end KF_Ctrl_Shift_Page_Up;


    procedure KF_Ctrl_Shift_Down
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_shift_down (This.Void_Ptr);
    end KF_Ctrl_Shift_Down;


    procedure KF_Ctrl_Shift_Left
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_shift_left (This.Void_Ptr);
    end KF_Ctrl_Shift_Left;


    procedure KF_Ctrl_Shift_Right
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_shift_right (This.Void_Ptr);
    end KF_Ctrl_Shift_Right;


    procedure KF_Ctrl_Shift_Up
           (This : in out Text_Editor'Class) is
    begin
        fl_text_editor_ctrl_shift_up (This.Void_Ptr);
    end KF_Ctrl_Shift_Up;




    procedure Add_Key_Binding
           (This : in out Text_Editor;
            Key  : in     Key_Combo;
            Func : in     Key_Func) is
    begin
        This.Bindings.Append ((Key, Func));
    end Add_Key_Binding;


    procedure Add_Key_Binding
           (This : in out Text_Editor;
            Bind : in     Key_Binding) is
    begin
        This.Bindings.Append (Bind);
    end Add_Key_Binding;


    procedure Add_Key_Bindings
           (This : in out Text_Editor;
            List : in     Key_Binding_List) is
    begin
        for I of List loop
            This.Bindings.Append (I);
        end loop;
    end Add_Key_Bindings;


    function Get_Bound_Key_Function
           (This : in Text_Editor;
            Key  : in Key_Combo)
        return Key_Func is
    begin
        for I in 1 .. Integer (This.Bindings.Length) loop
            if This.Bindings.Element (I).Key = Key then
                return This.Bindings.Element (I).Func;
            end if;
        end loop;
        return null;
    end Get_Bound_Key_Function;


    procedure Remove_Key_Binding
           (This : in out Text_Editor;
            Key  : in     Key_Combo)
    is
        use type Interfaces.C.int;
    begin
        for I in reverse 1 .. Integer (This.Bindings.Length) loop
            if This.Bindings.Reference (I).Key = Key then
                This.Bindings.Delete (I);
            end if;
        end loop;

        --  remove this once FLTK keybindings fixed
        --  if Key.Modcode /= Mod_None then
        --      fl_text_editor_remove_key_binding
        --             (This.Void_Ptr,
        --              Interfaces.C.int (Key.Keycode),
        --              Interfaces.C.int (Key.Modcode) * 65536);
        --  end if;
    end Remove_Key_Binding;


    procedure Remove_Key_Binding
           (This : in out Text_Editor;
            Bind : in     Key_Binding)
    is
        --  use type Interfaces.C.int;
    begin
        for I in reverse 1 .. Integer (This.Bindings.Length) loop
            if This.Bindings.Reference (I).Key = Bind.Key then
                This.Bindings.Delete (I);
            end if;
        end loop;

        --  remove this once FLTK keybindings fixed
        --  if Bind.Key.Modcode /= Mod_None then
        --      fl_text_editor_remove_key_binding
        --             (This.Void_Ptr,
        --              Interfaces.C.int (Bind.Key.Keycode),
        --              Interfaces.C.int (Bind.Key.Modcode) * 65536);
        --  end if;
    end Remove_Key_Binding;


    procedure Remove_Key_Bindings
           (This : in out Text_Editor;
            List : in     Key_Binding_List) is
    begin
        for I of List loop
            This.Remove_Key_Binding (I);
        end loop;
    end Remove_Key_Bindings;


    procedure Remove_All_Key_Bindings
           (This : in out Text_Editor) is
    begin
        This.Bindings := Binding_Vectors.Empty_Vector;
        --  This.Default_Func := null;

        --  remove this once FLTK keybindings fixed
        --  fl_text_editor_remove_all_key_bindings (This.Void_Ptr);
    end Remove_All_Key_Bindings;


    function Get_Default_Key_Function
           (This : in Text_Editor)
        return Default_Key_Func is
    begin
        return This.Default_Func;
    end Get_Default_Key_Function;


    procedure Set_Default_Key_Function
           (This : in out Text_Editor;
            Func : in     Default_Key_Func) is
    begin
        This.Default_Func := Func;
    end Set_Default_Key_Function;




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

