

package FLTK.Widgets.Groups.Windows.Single.Menu is


    type Menu_Window is new Single_Window with private;
    type Menu_Window_Access is access all Menu_Window;


    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Menu_Window;


    function Create
           (W, H : in Integer)
        return Menu_Window;


    procedure Show
           (M : in Menu_Window);


    procedure Hide
           (M : in Menu_Window);


    procedure Flush
           (M : in out Menu_Window);


    function Get_Overlay
           (M : in Menu_Window)
        return Boolean;


    procedure Set_Overlay
           (M : in out Menu_Window;
            V : in     Boolean);


private


    type Menu_Window is new Single_Window with null record;


    overriding procedure Finalize
           (This : in out Menu_Window);


end FLTK.Widgets.Groups.Windows.Single.Menu;

