

with

    System;

use type

    System.Address;


package body FLTK.Devices.Surfaces is


    function new_fl_surface
           (G : in System.Address)
        return System.Address;
    pragma Import (C, new_fl_surface, "new_fl_surface");
    pragma Inline (new_fl_surface);

    procedure free_fl_surface
           (S : in System.Address);
    pragma Import (C, free_fl_surface, "free_fl_surface");
    pragma Inline (free_fl_surface);




    procedure fl_surface_set_current
           (S : in System.Address);
    pragma Import (C, fl_surface_set_current, "fl_surface_set_current");
    pragma Inline (fl_surface_set_current);

    function fl_surface_get_surface
        return System.Address;
    pragma Import (C, fl_surface_get_surface, "fl_surface_get_surface");
    pragma Inline (fl_surface_get_surface);




    procedure Finalize
           (This : in out Surface_Device) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Surface_Device'Class
        then
            if This.Needs_Dealloc then
                free_fl_surface (This.Void_Ptr);
            end if;
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Device (This));
    end Finalize;




    package body Forge is

        function Create
               (Graphics : in out FLTK.Devices.Graphics.Graphics_Driver)
            return Surface_Device is
        begin
            return This : Surface_Device do
                This.Void_Ptr := new_fl_surface (Wrapper (Graphics).Void_Ptr);
            end return;
        end Create;

    end Forge;




    function Get_Current
        return access Surface_Device'Class is
    begin
        return Current_Ptr;
    end Get_Current;


    procedure Set_Current
           (This : in out Surface_Device) is
    begin
        fl_surface_set_current (This.Void_Ptr);
        Current_Ptr := This'Unchecked_Access;
    end Set_Current;




begin


    Original_Surface.Void_Ptr := fl_surface_get_surface;
    Original_Surface.Needs_Dealloc := False;


end FLTK.Devices.Surfaces;

