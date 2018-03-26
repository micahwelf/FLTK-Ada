

with

    FLTK.Widgets.Groups.Windows;


package FLTK.Devices.Surfaces.Copy is


    type Copy_Surface is new Surface_Device with private;




    package Forge is

        function Create
               (W, H : in Natural)
            return Copy_Surface;

    end Forge;




    function Get_W
           (This : in Copy_Surface)
        return Integer;

    function Get_H
           (This : in Copy_Surface)
        return Integer;




    procedure Draw_Widget
           (This               : in out Copy_Surface;
            Item               : in     FLTK.Widgets.Widget'Class;
            Offset_X, Offset_Y : in     Integer := 0);

    procedure Draw_Decorated_Window
           (This               : in out Copy_Surface;
            Item               : in     FLTK.Widgets.Groups.Windows.Window'Class;
            Offset_X, Offset_Y : in     Integer := 0);




    procedure Set_Current
           (This : in out Copy_Surface);


private


    type Copy_Surface is new Surface_Device with null record;

    overriding procedure Finalize
           (This : in out Copy_Surface);


end FLTK.Devices.Surfaces.Copy;

