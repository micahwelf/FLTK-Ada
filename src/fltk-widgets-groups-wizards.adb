

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Widgets.Groups.Wizards is


    procedure wizard_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, wizard_set_draw_hook, "wizard_set_draw_hook");

    procedure wizard_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, wizard_set_handle_hook, "wizard_set_handle_hook");




    function new_fl_wizard
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_wizard, "new_fl_wizard");

    procedure free_fl_wizard
           (S : in System.Address);
    pragma Import (C, free_fl_wizard, "free_fl_wizard");




    procedure fl_wizard_next
           (W : in System.Address);
    pragma Import (C, fl_wizard_next, "fl_wizard_next");

    procedure fl_wizard_prev
           (W : in System.Address);
    pragma Import (C, fl_wizard_prev, "fl_wizard_prev");




    function fl_wizard_get_visible
           (W : in System.Address)
        return System.Address;
    pragma Import (C, fl_wizard_get_visible, "fl_wizard_get_visible");

    procedure fl_wizard_set_visible
           (W, I : in System.Address);
    pragma Import (C, fl_wizard_set_visible, "fl_wizard_set_visible");




    procedure fl_wizard_draw
           (W : in System.Address);
    pragma Import (C, fl_wizard_draw, "fl_wizard_draw");

    function fl_wizard_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_wizard_handle, "fl_wizard_handle");




    procedure Finalize
           (This : in out Wizard) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Wizard'Class
        then
            This.Clear;
            free_fl_wizard (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Group (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Wizard is
        begin
            return This : Wizard do
                This.Void_Ptr := new_fl_wizard
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_group_end (This.Void_Ptr);
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                wizard_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                wizard_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Next
           (This : in out Wizard) is
    begin
        fl_wizard_next (This.Void_Ptr);
    end Next;


    procedure Prev
           (This : in out Wizard) is
    begin
        fl_wizard_prev (This.Void_Ptr);
    end Prev;




    function Get_Visible
           (This : in Wizard)
        return access Widget'Class
    is
        Widget_Ptr : System.Address :=
            fl_wizard_get_visible (This.Void_Ptr);
        Actual_Widget : access Widget'Class :=
            Widget_Convert.To_Pointer (fl_widget_get_user_data (Widget_Ptr));
    begin
        return Actual_Widget;
    end Get_Visible;


    procedure Set_Visible
           (This : in out Wizard;
            Item : access Widget'Class) is
    begin
        if Item = null then
            fl_wizard_set_visible (This.Void_Ptr, System.Null_Address);
        else
            fl_wizard_set_visible (This.Void_Ptr, Item.Void_Ptr);
        end if;
    end Set_Visible;




    procedure Draw
           (This : in out Wizard) is
    begin
        fl_wizard_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Wizard;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_wizard_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Wizards;

