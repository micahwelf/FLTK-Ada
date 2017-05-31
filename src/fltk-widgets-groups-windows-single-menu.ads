

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
           (This : in out Menu_Window);


    procedure Hide
           (This : in out Menu_Window);


    procedure Flush
           (This : in out Menu_Window);


    function Get_Overlay
           (This : in Menu_Window)
        return Boolean;


    procedure Set_Overlay
           (This  : in out Menu_Window;
            Value : in     Boolean);


    procedure Draw
           (This : in out Menu_Window);


    function Handle
           (This  : in out Menu_Window;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Menu_Window is new Single_Window with null record;


    overriding procedure Finalize
           (This : in out Menu_Window);


end FLTK.Widgets.Groups.Windows.Single.Menu;

