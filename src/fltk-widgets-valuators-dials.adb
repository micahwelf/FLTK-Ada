

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Dials is


    procedure dial_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, dial_set_draw_hook, "dial_set_draw_hook");

    procedure dial_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, dial_set_handle_hook, "dial_set_handle_hook");




    function new_fl_dial
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_dial, "new_fl_dial");

    procedure free_fl_dial
           (D : in System.Address);
    pragma Import (C, free_fl_dial, "free_fl_dial");




    function fl_dial_get_angle1
           (D : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_dial_get_angle1, "fl_dial_get_angle1");

    procedure fl_dial_set_angle1
           (D : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_dial_set_angle1, "fl_dial_set_angle1");

    function fl_dial_get_angle2
           (D : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_dial_get_angle2, "fl_dial_get_angle2");

    procedure fl_dial_set_angle2
           (D : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_dial_set_angle2, "fl_dial_set_angle2");

    procedure fl_dial_set_angles
           (D    : in System.Address;
            A, B : in Interfaces.C.int);
    pragma Import (C, fl_dial_set_angles, "fl_dial_set_angles");




    procedure fl_dial_draw
           (W : in System.Address);
    pragma Import (C, fl_dial_draw, "fl_dial_draw");

    function fl_dial_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_dial_handle, "fl_dial_handle");




    procedure Finalize
           (This : in out Dial) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Dial'Class
        then
            free_fl_dial (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Valuator (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Dial is
        begin
            return This : Dial do
                This.Void_Ptr := new_fl_dial
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                dial_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                dial_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_First_Angle
           (This : in Dial)
        return Integer is
    begin
        return Integer (fl_dial_get_angle1 (This.Void_Ptr));
    end Get_First_Angle;


    procedure Set_First_Angle
           (This : in out Dial;
            To   : in     Integer) is
    begin
        fl_dial_set_angle1 (This.Void_Ptr, Interfaces.C.int (To));
    end Set_First_Angle;


    function Get_Second_Angle
           (This : in Dial)
        return Integer is
    begin
        return Integer (fl_dial_get_angle2 (This.Void_Ptr));
    end Get_Second_Angle;


    procedure Set_Second_Angle
           (This : in out Dial;
            To   : in     Integer) is
    begin
        fl_dial_set_angle2 (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Second_Angle;


    procedure Set_Angles
           (This     : in out Dial;
            One, Two : in     Integer) is
    begin
        fl_dial_set_angles (This.Void_Ptr, Interfaces.C.int (One), Interfaces.C.int (Two));
    end Set_Angles;




    procedure Draw
           (This : in out Dial) is
    begin
        fl_dial_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Dial;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_dial_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Dials;

