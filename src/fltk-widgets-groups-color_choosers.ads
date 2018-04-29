

package FLTK.Widgets.Groups.Color_Choosers is


    type Color_Chooser is new Group with private;

    type Color_Chooser_Reference (Data : not null access Color_Chooser'Class) is
        limited null record with Implicit_Dereference => Data;

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




    procedure HSV_To_RGB
           (H, S, V : in     Long_Float;
            R, G, B :    out Long_Float);

    procedure RGB_To_HSV
           (R, G, B : in     Long_Float;
            H, S, V :    out Long_Float);




    function Color_Was_Changed
           (This : in Color_Chooser)
        return Boolean;

    procedure Clear_Changed
           (This : in out Color_Chooser);




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




    pragma Inline (Get_Red);
    pragma Inline (Get_Green);
    pragma Inline (Get_Blue);
    pragma Inline (Set_RGB);


    pragma Inline (Get_Hue);
    pragma Inline (Get_Saturation);
    pragma Inline (Get_Value);
    pragma Inline (Set_HSV);


    pragma Inline (HSV_To_RGB);
    pragma Inline (RGB_To_HSV);


    pragma Inline (Color_Was_Changed);
    pragma Inline (Clear_Changed);


    pragma Inline (Get_Mode);
    pragma Inline (Set_Mode);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups.Color_Choosers;

