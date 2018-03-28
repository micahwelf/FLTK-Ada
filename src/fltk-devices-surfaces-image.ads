

with

    FLTK.Images.RGB,
    FLTK.Images.Shared,
    FLTK.Widgets.Groups.Windows;


package FLTK.Devices.Surfaces.Image is


    type Image_Surface is new Surface_Device with private;




    package Forge is

        function Create
               (W, H    : in Integer;
                Highres : in Boolean := False)
            return Image_Surface;

    end Forge;




    function Is_Highres
           (This : in Image_Surface)
        return Boolean;




    procedure Draw_Widget
           (This               : in out Image_Surface;
            Item               : in     FLTK.Widgets.Widget'Class;
            Offset_X, Offset_Y : in     Integer := 0);

    procedure Draw_Decorated_Window
           (This               : in out Image_Surface;
            Item               : in     FLTK.Widgets.Groups.Windows.Window'Class;
            Offset_X, Offset_Y : in     Integer := 0);




    function Get_Image
           (This : in Image_Surface)
        return FLTK.Images.RGB.RGB_Image;

    function Get_Highres_Image
           (This : in Image_Surface)
        return FLTK.Images.Shared.Shared_Image;




    procedure Set_Current
           (This : in out Image_Surface);


private


    type Image_Surface is new Surface_Device with record
        High : Boolean := False;
    end record;

    overriding procedure Finalize
           (This : in out Image_Surface);


end FLTK.Devices.Surfaces.Image;

