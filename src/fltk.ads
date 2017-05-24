

with Ada.Finalization;
private with Interfaces.C;
private with System;


package FLTK is


    function Run return Integer;


    --  ugly implementation detail, never use this
    --  just ignore the hand moving behind the curtain
    --  (this is necessary so things like text_buffers and
    --  widgets can talk to each other behind the binding)
    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with private;


    type Color is new Natural;


    type Alignment is private;
    Align_Center : constant Alignment;
    Align_Top    : constant Alignment;
    Align_Bottom : constant Alignment;
    Align_Left   : constant Alignment;
    Align_Right  : constant Alignment;


    type Shortcut_Key is private;
    subtype Pressable_Key is Character range Character'Val (32) .. Character'Val (126);
    function Shortcut (Key : Pressable_Key) return Shortcut_Key;
    No_Key : constant Shortcut_Key;


    type Modifier_Key is private;
    function "+" (Left, Right : in Modifier_Key) return Modifier_Key;
    function "+" (Left : in Modifier_Key; Right : in Pressable_Key) return Shortcut_Key;
    function "+" (Left : in Modifier_Key; Right : in Shortcut_Key) return Shortcut_Key;
    Mod_None  : constant Modifier_Key;
    Mod_Shift : constant Modifier_Key;
    Mod_Ctrl  : constant Modifier_Key;
    Mod_Alt   : constant Modifier_Key;


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
            Screen,
            Screen_Bold,
            Zapf_Dingbats,
            Free_Font);


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


private


    function Has_Valid_Ptr
           (This : in Wrapper)
        return Boolean;


    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with
        record
            Void_Ptr : System.Address;
        end record;
        --  with Type_Invariant => Has_Valid_Ptr (Wrapper);

    --  unsure if the above invariant is doing what I'm after
    --  oh well, something to work on


    overriding procedure Initialize
           (This : in out Wrapper);


    type Alignment is new Interfaces.Unsigned_16;
    Align_Center : constant Alignment := 0;
    Align_Top    : constant Alignment := 1;
    Align_Bottom : constant Alignment := 2;
    Align_Left   : constant Alignment := 4;
    Align_Right  : constant Alignment := 8;


    type Modifier_Key is new Interfaces.Unsigned_8;


    type Shortcut_Key is
        record
            Modifier : Modifier_Key;
            Keypress : Character;
        end record;


    function Key_To_C
           (Key : Shortcut_Key)
        return Interfaces.C.unsigned_long;


    --  these values designed to align with FLTK enumeration types
    Mod_None  : constant Modifier_Key := 2#00000000#;
    Mod_Shift : constant Modifier_Key := 2#00000001#;
    Mod_Ctrl  : constant Modifier_Key := 2#00000100#;
    Mod_Alt   : constant Modifier_Key := 2#00001000#;


    No_Key : constant Shortcut_Key :=
        (Modifier => Mod_None, Keypress => Character'Val (0));


end FLTK;

