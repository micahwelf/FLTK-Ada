

package FLTK.Widgets.Valuators.Dials is


    type Dial is new Valuator with private;

    type Dial_Reference (Data : not null access Dial'Class) is limited null record
        with Implicit_Dereference => Data;

    type Dial_Kind is (Normal_Kind, Line_Kind, Fill_Kind);




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Dial;

    end Forge;




    function Get_Dial_Type
           (This : in Dial)
        return Dial_Kind;

    function Get_First_Angle
           (This : in Dial)
        return Integer;

    procedure Set_First_Angle
           (This : in out Dial;
            To   : in     Integer);

    function Get_Second_Angle
           (This : in Dial)
        return Integer;

    procedure Set_Second_Angle
           (This : in out Dial;
            To   : in     Integer);

    procedure Set_Angles
           (This     : in out Dial;
            One, Two : in     Integer);




    procedure Draw
           (This : in out Dial);

    function Handle
           (This  : in out Dial;
            Event : in     Event_Kind)
        return Event_Outcome;




    package Extra is

        procedure Set_Dial_Type
               (This : in out Dial;
                To   : in     Dial_Kind);

    end Extra;


private


    type Dial is new Valuator with null record;

    overriding procedure Finalize
           (This : in out Dial);




    pragma Inline (Get_Dial_Type);


    pragma Inline (Get_First_Angle);
    pragma Inline (Set_First_Angle);
    pragma Inline (Get_Second_Angle);
    pragma Inline (Set_Second_Angle);
    pragma Inline (Set_Angles);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Dials;

