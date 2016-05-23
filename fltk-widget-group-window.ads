

package FLTK.Widget.Group.Window is


    type Window_Type is new Group_Type with private;


    function Create (X, Y, W, H : Integer; Label : String) return Window_Type;
    function Create (W, H : in Integer) return Window_Type;

    procedure Show (W : in Window_Type);


private


    type Window_Type is new Group_Type with null record;


    overriding procedure Finalize (This : in out Window_Type);


end FLTK.Widget.Group.Window;

