

with

    FLTK.Widgets.Groups.Windows;


package FLTK.Devices.Surfaces.Paged.Printers is


    type Printer is new Paged_Surface with private;

    type Printer_Reference (Data : not null access Printer'Class) is limited null record
        with Implicit_Dereference => Data;




    package Forge is

        function Create
            return Printer;

    end Forge;




    procedure Start_Job
           (This  : in out Printer;
            Count : in     Natural);

    procedure Start_Job
           (This     : in out Printer;
            Count    : in     Natural;
            From, To : in     Positive);

    procedure End_Job
           (This : in out Printer);

    procedure Start_Page
           (This : in out Printer);

    procedure End_Page
           (This : in out Printer);




    procedure Get_Margins
           (This                     : in     Printer;
            Left, Top, Right, Bottom :    out Integer);

    procedure Get_Printable_Rect
           (This : in     Printer;
            W, H :    out Integer);

    procedure Get_Origin
           (This : in     Printer;
            X, Y :    out Integer);

    procedure Set_Origin
           (This : in out Printer;
            X, Y : in     Integer);

    procedure Rotate
           (This    : in out Printer;
            Degrees : in     Float);

    procedure Scale
           (This   : in out Printer;
            Factor : in     Float);

    procedure Scale
           (This               : in out Printer;
            Factor_X, Factor_Y : in     Float);

    procedure Translate
           (This             : in out Printer;
            Delta_X, Delta_Y : in     Integer);

    procedure Untranslate
           (This : in out Printer);




    procedure Print_Widget
           (This               : in out Printer;
            Item               : in     FLTK.Widgets.Widget'Class;
            Offset_X, Offset_Y : in     Integer := 0);

    procedure Print_Window_Part
           (This               : in out Printer;
            Item               : in     FLTK.Widgets.Groups.Windows.Window'Class;
            X, Y, W, H         : in     Integer;
            Offset_X, Offset_Y : in     Integer := 0);




    procedure Set_Current
           (This : in out Printer);


private


    type Printer is new Paged_Surface with null record;

    overriding procedure Finalize
           (This : in out Printer);




    pragma Inline (Start_Job);
    pragma Inline (End_Job);
    pragma Inline (Start_Page);
    pragma Inline (End_Page);


    pragma Inline (Get_Margins);
    pragma Inline (Get_Printable_Rect);
    pragma Inline (Get_Origin);
    pragma Inline (Set_Origin);
    pragma Inline (Rotate);
    pragma Inline (Scale);
    pragma Inline (Translate);
    pragma Inline (Untranslate);


    pragma Inline (Print_Widget);
    pragma Inline (Print_Window_Part);


    pragma Inline (Set_Current);


end FLTK.Devices.Surfaces.Paged.Printers;

