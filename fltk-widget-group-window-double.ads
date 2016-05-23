

package FLTK.Widget.Group.Window.Double is


    type Double_Type is new Window_Type with private;


    function Create (X, Y, W, H : Integer; Label : String) return Double_Type;
    function Create (W, H : in Integer) return Double_Type;

    procedure Show (W : in Double_Type);


private


    type Double_Type is new Window_Type with null record;


    overriding procedure Finalize (This : in out Double_Type);


end FLTK.Widget.Group.Window.Double;

