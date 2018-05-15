

with

    FLTK.Widgets.Groups.Windows;

private with

    Ada.Containers.Vectors,
    System.Address_To_Access_Conversions;


package FLTK.Event is


    type Event_Handler is access function
           (Event : in Event_Kind)
        return Event_Outcome;

    --  type Event_Dispatch is access function
    --         (Event : in     Event_Kind;
    --          Win   : access FLTK.Widgets.Groups.Windows.Window'Class)
    --      return Event_Outcome;




    procedure Add_Handler
           (Func : in Event_Handler);

    procedure Remove_Handler
           (Func : in Event_Handler);

    --  function Get_Dispatch
    --      return Event_Dispatch;

    --  procedure Set_Dispatch
    --         (Func : in Event_Dispatch);

    --  function Default_Dispatch
    --         (Event : in     Event_Kind;
    --          Win   : access FLTK.Widgets.Groups.Windows.Window'Class)
    --      return Event_Outcome;




    function Get_Grab
        return access FLTK.Widgets.Groups.Windows.Window'Class;

    procedure Set_Grab
           (To : in FLTK.Widgets.Groups.Windows.Window'Class);

    procedure Release_Grab;

    function Get_Pushed
        return access FLTK.Widgets.Widget'Class;

    procedure Set_Pushed
           (To : in FLTK.Widgets.Widget'Class);

    function Get_Below_Mouse
        return access FLTK.Widgets.Widget'Class;

    procedure Set_Below_Mouse
           (To : in FLTK.Widgets.Widget'Class);

    function Get_Focus
        return access FLTK.Widgets.Widget'Class;

    procedure Set_Focus
           (To : in FLTK.Widgets.Widget'Class);




    function Compose
           (Del : out Natural)
        return Boolean;

    procedure Compose_Reset;

    function Text
        return String;

    function Text_Length
        return Natural;




    function Last
        return Event_Kind;

    function Last_Modifier
        return Modifier;

    function Last_Modifier
           (Had : in Modifier)
        return Boolean;




    function Mouse_X
        return Integer;

    function Mouse_X_Root
        return Integer;

    function Mouse_Y
        return Integer;

    function Mouse_Y_Root
        return Integer;

    function Mouse_DX
        return Integer;

    function Mouse_DY
        return Integer;

    procedure Get_Mouse
           (X, Y : out Integer);

    function Is_Click
        return Boolean;

    function Is_Multi_Click
        return Boolean;

    procedure Set_Clicks
           (To : in Natural);

    function Last_Button
        return Mouse_Button;

    function Mouse_Left
        return Boolean;

    function Mouse_Middle
        return Boolean;

    function Mouse_Right
        return Boolean;

    function Is_Inside
           (X, Y, W, H : in Integer)
        return Boolean;




    function Last_Key
        return Keypress;

    function Original_Last_Key
        return Keypress;

    function Pressed_During
           (Key : in Keypress)
        return Boolean;

    function Key_Now
           (Key : in Keypress)
        return Boolean;

    function Key_Ctrl
        return Boolean;

    function Key_Alt
        return Boolean;

    function Key_Command
        return Boolean;

    function Key_Shift
        return Boolean;


private


    package Widget_Convert is new System.Address_To_Access_Conversions
        (FLTK.Widgets.Widget'Class);
    package Window_Convert is new System.Address_To_Access_Conversions
        (FLTK.Widgets.Groups.Windows.Window'Class);


    package Handler_Vectors is new Ada.Containers.Vectors
        (Index_Type => Positive, Element_Type => Event_Handler);


    Handlers : Handler_Vectors.Vector := Handler_Vectors.Empty_Vector;
    --  Current_Dispatch : Event_Dispatch := null;


    function fl_widget_get_user_data
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_get_user_data, "fl_widget_get_user_data");
    pragma Inline (fl_widget_get_user_data);




    pragma Inline (Add_Handler);
    pragma Inline (Remove_Handler);
    --  pragma Inline (Get_Dispatch);
    --  pragma Inline (Set_Dispatch);
    --  pragma Inline (Default_Dispatch);


    pragma Inline (Get_Grab);
    pragma Inline (Set_Grab);
    pragma Inline (Release_Grab);
    pragma Inline (Get_Pushed);
    pragma Inline (Set_Pushed);
    pragma Inline (Get_Below_Mouse);
    pragma Inline (Set_Below_Mouse);
    pragma Inline (Get_Focus);
    pragma Inline (Set_Focus);


    pragma Inline (Compose);
    pragma Inline (Compose_Reset);
    pragma Inline (Text);
    pragma Inline (Text_Length);


    pragma Inline (Last);
    pragma Inline (Last_Modifier);


    pragma Inline (Mouse_X);
    pragma Inline (Mouse_X_Root);
    pragma Inline (Mouse_Y);
    pragma Inline (Mouse_Y_Root);
    pragma Inline (Mouse_DX);
    pragma Inline (Mouse_DY);
    pragma Inline (Get_Mouse);
    pragma Inline (Is_Click);
    pragma Inline (Is_Multi_Click);
    pragma Inline (Set_Clicks);
    pragma Inline (Last_Button);
    pragma Inline (Mouse_Left);
    pragma Inline (Mouse_Middle);
    pragma Inline (Mouse_Right);
    pragma Inline (Is_Inside);


    pragma Inline (Last_Key);
    pragma Inline (Original_Last_Key);
    pragma Inline (Pressed_During);
    pragma Inline (Key_Now);
    pragma Inline (Key_Ctrl);
    pragma Inline (Key_Alt);
    pragma Inline (Key_Command);
    pragma Inline (Key_Shift);


end FLTK.Event;

