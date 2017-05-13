

package FLTK.Widgets.Groups.Windows.Double is


    type Double_Window is new Window with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Double_Window;


    function Create
           (W, H : in Integer)
        return Double_Window;


    procedure Show
           (This : in Double_Window);


    procedure Hide
           (This : in Double_Window);


    procedure Draw
           (This : in out Double_Window);


    function Handle
           (This  : in out Double_Window;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Double_Window is new Window with null record;


    overriding procedure Finalize
           (This : in out Double_Window);


end FLTK.Widgets.Groups.Windows.Double;

