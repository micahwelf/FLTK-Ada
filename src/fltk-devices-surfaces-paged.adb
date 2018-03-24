

with

    Interfaces.C,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Devices.Surfaces.Paged is


    function new_fl_paged_device
        return System.Address;
    pragma Import (C, new_fl_paged_device, "new_fl_paged_device");

    procedure free_fl_paged_device
           (D : in System.Address);
    pragma Import (C, free_fl_paged_device, "free_fl_paged_device");




    function fl_paged_device_start_job
           (D : in System.Address;
            C : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_paged_device_start_job, "fl_paged_device_start_job");

    function fl_paged_device_start_job2
           (D       : in System.Address;
            C, F, T : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_paged_device_start_job2, "fl_paged_device_start_job2");

    procedure fl_paged_device_end_job
           (D : in System.Address);
    pragma Import (C, fl_paged_device_end_job, "fl_paged_device_end_job");

    function fl_paged_device_start_page
           (D : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_paged_device_start_page, "fl_paged_device_start_page");

    function fl_paged_device_end_page
           (D : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_paged_device_end_page, "fl_paged_device_end_page");




    procedure fl_paged_device_margins
           (D          : in     System.Address;
            L, T, R, B :    out Interfaces.C.int);
    pragma Import (C, fl_paged_device_margins, "fl_paged_device_margins");

    function fl_paged_device_printable_rect
           (D    : in     System.Address;
            W, H :    out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_paged_device_printable_rect, "fl_paged_device_printable_rect");

    procedure fl_paged_device_get_origin
           (D    : in     System.Address;
            X, Y :    out Interfaces.C.int);
    pragma Import (C, fl_paged_device_get_origin, "fl_paged_device_get_origin");

    procedure fl_paged_device_set_origin
           (D    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_paged_device_set_origin, "fl_paged_device_set_origin");

    procedure fl_paged_device_rotate
           (D : in System.Address;
            R : in Interfaces.C.C_float);
    pragma Import (C, fl_paged_device_rotate, "fl_paged_device_rotate");

    procedure fl_paged_device_scale
           (D    : in System.Address;
            X, Y : in Interfaces.C.C_float);
    pragma Import (C, fl_paged_device_scale, "fl_paged_device_scale");

    procedure fl_paged_device_translate
           (D    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_paged_device_translate, "fl_paged_device_translate");

    procedure fl_paged_device_untranslate
           (D : in System.Address);
    pragma Import (C, fl_paged_device_untranslate, "fl_paged_device_untranslate");




    procedure fl_paged_device_print_widget
           (D, I   : in System.Address;
            DX, DY : in Interfaces.C.int);
    pragma Import (C, fl_paged_device_print_widget, "fl_paged_device_print_widget");

    procedure fl_paged_device_print_window
           (D, I   : in System.Address;
            DX, DY : in Interfaces.C.int);
    pragma Import (C, fl_paged_device_print_window, "fl_paged_device_print_window");

    procedure fl_paged_device_print_window_part
           (D, I               : in System.Address;
            X, Y, W, H, DX, DY : in Interfaces.C.int);
    pragma Import (C, fl_paged_device_print_window_part, "fl_paged_device_print_window_part");




    procedure Finalize
           (This : in out Paged_Surface) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Paged_Surface'Class
        then
            free_fl_paged_device (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Surface_Device (This));
    end Finalize;




    package body Forge is

        function Create
            return Paged_Surface is
        begin
            return This : Paged_Surface do
                This.Void_Ptr := new_fl_paged_device;
            end return;
        end Create;

    end Forge;




    procedure Start_Job
           (This  : in out Paged_Surface;
            Count : in     Natural) is
    begin
        if fl_paged_device_start_job
            (This.Void_Ptr, Interfaces.C.int (Count)) /= 0
        then
            raise Page_Error;
        end if;
    end Start_Job;


    procedure Start_Job
           (This     : in out Paged_Surface;
            Count    : in     Natural;
            From, To : in     Positive) is
    begin
        if fl_paged_device_start_job2
           (This.Void_Ptr,
            Interfaces.C.int (Count),
            Interfaces.C.int (From),
            Interfaces.C.int (To)) /= 0
        then
            raise Page_Error;
        end if;
    end Start_Job;


    procedure End_Job
           (This : in out Paged_Surface) is
    begin
        fl_paged_device_end_job (This.Void_Ptr);
    end End_Job;


    procedure Start_Page
           (This : in out Paged_Surface) is
    begin
        if fl_paged_device_start_page (This.Void_Ptr) /= 0 then
            raise Page_Error;
        end if;
    end Start_Page;


    procedure End_Page
           (This : in out Paged_Surface) is
    begin
        if fl_paged_device_end_page (This.Void_Ptr) /= 0 then
            raise Page_Error;
        end if;
    end End_Page;




    procedure Get_Margins
           (This                     : in     Paged_Surface;
            Left, Top, Right, Bottom :    out Integer)
    is
        L, T, R, B : Interfaces.C.int;
    begin
        fl_paged_device_margins (This.Void_Ptr, L, T, R, B);
        Left := Integer (L);
        Top := Integer (T);
        Right := Integer (R);
        Bottom := Integer (B);
    end Get_Margins;


    procedure Get_Printable_Rect
           (This : in     Paged_Surface;
            W, H :    out Integer)
    is
        Wid, Hei : Interfaces.C.int;
    begin
        if fl_paged_device_printable_rect (This.Void_Ptr, Wid, Hei) /= 0 then
            raise Page_Error;
        else
            W := Integer (Wid);
            H := Integer (Hei);
        end if;
    end Get_Printable_Rect;


    procedure Get_Origin
           (This : in     Paged_Surface;
            X, Y :    out Integer)
    is
        Eks, Why : Interfaces.C.int;
    begin
        fl_paged_device_get_origin (This.Void_Ptr, Eks, Why);
        X := Integer (Eks);
        Y := Integer (Why);
    end Get_Origin;


    procedure Set_Origin
           (This : in out Paged_Surface;
            X, Y : in     Integer) is
    begin
        fl_paged_device_set_origin
           (This.Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y));
    end Set_Origin;


    procedure Rotate
           (This    : in out Paged_Surface;
            Degrees : in     Float) is
    begin
        fl_paged_device_rotate (This.Void_Ptr, Interfaces.C.C_float (Degrees));
    end Rotate;


    procedure Scale
           (This   : in out Paged_Surface;
            Factor : in     Float) is
    begin
        fl_paged_device_scale (This.Void_Ptr, Interfaces.C.C_float (Factor), 0.0);
    end Scale;


    procedure Scale
           (This               : in out Paged_Surface;
            Factor_X, Factor_Y : in     Float) is
    begin
        fl_paged_device_scale
           (This.Void_Ptr,
            Interfaces.C.C_float (Factor_X),
            Interfaces.C.C_float (Factor_Y));
    end Scale;


    procedure Translate
           (This             : in out Paged_Surface;
            Delta_X, Delta_Y : in     Integer) is
    begin
        fl_paged_device_translate
           (This.Void_Ptr,
            Interfaces.C.int (Delta_X),
            Interfaces.C.int (Delta_Y));
    end Translate;


    procedure Untranslate
           (This : in out Paged_Surface) is
    begin
        fl_paged_device_untranslate (This.Void_Ptr);
    end Untranslate;




    procedure Print_Widget
           (This               : in out Paged_Surface;
            Item               : in     FLTK.Widgets.Widget'Class;
            Offset_X, Offset_Y : in     Integer := 0) is
    begin
        fl_paged_device_print_widget
           (This.Void_Ptr,
            Wrapper (Item).Void_Ptr,
            Interfaces.C.int (Offset_X),
            Interfaces.C.int (Offset_Y));
    end Print_Widget;


    procedure Print_Window
           (This               : in out Paged_Surface;
            Item               : in     FLTK.Widgets.Groups.Windows.Window'Class;
            Offset_X, Offset_Y : in     Integer := 0) is
    begin
        fl_paged_device_print_window
           (This.Void_Ptr,
            Wrapper (Item).Void_Ptr,
            Interfaces.C.int (Offset_X),
            Interfaces.C.int (Offset_Y));
    end Print_Window;


    procedure Print_Window_Part
           (This               : in out Paged_Surface;
            Item               : in     FLTK.Widgets.Groups.Windows.Window'Class;
            X, Y, W, H         : in     Integer;
            Offset_X, Offset_Y : in     Integer := 0) is
    begin
        fl_paged_device_print_window_part
           (This.Void_Ptr,
            Wrapper (Item).Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.int (Offset_X),
            Interfaces.C.int (Offset_Y));
    end Print_Window_Part;


end FLTK.Devices.Surfaces.Paged;

