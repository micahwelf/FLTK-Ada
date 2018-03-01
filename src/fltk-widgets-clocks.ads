

package FLTK.Widgets.Clocks is


    type Clock is new Widget with private;

    subtype Hour is Integer range 0 .. 23;
    subtype Minute is Integer range 0 .. 59;
    subtype Second is Integer range 0 .. 60;

    type Time_Value is mod 2 ** 32;




    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Clock;




    function Get_Hour
           (This : in Clock)
        return Hour;

    function Get_Minute
           (This : in Clock)
        return Minute;

    function Get_Second
           (This : in Clock)
        return Second;




    function Get_Time
           (This : in Clock)
        return Time_Value;

    procedure Set_Time
           (This : in out Clock;
            To   : in     Time_Value);

    procedure Set_Time
           (This    : in out Clock;
            Hours   : in     Hour;
            Minutes : in     Minute;
            Seconds : in     Second);




    procedure Draw
           (This : in out Clock);

    function Handle
           (This  : in out Clock;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Clock is new Widget with null record;

    overriding procedure Finalize
           (This : in out Clock);


end FLTK.Widgets.Clocks;

