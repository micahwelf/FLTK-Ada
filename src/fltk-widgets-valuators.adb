

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators is


    procedure valuator_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, valuator_set_draw_hook, "valuator_set_draw_hook");

    procedure valuator_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, valuator_set_handle_hook, "valuator_set_handle_hook");




    function new_fl_valuator
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_valuator, "new_fl_valuator");

    procedure free_fl_valuator
           (V : in System.Address);
    pragma Import (C, free_fl_valuator, "free_fl_valuator");




    function fl_valuator_clamp
           (V : in System.Address;
            D : in Interfaces.C.double)
        return Interfaces.C.double;
    pragma Import (C, fl_valuator_clamp, "fl_valuator_clamp");

    function fl_valuator_round
           (V : in System.Address;
            D : in Interfaces.C.double)
        return Interfaces.C.double;
    pragma Import (C, fl_valuator_round, "fl_valuator_round");

    function fl_valuator_increment
           (V : in System.Address;
            D : in Interfaces.C.double;
            S : in Interfaces.C.int)
        return Interfaces.C.double;
    pragma Import (C, fl_valuator_increment, "fl_valuator_increment");




    function fl_valuator_get_minimum
           (V : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_valuator_get_minimum, "fl_valuator_get_minimum");

    procedure fl_valuator_set_minimum
           (V : in System.Address;
            D : in Interfaces.C.double);
    pragma Import (C, fl_valuator_set_minimum, "fl_valuator_set_minimum");

    function fl_valuator_get_maximum
           (V : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_valuator_get_maximum, "fl_valuator_get_maximum");

    procedure fl_valuator_set_maximum
           (V : in System.Address;
            D : in Interfaces.C.double);
    pragma Import (C, fl_valuator_set_maximum, "fl_valuator_set_maximum");

    function fl_valuator_get_value
           (V : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_valuator_get_value, "fl_valuator_get_value");

    procedure fl_valuator_set_value
           (V : in System.Address;
            D : in Interfaces.C.double);
    pragma Import (C, fl_valuator_set_value, "fl_valuator_set_value");

    procedure fl_valuator_bounds
           (V    : in System.Address;
            A, B : in Interfaces.C.double);
    pragma Import (C, fl_valuator_bounds, "fl_valuator_bounds");

    procedure fl_valuator_precision
           (V : in System.Address;
            D : in Interfaces.C.int);
    pragma Import (C, fl_valuator_precision, "fl_valuator_precision");

    procedure fl_valuator_range
           (V    : in System.Address;
            A, B : in Interfaces.C.double);
    pragma Import (C, fl_valuator_range, "fl_valuator_range");




    function fl_valuator_handle
           (V : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_valuator_handle, "fl_valuator_handle");




    procedure Finalize
           (This : in out Valuator) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Valuator'Class
        then
            free_fl_valuator (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Widget (This));
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Valuator is
    begin
        return This : Valuator do
            This.Void_Ptr := new_fl_valuator
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Text));
            fl_widget_set_user_data
                   (This.Void_Ptr,
                    Widget_Convert.To_Address (This'Unchecked_Access));
            valuator_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
            valuator_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
        end return;
    end Create;




    function Clamp
           (This  : in Valuator;
            Input : in Long_Float)
        return Long_Float is
    begin
        return Long_Float (fl_valuator_clamp (This.Void_Ptr, Interfaces.C.double (Input)));
    end Clamp;


    function Round
           (This  : in Valuator;
            Input : in Long_Float)
        return Long_Float is
    begin
        return Long_Float (fl_valuator_round (This.Void_Ptr, Interfaces.C.double (Input)));
    end Round;


    function Increment
           (This  : in Valuator;
            Input : in Long_Float;
            Step  : in Integer)
        return Long_Float is
    begin
        return Long_Float (fl_valuator_increment
           (This.Void_Ptr,
            Interfaces.C.double (Input),
            Interfaces.C.int (Step)));
    end Increment;




    function Get_Minimum
           (This : in Valuator)
        return Long_Float is
    begin
        return Long_Float (fl_valuator_get_minimum (This.Void_Ptr));
    end Get_Minimum;


    procedure Set_Minimum
           (This : in out Valuator;
            To   : in     Long_Float) is
    begin
        fl_valuator_set_minimum (This.Void_Ptr, Interfaces.C.double (To));
    end Set_Minimum;


    function Get_Maximum
           (This : in Valuator)
        return Long_Float is
    begin
        return Long_Float (fl_valuator_get_maximum (This.Void_Ptr));
    end Get_Maximum;


    procedure Set_Maximum
           (This : in out Valuator;
            To   : in     Long_Float) is
    begin
        fl_valuator_set_maximum (This.Void_Ptr, Interfaces.C.double (To));
    end Set_Maximum;


    function Get_Value
           (This : in Valuator)
        return Long_Float is
    begin
        return Long_Float (fl_valuator_get_value (This.Void_Ptr));
    end Get_Value;


    procedure Set_Value
           (This : in out Valuator;
            To   : in     Long_Float) is
    begin
        fl_valuator_set_value (This.Void_Ptr, Interfaces.C.double (To));
    end Set_Value;


    procedure Set_Bounds
           (This     : in out Valuator;
            Min, Max : in     Long_Float) is
    begin
        fl_valuator_bounds
           (This.Void_Ptr,
            Interfaces.C.double (Min),
            Interfaces.C.double (Max));
    end Set_Bounds;


    procedure Set_Precision
           (This : in out Valuator;
            To   : in     Integer) is
    begin
        fl_valuator_precision (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Precision;


    procedure Set_Range
           (This     : in out Valuator;
            Min, Max : in     Long_Float) is
    begin
        fl_valuator_range
           (This.Void_Ptr,
            Interfaces.C.double (Min),
            Interfaces.C.double (Max));
    end Set_Range;




    function Handle
           (This  : in out Valuator;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_valuator_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators;

