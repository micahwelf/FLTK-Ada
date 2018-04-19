

with

    Interfaces.C.Strings,
    System;

use type

    System.Address;


package body FLTK.Widgets.Valuators.Counters is


    procedure counter_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, counter_set_draw_hook, "counter_set_draw_hook");
    pragma Inline (counter_set_draw_hook);

    procedure counter_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, counter_set_handle_hook, "counter_set_handle_hook");
    pragma Inline (counter_set_handle_hook);




    function new_fl_counter
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_counter, "new_fl_counter");
    pragma Inline (new_fl_counter);

    procedure free_fl_counter
           (A : in System.Address);
    pragma Import (C, free_fl_counter, "free_fl_counter");
    pragma Inline (free_fl_counter);




    function fl_counter_get_step
           (C : in System.Address)
        return Interfaces.C.double;
    pragma Import (C, fl_counter_get_step, "fl_counter_get_step");
    pragma Inline (fl_counter_get_step);

    procedure fl_counter_set_step
           (C : in System.Address;
            T : in Interfaces.C.double);
    pragma Import (C, fl_counter_set_step, "fl_counter_set_step");
    pragma Inline (fl_counter_set_step);

    procedure fl_counter_set_lstep
           (C : in System.Address;
            T : in Interfaces.C.double);
    pragma Import (C, fl_counter_set_lstep, "fl_counter_set_lstep");
    pragma Inline (fl_counter_set_lstep);




    function fl_counter_get_textcolor
           (C : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_counter_get_textcolor, "fl_counter_get_textcolor");
    pragma Inline (fl_counter_get_textcolor);

    procedure fl_counter_set_textcolor
           (C : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_counter_set_textcolor, "fl_counter_set_textcolor");
    pragma Inline (fl_counter_set_textcolor);

    function fl_counter_get_textfont
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_counter_get_textfont, "fl_counter_get_textfont");
    pragma Inline (fl_counter_get_textfont);

    procedure fl_counter_set_textfont
           (C : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_counter_set_textfont, "fl_counter_set_textfont");
    pragma Inline (fl_counter_set_textfont);

    function fl_counter_get_textsize
           (C : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_counter_get_textsize, "fl_counter_get_textsize");
    pragma Inline (fl_counter_get_textsize);

    procedure fl_counter_set_textsize
           (C : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_counter_set_textsize, "fl_counter_set_textsize");
    pragma Inline (fl_counter_set_textsize);




    procedure fl_counter_draw
           (W : in System.Address);
    pragma Import (C, fl_counter_draw, "fl_counter_draw");
    pragma Inline (fl_counter_draw);

    function fl_counter_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_counter_handle, "fl_counter_handle");
    pragma Inline (fl_counter_handle);




    procedure Finalize
           (This : in out Counter) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Counter'Class
        then
            free_fl_counter (This.Void_Ptr);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Valuator (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Counter is
        begin
            return This : Counter do
                This.Void_Ptr := new_fl_counter
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                counter_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                counter_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    function Get_Step
           (This : in Counter)
        return Long_Float is
    begin
        return Long_Float (fl_counter_get_step (This.Void_Ptr));
    end Get_Step;


    procedure Set_Step
           (This : in out Counter;
            To   : in     Long_Float) is
    begin
        fl_counter_set_step (This.Void_Ptr, Interfaces.C.double (To));
    end Set_Step;


    function Get_Long_Step
           (This : in Counter)
        return Long_Float is
    begin
        return This.Long_Step;
    end Get_Long_Step;


    procedure Set_Long_Step
           (This : in out Counter;
            To   : in     Long_Float) is
    begin
        This.Long_Step := To;
        fl_counter_set_lstep (This.Void_Ptr, Interfaces.C.double (To));
    end Set_Long_Step;




    function Get_Text_Color
           (This : in Counter)
        return Color is
    begin
        return Color (fl_counter_get_textcolor (This.Void_Ptr));
    end Get_Text_Color;


    procedure Set_Text_Color
           (This : in out Counter;
            To   : in     Color) is
    begin
        fl_counter_set_textcolor (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Text_Color;


    function Get_Text_Font
           (This : in Counter)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_counter_get_textfont (This.Void_Ptr));
    end Get_Text_Font;


    procedure Set_Text_Font
           (This : in out Counter;
            To   : in     Font_Kind) is
    begin
        fl_counter_set_textfont (This.Void_Ptr, Font_Kind'Pos (To));
    end Set_Text_Font;


    function Get_Text_Size
           (This : in Counter)
        return Font_Size is
    begin
        return Font_Size (fl_counter_get_textsize (This.Void_Ptr));
    end Get_Text_Size;


    procedure Set_Text_Size
           (This : in out Counter;
            To   : in     Font_Size) is
    begin
        fl_counter_set_textsize (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Text_Size;




    procedure Draw
           (This : in out Counter) is
    begin
        fl_counter_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Counter;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_counter_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Valuators.Counters;

