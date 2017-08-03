

with

    FLTK.Images;

limited with

    FLTK.Widgets.Groups;

private with

    System.Address_To_Access_Conversions,
    Ada.Unchecked_Conversion,
    Interfaces.C;


package FLTK.Widgets is


    type Widget is new Wrapper with private;

    type Widget_Callback is access procedure
           (Item : in out Widget'Class);




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Widget;




    procedure Activate
           (This : in out Widget);

    procedure Deactivate
           (This : in out Widget);

    function Is_Active
           (This : in Widget)
        return Boolean;

    function Is_Tree_Active
           (This : in Widget)
        return Boolean;

    procedure Clear_Active
           (This : in out Widget);




    function Has_Changed
           (This : in Widget)
        return Boolean;

    procedure Clear_Changed
           (This : in out Widget);




    function Parent
           (This : in Widget)
        return access FLTK.Widgets.Groups.Group'Class;

    function Contains
           (This : in Widget;
            Item : in Widget'Class)
        return Boolean;




    function Get_Alignment
           (This : in Widget)
        return Alignment;

    procedure Set_Alignment
           (This      : in out Widget;
            New_Align : in     Alignment);

    function Get_Box
           (This : in Widget)
        return Box_Kind;

    procedure Set_Box
           (This : in out Widget;
            Box  : in     Box_Kind);

    function Get_Label
           (This : in out Widget)
        return String;

    procedure Set_Label
           (This : in out Widget;
            Text : in     String);

    function Get_Label_Font
           (This : in Widget)
        return Font_Kind;

    procedure Set_Label_Font
           (This : in out Widget;
            Font : in     Font_Kind);

    function Get_Label_Size
           (This : in Widget)
        return Font_Size;

    procedure Set_Label_Size
           (This : in out Widget;
            Size : in     Font_Size);

    function Get_Label_Type
           (This : in Widget)
        return Label_Kind;

    procedure Set_Label_Type
           (This  : in out Widget;
            Label : in     Label_Kind);

    function Get_Callback
           (This : in Widget)
        return Widget_Callback;

    procedure Set_Callback
           (This : in out Widget;
            Func : in     Widget_Callback);




    function Get_X
           (This : in Widget)
        return Integer;

    function Get_Y
           (This : in Widget)
        return Integer;

    function Get_W
           (This : in Widget)
        return Integer;

    function Get_H
           (This : in Widget)
        return Integer;

    procedure Resize
           (This : in out Widget;
            W, H : in     Integer);

    procedure Reposition
           (This : in out Widget;
            X, Y : in     Integer);




    function Get_Image
           (This : in Widget)
        return access FLTK.Images.Image'Class;

    procedure Set_Image
           (This : in out Widget;
            Pic  : in out FLTK.Images.Image'Class);




    procedure Draw
           (This : in out Widget) is null;

    procedure Redraw
           (This : in out Widget);

    procedure Redraw_Label
           (This : in out Widget);

    function Handle
           (This  : in out Widget;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Widget is new Wrapper with
        record
            Callback      : Widget_Callback;
            Current_Image : access FLTK.Images.Image'Class;
        end record;

    overriding procedure Finalize
           (This : in out Widget);




    --  the user data portion should always be a reference back to the Ada binding
    procedure Callback_Hook
           (W, U : in System.Address);
    pragma Convention (C, Callback_Hook);

    procedure Draw_Hook
           (U : in System.Address);
    pragma Convention (C, Draw_Hook);

    function Handle_Hook
           (U : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Convention (C, Handle_Hook);




    package Widget_Convert is new System.Address_To_Access_Conversions (Widget'Class);
    package Callback_Convert is
        function To_Pointer is new Ada.Unchecked_Conversion (System.Address, Widget_Callback);
        function To_Address is new Ada.Unchecked_Conversion (Widget_Callback, System.Address);
    end Callback_Convert;




    function fl_widget_get_user_data
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_get_user_data, "fl_widget_get_user_data");

    procedure fl_widget_set_user_data
           (W, D : in System.Address);
    pragma Import (C, fl_widget_set_user_data, "fl_widget_set_user_data");


end FLTK.Widgets;

