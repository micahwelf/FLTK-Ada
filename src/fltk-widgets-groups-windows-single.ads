

package FLTK.Widgets.Groups.Windows.Single is


    type Single_Window is new Window with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Single_Window;


    function Create
           (W, H : in Integer)
        return Single_Window;


    procedure Show
           (This : in out Single_Window);


    procedure Flush
           (This : in out Single_Window);


    procedure Draw
           (This : in out Single_Window);


    function Handle
           (This  : in out Single_Window;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Single_Window is new Window with null record;


    overriding procedure Finalize
           (This : in out Single_Window);


end FLTK.Widgets.Groups.Windows.Single;

