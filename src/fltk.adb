

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




    function Press
           (Key : in Pressable_Key)
        return Keypress is
    begin
        return Character'Pos (Key);
    end Press;


    function Press
           (Key : Pressable_Key)
        return Key_Combo is
    begin
        return This : Key_Combo do
            This.Modcode := Mod_None;
            This.Keycode := Character'Pos (Key);
            This.Mousecode := No_Button;
        end return;
    end Press;


    function Press
           (Key : in Keypress)
        return Key_Combo is
    begin
        return This : Key_Combo do
            This.Modcode := Mod_None;
            This.Keycode := Key;
            This.Mousecode := No_Button;
        end return;
    end Press;


    function Press
           (Key : in Mouse_Button)
        return Key_Combo is
    begin
        return This : Key_Combo do
            This.Modcode := Mod_None;
            This.Keycode := 0;
            This.Mousecode := Key;
        end return;
    end Press;




    function "+"
           (Left, Right : in Modifier)
        return Modifier is
    begin
        return Left or Right;
    end "+";


    function "+"
           (Left  : in Modifier;
            Right : in Pressable_Key)
        return Key_Combo is
    begin
        return This : Key_Combo do
            This.Modcode := Left;
            This.Keycode := Character'Pos (Right);
            This.Mousecode := No_Button;
        end return;
    end "+";


    function "+"
           (Left : in Modifier;
            Right : in Keypress)
        return Key_Combo is
    begin
        return This : Key_Combo do
            This.Modcode := Left;
            This.Keycode := Right;
            This.Mousecode := No_Button;
        end return;
    end "+";


    function "+"
           (Left : in Modifier;
            Right : in Mouse_Button)
        return Key_Combo is
    begin
        return This : Key_Combo do
            This.Modcode := Left;
            This.Keycode := 0;
            This.Mousecode := Right;
        end return;
    end "+";


    function "+"
           (Left  : in Modifier;
            Right : in Key_Combo)
        return Key_Combo is
    begin
        return This : Key_Combo do
            This.Modcode := Left or Right.Modcode;
            This.Keycode := Right.Keycode;
            This.Mousecode := Right.Mousecode;
        end return;
    end "+";




    function To_C
           (Key : in Key_Combo)
        return Interfaces.C.unsigned_long is
    begin
        return To_C (Key.Modcode) + To_C (Key.Keycode) + To_C (Key.Mousecode);
    end To_C;


    function To_Ada
           (Key : in Interfaces.C.unsigned_long)
        return Key_Combo is
    begin
        return Result : Key_Combo do
            Result.Modcode := To_Ada (Key);
            Result.Keycode := To_Ada (Key);
            Result.Mousecode := To_Ada (Key);
        end return;
    end To_Ada;


    function To_C
           (Key : in Keypress)
        return Interfaces.C.unsigned_long is
    begin
        return Interfaces.C.unsigned_long (Key);
    end To_C;


    function To_Ada
           (Key : in Interfaces.C.unsigned_long)
        return Keypress is
    begin
        return Keypress (Key mod 65536);
    end To_Ada;


    function To_C
           (Modi : in Modifier)
        return Interfaces.C.unsigned_long is
    begin
        return Interfaces.C.unsigned_long (Modi) * 65536;
    end To_C;


    function To_Ada
           (Modi : in Interfaces.C.unsigned_long)
        return Modifier is
    begin
        return Modifier ((Modi / 65536) mod 256);
    end To_Ada;


    function To_C
           (Button : in Mouse_Button)
        return Interfaces.C.unsigned_long is
    begin
        case Button is
            when Left_Button => return 1 * (256 ** 3);
            when Middle_Button => return 2 * (256 ** 3);
            when Right_Button => return 4 * (256 ** 3);
            when others => return 0;
        end case;
    end To_C;


    function To_Ada
           (Button : in Interfaces.C.unsigned_long)
        return Mouse_Button is
    begin
        case (Button / (256 ** 3)) is
            when 1 => return Left_Button;
            when 2 => return Middle_Button;
            when 4 => return Right_Button;
            when others => return No_Button;
        end case;
    end To_Ada;


end FLTK;

