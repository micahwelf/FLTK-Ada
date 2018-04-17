

with

    FLTK.Widgets.Inputs,
    FLTK.Widgets.Menus.Menu_Buttons;


package FLTK.Widgets.Groups.Input_Choices is


    type Input_Choice is new Group with private;




    package Forge is

        function Create
               (X, Y, W, H : in Integer;
                Text       : in String)
            return Input_Choice;

    end Forge;




    function Input
           (This : in out Input_Choice)
        return FLTK.Widgets.Inputs.Input_Reference;

    function Menu_Button
           (This : in out Input_Choice)
        return FLTK.Widgets.Menus.Menu_Buttons.Menu_Button_Cursor;




    function Has_Changed
           (This : in Input_Choice)
        return Boolean;

    procedure Clear_Changed
           (This : in out Input_Choice);

    function Get_Down_Box
           (This : in Input_Choice)
        return Box_Kind;

    procedure Set_Down_Box
           (This : in out Input_Choice;
            To   : in     Box_Kind);

    function Get_Text_Color
           (This : in Input_Choice)
        return Color;

    procedure Set_Text_Color
           (This : in out Input_Choice;
            To   : in     Color);

    function Get_Text_Font
           (This : in Input_Choice)
        return Font_Kind;

    procedure Set_Text_Font
           (This : in out Input_Choice;
            To   : in     Font_Kind);

    function Get_Text_Size
           (This : in Input_Choice)
        return Font_Size;

    procedure Set_Text_Size
           (This : in out Input_Choice;
            To   : in     Font_Size);

    function Get_Input
           (This : in Input_Choice)
        return String;

    procedure Set_Input
           (This : in out Input_Choice;
            To   : in     String);

    procedure Set_Item
           (This : in out Input_Choice;
            Num  : in     Integer);




    procedure Draw
           (This : in out Input_Choice);

    function Handle
           (This  : in out Input_Choice;
            Event : in     Event_Kind)
        return Event_Outcome;


private


    package INP renames FLTK.Widgets.Inputs;
    package MB renames FLTK.Widgets.Menus.Menu_Buttons;


    type Input_Access is access INP.Input;
    type Menu_Button_Access is access MB.Menu_Button;


    type Input_Choice is new Group with record
        My_Input       : Input_Access;
        My_Menu_Button : Menu_Button_Access;
    end record;

    overriding procedure Finalize
           (This : in out Input_Choice);


end FLTK.Widgets.Groups.Input_Choices;

