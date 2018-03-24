

with

    FLTK.Widgets.Groups.Windows;


package FLTK.Devices.Surfaces.Paged is


    type Paged_Surface is new Surface_Device with private;

    type Page_Format is
       (A0, A1, A2, A3, A4, A5, A6, A7, A8, A9,
        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10,
        C5E, DLE, Executive, Folio, Ledger,
        Legal, Letter, Tabloid, Envelope);

    type Page_Layout is
       (Potrait, Landscape, Reversed, Orientation);




    Page_Error : exception;




    package Forge is

        function Create
            return Paged_Surface;

    end Forge;




    procedure Start_Job
           (This  : in out Paged_Surface;
            Count : in     Natural);

    procedure Start_Job
           (This     : in out Paged_Surface;
            Count    : in     Natural;
            From, To : in     Positive);

    procedure End_Job
           (This : in out Paged_Surface);

    procedure Start_Page
           (This : in out Paged_Surface);

    procedure End_Page
           (This : in out Paged_Surface);




    procedure Get_Margins
           (This                     : in     Paged_Surface;
            Left, Top, Right, Bottom :    out Integer);

    procedure Get_Printable_Rect
           (This : in     Paged_Surface;
            W, H :    out Integer);

    procedure Get_Origin
           (This : in     Paged_Surface;
            X, Y :    out Integer);

    procedure Set_Origin
           (This : in out Paged_Surface;
            X, Y : in     Integer);

    procedure Rotate
           (This    : in out Paged_Surface;
            Degrees : in     Float);

    procedure Scale
           (This   : in out Paged_Surface;
            Factor : in     Float);

    procedure Scale
           (This               : in out Paged_Surface;
            Factor_X, Factor_Y : in     Float);

    procedure Translate
           (This             : in out Paged_Surface;
            Delta_X, Delta_Y : in     Integer);

    procedure Untranslate
           (This : in out Paged_Surface);




    procedure Print_Widget
           (This               : in out Paged_Surface;
            Item               : in     FLTK.Widgets.Widget'Class;
            Offset_X, Offset_Y : in     Integer := 0);

    procedure Print_Window
           (This               : in out Paged_Surface;
            Item               : in     FLTK.Widgets.Groups.Windows.Window'Class;
            Offset_X, Offset_Y : in     Integer := 0);

    procedure Print_Window_Part
           (This               : in out Paged_Surface;
            Item               : in     FLTK.Widgets.Groups.Windows.Window'Class;
            X, Y, W, H         : in     Integer;
            Offset_X, Offset_Y : in     Integer := 0);


private


    type Paged_Surface is new Surface_Device with null record;

    overriding procedure Finalize
           (This : in out Paged_Surface);


end FLTK.Devices.Surfaces.Paged;

