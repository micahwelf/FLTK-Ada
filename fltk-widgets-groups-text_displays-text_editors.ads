

package FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    type Text_Editor is new Text_Display with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Text_Editor;


private


    type Text_Editor is new Text_Display with null record;


    overriding procedure Finalize
           (This : in out Text_Editor);


end FLTK.Widgets.Groups.Text_Displays.Text_Editors;

