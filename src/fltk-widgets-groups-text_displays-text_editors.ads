

private with

    Interfaces.C,
    Ada.Containers.Vectors;


package FLTK.Widgets.Groups.Text_Displays.Text_Editors is


    type Text_Editor is new Text_Display with private;

    type Insert_Mode is (Before, After);
    --  type Tab_Navigation is (Insert_Char, Widget_Focus);

    type Key_Func is access procedure
           (This : in out Text_Editor'Class);

    type Default_Key_Func is access procedure
           (This : in out Text_Editor'Class;
            Key  : in     Key_Combo);

    type Key_Binding is record
        Key  : Key_Combo;
        Func : Key_Func;
    end record;

    type Key_Binding_List is array (Positive range <>) of Key_Binding;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Text_Editor;

    end Forge;




    procedure Default
           (This : in out Text_Editor'Class;
            Key  : in     Key_Combo);




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




    procedure KF_Backspace
           (This : in out Text_Editor'Class);

    procedure KF_Insert
           (This : in out Text_Editor'Class);

    procedure KF_Enter
           (This : in out Text_Editor'Class);

    procedure KF_Ignore
           (This : in out Text_Editor'Class);




    procedure KF_Home
           (This : in out Text_Editor'Class);

    procedure KF_End
           (This : in out Text_Editor'Class);

    procedure KF_Page_Down
           (This : in out Text_Editor'Class);

    procedure KF_Page_Up
           (This : in out Text_Editor'Class);

    procedure KF_Down
           (This : in out Text_Editor'Class);

    procedure KF_Left
           (This : in out Text_Editor'Class);

    procedure KF_Right
           (This : in out Text_Editor'Class);

    procedure KF_Up
           (This : in out Text_Editor'Class);




    procedure KF_Shift_Home
           (This : in out Text_Editor'Class);

    procedure KF_Shift_End
           (This : in out Text_Editor'Class);

    procedure KF_Shift_Page_Down
           (This : in out Text_Editor'Class);

    procedure KF_Shift_Page_Up
           (This : in out Text_Editor'Class);

    procedure KF_Shift_Down
           (This : in out Text_Editor'Class);

    procedure KF_Shift_Left
           (This : in out Text_Editor'Class);

    procedure KF_Shift_Right
           (This : in out Text_Editor'Class);

    procedure KF_Shift_Up
           (This : in out Text_Editor'Class);




    procedure KF_Ctrl_Home
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_End
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Page_Down
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Page_Up
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Down
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Left
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Right
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Up
           (This : in out Text_Editor'Class);




    procedure KF_Ctrl_Shift_Home
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Shift_End
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Shift_Page_Down
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Shift_Page_Up
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Shift_Down
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Shift_Left
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Shift_Right
           (This : in out Text_Editor'Class);

    procedure KF_Ctrl_Shift_Up
           (This : in out Text_Editor'Class);




    Default_Key_Bindings : constant Key_Binding_List :=
           ((Mod_None + Enter_Key,        KF_Enter'Access),
            (Mod_None + Keypad_Enter_Key, KF_Enter'Access),
            (Mod_None + Backspace_Key,    KF_Backspace'Access),
            (Mod_None + Insert_Key,       KF_Insert'Access),

            (Mod_None + Delete_Key,     Delete'Access),
            (Mod_Ctrl + 'c', Copy'Access),
            (Mod_Ctrl + 'v', Paste'Access),
            (Mod_Ctrl + 'x', Cut'Access),
            (Mod_Ctrl + 'z', Undo'Access),
            (Mod_Ctrl + 'a', Select_All'Access),

            (Mod_None + Home_Key,      KF_Home'Access),
            (Mod_None + End_Key,       KF_End'Access),
            (Mod_None + Page_Down_Key, KF_Page_Down'Access),
            (Mod_None + Page_Up_Key,   KF_Page_Up'Access),
            (Mod_None + Down_Key,      KF_Down'Access),
            (Mod_None + Left_Key,      KF_Left'Access),
            (Mod_None + Right_Key,     KF_Right'Access),
            (Mod_None + Up_Key,        KF_Up'Access),

            (Mod_Shift + Home_Key,      KF_Shift_Home'Access),
            (Mod_Shift + End_Key,       KF_Shift_End'Access),
            (Mod_Shift + Page_Down_Key, KF_Shift_Page_Down'Access),
            (Mod_Shift + Page_Up_Key,   KF_Shift_Page_Up'Access),
            (Mod_Shift + Down_Key,      KF_Shift_Down'Access),
            (Mod_Shift + Left_Key,      KF_Shift_Left'Access),
            (Mod_Shift + Right_Key,     KF_Shift_Right'Access),
            (Mod_Shift + Up_Key,        KF_Shift_Up'Access),

            (Mod_Ctrl + Home_Key,      KF_Ctrl_Home'Access),
            (Mod_Ctrl + End_Key,       KF_Ctrl_End'Access),
            (Mod_Ctrl + Page_Down_Key, KF_Ctrl_Page_Down'Access),
            (Mod_Ctrl + Page_Up_Key,   KF_Ctrl_Page_Up'Access),
            (Mod_Ctrl + Down_Key,      KF_Ctrl_Down'Access),
            (Mod_Ctrl + Left_Key,      KF_Ctrl_Left'Access),
            (Mod_Ctrl + Right_Key,     KF_Ctrl_Right'Access),
            (Mod_Ctrl + Up_Key,        KF_Ctrl_Up'Access),

            (Mod_Ctrl + Mod_Shift + Home_Key,      KF_Ctrl_Shift_Home'Access),
            (Mod_Ctrl + Mod_Shift + End_Key,       KF_Ctrl_Shift_End'Access),
            (Mod_Ctrl + Mod_Shift + Page_Down_Key, KF_Ctrl_Shift_Page_Down'Access),
            (Mod_Ctrl + Mod_Shift + Page_Up_Key,   KF_Ctrl_Shift_Page_Up'Access),
            (Mod_Ctrl + Mod_Shift + Down_Key,      KF_Ctrl_Shift_Down'Access),
            (Mod_Ctrl + Mod_Shift + Left_Key,      KF_Ctrl_Shift_Left'Access),
            (Mod_Ctrl + Mod_Shift + Right_Key,     KF_Ctrl_Shift_Right'Access),
            (Mod_Ctrl + Mod_Shift + Up_Key,        KF_Ctrl_Shift_Up'Access));




    --  NOTE NOTE NOTE NOTE NOTE
    --
    --  Changing the keybindings for Shortcut_Keys that include modifiers
    --  currently does not work due to some bugbear in the FLTK side of things.
    --
    --  Until that's fixed, the default keybindings for those key combinations
    --  that include modifiers have been left in place.
    --
    --  NOTE NOTE NOTE NOTE NOTE




    procedure Add_Key_Binding
           (This : in out Text_Editor;
            Key  : in     Key_Combo;
            Func : in     Key_Func);

    procedure Add_Key_Binding
           (This : in out Text_Editor;
            Bind : in     Key_Binding);

    function Get_Bound_Key_Function
           (This : in Text_Editor;
            Key  : in Key_Combo)
        return Key_Func;

    procedure Remove_Key_Binding
           (This : in out Text_Editor;
            Key  : in     Key_Combo);

    procedure Remove_Key_Binding
           (This : in out Text_Editor;
            Bind : in     Key_Binding);

    procedure Remove_All_Key_Bindings
           (This : in out Text_Editor);

    function Get_Default_Key_Function
           (This : in Text_Editor)
        return Default_Key_Func;

    procedure Set_Default_Key_Function
           (This : in out Text_Editor;
            Func : in     Default_Key_Func);




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


    package Binding_Vectors is new Ada.Containers.Vectors
           (Index_Type => Positive, Element_Type => Key_Binding);




    type Text_Editor is new Text_Display with
        record
            Bindings     : Binding_Vectors.Vector;
            Default_Func : Default_Key_Func;
        end record;

    overriding procedure Finalize
           (This : in out Text_Editor);




    function Key_Func_Hook
           (K : in Interfaces.C.int;
            E : in System.Address)
        return Interfaces.C.int;
    pragma Convention (C, Key_Func_Hook);




    package Editor_Convert is new System.Address_To_Access_Conversions (Text_Editor'Class);


end FLTK.Widgets.Groups.Text_Displays.Text_Editors;

