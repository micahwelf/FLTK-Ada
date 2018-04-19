

package FLTK.Widgets.Valuators is


    type Valuator is new Widget with private;

    type Valuator_Reference (Data : not null access Valuator'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Valuator;

    end Forge;




    function Clamp
           (This  : in Valuator;
            Input : in Long_Float)
        return Long_Float;

    function Round
           (This  : in Valuator;
            Input : in Long_Float)
        return Long_Float;

    function Increment
           (This  : in Valuator;
            Input : in Long_Float;
            Step  : in Integer)
        return Long_Float;




    function Get_Minimum
           (This : in Valuator)
        return Long_Float;

    procedure Set_Minimum
           (This : in out Valuator;
            To   : in     Long_Float);

    function Get_Maximum
           (This : in Valuator)
        return Long_Float;

    procedure Set_Maximum
           (This : in out Valuator;
            To   : in     Long_Float);

    function Get_Step
           (This : in Valuator)
        return Long_Float;

    procedure Set_Step
           (This : in out Valuator;
            To   : in     Long_Float);

    function Get_Value
           (This : in Valuator)
        return Long_Float;

    procedure Set_Value
           (This : in out Valuator;
            To   : in     Long_Float);

    procedure Set_Bounds
           (This     : in out Valuator;
            Min, Max : in     Long_Float);

    procedure Set_Precision
           (This : in out Valuator;
            To   : in     Integer);

    procedure Set_Range
           (This     : in out Valuator;
            Min, Max : in     Long_Float);




    function Handle
           (This  : in out Valuator;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Valuator is new Widget with null record;

    overriding procedure Finalize
           (This : in out Valuator);




    pragma Inline (Clamp);
    pragma Inline (Round);
    pragma Inline (Increment);


    pragma Inline (Get_Minimum);
    pragma Inline (Set_Minimum);
    pragma Inline (Get_Maximum);
    pragma Inline (Set_Maximum);
    pragma Inline (Get_Step);
    pragma Inline (Set_Step);
    pragma Inline (Get_Value);
    pragma Inline (Set_Value);
    pragma Inline (Set_Bounds);
    pragma Inline (Set_Precision);
    pragma Inline (Set_Range);


    pragma Inline (Handle);


end FLTK.Widgets.Valuators;

