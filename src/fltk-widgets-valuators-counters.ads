

package FLTK.Widgets.Valuators.Counters is


    type Counter is new Valuator with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Counter;

    end Forge;




    function Get_Step
           (This : in Counter)
        return Long_Float;

    procedure Set_Step
           (This : in out Counter;
            To   : in     Long_Float);

    function Get_Long_Step
           (This : in Counter)
        return Long_Float;

    procedure Set_Long_Step
           (This : in out Counter;
            To   : in     Long_Float);




    function Get_Text_Color
           (This : in Counter)
        return Color;

    procedure Set_Text_Color
           (This : in out Counter;
            To   : in     Color);

    function Get_Text_Font
           (This : in Counter)
        return Font_Kind;

    procedure Set_Text_Font
           (This : in out Counter;
            To   : in     Font_Kind);

    function Get_Text_Size
           (This : in Counter)
        return Font_Size;

    procedure Set_Text_Size
           (This : in out Counter;
            To   : in     Font_Size);




    procedure Draw
           (This : in out Counter);

    function Handle
           (This  : in out Counter;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Counter is new Valuator with record
        --  Needed because Fl_Counter doesn't have
        --  a way to retrieve this value otherwise.
        Long_Step : Long_Float := 1.0;
    end record;

    overriding procedure Finalize
           (This : in out Counter);


end FLTK.Widgets.Valuators.Counters;

