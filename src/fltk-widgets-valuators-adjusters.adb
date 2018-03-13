

with

    Interfaces.C.Strings,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Widgets.Valuators.Adjusters is


    procedure adjuster_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, adjuster_set_draw_hook, "adjuster_set_draw_hook");

    procedure adjuster_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, adjuster_set_handle_hook, "adjuster_set_handle_hook");




    function new_fl_adjuster
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_adjuster, "new_fl_adjuster");

    procedure free_fl_adjuster
           (A : in System.Address);
    pragma Import (C, free_fl_adjuster, "free_fl_adjuster");




    function fl_adjuster_is_soft
           (A : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_adjuster_is_soft, "fl_adjuster_is_soft");

    procedure fl_adjuster_set_soft
           (A : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_adjuster_set_soft, "fl_adjuster_set_soft");




    procedure fl_adjuster_draw
           (W : in System.Address);
    pragma Import (C, fl_adjuster_draw, "fl_adjuster_draw");

    function fl_adjuster_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_adjuster_handle, "fl_adjuster_handle");




    procedure Finalize
           (This : in out Adjuster) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Adjuster'Class
        then
            free_fl_adjuster (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Valuator (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Adjuster is
        begin
            return This : Adjuster do
                This.Void_Ptr := new_fl_adjuster
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                adjuster_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                adjuster_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Is_Soft
           (This : in Adjuster)
        return Boolean is
    begin
        return fl_adjuster_is_soft (This.Void_Ptr) /= 0;
    end Is_Soft;


    procedure Set_Soft
           (This : in out Adjuster;
            To   : in     Boolean) is
    begin
        fl_adjuster_set_soft (This.Void_Ptr, Boolean'Pos (To));
    end Set_Soft;




    procedure Draw
           (This : in out Adjuster) is
    begin
        fl_adjuster_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Adjuster;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_adjuster_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Adjusters;

