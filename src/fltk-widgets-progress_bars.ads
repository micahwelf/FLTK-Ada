

package FLTK.Widgets.Progress_Bars is


    type Progress_Bar is new Widget with private;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Progress_Bar;




    function Get_Minimum
           (This : in Progress_Bar)
        return Float;

    procedure Set_Minimum
           (This : in out Progress_Bar;
            To   : in     Float);

    function Get_Maximum
           (This : in Progress_Bar)
        return Float;

    procedure Set_Maximum
           (This : in out Progress_Bar;
            To   : in     Float);

    function Get_Value
           (This : in Progress_Bar)
        return Float;

    procedure Set_Value
           (This : in out Progress_Bar;
            To   : in     Float);




    procedure Draw
           (This : in out Progress_Bar);

    function Handle
           (This  : in out Progress_Bar;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Progress_Bar is new Widget with null record;

    overriding procedure Finalize
           (This : in out Progress_Bar);


end FLTK.Widgets.Progress_Bars;

