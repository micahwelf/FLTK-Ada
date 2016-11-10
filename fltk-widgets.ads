

with FLTK.Enums; use FLTK.Enums;
with FLTK.Images;
limited with FLTK.Widgets.Groups;
private with System;
private with System.Address_To_Access_Conversions;
private with Ada.Unchecked_Conversion;


package FLTK.Widgets is


    type Widget is abstract new Wrapper with private;


    type Widget_Callback is access procedure
           (Item : in out Widget'Class);


    type Font_Size is new Natural;
    Normal_Size : constant Font_Size := 14;
    type Color is new Natural;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Widget is abstract;


    function Parent
           (This : in Widget)
        return access FLTK.Widgets.Groups.Group'Class;


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


private


    type Widget is abstract new Wrapper with
        record
            Callback      : Widget_Callback;
            Current_Image : access FLTK.Images.Image'Class;
        end record;


    package Widget_Convert is new System.Address_To_Access_Conversions (Widget'Class);
    --  package Callback_Convert is new System.Address_To_Access_Conversions (Widget_Callback);
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

