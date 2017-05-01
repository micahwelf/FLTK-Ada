

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    procedure text_editor_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, text_editor_set_draw_hook, "text_editor_set_draw_hook");

    procedure fl_text_editor_draw
           (W : in System.Address);
    pragma Import (C, fl_text_editor_draw, "fl_text_editor_draw");

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

    procedure fl_text_editor_remove_key_binding
           (TE : in System.Address;
            K  : in Interfaces.C.unsigned;
            M  : in Interfaces.C.unsigned_long);
    pragma Import (C, fl_text_editor_remove_key_binding, "fl_text_editor_remove_key_binding");




    procedure Draw_Hook (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    procedure Draw_Hook
           (U : in System.Address)
    is
        Ada_Text_Editor : access Text_Editor'Class :=
            Text_Editor_Convert.To_Pointer (U);
    begin
        Ada_Text_Editor.Draw;
    end Draw_Hook;




    procedure Draw
           (This : in out Text_Editor) is
    begin
        fl_text_editor_draw (This.Void_Ptr);
    end Draw;




    procedure Finalize
           (This : in out Text_Editor) is
    begin
        Finalize (Text_Display (This));
        if This.Void_Ptr /= System.Null_Address then
            if This in Text_Editor then
                free_fl_text_editor (This.Void_Ptr);
            end if;
        end if;
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


end FLTK.Widgets.Groups.Text_Displays.Text_Editors;
