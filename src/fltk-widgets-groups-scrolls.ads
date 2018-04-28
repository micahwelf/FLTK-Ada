

package FLTK.Widgets.Groups.Scrolls is


    type Scroll is new Group with private;

    type Scroll_Reference (Data : not null access Scroll'Class) is limited null record
        with Implicit_Dereference => Data;

    type Scroll_Kind is
           (Horizontal,
            Vertical,
            Both,
            Always_On,
            Horizontal_Always,
            Vertical_Always,
            Both_Always);




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Scroll;

    end Forge;




    procedure Clear
           (This : in out Scroll);




    procedure Scroll_To
           (This : in out Scroll;
            X, Y : in     Integer);

    procedure Set_Type
           (This : in out Scroll;
            Mode : in     Scroll_Kind);




    function Get_Scrollbar_Size
           (This : in Scroll)
        return Integer;

    procedure Set_Scrollbar_Size
           (This : in out Scroll;
            To   : in     Integer);

    --  These two functions are far too similar in name and
    --  function to the Get_X and Get_Y for Widgets.
    function Get_Scroll_X
           (This : in Scroll)
        return Integer;

    function Get_Scroll_Y
           (This : in Scroll)
        return Integer;




    procedure Draw
           (This : in out Scroll);

    function Handle
           (This  : in out Scroll;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type Scroll is new Group with null record;

    overriding procedure Finalize
           (This : in out Scroll);




    pragma Inline (Clear);


    pragma Inline (Scroll_To);
    pragma Inline (Set_Type);


    pragma Inline (Get_Scrollbar_Size);
    pragma Inline (Set_Scrollbar_Size);
    pragma Inline (Get_Scroll_X);
    pragma Inline (Get_Scroll_Y);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups.Scrolls;

