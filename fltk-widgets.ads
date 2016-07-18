

with FLTK.Enums; use FLTK.Enums;
limited with FLTK.Widgets.Groups;


package FLTK.Widgets is


    type Widget is abstract new Wrapper with private;
    type Widget_Cursor (Data : access Widget'Class) is limited null record
        with Implicit_Dereference => Data;


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


private


    type Widget is abstract new Wrapper with
        record
            Parent : access FLTK.Widgets.Groups.Group;
        end record;


    overriding procedure Finalize
           (This : in out Widget);


end FLTK.Widgets;

