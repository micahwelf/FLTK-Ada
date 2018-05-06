

with

    Interfaces.C,
    System;

use type

    Interfaces.C.int,
    Interfaces.C.unsigned_long,
    System.Address;


package body FLTK is


    function fl_abi_check
           (V : in Interfaces.C.int)
        return Interfaces.C.int;
    pragma Import (C, fl_abi_check, "fl_abi_check");
    pragma Inline (fl_abi_check);

    function fl_abi_version
        return Interfaces.C.int;
    pragma Import (C, fl_abi_version, "fl_abi_version");
    pragma Inline (fl_abi_version);

    function fl_api_version
        return Interfaces.C.int;
    pragma Import (C, fl_api_version, "fl_api_version");
    pragma Inline (fl_api_version);

    function fl_version
        return Interfaces.C.double;
    pragma Import (C, fl_version, "fl_version");
    pragma Inline (fl_version);




    function fl_get_damage
        return Interfaces.C.int;
    pragma Import (C, fl_get_damage, "fl_get_damage");
    pragma Inline (fl_get_damage);

    procedure fl_set_damage
           (V : in Interfaces.C.int);
    pragma Import (C, fl_set_damage, "fl_set_damage");
    pragma Inline (fl_set_damage);




    function fl_check
        return Interfaces.C.int;
    pragma Import (C, fl_check, "fl_check");
    pragma Inline (fl_check);

    function fl_ready
        return Interfaces.C.int;
    pragma Import (C, fl_ready, "fl_ready");
    pragma Inline (fl_ready);

    function fl_wait
        return Interfaces.C.int;
    pragma Import (C, fl_wait, "fl_wait");
    pragma Inline (fl_wait);

    function fl_wait2
           (S : in Interfaces.C.double)
        return Interfaces.C.int;
    pragma Import (C, fl_wait2, "fl_wait2");
    pragma Inline (fl_wait2);

    function fl_run
        return Interfaces.C.int;
    pragma Import (C, fl_run, "fl_run");
    pragma Inline (fl_run);




    function Is_Valid
           (Object : in Wrapper)
        return Boolean is
    begin
        return Object.Void_Ptr /= System.Null_Address;
    end Is_Valid;


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




    function "+"
           (Left, Right : in Menu_Flag)
        return Menu_Flag is
    begin
        return Left or Right;
    end "+";




    function ABI_Check
           (ABI_Ver : in Version_Number)
        return Boolean is
    begin
        return fl_abi_check (Interfaces.C.int (ABI_Ver)) /= 0;
    end ABI_Check;


    function ABI_Version
        return Version_Number is
    begin
        return Version_Number (fl_abi_version);
    end ABI_Version;


    function API_Version
        return Version_Number is
    begin
        return Version_Number (fl_api_version);
    end API_Version;


    function Version
        return Version_Number is
    begin
        return Version_Number (fl_version);
    end Version;




    function Is_Damaged
        return Boolean is
    begin
        return fl_get_damage /= 0;
    end Is_Damaged;


    procedure Set_Damaged
           (To : in Boolean) is
    begin
        fl_set_damage (Boolean'Pos (To));
    end Set_Damaged;




    function Check
        return Boolean is
    begin
        return fl_check /= 0;
    end Check;


    function Ready
        return Boolean is
    begin
        return fl_ready /= 0;
    end Ready;


    function Wait
        return Integer is
    begin
        return Integer (fl_wait);
    end Wait;


    function Wait
           (Seconds : in Long_Float)
        return Integer is
    begin
        return Integer (fl_wait2 (Interfaces.C.double (Seconds)));
    end Wait;


    function Run
        return Integer is
    begin
        return Integer (fl_run);
    end Run;


end FLTK;

