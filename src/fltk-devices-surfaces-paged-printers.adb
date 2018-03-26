

with

    Interfaces.C,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Devices.Surfaces.Paged.Printers is


    function new_fl_printer
        return System.Address;
    pragma Import (C, new_fl_printer, "new_fl_printer");

    procedure free_fl_printer
           (D : in System.Address);
    pragma Import (C, free_fl_printer, "free_fl_printer");




    function fl_printer_start_job
           (D : in System.Address;
            C : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_printer_start_job, "fl_printer_start_job");

    function fl_printer_start_job2
           (D       : in System.Address;
            C, F, T : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_printer_start_job2, "fl_printer_start_job2");

    procedure fl_printer_end_job
           (D : in System.Address);
    pragma Import (C, fl_printer_end_job, "fl_printer_end_job");

    function fl_printer_start_page
           (D : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_printer_start_page, "fl_printer_start_page");

    function fl_printer_end_page
           (D : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_printer_end_page, "fl_printer_end_page");




    procedure fl_printer_margins
           (D          : in     System.Address;
            L, T, R, B :    out Interfaces.C.int);
    pragma Import (C, fl_printer_margins, "fl_printer_margins");

    function fl_printer_printable_rect
           (D    : in     System.Address;
            W, H :    out Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_printer_printable_rect, "fl_printer_printable_rect");

    procedure fl_printer_get_origin
           (D    : in     System.Address;
            X, Y :    out Interfaces.C.int);
    pragma Import (C, fl_printer_get_origin, "fl_printer_get_origin");

    procedure fl_printer_set_origin
           (D    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_printer_set_origin, "fl_printer_set_origin");

    procedure fl_printer_rotate
           (D : in System.Address;
            R : in Interfaces.C.C_float);
    pragma Import (C, fl_printer_rotate, "fl_printer_rotate");

    procedure fl_printer_scale
           (D    : in System.Address;
            X, Y : in Interfaces.C.C_float);
    pragma Import (C, fl_printer_scale, "fl_printer_scale");

    procedure fl_printer_translate
           (D    : in System.Address;
            X, Y : in Interfaces.C.int);
    pragma Import (C, fl_printer_translate, "fl_printer_translate");

    procedure fl_printer_untranslate
           (D : in System.Address);
    pragma Import (C, fl_printer_untranslate, "fl_printer_untranslate");




    procedure fl_printer_print_widget
           (D, I   : in System.Address;
            DX, DY : in Interfaces.C.int);
    pragma Import (C, fl_printer_print_widget, "fl_printer_print_widget");

    procedure fl_printer_print_window_part
           (D, I               : in System.Address;
            X, Y, W, H, DX, DY : in Interfaces.C.int);
    pragma Import (C, fl_printer_print_window_part, "fl_printer_print_window_part");




    procedure fl_printer_set_current
           (D : in System.Address);
    pragma Import (C, fl_printer_set_current, "fl_printer_set_current");




    procedure Finalize
           (This : in out Printer) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Printer'Class
        then
            free_fl_printer (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Paged_Surface (This));
    end Finalize;




    package body Forge is

        function Create
            return Printer is
        begin
            return This : Printer do
                This.Void_Ptr := new_fl_printer;
            end return;
        end Create;

    end Forge;




    procedure Start_Job
           (This  : in out Printer;
            Count : in     Natural) is
    begin
        if fl_printer_start_job
            (This.Void_Ptr, Interfaces.C.int (Count)) /= 0
        then
            raise Page_Error;
        end if;
    end Start_Job;


    procedure Start_Job
           (This     : in out Printer;
            Count    : in     Natural;
            From, To : in     Positive) is
    begin
        if fl_printer_start_job2
           (This.Void_Ptr,
            Interfaces.C.int (Count),
            Interfaces.C.int (From),
            Interfaces.C.int (To)) /= 0
        then
            raise Page_Error;
        end if;
    end Start_Job;


    procedure End_Job
           (This : in out Printer) is
    begin
        fl_printer_end_job (This.Void_Ptr);
    end End_Job;


    procedure Start_Page
           (This : in out Printer) is
    begin
        if fl_printer_start_page (This.Void_Ptr) /= 0 then
            raise Page_Error;
        end if;
    end Start_Page;


    procedure End_Page
           (This : in out Printer) is
    begin
        if fl_printer_end_page (This.Void_Ptr) /= 0 then
            raise Page_Error;
        end if;
    end End_Page;




    procedure Get_Margins
           (This                     : in     Printer;
            Left, Top, Right, Bottom :    out Integer)
    is
        L, T, R, B : Interfaces.C.int;
    begin
        fl_printer_margins (This.Void_Ptr, L, T, R, B);
        Left := Integer (L);
        Top := Integer (T);
        Right := Integer (R);
        Bottom := Integer (B);
    end Get_Margins;


    procedure Get_Printable_Rect
           (This : in     Printer;
            W, H :    out Integer)
    is
        Wid, Hei : Interfaces.C.int;
    begin
        if fl_printer_printable_rect (This.Void_Ptr, Wid, Hei) /= 0 then
            raise Page_Error;
        else
            W := Integer (Wid);
            H := Integer (Hei);
        end if;
    end Get_Printable_Rect;


    procedure Get_Origin
           (This : in     Printer;
            X, Y :    out Integer)
    is
        Eks, Why : Interfaces.C.int;
    begin
        fl_printer_get_origin (This.Void_Ptr, Eks, Why);
        X := Integer (Eks);
        Y := Integer (Why);
    end Get_Origin;


    procedure Set_Origin
           (This : in out Printer;
            X, Y : in     Integer) is
    begin
        fl_printer_set_origin
           (This.Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y));
    end Set_Origin;


    procedure Rotate
           (This    : in out Printer;
            Degrees : in     Float) is
    begin
        fl_printer_rotate (This.Void_Ptr, Interfaces.C.C_float (Degrees));
    end Rotate;


    procedure Scale
           (This   : in out Printer;
            Factor : in     Float) is
    begin
        fl_printer_scale (This.Void_Ptr, Interfaces.C.C_float (Factor), 0.0);
    end Scale;


    procedure Scale
           (This               : in out Printer;
            Factor_X, Factor_Y : in     Float) is
    begin
        fl_printer_scale
           (This.Void_Ptr,
            Interfaces.C.C_float (Factor_X),
            Interfaces.C.C_float (Factor_Y));
    end Scale;


    procedure Translate
           (This             : in out Printer;
            Delta_X, Delta_Y : in     Integer) is
    begin
        fl_printer_translate
           (This.Void_Ptr,
            Interfaces.C.int (Delta_X),
            Interfaces.C.int (Delta_Y));
    end Translate;


    procedure Untranslate
           (This : in out Printer) is
    begin
        fl_printer_untranslate (This.Void_Ptr);
    end Untranslate;




    procedure Print_Widget
           (This               : in out Printer;
            Item               : in     FLTK.Widgets.Widget'Class;
            Offset_X, Offset_Y : in     Integer := 0) is
    begin
        fl_printer_print_widget
           (This.Void_Ptr,
            Wrapper (Item).Void_Ptr,
            Interfaces.C.int (Offset_X),
            Interfaces.C.int (Offset_Y));
    end Print_Widget;


    procedure Print_Window_Part
           (This               : in out Printer;
            Item               : in     FLTK.Widgets.Groups.Windows.Window'Class;
            X, Y, W, H         : in     Integer;
            Offset_X, Offset_Y : in     Integer := 0) is
    begin
        fl_printer_print_window_part
           (This.Void_Ptr,
            Wrapper (Item).Void_Ptr,
            Interfaces.C.int (X),
            Interfaces.C.int (Y),
            Interfaces.C.int (W),
            Interfaces.C.int (H),
            Interfaces.C.int (Offset_X),
            Interfaces.C.int (Offset_Y));
    end Print_Window_Part;




    procedure Set_Current
           (This : in out Printer) is
    begin
        fl_printer_set_current (This.Void_Ptr);
        Current_Ptr := This'Unchecked_Access;
    end Set_Current;


end FLTK.Devices.Surfaces.Paged.Printers;

