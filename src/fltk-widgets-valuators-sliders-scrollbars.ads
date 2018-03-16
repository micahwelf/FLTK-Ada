

package FLTK.Widgets.Valuators.Sliders.Scrollbars is


    type Scrollbar is new Slider with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Scrollbar;

    end Forge;




    function Get_Line_Size
           (This : in Scrollbar)
        return Natural;

    procedure Set_Line_Size
           (This : in out Scrollbar;
            To   : in     Natural);

    function Get_Position
           (This : in Scrollbar)
        return Natural;

    procedure Set_Position
           (This : in out Scrollbar;
            To   : in     Natural);

    procedure Set_All
           (This        : in out Scrollbar;
            Position    : in     Natural;
            Win_Size    : in     Natural;
            First_Line  : in     Natural;
            Total_Lines : in     Natural);




    procedure Draw
           (This : in out Scrollbar);

    function Handle
           (This  : in out Scrollbar;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Scrollbar is new Slider with null record;

    overriding procedure Finalize
           (This : in out Scrollbar);


end FLTK.Widgets.Valuators.Sliders.Scrollbars;

