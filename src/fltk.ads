

with

    Ada.Finalization;

private with

    Interfaces.C,
    System;


package FLTK is


    function Run return Integer;


    --  ugly implementation detail, never use this
    --  just ignore the hand moving behind the curtain
    --  (this is necessary so things like text_buffers and
    --  widgets can talk to each other behind the binding)
    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with private;


    type Color is new Natural;
    type Color_Component is mod 256;
    No_Color : constant Color;


    type Alignment is private;
    Align_Center : constant Alignment;
    Align_Top    : constant Alignment;
    Align_Bottom : constant Alignment;
    Align_Left   : constant Alignment;
    Align_Right  : constant Alignment;


    type Keypress is private;
    subtype Pressable_Key is Character range Character'Val (32) .. Character'Val (126);
    function Press (Key : in Pressable_Key) return Keypress;
    Enter_Key        : constant Keypress;
    Keypad_Enter_Key : constant Keypress;
    Backspace_Key    : constant Keypress;
    Insert_Key       : constant Keypress;
    Delete_Key       : constant Keypress;
    Home_Key         : constant Keypress;
    End_Key          : constant Keypress;
    Page_Down_Key    : constant Keypress;
    Page_Up_Key      : constant Keypress;
    Down_Key         : constant Keypress;
    Left_Key         : constant Keypress;
    Right_Key        : constant Keypress;
    Up_Key           : constant Keypress;
    Escape_Key       : constant Keypress;


    type Mouse_Button is (No_Button, Left_Button, Middle_Button, Right_Button);


    type Key_Combo is private;
    function Press (Key : in Pressable_Key) return Key_Combo;
    function Press (Key : in Keypress) return Key_Combo;
    function Press (Key : in Mouse_Button) return Key_Combo;
    No_Key : constant Key_Combo;


    type Modifier is private;
    function "+" (Left, Right : in Modifier) return Modifier;
    function "+" (Left : in Modifier; Right : in Pressable_Key) return Key_Combo;
    function "+" (Left : in Modifier; Right : in Keypress) return Key_Combo;
    function "+" (Left : in Modifier; Right : in Mouse_Button) return Key_Combo;
    function "+" (Left : in Modifier; Right : in Key_Combo) return Key_Combo;
    Mod_None  : constant Modifier;
    Mod_Shift : constant Modifier;
    Mod_Ctrl  : constant Modifier;
    Mod_Alt   : constant Modifier;


    type Box_Kind is
           (No_Box,
            Flat_Box,
            Up_Box,
            Down_Box,
            Up_Frame,
            Down_Frame,
            Thin_Up_Box,
            Thin_Down_Box,
            Thin_Up_Frame,
            Thin_Down_Frame,
            Engraved_Box,
            Embossed_Box,
            Engraved_Frame,
            Embossed_Frame,
            Border_Box,
            Shadow_Box,
            Border_Frame,
            Shadow_Frame,
            Rounded_Box,
            RShadow_Box,
            Rounded_Frame,
            RFlat_Box,
            Round_Up_Box,
            Round_Down_Box,
            Diamond_Up_Box,
            Diamond_Down_Box,
            Oval_Box,
            OShadow_Box,
            Oval_Frame,
            OFlat_Box,
            Plastic_Up_Box,
            Plastic_Down_Box,
            Plastic_Up_Frame,
            Plastic_Down_Frame,
            Plastic_Thin_Up_Box,
            Plastic_Thin_Down_Box,
            Plastic_Round_Up_Box,
            Plastic_Round_Down_Box,
            Gtk_Up_Box,
            Gtk_Down_Box,
            Gtk_Up_Frame,
            Gtk_Down_Frame,
            Gtk_Thin_Up_Box,
            Gtk_Thin_Down_Box,
            Gtk_Thin_Up_Frame,
            Gtk_Thin_Down_Frame,
            Gtk_Round_Up_Box,
            Gtk_Round_Down_Box,
            Gleam_Up_Box,
            Gleam_Down_Box,
            Gleam_Up_Frame,
            Gleam_Down_Frame,
            Gleam_Thin_Up_Box,
            Gleam_Thin_Down_Box,
            Gleam_Round_Up_Box,
            Gleam_Round_Down_Box,
            Free_Box);


    type Font_Kind is
           (Helvetica,
            Helvetica_Bold,
            Helvetica_Italic,
            Helvetica_Bold_Italic,
            Courier,
            Courier_Bold,
            Courier_Italic,
            Courier_Bold_Italic,
            Times,
            Times_Bold,
            Times_Italic,
            Times_Bold_Italic,
            Symbol,
            Monospace,
            Monospace_Bold,
            Zapf_Dingbats,
            Free_Font);


    type Font_Size is new Natural;
    Normal_Size : constant Font_Size := 14;


    type Label_Kind is
           (Normal_Label,
            No_Label,
            Shadow_Label,
            Engraved_Label,
            Embossed_Label,
            Multi_Label,
            Icon_Label,
            Image_Label,
            Free_Label);


    type Event_Kind is
           (No_Event,
            Push,
            Release,
            Enter,
            Leave,
            Drag,
            Focus,
            Unfocus,
            Keydown,
            Keyup,
            Close,
            Move,
            Shortcut,
            Deactivate,
            Activate,
            Hide,
            Show,
            Paste,
            Selection_Clear,
            Mouse_Wheel,
            DnD_Enter,
            DnD_Drag,
            DnD_Leave,
            DnD_Release,
            Screen_Config_Changed,
            Fullscreen);


    type Event_Outcome is (Not_Handled, Handled);


