

package FLTK.Popups is


    procedure Alert
           (Message : String);


    type Choice is (First, Second, Third);
    function Three_Way_Choice
           (Message, Button1, Button2, Button3 : in String)
        return Choice;


    function File_Chooser
           (Message, Filter_Pattern, Default : in String;
            Relative : in Boolean := False)
        return String;


    function Text_Input
           (Message, Default : in String)
        return String;


    procedure Message_Box
           (Message : in String);


end FLTK.Popups;

