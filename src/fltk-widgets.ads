

with

    FLTK.Images;

limited with

    FLTK.Widgets.Groups.Windows;

private with

    System.Address_To_Access_Conversions,
    Ada.Unchecked_Conversion,
    Interfaces.C;


package FLTK.Widgets is


    type Widget is new Wrapper with private;

    type Widget_Reference (Data : not null access Widget'Class) is limited null record
        with Implicit_Dereference => Data;

    type Widget_Callback is access procedure
           (Item : in out Widget'Class);

    type Callback_Flag is private;
    function "+" (Left, Right : in Callback_Flag) return Callback_Flag;
    Call_Never     : constant Callback_Flag;
    When_Changed   : constant Callback_Flag;
    When_Interact  : constant Callback_Flag;
    When_Release   : constant Callback_Flag;
    When_Enter_Key : constant Callback_Flag;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Widget;

    end Forge;




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

    procedure Set_Active
           (This : in out Widget;
            To   : in     Boolean);




    function Has_Changed
           (This : in Widget)
        return Boolean;

    procedure Set_Changed
           (This : in out Widget;
            To   : in     Boolean);

    function Is_Output_Only
           (This : in Widget)
        return Boolean;

    procedure Set_Output_Only
           (This : in out Widget;
            To   : in     Boolean);

    function Is_Visible
           (This : in Widget)
        return Boolean;

    function Is_Tree_Visible
           (This : in Widget)
        return Boolean;

    procedure Set_Visible
           (This : in out Widget;
            To   : in     Boolean);




    function Has_Visible_Focus
           (This : in Widget)
        return Boolean;

    procedure Set_Visible_Focus
           (This : in out Widget;
            To   : in     Boolean);

    function Take_Focus
           (This : in out Widget)
        return Boolean;

    function Takes_Events
           (This : in Widget)
        return Boolean;




    function Get_Background_Color
           (This : in Widget)
        return Color;

    procedure Set_Background_Color
           (This : in out Widget;
            To   : in     Color);

    function Get_Selection_Color
           (This : in Widget)
        return Color;

    procedure Set_Selection_Color
           (This : in out Widget;
            To   : in     Color);




    function Parent
           (This : in Widget)
        return access FLTK.Widgets.Groups.Group'Class;

    function Contains
           (This : in Widget;
            Item : in Widget'Class)
        return Boolean;

    function Inside
           (This   : in Widget;
            Parent : in Widget'Class)
        return Boolean;

    function Nearest_Window
           (This : in Widget)
        return access FLTK.Widgets.Groups.Windows.Window'Class;

    function Top_Window
           (This : in Widget)
        return access FLTK.Widgets.Groups.Windows.Window'Class;

    function Top_Window_Offset
           (This : in Widget;
            Offset_X, Offset_Y : out Integer)
        return access FLTK.Widgets.Groups.Windows.Window'Class;




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

    function Get_Tooltip
           (This : in Widget)
        return String;

    procedure Set_Tooltip
           (This : in out Widget;
            Text : in     String);




    function Get_Label
           (This : in Widget)
        return String;

    procedure Set_Label
           (This : in out Widget;
            Text : in     String);

    function Get_Label_Color
           (This : in Widget)
        return Color;

    procedure Set_Label_Color
           (This  : in out Widget;
            Value : in     Color);

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

    procedure Measure_Label
           (This : in     Widget;
            W, H :    out Integer);




    function Get_Callback
           (This : in Widget)
        return Widget_Callback;

    procedure Set_Callback
           (This : in out Widget;
            Func : in     Widget_Callback);

    procedure Do_Callback
           (This : in out Widget);

    function Get_When
           (This : in Widget)
        return Callback_Flag;

    procedure Set_When
           (This : in out Widget;
            To   : in     Callback_Flag);




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

    function Get_Inactive_Image
           (This : in Widget)
        return access FLTK.Images.Image'Class;

    procedure Set_Inactive_Image
           (This : in out Widget;
            Pic  : in out FLTK.Images.Image'Class);




    function Is_Damaged
           (This : in Widget)
        return Boolean;

    procedure Set_Damaged
           (This : in out Widget;
            To   : in     Boolean);

    procedure Set_Damaged
           (This       : in out Widget;
            To         : in     Boolean;
            X, Y, W, H : in     Integer);

    procedure Draw
           (This : in out Widget) is null;

    procedure Draw_Label
           (This       : in Widget;
            X, Y, W, H : in Integer;
            Align      : in Alignment);

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
            Callback       : Widget_Callback;
            Current_Image  : access FLTK.Images.Image'Class;
            Inactive_Image : access FLTK.Images.Image'Class;
        end record;

    overriding procedure Finalize
           (This : in out Widget);




    type Callback_Flag is new Interfaces.C.unsigned;

    Call_Never     : constant Callback_Flag := 0;
    When_Changed   : constant Callback_Flag := 1;
    When_Interact  : constant Callback_Flag := 2;
    When_Release   : constant Callback_Flag := 4;
    When_Enter_Key : constant Callback_Flag := 8;




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




    pragma Inline (Activate);
    pragma Inline (Deactivate);
    pragma Inline (Is_Active);
    pragma Inline (Is_Tree_Active);
    pragma Inline (Set_Active);


    pragma Inline (Has_Changed);
    pragma Inline (Set_Changed);
    pragma Inline (Is_Output_Only);
    pragma Inline (Set_Output_Only);
    pragma Inline (Is_Visible);
    pragma Inline (Set_Visible);


    pragma Inline (Has_Visible_Focus);
    pragma Inline (Set_Visible_Focus);
    pragma Inline (Take_Focus);
    pragma Inline (Takes_Events);


    pragma Inline (Get_Background_Color);
    pragma Inline (Set_Background_Color);
    pragma Inline (Get_Selection_Color);
    pragma Inline (Set_Selection_Color);


    pragma Inline (Parent);
    pragma Inline (Contains);
    pragma Inline (Inside);
    pragma Inline (Nearest_Window);
    pragma Inline (Top_Window);
    pragma Inline (Top_Window_Offset);


    pragma Inline (Get_Alignment);
    pragma Inline (Set_Alignment);
    pragma Inline (Get_Box);
    pragma Inline (Set_Box);
    pragma Inline (Get_Tooltip);
    pragma Inline (Set_Tooltip);


    pragma Inline (Get_Label);
    pragma Inline (Set_Label);
    pragma Inline (Get_Label_Color);
    pragma Inline (Set_Label_Color);
    pragma Inline (Get_Label_Font);
    pragma Inline (Set_Label_Font);
    pragma Inline (Get_Label_Size);
    pragma Inline (Set_Label_Size);
    pragma Inline (Get_Label_Type);
    pragma Inline (Set_Label_Type);
    pragma Inline (Measure_Label);


    pragma Inline (Get_Callback);
    pragma Inline (Set_Callback);
    pragma Inline (Do_Callback);
    pragma Inline (Get_When);
    pragma Inline (Set_When);


    pragma Inline (Get_X);
    pragma Inline (Get_Y);
    pragma Inline (Get_W);
    pragma Inline (Get_H);
    pragma Inline (Resize);
    pragma Inline (Reposition);


    pragma Inline (Get_Image);
    pragma Inline (Set_Image);
    pragma Inline (Get_Inactive_Image);
    pragma Inline (Set_Inactive_Image);


    pragma Inline (Is_Damaged);
    pragma Inline (Set_Damaged);
    pragma Inline (Draw);
    pragma Inline (Draw_Label);
    pragma Inline (Redraw);
    pragma Inline (Redraw_Label);
    pragma Inline (Handle);


end FLTK.Widgets;

