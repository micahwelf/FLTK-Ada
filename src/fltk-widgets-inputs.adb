

with

    Interfaces.C.Strings,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Widgets.Inputs is


    procedure input_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, input_set_draw_hook, "input_set_draw_hook");
    pragma Inline (input_set_draw_hook);

    procedure input_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, input_set_handle_hook, "input_set_handle_hook");
    pragma Inline (input_set_handle_hook);




    function new_fl_input
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_input, "new_fl_input");
    pragma Inline (new_fl_input);

    procedure free_fl_input
           (F : in System.Address);
    pragma Import (C, free_fl_input, "free_fl_input");
    pragma Inline (free_fl_input);




    function fl_input_copy
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_copy, "fl_input_copy");
    pragma Inline (fl_input_copy);

    function fl_input_cut
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_cut, "fl_input_cut");
    pragma Inline (fl_input_cut);

    function fl_input_cut2
           (I : in System.Address;
            B : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_input_cut2, "fl_input_cut2");
    pragma Inline (fl_input_cut2);

    function fl_input_cut3
           (I    : in System.Address;
            A, B : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_input_cut3, "fl_input_cut3");
    pragma Inline (fl_input_cut3);

    function fl_input_copy_cuts
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_copy_cuts, "fl_input_copy_cuts");
    pragma Inline (fl_input_copy_cuts);

    function fl_input_undo
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_undo, "fl_input_undo");
    pragma Inline (fl_input_undo);




    function fl_input_get_readonly
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_readonly, "fl_input_get_readonly");
    pragma Inline (fl_input_get_readonly);

    procedure fl_input_set_readonly
           (I : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_set_readonly, "fl_input_set_readonly");
    pragma Inline (fl_input_set_readonly);

    function fl_input_get_tab_nav
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_tab_nav, "fl_input_get_tab_nav");
    pragma Inline (fl_input_get_tab_nav);

    procedure fl_input_set_tab_nav
           (I : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_set_tab_nav, "fl_input_set_tab_nav");
    pragma Inline (fl_input_set_tab_nav);

    function fl_input_get_wrap
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_wrap, "fl_input_get_wrap");
    pragma Inline (fl_input_get_wrap);

    procedure fl_input_set_wrap
           (I : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_set_wrap, "fl_input_set_wrap");
    pragma Inline (fl_input_set_wrap);




    function fl_input_get_input_type
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_input_type, "fl_input_get_input_type");
    pragma Inline (fl_input_get_input_type);

    procedure fl_input_set_input_type
           (I : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_set_input_type, "fl_input_set_input_type");
    pragma Inline (fl_input_set_input_type);

    function fl_input_get_shortcut
           (I : in System.Address)
        return Interfaces.C.unsigned_long;
    pragma Import (C, fl_input_get_shortcut, "fl_input_get_shortcut");
    pragma Inline (fl_input_get_shortcut);

    procedure fl_input_set_shortcut
           (I : in System.Address;
            T : in Interfaces.C.unsigned_long);
    pragma Import (C, fl_input_set_shortcut, "fl_input_set_shortcut");
    pragma Inline (fl_input_set_shortcut);

    function fl_input_get_mark
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_mark, "fl_input_get_mark");
    pragma Inline (fl_input_get_mark);

    function fl_input_set_mark
           (I : in System.Address;
            T : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_input_set_mark, "fl_input_set_mark");
    pragma Inline (fl_input_set_mark);

    function fl_input_get_position
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_position, "fl_input_get_position");
    pragma Inline (fl_input_get_position);

    function fl_input_set_position
           (I : in System.Address;
            T : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_input_set_position, "fl_input_set_position");
    pragma Inline (fl_input_set_position);




    function fl_input_index
           (I : in System.Address;
            P : in Interfaces.C.int)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_input_index, "fl_input_index");
    pragma Inline (fl_input_index);

    function fl_input_insert
           (I : in System.Address;
            S : in Interfaces.C.char_array;
            L : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_input_insert, "fl_input_insert");
    pragma Inline (fl_input_insert);

    function fl_input_replace
           (I    : in System.Address;
            B, E : in Interfaces.C.int;
            S    : in Interfaces.C.char_array;
            L    : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_input_replace, "fl_input_replace");
    pragma Inline (fl_input_replace);

    procedure fl_input_set_value
           (I : in System.Address;
            T : in Interfaces.C.char_array;
            L : in Interfaces.C.int);
    pragma Import (C, fl_input_set_value, "fl_input_set_value");
    pragma Inline (fl_input_set_value);




    function fl_input_get_maximum_size
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_maximum_size, "fl_input_get_maximum_size");
    pragma Inline (fl_input_get_maximum_size);

    procedure fl_input_set_maximum_size
           (I : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_set_maximum_size, "fl_input_set_maximum_size");
    pragma Inline (fl_input_set_maximum_size);

    function fl_input_get_size
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_size, "fl_input_get_size");
    pragma Inline (fl_input_get_size);




    function fl_input_get_cursor_color
           (I : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_input_get_cursor_color, "fl_input_get_cursor_color");
    pragma Inline (fl_input_get_cursor_color);

    procedure fl_input_set_cursor_color
           (I : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_input_set_cursor_color, "fl_input_set_cursor_color");
    pragma Inline (fl_input_set_cursor_color);

    function fl_input_get_textcolor
           (I : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_input_get_textcolor, "fl_input_get_textcolor");
    pragma Inline (fl_input_get_textcolor);

    procedure fl_input_set_textcolor
           (I : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_input_set_textcolor, "fl_input_set_textcolor");
    pragma Inline (fl_input_set_textcolor);

    function fl_input_get_textfont
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_textfont, "fl_input_get_textfont");
    pragma Inline (fl_input_get_textfont);

    procedure fl_input_set_textfont
           (I : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_set_textfont, "fl_input_set_textfont");
    pragma Inline (fl_input_set_textfont);

    function fl_input_get_textsize
           (I : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_get_textsize, "fl_input_get_textsize");
    pragma Inline (fl_input_get_textsize);

    procedure fl_input_set_textsize
           (I : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_set_textsize, "fl_input_set_textsize");
    pragma Inline (fl_input_set_textsize);




    procedure fl_input_set_size
           (I    : in System.Address;
            W, H : in Interfaces.C.int);
    pragma Import (C, fl_input_set_size, "fl_input_set_size");
    pragma Inline (fl_input_set_size);




    procedure fl_input_draw
           (W : in System.Address);
    pragma Import (C, fl_input_draw, "fl_input_draw");
    pragma Inline (fl_input_draw);

    function fl_input_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_input_handle, "fl_input_handle");
    pragma Inline (fl_input_handle);




    procedure Finalize
           (This : in out Input) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Input'Class
        then
            if This.Needs_Dealloc then
                free_fl_input (This.Void_Ptr);
            end if;
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Widget (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Input is
        begin
            return This : Input do
                This.Void_Ptr := new_fl_input
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                input_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                input_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);
            end return;
        end Create;

    end Forge;




    procedure Copy
           (This : in out Input) is
    begin
        This.Was_Changed := fl_input_copy (This.Void_Ptr) /= 0;
    end Copy;


    procedure Cut
           (This : in out Input) is
    begin
        This.Was_Changed := fl_input_cut (This.Void_Ptr) /= 0;
    end Cut;


    procedure Cut
           (This      : in out Input;
            Num_Bytes : in     Integer) is
    begin
        This.Was_Changed := fl_input_cut2
           (This.Void_Ptr,
            Interfaces.C.int (Num_Bytes)) /= 0;
    end Cut;


    procedure Cut
           (This          : in out Input;
            Start, Finish : in     Integer) is
    begin
        This.Was_Changed := fl_input_cut3
           (This.Void_Ptr,
            Interfaces.C.int (Start),
            Interfaces.C.int (Finish)) /= 0;
    end Cut;


    procedure Copy_Cuts
           (This : in out Input) is
    begin
        This.Was_Changed := fl_input_copy_cuts (This.Void_Ptr) /= 0;
    end Copy_Cuts;


    procedure Undo
           (This : in out Input) is
    begin
        This.Was_Changed := fl_input_undo (This.Void_Ptr) /= 0;
    end Undo;




    function Has_Changed
           (This : in Input)
        return Boolean is
    begin
        return This.Was_Changed;
    end Has_Changed;


    procedure Clear_Changed
           (This : in out Input) is
    begin
        This.Was_Changed := False;
    end Clear_Changed;


    function Is_Readonly
           (This : in Input)
        return Boolean is
    begin
        return fl_input_get_readonly (This.Void_Ptr) /= 0;
    end Is_Readonly;


    procedure Set_Readonly
           (This : in out Input;
            To   : in     Boolean) is
    begin
        fl_input_set_readonly (This.Void_Ptr, Boolean'Pos (To));
    end Set_Readonly;


    function Is_Tab_Nav
           (This : in Input)
        return Boolean is
    begin
        return fl_input_get_tab_nav (This.Void_Ptr) /= 0;
    end Is_Tab_Nav;


    procedure Set_Tab_Nav
           (This : in out Input;
            To   : in     Boolean) is
    begin
        fl_input_set_tab_nav (This.Void_Ptr, Boolean'Pos (To));
    end Set_Tab_Nav;


    function Is_Wrap
           (This : in Input)
        return Boolean is
    begin
        return fl_input_get_wrap (This.Void_Ptr) /= 0;
    end Is_Wrap;


    procedure Set_Wrap
           (This : in out Input;
            To   : in     Boolean) is
    begin
        fl_input_set_wrap (This.Void_Ptr, Boolean'Pos (To));
    end Set_Wrap;




    function Get_Input_Type
           (This : in Input)
        return Input_Kind
    is
        C_Val : Interfaces.C.int := fl_input_get_input_type (This.Void_Ptr);
    begin
        for V in Input_Kind loop
            if Input_Kind_Values (V) = C_Val then
                return V;
            end if;
        end loop;
        return Normal_Kind;
    end Get_Input_Type;


    function Get_Shortcut_Key
           (This : in Input)
        return Shortcut_Key is
    begin
        return C_To_Key (fl_input_get_shortcut (This.Void_Ptr));
    end Get_Shortcut_Key;


    procedure Set_Shortcut_Key
           (This : in out Input;
            To   : in     Shortcut_Key) is
    begin
        fl_input_set_shortcut (This.Void_Ptr, Key_To_C (To));
    end Set_Shortcut_Key;


    function Get_Mark
           (This : in Input)
        return Natural is
    begin
        return Natural (fl_input_get_mark (This.Void_Ptr));
    end Get_Mark;


    procedure Set_Mark
           (This : in out Input;
            To   : in     Natural) is
    begin
        This.Was_Changed := fl_input_set_mark
           (This.Void_Ptr, Interfaces.C.int (To)) /= 0;
    end Set_Mark;


    function Get_Position
           (This : in Input)
        return Natural is
    begin
        return Natural (fl_input_get_position (This.Void_Ptr));
    end Get_Position;


    procedure Set_Position
           (This : in out Input;
            To   : in     Natural) is
    begin
        This.Was_Changed := fl_input_set_position
           (This.Void_Ptr, Interfaces.C.int (To)) /= 0;
    end Set_Position;




    function Index
           (This  : in Input;
            Place : in Integer)
        return Character is
    begin
        return Character'Val (fl_input_index (This.Void_Ptr, Interfaces.C.int (Place)));
    end Index;


    procedure Insert
           (This : in out Input;
            Str  : in     String) is
    begin
        This.Was_Changed := fl_input_insert
           (This.Void_Ptr,
            Interfaces.C.To_C (Str),
            Str'Length) /= 0;
    end Insert;


    procedure Replace
           (This     : in out Input;
            From, To : in     Natural;
            New_Text : in     String) is
    begin
        This.Was_Changed := fl_input_replace
           (This.Void_Ptr,
            Interfaces.C.int (From),
            Interfaces.C.int (To),
            Interfaces.C.To_C (New_Text),
            New_Text'Length) /= 0;
    end Replace;


    function Get_Value
           (This : in Input)
        return String is
    begin
        --  pointer to internal buffer only, so no Free required
        return Interfaces.C.Strings.Value (fl_input_get_value (This.Void_Ptr));
    end Get_Value;


    procedure Set_Value
           (This : in out Input;
            To   : in     String) is
    begin
        fl_input_set_value (This.Void_Ptr, Interfaces.C.To_C (To), To'Length);
    end Set_Value;




    function Get_Maximum_Size
           (This : in Input)
        return Natural is
    begin
        return Natural (fl_input_get_maximum_size (This.Void_Ptr));
    end Get_Maximum_Size;


    procedure Set_Maximum_Size
           (This : in out Input;
            To   : in     Natural) is
    begin
        fl_input_set_maximum_size (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Maximum_Size;


    function Size
           (This : in Input)
        return Natural is
    begin
        return Natural (fl_input_get_size (This.Void_Ptr));
    end Size;




    function Get_Cursor_Color
           (This : in Input)
        return Color is
    begin
        return Color (fl_input_get_cursor_color (This.Void_Ptr));
    end Get_Cursor_Color;


    procedure Set_Cursor_Color
           (This : in out Input;
            To   : in     Color) is
    begin
        fl_input_set_cursor_color (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Cursor_Color;


    function Get_Text_Color
           (This : in Input)
        return Color is
    begin
        return Color (fl_input_get_textcolor (This.Void_Ptr));
    end Get_Text_Color;


    procedure Set_Text_Color
           (This : in out Input;
            To   : in     Color) is
    begin
        fl_input_set_textcolor (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Text_Color;


    function Get_Text_Font
           (This : in Input)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_input_get_textfont (This.Void_Ptr));
    end Get_Text_Font;


    procedure Set_Text_Font
           (This : in out Input;
            To   : in     Font_Kind) is
    begin
        fl_input_set_textfont (This.Void_Ptr, Font_Kind'Pos (To));
    end Set_Text_Font;


    function Get_Text_Size
           (This : in Input)
        return Font_Size is
    begin
        return Font_Size (fl_input_get_textsize (This.Void_Ptr));
    end Get_Text_Size;


    procedure Set_Text_Size
           (This : in out Input;
            To   : in     Font_Size) is
    begin
        fl_input_set_textsize (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Text_Size;




    procedure Resize
           (This : in out Input;
            W, H : in     Integer) is
    begin
        fl_input_set_size (This.Void_Ptr, Interfaces.C.int (W), Interfaces.C.int (H));
    end Resize;




    procedure Draw
           (This : in out Input) is
    begin
        fl_input_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Input;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_input_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;




    package body Extra is

        procedure Set_Input_Type
               (This : in out Input;
                To   : in     Input_Kind) is
        begin
            fl_input_set_input_type (This.Void_Ptr, Input_Kind_Values (To));
        end Set_Input_Type;

        pragma Inline (Set_Input_Type);

    end Extra;


end FLTK.Widgets.Inputs;

