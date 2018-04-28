

with

    Interfaces.C,
    System;

use type

    System.Address;


package body FLTK.Devices.Surfaces.Copy is


    function new_fl_copy_surface
           (W, H : in Interfaces.C.int)
        return System.Address;
    pragma Import (C, new_fl_copy_surface, "new_fl_copy_surface");
    pragma Inline (new_fl_copy_surface);

    procedure free_fl_copy_surface
           (S : in System.Address);
    pragma Import (C, free_fl_copy_surface, "free_fl_copy_surface");
    pragma Inline (free_fl_copy_surface);




    function fl_copy_surface_get_w
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_copy_surface_get_w, "fl_copy_surface_get_w");
    pragma Inline (fl_copy_surface_get_w);

    function fl_copy_surface_get_h
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_copy_surface_get_h, "fl_copy_surface_get_h");
    pragma Inline (fl_copy_surface_get_h);




    procedure fl_copy_surface_draw
           (S, W   : in System.Address;
            OX, OY : in Interfaces.C.int);
    pragma Import (C, fl_copy_surface_draw, "fl_copy_surface_draw");
    pragma Inline (fl_copy_surface_draw);

    procedure fl_copy_surface_draw_decorated_window
           (S, W   : in System.Address;
            OX, OY : in Interfaces.C.int);
    pragma Import (C, fl_copy_surface_draw_decorated_window,
        "fl_copy_surface_draw_decorated_window");
    pragma Inline (fl_copy_surface_draw_decorated_window);




    procedure fl_copy_surface_set_current
           (S : in System.Address);
    pragma Import (C, fl_copy_surface_set_current, "fl_copy_surface_set_current");
    pragma Inline (fl_copy_surface_set_current);




    procedure Finalize
           (This : in out Copy_Surface) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Copy_Surface'Class
        then
            free_fl_copy_surface (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Surface_Device (This));
    end Finalize;




    package body Forge is

        function Create
               (W, H : in Natural)
            return Copy_Surface is
        begin
            return This : Copy_Surface do
                This.Void_Ptr := new_fl_copy_surface
                   (Interfaces.C.int (W),
                    Interfaces.C.int (H));
            end return;
        end Create;

    end Forge;




    function Get_W
           (This : in Copy_Surface)
        return Integer is
    begin
        return Integer (fl_copy_surface_get_w (This.Void_Ptr));
    end Get_W;


    function Get_H
           (This : in Copy_Surface)
        return Integer is
    begin
        return Integer (fl_copy_surface_get_h (This.Void_Ptr));
    end Get_H;




    procedure Draw_Widget
           (This               : in out Copy_Surface;
            Item               : in     FLTK.Widgets.Widget'Class;
            Offset_X, Offset_Y : in     Integer := 0) is
    begin
        fl_copy_surface_draw
           (This.Void_Ptr,
            Wrapper (Item).Void_Ptr,
            Interfaces.C.int (Offset_X),
            Interfaces.C.int (Offset_Y));
    end Draw_Widget;


    procedure Draw_Decorated_Window
           (This               : in out Copy_Surface;
            Item               : in     FLTK.Widgets.Groups.Windows.Window'Class;
            Offset_X, Offset_Y : in     Integer := 0) is
    begin
        fl_copy_surface_draw_decorated_window
           (This.Void_Ptr,
            Wrapper (Item).Void_Ptr,
            Interfaces.C.int (Offset_X),
            Interfaces.C.int (Offset_Y));
    end Draw_Decorated_Window;




    procedure Set_Current
           (This : in out Copy_Surface) is
    begin
        fl_copy_surface_set_current (This.Void_Ptr);
        Current_Ptr := This'Unchecked_Access;
    end Set_Current;


end FLTK.Devices.Surfaces.Copy;

