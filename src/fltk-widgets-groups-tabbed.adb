

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Groups.Tabbed is


    procedure tabs_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, tabs_set_draw_hook, "tabs_set_draw_hook");

    procedure tabs_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, tabs_set_handle_hook, "tabs_set_handle_hook");




    function new_fl_tabs
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_tabs, "new_fl_tabs");

    procedure free_fl_tabs
           (S : in System.Address);
    pragma Import (C, free_fl_tabs, "free_fl_tabs");




    procedure fl_tabs_client_area
           (T          : in     System.Address;
            X, Y, W, H :    out Interfaces.C.int;
            I          : in     Interfaces.C.int);
    pragma Import (C, fl_tabs_client_area, "fl_tabs_client_area");




    function fl_tabs_get_push
           (T : in System.Address)
        return System.Address;
    pragma Import (C, fl_tabs_get_push, "fl_tabs_get_push");

    procedure fl_tabs_set_push
           (T, I : in System.Address);
    pragma Import (C, fl_tabs_set_push, "fl_tabs_set_push");

    function fl_tabs_get_value
           (T : in System.Address)
        return System.Address;
    pragma Import (C, fl_tabs_get_value, "fl_tabs_get_value");

    procedure fl_tabs_set_value
           (T, V : in System.Address);
    pragma Import (C, fl_tabs_set_value, "fl_tabs_set_value");

    function fl_tabs_which
           (T    : in System.Address;
            X, Y : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, fl_tabs_which, "fl_tabs_which");




    procedure fl_tabs_draw
           (W : in System.Address);
    pragma Import (C, fl_tabs_draw, "fl_tabs_draw");

    function fl_tabs_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_tabs_handle, "fl_tabs_handle");




    procedure Finalize
           (This : in out Tabs) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Tabs'Class
        then
            This.Clear;
            free_fl_tabs (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Group (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Tabs is
        begin
            return This : Tabs do
                This.Void_Ptr := new_fl_tabs
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_group_end (This.Void_Ptr);
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                tabs_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                tabs_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Get_Client_Area
           (This       : in     Tabs;
            Tab_Height : in     Natural;
            X, Y, W, H :    out Integer)
    is
        RX, RY, RW, RH : Interfaces.C.int;
    begin
        fl_tabs_client_area (This.Void_Ptr, RX, RY, RW, RH, Interfaces.C.int (Tab_Height));
        X := Integer (RX);
        Y := Integer (RY);
        W := Integer (RW);
        H := Integer (RH);
    end Get_Client_Area;




    function Get_Push
           (This : in Tabs)
        return access Widget'Class
    is
        Widget_Ptr : System.Address :=
            fl_tabs_get_push (This.Void_Ptr);
        Actual_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (fl_widget_get_user_data (Widget_Ptr));
    begin
        return Actual_Widget;
    end Get_Push;


    procedure Set_Push
           (This : in out Tabs;
            Item : access Widget'Class) is
    begin
        if Item = null then
            fl_tabs_set_push (This.Void_Ptr, System.Null_Address);
        else
            fl_tabs_set_push (This.Void_Ptr, Item.Void_Ptr);
        end if;
    end Set_Push;


    function Get_Visible
           (This : in Tabs)
        return access Widget'Class
    is
        Widget_Ptr : System.Address :=
            fl_tabs_get_value (This.Void_Ptr);
        Actual_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (fl_widget_get_user_data (Widget_Ptr));
    begin
        return Actual_Widget;
    end Get_Visible;


    procedure Set_Visible
           (This : in out Tabs;
            Item : access Widget'Class) is
    begin
        if Item = null then
            fl_tabs_set_value (This.Void_Ptr, System.Null_Address);
        else
            fl_tabs_set_value (This.Void_Ptr, Item.Void_Ptr);
        end if;
    end Set_Visible;


    function Get_Which
           (This             : in Tabs;
            Event_X, Event_Y : in Integer)
        return access Widget'Class
    is
        Widget_Ptr : System.Address :=
            fl_tabs_which (This.Void_Ptr, Interfaces.C.int (Event_X), Interfaces.C.int (Event_Y));
        Actual_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (fl_widget_get_user_data (Widget_Ptr));
    begin
        return Actual_Widget;
    end Get_Which;




    procedure Draw
           (This : in out Tabs) is
    begin
        fl_tabs_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Tabs;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_tabs_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Tabbed;

