

with Interfaces.C;
use type Interfaces.C.unsigned_long;


package body FLTK.Enums is


    function Shortcut
           (Key : Pressable_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifier := Mod_None;
            This.Keypress := Key;
        end return;
    end Shortcut;




    function Key_To_C
           (Key : Shortcut_Key)
        return Interfaces.C.unsigned_long is
    begin
        return Interfaces.C.unsigned_long (Key.Modifier) *
               65536 + Character'Pos (Key.Keypress);
    end Key_To_C;




    function "+"
           (Left, Right : in Modifier_Key)
        return Modifier_Key is
    begin
        return Left or Right;
    end "+";




    function "+"
           (Left  : in Modifier_Key;
            Right : in Pressable_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifier := Left;
            This.Keypress := Right;
        end return;
    end "+";




    function "+"
           (Left  : in Modifier_Key;
            Right : in Shortcut_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifier := Left or Right.Modifier;
            This.Keypress := Right.Keypress;
        end return;
    end "+";


end FLTK.Enums;

