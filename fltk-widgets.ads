

with FLTK.Enums; use FLTK.Enums;
limited with FLTK.Widgets.Groups;
private with System;
private with System.Address_To_Access_Conversions;


package FLTK.Widgets is


    type Widget is abstract new Wrapper with private;
    type Widget_Cursor (Data : access Widget'Class) is limited null record
        with Implicit_Dereference => Data;


    type Widget_Callback is interface;
    procedure Call
           (This : in     Widget_Callback;
            Item : in out Widget'Class) is abstract;


    --  would like to move this definition to FLTK.Widgets.Groups somehow
    type Group_Cursor (Data : access FLTK.Widgets.Groups.Group'Class) is limited null record
        with Implicit_Dereference => Data;


    type Font_Size is new Natural;
    Normal_Size : constant Font_Size := 14;
    type Color is new Natural;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Widget is abstract;


    function Parent
           (This : in Widget)
        return Group_Cursor;


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


    procedure Set_Callback
           (This : in out Widget;
            Func : not null access Widget_Callback'Class);


private


    type Widget is abstract new Wrapper with
        record
            Callback : access Widget_Callback'Class;
        end record;


    package Widget_Convert is new System.Address_To_Access_Conversions (Widget'Class);
    package Callback_Convert is new System.Address_To_Access_Conversions (Widget_Callback'Class);


    function fl_widget_get_user_data
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_widget_get_user_data, "fl_widget_get_user_data");


    procedure fl_widget_set_user_data
           (W, D : in System.Address);
    pragma Import (C, fl_widget_set_user_data, "fl_widget_set_user_data");


end FLTK.Widgets;

