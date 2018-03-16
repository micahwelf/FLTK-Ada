

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Sliders.Scrollbars is


    procedure scrollbar_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, scrollbar_set_draw_hook, "scrollbar_set_draw_hook");

    procedure scrollbar_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, scrollbar_set_handle_hook, "scrollbar_set_handle_hook");




    function new_fl_scrollbar
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_scrollbar, "new_fl_scrollbar");

    procedure free_fl_scrollbar
           (D : in System.Address);
    pragma Import (C, free_fl_scrollbar, "free_fl_scrollbar");




    function fl_scrollbar_get_linesize
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_scrollbar_get_linesize, "fl_scrollbar_get_linesize");

    procedure fl_scrollbar_set_linesize
           (S : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_scrollbar_set_linesize, "fl_scrollbar_set_linesize");

    function fl_scrollbar_get_value
           (S : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_scrollbar_get_value, "fl_scrollbar_get_value");

    procedure fl_scrollbar_set_value
           (S : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_scrollbar_set_value, "fl_scrollbar_set_value");

    procedure fl_scrollbar_set_value2
           (S          : in System.Address;
            P, W, F, T : in Interfaces.C.int);
    pragma Import (C, fl_scrollbar_set_value2, "fl_scrollbar_set_value2");




    procedure fl_scrollbar_draw
           (W : in System.Address);
    pragma Import (C, fl_scrollbar_draw, "fl_scrollbar_draw");

    function fl_scrollbar_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_scrollbar_handle, "fl_scrollbar_handle");




    procedure Finalize
           (This : in out Scrollbar) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Scrollbar'Class
        then
            free_fl_scrollbar (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Slider (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Scrollbar is
        begin
            return This : Scrollbar do
                This.Void_Ptr := new_fl_scrollbar
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                scrollbar_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                scrollbar_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_Line_Size
           (This : in Scrollbar)
        return Natural is
    begin
        return Natural (fl_scrollbar_get_linesize (This.Void_Ptr));
    end Get_Line_Size;


    procedure Set_Line_Size
           (This : in out Scrollbar;
            To   : in     Natural) is
    begin
        fl_scrollbar_set_linesize (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Line_Size;


    function Get_Position
           (This : in Scrollbar)
        return Natural is
    begin
        return Natural (fl_scrollbar_get_value (This.Void_Ptr));
    end Get_Position;


    procedure Set_Position
           (This : in out Scrollbar;
            To   : in     Natural) is
    begin
        fl_scrollbar_set_value (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Position;


    procedure Set_All
           (This        : in out Scrollbar;
            Position    : in     Natural;
            Win_Size    : in     Natural;
            First_Line  : in     Natural;
            Total_Lines : in     Natural) is
    begin
        fl_scrollbar_set_value2
           (This.Void_Ptr,
            Interfaces.C.int (Position),
            Interfaces.C.int (Win_Size),
            Interfaces.C.int (First_Line),
            Interfaces.C.int (Total_Lines));
    end Set_All;




    procedure Draw
           (This : in out Scrollbar) is
    begin
        fl_scrollbar_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Scrollbar;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_scrollbar_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Sliders.Scrollbars;

