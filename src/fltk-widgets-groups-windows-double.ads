

package FLTK.Widgets.Groups.Windows.Double is


    type Double_Window is new Window with private;

    type Double_Window_Reference (Data : not null access Double_Window'Class) is
        limited null record with Implicit_Dereference => Data;



    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Double_Window;

        function Create
               (W, H : in Integer)
            return Double_Window;

    end Forge;




    procedure Show
           (This : in out Double_Window);

    procedure Hide
           (This : in out Double_Window);

    procedure Flush
           (This : in out Double_Window);




    procedure Draw
           (This : in out Double_Window);

    function Handle
           (This  : in out Double_Window;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Double_Window is new Window with null record;

    overriding procedure Finalize
           (This : in out Double_Window);




    pragma Inline (Show);
    pragma Inline (Hide);
    pragma Inline (Flush);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups.Windows.Double;

