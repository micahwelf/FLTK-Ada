

package FLTK.Widgets.Groups.Windows is


    type Window is new Group with private;


    function Create (X, Y, W, H : Integer; Label : String) return Window;
    function Create (W, H : in Integer) return Window;

    procedure Show (W : in Window);


private


    type Window is new Group with null record;


    overriding procedure Finalize (This : in out Window);


end FLTK.Widgets.Groups.Windows;

