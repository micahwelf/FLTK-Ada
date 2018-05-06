

with

    FLTK.Widgets.Groups.Windows;

private with

    Interfaces.C;


package FLTK.Static is


    type Awake_Handler is access procedure;

    type Timeout_Handler is access procedure;

    type Idle_Handler is access procedure;




    type Buffer_Kind is (Selection, Clipboard);

    type Clipboard_Notify_Handler is access procedure
           (Kind : in Buffer_Kind);




    type File_Descriptor is new Integer;

    type File_Mode is (Read, Write, Except);

    type File_Handler is access procedure
           (FD : in File_Descriptor);




    type Box_Draw_Function is access procedure
           (X, Y, W, H : in Integer;
            My_Color   : in Color);




    type Option is
           (Arrow_Focus,
            Visible_Focus,
            DND_Text,
            Show_Tooltips,
            FNFC_Uses_GTK,
            Last);




    procedure Add_Awake_Handler
           (Func : in Awake_Handler);

    function Get_Awake_Handler
        return Awake_Handler;




    procedure Add_Check
           (Func : in Timeout_Handler);

    function Has_Check
           (Func : in Timeout_Handler)
        return Boolean;

    procedure Remove_Check
           (Func : in Timeout_Handler);




    procedure Add_Timeout
           (Seconds : in Long_Float;
            Func    : in Timeout_Handler);

    function Has_Timeout
           (Func : in Timeout_Handler)
        return Boolean;

    procedure Remove_Timeout
           (Func : in Timeout_Handler);

    procedure Repeat_Timeout
           (Seconds : in Long_Float;
            Func    : in Timeout_Handler);




    procedure Add_Clipboard_Notify
           (Func : in Clipboard_Notify_Handler);

    procedure Remove_Clipboard_Notify
           (Func : in Clipboard_Notify_Handler);




    procedure Add_File_Descriptor
           (FD   : in File_Descriptor;
            Func : in File_Handler);

    procedure Add_File_Descriptor
           (FD   : in File_Descriptor;
            Mode : in File_Mode;
            Func : in File_Handler);

    procedure Remove_File_Descriptor
           (FD : in File_Descriptor);

    procedure Remove_File_Descriptor
           (FD   : in File_Descriptor;
            Mode : in File_Mode);




    procedure Add_Idle
           (Func : in Idle_Handler);

    function Has_Idle
           (Func : in Idle_Handler)
        return Boolean;

    procedure Remove_Idle
           (Func : in Idle_Handler);




    procedure Get_Color
           (From    : in     Color;
            R, G, B :    out Color_Component);

    procedure Set_Color
           (To      : in Color;
            R, G, B : in Color_Component);

    procedure Free_Color
           (Value   : in Color;
            Overlay : in Boolean := False);

    procedure Own_Colormap;

    procedure Set_Foreground
           (R, G, B : in Color_Component);

    procedure Set_Background
           (R, G, B : in Color_Component);

    procedure Set_Alt_Background
           (R, G, B : in Color_Component);

    procedure System_Colors;




    function Font_Image
           (Kind : in Font_Kind)
        return String;

    function Font_Family_Image
           (Kind : in Font_Kind)
        return String;

    procedure Set_Font_Kind
           (To, From : in Font_Kind);

    function Font_Sizes
           (Kind : in Font_Kind)
        return Font_Size_Array;

    procedure Setup_Fonts
           (How_Many_Set_Up : out Natural);




    function Get_Box_Height_Offset
           (Kind : in Box_Kind)
        return Integer;

    function Get_Box_Width_Offset
           (Kind : in Box_Kind)
        return Integer;

    function Get_Box_X_Offset
           (Kind : in Box_Kind)
        return Integer;

    function Get_Box_Y_Offset
           (Kind : in Box_Kind)
        return Integer;

    procedure Set_Box_Kind
           (To, From : in Box_Kind);

    function Draw_Box_Active
        return Boolean;

    --  function Get_Box_Draw_Function
    --         (Kind : in Box_Kind)
    --      return Box_Draw_Function;

    --  procedure Set_Box_Draw_Function
    --         (Kind               : in Box_Kind;
    --          Func               : in Box_Draw_Function;
    --          Offset_X, Offset_Y : in Integer := 0;
    --          Offset_W, Offset_H : in Integer := 0);




    procedure Copy
           (Text : in String;
            Dest : in Buffer_Kind);

    procedure Paste
           (Receiver : in FLTK.Widgets.Widget'Class;
            Source   : in Buffer_Kind);

    procedure Selection
           (Owner : in FLTK.Widgets.Widget'Class;
            Text  : in String);




    procedure Drag_Drop_Start;

    function Get_Drag_Drop_Text_Support
        return Boolean;

    procedure Set_Drag_Drop_Text_Support
           (To : in Boolean);




    procedure Enable_System_Input;

    procedure Disable_System_Input;

    function Has_Visible_Focus
        return Boolean;

    procedure Set_Visible_Focus
           (To : in Boolean);




    procedure Default_Window_Close
           (Item : in out FLTK.Widgets.Widget'Class);

    function Get_First_Window
        return access FLTK.Widgets.Groups.Windows.Window'Class;

    procedure Set_First_Window
           (To : in FLTK.Widgets.Groups.Windows.Window'Class);

    function Get_Next_Window
           (From : in FLTK.Widgets.Groups.Windows.Window'Class)
        return access FLTK.Widgets.Groups.Windows.Window'Class;

    function Get_Top_Modal
        return access FLTK.Widgets.Groups.Windows.Window'Class;




    function Read_Queue
        return access FLTK.Widgets.Widget'Class;

    procedure Do_Widget_Deletion;




    function Get_Scheme
        return String;

    procedure Set_Scheme
           (To : in String);

    function Is_Scheme
           (Scheme : in String)
        return Boolean;

    procedure Reload_Scheme;




    function Get_Option
           (Opt : in Option)
        return Boolean;

    procedure Set_Option
           (Opt : in Option;
            To  : in Boolean);




    function Get_Default_Scrollbar_Size
        return Natural;

    procedure Set_Default_Scrollbar_Size
           (To : in Natural);


private


    File_Mode_Codes : array (File_Mode) of Interfaces.C.int :=
        (Read => 1, Write => 4, Except => 8);




    pragma Import (C, Own_Colormap, "fl_static_own_colormap");
    pragma Import (C, System_Colors, "fl_static_get_system_colors");


    pragma Import (C, Drag_Drop_Start, "fl_static_dnd");


    pragma Import (C, Enable_System_Input, "fl_static_enable_im");
    pragma Import (C, Disable_System_Input, "fl_static_disable_im");


    pragma Import (C, Do_Widget_Deletion, "fl_static_do_widget_deletion");


    pragma Import (C, Reload_Scheme, "fl_static_reload_scheme");




    pragma Inline (Add_Awake_Handler);
    pragma Inline (Get_Awake_Handler);


    pragma Inline (Add_Check);
    pragma Inline (Has_Check);
    pragma Inline (Remove_Check);


    pragma Inline (Add_Timeout);
    pragma Inline (Has_Timeout);
    pragma Inline (Remove_Timeout);
    pragma Inline (Repeat_Timeout);


    pragma Inline (Add_Clipboard_Notify);
    pragma Inline (Remove_Clipboard_Notify);


    pragma Inline (Add_File_Descriptor);
    pragma Inline (Remove_File_Descriptor);


    pragma Inline (Add_Idle);
    pragma Inline (Has_Idle);
    pragma Inline (Remove_Idle);


    pragma Inline (Get_Color);
    pragma Inline (Set_Color);
    pragma Inline (Free_Color);
    pragma Inline (Own_Colormap);
    pragma Inline (Set_Foreground);
    pragma Inline (Set_Background);
    pragma Inline (Set_Alt_Background);
    pragma Inline (System_Colors);


    pragma Inline (Font_Image);
    pragma Inline (Font_Family_Image);
    pragma Inline (Set_Font_Kind);
    pragma Inline (Font_Sizes);
    pragma Inline (Setup_Fonts);


    pragma Inline (Get_Box_Height_Offset);
    pragma Inline (Get_Box_Width_Offset);
    pragma Inline (Get_Box_X_Offset);
    pragma Inline (Get_Box_Y_Offset);
    pragma Inline (Set_Box_Kind);
    pragma Inline (Draw_Box_Active);
    --  pragma Inline (Get_Box_Draw_Function);
    --  pragma Inline (Set_Box_Draw_Function);


    pragma Inline (Copy);
    pragma Inline (Paste);
    pragma Inline (Selection);


    pragma Inline (Drag_Drop_Start);
    pragma Inline (Get_Drag_Drop_Text_Support);
    pragma Inline (Set_Drag_Drop_Text_Support);


    pragma Inline (Enable_System_Input);
    pragma Inline (Disable_System_Input);
    pragma Inline (Has_Visible_Focus);
    pragma Inline (Set_Visible_Focus);


    pragma Inline (Default_Window_Close);
    pragma Inline (Get_First_Window);
    pragma Inline (Set_First_Window);
    pragma Inline (Get_Next_Window);
    pragma Inline (Get_Top_Modal);


    pragma Inline (Read_Queue);
    pragma Inline (Do_Widget_Deletion);


    pragma Inline (Get_Scheme);
    pragma Inline (Set_Scheme);
    pragma Inline (Is_Scheme);
    pragma Inline (Reload_Scheme);


    pragma Inline (Get_Option);
    pragma Inline (Set_Option);


    pragma Inline (Get_Default_Scrollbar_Size);
    pragma Inline (Set_Default_Scrollbar_Size);


end FLTK.Static;

