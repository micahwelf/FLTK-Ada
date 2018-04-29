

with

    FLTK.Widgets.Inputs,
    FLTK.Widgets.Menus.Menu_Buttons;


package FLTK.Widgets.Groups.Input_Choices is


    type Input_Choice is new Group with private;

    type Input_Choice_Reference (Data : not null access Input_Choice'Class) is
        limited null record with Implicit_Dereference => Data;




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
        return FLTK.Widgets.Menus.Menu_Buttons.Menu_Button_Reference;




    procedure Clear
           (This : in out Input_Choice);




    function Has_Changed
           (This : in Input_Choice)
        return Boolean;

    procedure Clear_Changed
           (This : in out Input_Choice);

    procedure Set_Changed
           (This : in out Input_Choice;
            To   : in     Boolean);

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




    pragma Inline (Input);
    pragma Inline (Menu_Button);


    pragma Inline (Has_Changed);
    pragma Inline (Clear_Changed);
    pragma Inline (Get_Down_Box);
    pragma Inline (Set_Down_Box);
    pragma Inline (Get_Text_Color);
    pragma Inline (Set_Text_Color);
    pragma Inline (Get_Text_Font);
    pragma Inline (Set_Text_Font);
    pragma Inline (Get_Text_Size);
    pragma Inline (Set_Text_Size);
    pragma Inline (Get_Input);
    pragma Inline (Set_Input);
    pragma Inline (Set_Item);


    pragma Inline (Draw);
    pragma Inline (Handle);


end FLTK.Widgets.Groups.Input_Choices;

