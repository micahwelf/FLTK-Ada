

with

    FLTK.Devices.Graphics;


package FLTK.Devices.Surfaces is


    type Surface_Device is new Device with private;

    type Surface_Device_Reference (Data : not null access Surface_Device'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (Graphics : in out FLTK.Devices.Graphics.Graphics_Driver)
            return Surface_Device;

    end Forge;




    function Get_Current
        return access Surface_Device'Class;

    procedure Set_Current
           (This : in out Surface_Device);


private


    type Surface_Device is new Device with null record;

    overriding procedure Finalize
           (This : in out Surface_Device);




    Original_Surface : aliased Surface_Device;
    Current_Ptr : access Surface_Device'Class := Original_Surface'Access;




    pragma Inline (Get_Current);
    pragma Inline (Set_Current);


end FLTK.Devices.Surfaces;

