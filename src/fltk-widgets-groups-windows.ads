

with FLTK.Images.RGB;
private with Interfaces.C;


package FLTK.Widgets.Groups.Windows is


    type Window is new Group with private;


    type Border_State is (None, Visible);


    type Cursor is
           (Default, Arrow, Crosshair, Wait,
            Insert, Hand, Help, Move,
            NS, WE, NWSE, NESW,
            N, NE, E, SE, S, SW, W, NW,
            None);


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Window;


    function Create
           (W, H : in Integer)
        return Window;


    procedure Show
           (This : in Window);


    procedure Hide
           (This : in Window);


    procedure Make_Current
           (This : in out Window);


    function Get_Border
           (This : in Window)
        return Border_State;


    procedure Set_Border
           (This : in out Window;
            To   : in     Border_State);


    procedure Set_Label
           (This : in out Window;
            Text : in     String);


    procedure Set_Size_Range
           (This                           : in out Window;
            Min_W, Min_H                   : in     Integer;
            Max_W, Max_H, Incre_W, Incre_H : in     Integer := 0;
            Keep_Aspect                    : in     Boolean := False);


    procedure Set_Icon
           (This : in out Window;
            Pic  : in out FLTK.Images.RGB.RGB_Image'Class);


    procedure Set_Modal
           (This : in out Window);


    procedure Set_Non_Modal
           (This : in out Window);


    procedure Set_Cursor
           (This : in out Window;
            To   : in     Cursor);


    procedure Set_Default_Cursor
           (This : in out Window;
            To   : in     Cursor);


    function Get_X_Root
           (This : in Window)
        return Integer;


    function Get_Y_Root
           (This : in Window)
        return Integer;


    function Get_Decorated_W
           (This : in Window)
        return Integer;


    function Get_Decorated_H
           (This : in Window)
        return Integer;


    procedure Draw
           (This : in out Window);


    function Handle
           (This  : in out Window;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Window is new Group with null record;


    overriding procedure Finalize
           (This : in out Window);


    --  What delightful magic numbers FLTK cursors are!
    --  (These correspond to the enum found in Enumerations.H)
    Cursor_Values : array (Cursor) of Interfaces.C.int :=
           (Default   => 0,
            Arrow     => 35,
            Crosshair => 66,
            Wait      => 76,
            Insert    => 77,
            Hand      => 31,
            Help      => 47,
            Move      => 27,
            NS        => 78,
            WE        => 79,
            NWSE      => 80,
            NESW      => 81,
            N         => 70,
            NE        => 69,
            E         => 49,
            SE        => 8,
            S         => 9,
            SW        => 7,
            W         => 36,
            NW        => 68,
            None      => 255);


end FLTK.Widgets.Groups.Windows;

