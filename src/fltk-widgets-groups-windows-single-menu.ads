

package FLTK.Widgets.Groups.Windows.Single.Menu is


    type Menu_Window is new Single_Window with private;

    type Menu_Window_Reference (Data : not null access Menu_Window'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Menu_Window;

        function Create
               (W, H : in Integer)
            return Menu_Window;

    end Forge;




    procedure Show
           (This : in out Menu_Window);

    procedure Hide
           (This : in out Menu_Window);

    procedure Flush
           (This : in out Menu_Window);




    function Is_Overlay
           (This : in Menu_Window)
        return Boolean;

    procedure Set_Overlay
           (This  : in out Menu_Window;
            Value : in     Boolean);




    procedure Draw
           (This : in out Menu_Window);

    function Handle
           (This  : in out Menu_Window;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Menu_Window is new Single_Window with null record;

    overriding procedure Finalize
           (This : in out Menu_Window);




    pragma Inline (Show);
    pragma Inline (Hide);
    pragma Inline (Flush);


    pragma Inline (Is_Overlay);
    pragma Inline (Set_Overlay);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups.Windows.Single.Menu;

