

package FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    type Text_Editor is new Text_Display with private;

    type Insert_Mode is (Before, After);
    --  type Tab_Navigation is (Insert_Char, Widget_Focus);




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




    procedure Backspace_Key
           (This : in out Text_Editor);

    procedure Home_Key
           (This : in out Text_Editor);

    procedure End_Key
           (This : in out Text_Editor);

    procedure Insert_Key
           (This : in out Text_Editor);

    procedure Page_Down_Key
           (This : in out Text_Editor);

    procedure Page_Up_Key
           (This : in out Text_Editor);

    procedure Down_Key
           (This : in out Text_Editor);

    procedure Left_Key
           (This : in out Text_Editor);

    procedure Right_Key
           (This : in out Text_Editor);

    procedure Up_Key
           (This : in out Text_Editor);




    procedure Remove_Key_Binding
           (This : in out Text_Editor;
            Key  : in     Shortcut_Key);




    function Get_Insert_Mode
           (This : in Text_Editor)
        return Insert_Mode;

    procedure Set_Insert_Mode
           (This : in out Text_Editor;
            To   : in     Insert_Mode);




    --  function Get_Tab_Nav_Mode
    --         (This : in Text_Editor)
    --      return Tab_Navigation;

    --  procedure Set_Tab_Nav_Mode
    --         (This : in out Text_Editor;
    --          To   : in     Tab_Navigation);




    procedure Draw
           (This : in out Text_Editor);

    function Handle
           (This  : in out Text_Editor;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Text_Editor is new Text_Display with null record;

    overriding procedure Finalize
           (This : in out Text_Editor);


end FLTK.Widgets.Groups.Text_Displays.Text_Editors;

