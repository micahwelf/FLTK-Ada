

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    function new_fl_text_editor
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_text_editor, "new_fl_text_editor");

    procedure free_fl_text_editor
           (TE : in System.Address);
    pragma Import (C, free_fl_text_editor, "free_fl_text_editor");

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
        end return;
    end Create;




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


end FLTK.Widgets.Groups.Text_Displays.Text_Editors;

