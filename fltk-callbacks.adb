

package body FLTK.Callbacks is


    function Create
           (Call : access procedure)
        return Callback is
    begin
        return This : Callback;
    end Create;


end FLTK.Callbacks;

