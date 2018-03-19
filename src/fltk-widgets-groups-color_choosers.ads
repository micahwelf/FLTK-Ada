

package FLTK.Widgets.Groups.Color_Choosers is


    type Color_Chooser is new Group with private;

    type Color_Mode is (RGB, Byte, Hex, HSV);




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Color_Chooser;

    end Forge;




    function Get_Red
           (This : in Color_Chooser)
        return Long_Float;

    function Get_Green
           (This : in Color_Chooser)
        return Long_Float;

    function Get_Blue
           (This : in Color_Chooser)
        return Long_Float;

    procedure Set_RGB
           (This    : in out Color_Chooser;
            R, G, B : in     Long_Float);




    function Get_Hue
           (This : in Color_Chooser)
        return Long_Float;

    function Get_Saturation
           (This : in Color_Chooser)
        return Long_Float;

    function Get_Value
           (This : in Color_Chooser)
        return Long_Float;

    procedure Set_HSV
           (This    : in out Color_Chooser;
            H, S, V : in     Long_Float);




    function Color_Was_Changed
           (This : in Color_Chooser)
        return Boolean;




    function Get_Mode
           (This : in Color_Chooser)
        return Color_Mode;

    procedure Set_Mode
           (This : in out Color_Chooser;
            To   : in     Color_Mode);




    procedure Draw
           (This : in out Color_Chooser);

    function Handle
           (This  : in out Color_Chooser;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Color_Chooser is new Group with record
        Was_Changed : Boolean := False;
    end record;

    overriding procedure Finalize
           (This : in out Color_Chooser);


end FLTK.Widgets.Groups.Color_Choosers;

