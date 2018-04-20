

package FLTK.Widgets.Valuators.Sliders is


    type Slider is new Valuator with private;

    type Slider_Reference (Data : not null access Slider'Class) is limited null record
        with Implicit_Dereference => Data;

    type Slider_Kind is
       (Vertical_Kind, Horizontal_Kind,
        Vert_Fill_Kind, Hor_Fill_Kind,
        Vert_Nice_Kind, Hor_Nice_Kind);




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Slider;

    end Forge;




    function Get_Slider_Type
           (This : in Slider)
        return Slider_Kind;

    procedure Set_Bounds
           (This     : in out Slider;
            Min, Max : in     Long_Float);

    function Get_Box
           (This : in Slider)
        return Box_Kind;

    procedure Set_Box
           (This : in out Slider;
            To   : in     Box_Kind);

    function Get_Slide_Size
           (This : in Slider)
        return Float;

    procedure Set_Slide_Size
           (This : in out Slider;
            To   : in     Float);

    procedure Set_Scrollvalue
           (This            : in out Slider;
            Pos_First_Line  : in     Natural;
            Lines_In_Window : in     Natural;
            First_Line_Num  : in     Natural;
            Total_Lines     : in     Natural);




    procedure Draw
           (This : in out Slider);

    function Handle
           (This  : in out Slider;
            Event : in     Event_Kind)
        return Event_Outcome;




    package Extra is

        procedure Set_Slider_Type
               (This : in out Slider;
                To   : in     Slider_Kind);

    end Extra;


private


    type Slider is new Valuator with null record;

    overriding procedure Finalize
           (This : in out Slider);




    pragma Inline (Get_Slider_Type);
    pragma Inline (Set_Bounds);
    pragma Inline (Get_Box);
    pragma Inline (Set_Box);
    pragma Inline (Get_Slide_Size);
    pragma Inline (Set_Slide_Size);
    pragma Inline (Set_Scrollvalue);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Valuators.Sliders;

