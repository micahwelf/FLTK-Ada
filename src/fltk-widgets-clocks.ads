

package FLTK.Widgets.Clocks is


    type Clock is new Widget with private;

    type Clock_Reference (Data : not null access Clock'Class) is limited null record
        with Implicit_Dereference => Data;

    subtype Hour is Integer range 0 .. 23;
    subtype Minute is Integer range 0 .. 59;
    subtype Second is Integer range 0 .. 60;

    type Time_Value is mod 2 ** 32;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Clock;

    end Forge;




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

    procedure Draw
           (This       : in out Clock;
            X, Y, W, H : in     Integer);

    function Handle
           (This  : in out Clock;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Clock is new Widget with null record;

    overriding procedure Finalize
           (This : in out Clock);




    pragma Inline (Get_Hour);
    pragma Inline (Get_Minute);
    pragma Inline (Get_Second);


    pragma Inline (Get_Time);
    pragma Inline (Set_Time);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Clocks;

