

package FLTK.Widgets.Clocks.Updated is


    type Updated_Clock is new Clock with private;

    type Updated_Clock_Reference (Data : not null access Updated_Clock'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Updated_Clock;

        function Create
               (Kind       : in Box_Kind;
                X, Y, W, H : in Integer;
                Text       : in String)
            return Updated_Clock;

    end Forge;




    procedure Draw
           (This : in out Updated_Clock);

    procedure Draw
           (This       : in out Clock;
            X, Y, W, H : in     Integer);

    function Handle
           (This  : in out Updated_Clock;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Updated_Clock is new Clock with null record;

    overriding procedure Finalize
           (This : in out Updated_Clock);




    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Clocks.Updated;

