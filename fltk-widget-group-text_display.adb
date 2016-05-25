

with Interfaces.C;
with System;
use type System.Address;


package body FLTK.Widget.Group.Text_Display is


    function new_fl_text_display
           (X, Y, W, H : in Interfaces.C.int;
            L          : in Interfaces.C.char_array)
        return System.Address;
    pragma Import (C, new_fl_text_display, "new_fl_text_display");

    procedure free_fl_text_display
           (TD : in System.Address);
    pragma Import (C, free_fl_text_display, "free_fl_text_display");

    function fl_text_display_get_text_color
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_text_color, "fl_text_display_get_text_color");

    procedure fl_text_display_set_text_color
           (TD : in System.Address;
            C  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_text_color, "fl_text_display_set_text_color");

    function fl_text_display_get_text_font
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_text_font, "fl_text_display_get_text_font");

    procedure fl_text_display_set_text_font
           (TD : in System.Address;
            F  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_text_font, "fl_text_display_set_text_font");

    function fl_text_display_get_text_size
           (TD : in System.Address)
        return Interfaces.C.int;
    pragma Import (C, fl_text_display_get_text_size, "fl_text_display_get_text_size");

    procedure fl_text_display_set_text_size
           (TD : in System.Address;
            S  : in Interfaces.C.int);
    pragma Import (C, fl_text_display_set_text_size, "fl_text_display_set_text_size");




    procedure fl_group_end
           (G : in System.Address);
    pragma Import (C, fl_group_end, "fl_group_end");




    procedure Finalize (This : in out Text_Display_Type) is
    begin
        if (This.Void_Ptr /= System.Null_Address) then
            free_fl_text_display (This.Void_Ptr);
        end if;
    end Finalize;




    function Create
           (X, Y, W, H : in Integer;
            Label      : in String)
        return Text_Display_Type is

        VP : System.Address;

    begin
        VP := new_fl_text_display
                   (Interfaces.C.int (X),
                    Interfaces.C.int (Y),
                    Interfaces.C.int (W),
                    Interfaces.C.int (H),
                    Interfaces.C.To_C (Label));
        fl_group_end (VP);
        return (Ada.Finalization.Limited_Controlled with Void_Ptr => VP);
    end Create;




    function Get_Text_Color
           (TD : in Text_Display_Type)
        return Color is
    begin
        return Color (fl_text_display_get_text_color (TD.Void_Ptr));
    end Get_Text_Color;




    procedure Set_Text_Color
           (TD : in Text_Display_Type;
            C : in Color) is
    begin
        fl_text_display_set_text_color (TD.Void_Ptr, Interfaces.C.int (C));
    end Set_Text_Color;




    function Get_Text_Font
           (TD : in Text_Display_Type)
        return Font_Kind is
    begin
        return Font_Kind'Val (fl_text_display_get_text_font (TD.Void_Ptr));
    end Get_Text_Font;




    procedure Set_Text_Font
           (TD : in Text_Display_Type;
            F : in Font_Kind) is
    begin
        fl_text_display_set_text_font (TD.Void_Ptr, Font_Kind'Pos (F));
    end Set_Text_Font;




    function Get_Text_Size
           (TD : in Text_Display_Type)
        return Font_Size is
    begin
        return Font_Size (fl_text_display_get_text_size (TD.Void_Ptr));
    end Get_Text_Size;




    procedure Set_Text_Size
           (TD : in Text_Display_Type;
            S : in Font_Size) is
    begin
        fl_text_display_set_text_size (TD.Void_Ptr, Interfaces.C.int (S));
    end Set_Text_Size;


end FLTK.Widget.Group.Text_Display;

