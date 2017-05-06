

package FLTK.Widgets.Groups.Windows.Single is


    type Single_Window is new Window with private;


    function Create
           (X, Y, W, H : in Integer;
            Text       : in String)
        return Single_Window;


    function Create
           (W, H : in Integer)
        return Single_Window;


    procedure Show
           (This : in Single_Window);


    procedure Flush
           (This : in out Single_Window);


    procedure Draw
           (This : in out Single_Window);


private


    type Single_Window is new Window with null record;


    overriding procedure Finalize
           (This : in out Single_Window);


    package Single_Window_Convert is new System.Address_To_Access_Conversions
           (Single_Window'Class);


end FLTK.Widgets.Groups.Windows.Single;

