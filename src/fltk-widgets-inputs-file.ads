

package FLTK.Widgets.Inputs.File is


    type File_Input is new Input with private;

    type File_Input_Reference (Data : not null access File_Input'Class) is
        limited null record with Implicit_Dereference => Data;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return File_Input;

    end Forge;




    function Get_Down_Box
           (This : in File_Input)
        return Box_Kind;

    procedure Set_Down_Box
           (This : in out File_Input;
            To   : in     Box_Kind);

    function Get_Error_Color
           (This : in File_Input)
        return Color;

    procedure Set_Error_Color
           (This : in out File_Input;
            To   : in     Color);




    function Get_Value
           (This : in Input)
        return String;

    procedure Set_Value
           (This : in out Input;
            To   : in     String);




    procedure Draw
           (This : in out File_Input);

    function Handle
           (This  : in out File_Input;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    type File_Input is new Input with null record;

    overriding procedure Finalize
           (This : in out File_Input);




    pragma Inline (Get_Down_Box);
    pragma Inline (Set_Down_Box);
    pragma Inline (Get_Error_Color);
    pragma Inline (Set_Error_Color);


    pragma Inline (Get_Value);
    pragma Inline (Set_Value);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Inputs.File;

