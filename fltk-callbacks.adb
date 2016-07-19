

package body FLTK.Callbacks is


    function Create
           (Call : in access procedure)
        return Callback is
    begin
        return null record;
    end Create;


end FLTK.Callbacks;

