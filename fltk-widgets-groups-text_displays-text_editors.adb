

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    function new_fl_text_editor
           (X, Y, W, H : in Interfaces.C.int;
            Label      : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_text_editor, "new_fl_text_editor");

    procedure free_fl_text_editor
           (TE : in System.Address);
    pragma Import (C, free_fl_text_editor, "free_fl_text_editor");




    procedure fl_group_end
           (TE : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");




    procedure Finalize
           (This : in out Text_Editor) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_text_editor (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Text_Editor is

        VP : System.Address;

    begin
        VP := new_fl_text_editor
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Label));
        fl_group_end (VP);
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP, Buffer => null);
    end Create;


end FLTK.Widgets.Groups.Text_Displays.Text_Editors;

