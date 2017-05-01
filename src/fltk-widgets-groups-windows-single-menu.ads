

package FLTK.Widgets.Groups.Windows.Single.Menu is


    type Menu_Window is new Single_Window with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Menu_Window;


    function Create
           (W, H : in Integer)
        return Menu_Window;


    procedure Show
           (This : in Menu_Window);


    procedure Hide
           (This : in Menu_Window);


    procedure Flush
           (This : in out Menu_Window);


    function Get_Overlay
           (This : in Menu_Window)
        return Boolean;


    procedure Set_Overlay
           (This  : in out Menu_Window;
            Value : in     Boolean);


private


    procedure Draw
           (This : in out Menu_Window);


    type Menu_Window is new Single_Window with null record;


    overriding procedure Finalize
           (This : in out Menu_Window);


    package Menu_Window_Convert is new System.Address_To_Access_Conversions
           (Menu_Window'Class);


end FLTK.Widgets.Groups.Windows.Single.Menu;

