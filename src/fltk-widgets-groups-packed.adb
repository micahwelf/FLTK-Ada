

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Groups.Packed is


    procedure pack_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, pack_set_draw_hook, "pack_set_draw_hook");
    pragma Inline (pack_set_draw_hook);

    procedure pack_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, pack_set_handle_hook, "pack_set_handle_hook");
    pragma Inline (pack_set_handle_hook);




    function new_fl_pack
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_pack, "new_fl_pack");
    pragma Inline (new_fl_pack);

    procedure free_fl_pack
           (B : in System.Address);
    pragma Import (C, free_fl_pack, "free_fl_pack");
    pragma Inline (free_fl_pack);




    function fl_pack_get_spacing
           (P : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_pack_get_spacing, "fl_pack_get_spacing");
    pragma Inline (fl_pack_get_spacing);

    procedure fl_pack_set_spacing
           (P : in System.Address;
            S : in Interfaces.C.int);
    pragma Import (C, fl_pack_set_spacing, "fl_pack_set_spacing");
    pragma Inline (fl_pack_set_spacing);




    procedure fl_pack_draw
           (W : in System.Address);
    pragma Import (C, fl_pack_draw, "fl_pack_draw");
    pragma Inline (fl_pack_draw);

    function fl_pack_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_pack_handle, "fl_pack_handle");
    pragma Inline (fl_pack_handle);




    procedure Finalize
           (This : in out Packed_Group) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Packed_Group'Class
        then
            This.Clear;
            free_fl_pack (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Group (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Packed_Group is
        begin
            return This : Packed_Group do
                This.Void_Ptr := new_fl_pack
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_group_end (This.Void_Ptr);
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                pack_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                pack_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_Spacing
           (This : in Packed_Group)
        return Integer is
    begin
        return Integer (fl_pack_get_spacing (This.Void_Ptr));
    end Get_Spacing;


    procedure Set_Spacing
           (This : in out Packed_Group;
            To   : in     Integer) is
    begin
        fl_pack_set_spacing (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Spacing;




    procedure Draw
           (This : in out Packed_Group) is
    begin
        fl_pack_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Packed_Group;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_pack_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Packed;

