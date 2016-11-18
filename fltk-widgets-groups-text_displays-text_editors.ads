

with FLTK.Enums; use FLTK.Enums;


package FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    type Text_Editor is new Text_Display with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Text_Editor;


    procedure Undo
           (This : in out Text_Editor);


    procedure Cut
           (This : in out Text_Editor);


    procedure Copy
           (This : in out Text_Editor);


    procedure Paste
           (This : in out Text_Editor);


    procedure Delete
           (This : in out Text_Editor);


    procedure Remove_Key_Binding
           (This : in out Text_Editor;
            Key  : in     Shortcut_Key);


private


    type Text_Editor is new Text_Display with null record;


    overriding procedure Finalize
           (This : in out Text_Editor);


end FLTK.Widgets.Groups.Text_Displays.Text_Editors;

