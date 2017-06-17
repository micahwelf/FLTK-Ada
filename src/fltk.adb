

with

    Interfaces.C,
    System;

use type

    Interfaces.C.unsigned_long,
    System.Address;


package body FLTK is


    function fl_run return Interfaces.C.int;
    pragma Import (C, fl_run, "fl_run");




    function Run
        return Integer is
    begin
        return Integer (fl_run);
    end Run;




    function Has_Valid_Ptr
           (This : in Wrapper)
        return Boolean is
    begin
        return This.Void_Ptr /= System.Null_Address;
    end Has_Valid_Ptr;


    procedure Initialize
           (This : in out Wrapper) is
    begin
        This.Void_Ptr := System.Null_Address;
    end Initialize;





    function Shortcut
           (Key : Pressable_Key)
        return Shortcut_Key is
    begin
        return This : Shortcut_Key do
            This.Modifier := Mod_None;
            This.Keypress := Character'Pos (Key);
        end return;
    end Shortcut;




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
            This.Keypress := Character'Pos (Right);
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




    function Key_To_C
           (Key : in Shortcut_Key)
        return Interfaces.C.unsigned_long is
    begin
        return Interfaces.C.unsigned_long (Key.Modifier) *
               65536 + Interfaces.C.unsigned_long (Key.Keypress);
    end Key_To_C;


    function C_To_Key
           (Key : in Interfaces.C.unsigned_long)
        return Shortcut_Key is
    begin
        return Result : Shortcut_Key do
            Result.Modifier := Modifier_Key (Key / 65536);
            Result.Keypress := Interfaces.Unsigned_16 (Key mod 65536);
        end return;
    end C_To_Key;


end FLTK;

