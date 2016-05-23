

with FLTK.Enums; use FLTK.Enums;
private with Ada.Finalization;
private with System;


package FLTK.Widget is


    type Widget_Type is abstract tagged limited private;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Widget_Type is abstract;


    function Get_Box
           (W : in Widget_Type'Class)
        return Box_Kind;


    procedure Set_Box
           (W : in Widget_Type'Class;
            B : in Box_Kind);


    function Get_Label_Font
           (W : in Widget_Type'Class)
        return Font_Kind;


    procedure Set_Label_Font
           (W : in Widget_Type'Class;
            F : in Font_Kind);


private


    type Widget_Type is abstract new Ada.Finalization.Limited_Controlled with
        record
            Void_Ptr : System.Address;
        end record;


    overriding procedure Initialize (This : in out Widget_Type);


end FLTK.Widget;

