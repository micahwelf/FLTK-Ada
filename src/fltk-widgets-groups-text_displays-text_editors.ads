

package FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    type Text_Editor is new Text_Display with private;

    type Insert_Mode is (Before, After);
    --  type Tab_Navigation is (Insert_Char, Widget_Focus);

    type Key_Func is access procedure
           (This : in out Text_Editor'Class);

    type Default_Key_Func is access procedure
           (This : in out Text_Editor'Class;
            Key  : in     Shortcut_Key);

    type Key_Binding is record
        Key  : Shortcut_Key;
        Func : Key_Func;
    end record;

    type Key_Binding_List is array (Positive) of Key_Binding;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Text_Editor;




    procedure Default
           (This : in out Text_Editor'Class;
            Key  : in     Shortcut_Key);




    procedure Undo
           (This : in out Text_Editor'Class);

    procedure Cut
           (This : in out Text_Editor'Class);

    procedure Copy
           (This : in out Text_Editor'Class);

    procedure Paste
           (This : in out Text_Editor'Class);

    procedure Delete
           (This : in out Text_Editor'Class);

    procedure Select_All
           (This : in out Text_Editor'Class);




    procedure Backspace_Key
           (This : in out Text_Editor'Class);

    procedure Insert_Key
           (This : in out Text_Editor'Class);

    procedure Enter_Key
           (This : in out Text_Editor'Class);

    procedure Ignore_Key
           (This : in out Text_Editor'Class);




    procedure Home_Key
           (This : in out Text_Editor'Class);

    procedure End_Key
           (This : in out Text_Editor'Class);

    procedure Page_Down_Key
           (This : in out Text_Editor'Class);

    procedure Page_Up_Key
           (This : in out Text_Editor'Class);

    procedure Down_Key
           (This : in out Text_Editor'Class);

    procedure Left_Key
           (This : in out Text_Editor'Class);

    procedure Right_Key
           (This : in out Text_Editor'Class);

    procedure Up_Key
           (This : in out Text_Editor'Class);




    procedure Shift_Home_Key
           (This : in out Text_Editor'Class);

    procedure Shift_End_Key
           (This : in out Text_Editor'Class);

    procedure Shift_Page_Down_Key
           (This : in out Text_Editor'Class);

    procedure Shift_Page_Up_Key
           (This : in out Text_Editor'Class);

    procedure Shift_Down_Key
           (This : in out Text_Editor'Class);

    procedure Shift_Left_Key
           (This : in out Text_Editor'Class);

    procedure Shift_Right_Key
           (This : in out Text_Editor'Class);

    procedure Shift_Up_Key
           (This : in out Text_Editor'Class);




    procedure Ctrl_Home_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_End_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Page_Down_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Page_Up_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Down_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Left_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Right_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Up_Key
           (This : in out Text_Editor'Class);




    procedure Ctrl_Shift_Home_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Shift_End_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Shift_Page_Down_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Shift_Page_Up_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Shift_Down_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Shift_Left_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Shift_Right_Key
           (This : in out Text_Editor'Class);

    procedure Ctrl_Shift_Up_Key
           (This : in out Text_Editor'Class);




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

