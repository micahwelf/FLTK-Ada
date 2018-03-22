

with

    FLTK.Widgets.Boxes,
    FLTK.Widgets.Groups.Color_Choosers;


package FLTK.Dialogs is


    type Beep_Kind is
       (Default_Beep, Message_Beep, Error_Beep,
        Question_Beep, Password_Beep, Notification_Beep);

    type Choice is (First, Second, Third);




    procedure Alert
           (Message : String);

    --  function Ask
    --         (Message : in String)
    --      return Boolean;

    procedure Beep
           (Kind : in Beep_Kind);

    function Three_Way_Choice
           (Message, Button1, Button2, Button3 : in String)
        return Choice;

    function Text_Input
           (Message : in String;
            Default : in String := "")
        return String;

    procedure Message_Box
           (Message : in String);

    function Password
           (Message : in String;
            Default : in String := "")
        return String;




    function Color_Chooser
           (Title   : in     String;
            R, G, B : in out Long_Float;
            Mode    : in     FLTK.Widgets.Groups.Color_Choosers.Color_Mode)
        return Boolean;

    function Dir_Chooser
           (Message, Default : in String;
            Relative         : in Boolean := False)
        return String;

    function File_Chooser
           (Message, Filter_Pattern, Default : in String;
            Relative                         : in Boolean := False)
        return String;




    function Get_Hotspot
        return Boolean;

    procedure Set_Hotspot
           (To : in Boolean);

    procedure Set_Message_Font
           (Font : in Font_Kind;
            Size : in Font_Size);

    function Get_Message_Icon
        return FLTK.Widgets.Boxes.Box_Cursor;

    procedure Set_Message_Title
           (To : in String);

    procedure Set_Message_Title_Default
           (To : in String);


private


    Icon_Box : aliased FLTK.Widgets.Boxes.Box;


end FLTK.Dialogs;

