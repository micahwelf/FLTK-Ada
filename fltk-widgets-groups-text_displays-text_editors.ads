

package FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    type Text_Editor is new Text_Display with private;
    type Text_Editor_Access is access all Text_Editor;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Text_Editor;


private


    type Text_Editor is new Text_Display with null record;


    overriding procedure Finalize
           (This : in out Text_Editor);


end FLTK.Widgets.Groups.Text_Displays.Text_Editors;

