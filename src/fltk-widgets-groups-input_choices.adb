

with

    Ada.Unchecked_Deallocation,
    Interfaces.C.Strings,
    System;

use type

    Interfaces.C.int,
    System.Address;


package body FLTK.Widgets.Groups.Input_Choices is


    procedure input_choice_set_draw_hook
           (W, D : in System.Address);
    pragma Import (C, input_choice_set_draw_hook, "input_choice_set_draw_hook");

    procedure input_choice_set_handle_hook
           (W, H : in System.Address);
    pragma Import (C, input_choice_set_handle_hook, "input_choice_set_handle_hook");




    function new_fl_input_choice
           (X, Y, W, H : in Interfaces.C.int;
            Text       : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_input_choice, "new_fl_input_choice");

    procedure free_fl_input_choice
           (W : in System.Address);
    pragma Import (C, free_fl_input_choice, "free_fl_input_choice");




    function fl_input_choice_input
           (N : in System.Address)
        return System.Address;
    pragma Import (C, fl_input_choice_input, "fl_input_choice_input");

    function fl_input_choice_menubutton
           (N : in System.Address)
        return System.Address;
    pragma Import (C, fl_input_choice_menubutton, "fl_input_choice_menubutton");




    function fl_input_choice_changed
           (N : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_choice_changed, "fl_input_choice_changed");

    procedure fl_input_choice_clear_changed
           (N : in System.Address);
    pragma Import (C, fl_input_choice_clear_changed, "fl_input_choice_clear_changed");

    function fl_input_choice_get_down_box
           (N : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_choice_get_down_box, "fl_input_choice_get_down_box");

    procedure fl_input_choice_set_down_box
           (N : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_choice_set_down_box, "fl_input_choice_set_down_box");

    function fl_input_choice_get_textcolor
           (N : in System.Address)
        return Interfaces.C.unsigned;
    pragma Import (C, fl_input_choice_get_textcolor, "fl_input_choice_get_textcolor");

    procedure fl_input_choice_set_textcolor
           (N : in System.Address;
            T : in Interfaces.C.unsigned);
    pragma Import (C, fl_input_choice_set_textcolor, "fl_input_choice_set_textcolor");

    function fl_input_choice_get_textfont
           (N : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_choice_get_textfont, "fl_input_choice_get_textfont");

    procedure fl_input_choice_set_textfont
           (N : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_choice_set_textfont, "fl_input_choice_set_textfont");

    function fl_input_choice_get_textsize
           (N : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_input_choice_get_textsize, "fl_input_choice_get_textsize");

    procedure fl_input_choice_set_textsize
           (N : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_choice_set_textsize, "fl_input_choice_set_textsize");

    function fl_input_choice_get_value
           (N : in System.Address)
        return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, fl_input_choice_get_value, "fl_input_choice_get_value");

    procedure fl_input_choice_set_value
           (N : in System.Address;
            T : in Interfaces.C.char_array);
    pragma Import (C, fl_input_choice_set_value, "fl_input_choice_set_value");

    procedure fl_input_choice_set_value2
           (N : in System.Address;
            T : in Interfaces.C.int);
    pragma Import (C, fl_input_choice_set_value2, "fl_input_choice_set_value2");




    procedure fl_input_choice_draw
           (W : in System.Address);
    pragma Import (C, fl_input_choice_draw, "fl_input_choice_draw");

    function fl_input_choice_handle
           (W : in System.Address;
            E : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_input_choice_handle, "fl_input_choice_handle");




    procedure Free is new Ada.Unchecked_Deallocation
        (INP.Input, Input_Access);
    procedure Free is new Ada.Unchecked_Deallocation
        (MB.Menu_Button, Menu_Button_Access);




    procedure Finalize
           (This : in out Input_Choice) is
    begin
        if  This.Void_Ptr /= System.Null_Address and then
            This in Input_Choice'Class
        then
            This.Clear;
            free_fl_input_choice (This.Void_Ptr);
            Free (This.My_Input);
            Free (This.My_Menu_Button);
            This.Void_Ptr := System.Null_Address;
        end if;
        Finalize (Group (This));
    end Finalize;




    package body Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Input_Choice is
        begin
            return This : Input_Choice do
                This.Void_Ptr := new_fl_input_choice
                       (Interfaces.C.int (X),
                        Interfaces.C.int (Y),
                        Interfaces.C.int (W),
                        Interfaces.C.int (H),
                        Interfaces.C.To_C (Text));
                fl_group_end (This.Void_Ptr);
                fl_widget_set_user_data
                       (This.Void_Ptr,
                        Widget_Convert.To_Address (This'Unchecked_Access));
                input_choice_set_draw_hook (This.Void_Ptr, Draw_Hook'Address);
                input_choice_set_handle_hook (This.Void_Ptr, Handle_Hook'Address);

                This.My_Input := new INP.Input;
                Wrapper (This.My_Input.all).Void_Ptr :=
                    fl_input_choice_input (This.Void_Ptr);
                Wrapper (This.My_Input.all).Needs_Dealloc := False;

                This.My_Menu_Button := new MB.Menu_Button;
                Wrapper (This.My_Menu_Button.all).Void_Ptr :=
                    fl_input_choice_menubutton (This.Void_Ptr);
                Wrapper (This.My_Menu_Button.all).Needs_Dealloc := False;
            end return;
        end Create;

    end Forge;




    function Input
           (This : in out Input_Choice)
        return INP.Input_Reference is
    begin
        return (Data => This.My_Input);
    end Input;


    function Menu_Button
           (This : in out Input_Choice)
        return MB.Menu_Button_Reference is
    begin
        return (Data => This.My_Menu_Button);
    end Menu_Button;




    function Has_Changed
           (This : in Input_Choice)
        return Boolean is
    begin
        return fl_input_choice_changed (This.Void_Ptr) /= 0;
    end Has_Changed;


    procedure Clear_Changed
           (This : in out Input_Choice) is
    begin
        fl_input_choice_clear_changed (This.Void_Ptr);
    end Clear_Changed;


    function Get_Down_Box
           (This : in Input_Choice)
        return Box_Kind is
    begin
        return Box_Kind'Val (fl_input_choice_get_down_box (This.Void_Ptr));
    end Get_Down_Box;


    procedure Set_Down_Box
           (This : in out Input_Choice;
            To   : in     Box_Kind) is
    begin
        fl_input_choice_set_down_box (This.Void_Ptr, Box_Kind'Pos (To));
    end Set_Down_Box;


    function Get_Text_Color
           (This : in Input_Choice)
        return Color is
    begin
        return Color (fl_input_choice_get_textcolor (This.Void_Ptr));
    end Get_Text_Color;


    procedure Set_Text_Color
           (This : in out Input_Choice;
            To   : in     Color) is
    begin
        fl_input_choice_set_textcolor (This.Void_Ptr, Interfaces.C.unsigned (To));
    end Set_Text_Color;


    function Get_Text_Font
           (This : in Input_Choice)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_input_choice_get_textfont (This.Void_Ptr));
    end Get_Text_Font;


    procedure Set_Text_Font
           (This : in out Input_Choice;
            To   : in     Font_Kind) is
    begin
        fl_input_choice_set_textfont (This.Void_Ptr, Font_Kind'Pos (To));
    end Set_Text_Font;


    function Get_Text_Size
           (This : in Input_Choice)
        return Font_Size is
    begin
        return Font_Size (fl_input_choice_get_textsize (This.Void_Ptr));
    end Get_Text_Size;


    procedure Set_Text_Size
           (This : in out Input_Choice;
            To   : in     Font_Size) is
    begin
        fl_input_choice_set_textsize (This.Void_Ptr, Interfaces.C.int (To));
    end Set_Text_Size;


    function Get_Input
           (This : in Input_Choice)
        return String
    is
        C_Str : Interfaces.C.Strings.chars_ptr := fl_input_choice_get_value (This.Void_Ptr);
        The_Text : String := Interfaces.C.Strings.Value (C_Str);
    begin
        Interfaces.C.Strings.Free (C_Str);
        return The_Text;
    end Get_Input;


    procedure Set_Input
           (This : in out Input_Choice;
            To   : in     String) is
    begin
        fl_input_choice_set_value (This.Void_Ptr, Interfaces.C.To_C (To));
    end Set_Input;


    procedure Set_Item
           (This : in out Input_Choice;
            Num  : in     Integer) is
    begin
        fl_input_choice_set_value2 (This.Void_Ptr, Interfaces.C.int (Num));
    end Set_Item;




    procedure Draw
           (This : in out Input_Choice) is
    begin
        fl_input_choice_draw (This.Void_Ptr);
    end Draw;


    function Handle
           (This  : in out Input_Choice;
            Event : in     Event_Kind)
        return Event_Outcome is
    begin
        return Event_Outcome'Val
               (fl_input_choice_handle (This.Void_Ptr, Event_Kind'Pos (Event)));
    end Handle;


end FLTK.Widgets.Groups.Input_Choices;