private


    function Has_Valid_Ptr
           (This : in Wrapper)
        return Boolean;

    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with
        record
            Void_Ptr      : System.Address;
            Needs_Dealloc : Boolean := True;
        end record;
        --  with Type_Invariant => Has_Valid_Ptr (Wrapper);

    --  unsure if the above invariant is doing what I'm after
    --  oh well, something to work on

    overriding procedure Initialize
           (This : in out Wrapper);


    No_Color : constant Color := 0;


    type Alignment is new Interfaces.Unsigned_16;
    Align_Center : constant Alignment := 0;
    Align_Top    : constant Alignment := 1;
    Align_Bottom : constant Alignment := 2;
    Align_Left   : constant Alignment := 4;
    Align_Right  : constant Alignment := 8;


    type Keypress is new Interfaces.Unsigned_16;
    type Modifier is new Interfaces.Unsigned_16;
    type Key_Combo is
        record
            Modcode   : Modifier;
            Keycode   : Keypress;
            Mousecode : Mouse_Button;
        end record;


    function To_C
           (Key : in Key_Combo)
        return Interfaces.C.unsigned_long;

    function To_Ada
           (Key : in Interfaces.C.unsigned_long)
        return Key_Combo;

    function To_C
           (Key : in Keypress)
        return Interfaces.C.unsigned_long;

    function To_Ada
           (Key : in Interfaces.C.unsigned_long)
        return Keypress;

    function To_C
           (Modi : in Modifier)
        return Interfaces.C.unsigned_long;

    function To_Ada
           (Modi : in Interfaces.C.unsigned_long)
        return Modifier;

    function To_C
           (Button : in Mouse_Button)
        return Interfaces.C.unsigned_long;

    function To_Ada
           (Button : in Interfaces.C.unsigned_long)
        return Mouse_Button;


    --  these values designed to align with FLTK enumeration types
    Mod_None  : constant Modifier := 2#00000000#;
    Mod_Shift : constant Modifier := 2#00000001#;
    Mod_Ctrl  : constant Modifier := 2#00000100#;
    Mod_Alt   : constant Modifier := 2#00001000#;


    No_Key : constant Key_Combo := (Modcode => Mod_None, Keycode => 0, Mousecode => No_Button);


    --  these values correspond to constants defined in FLTK Enumerations.H
    Enter_Key        : constant Keypress := 16#ff0d#;
    Keypad_Enter_Key : constant Keypress := 16#ff8d#;
    Backspace_Key    : constant Keypress := 16#ff08#;
    Insert_Key       : constant Keypress := 16#ff63#;
    Delete_Key       : constant Keypress := 16#ffff#;
    Home_Key         : constant Keypress := 16#ff50#;
    End_Key          : constant Keypress := 16#ff57#;
    Page_Down_Key    : constant Keypress := 16#ff56#;
    Page_Up_Key      : constant Keypress := 16#ff55#;
    Down_Key         : constant Keypress := 16#ff54#;
    Left_Key         : constant Keypress := 16#ff51#;
    Right_Key        : constant Keypress := 16#ff53#;
    Up_Key           : constant Keypress := 16#ff52#;
    Escape_Key       : constant Keypress := 16#ff1b#;


end FLTK;

