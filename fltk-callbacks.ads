

package FLTK.Callbacks is


    type Callback is private;


    function Create
           (Call : in access procedure)
        return Callback;


private


    type Callback is null record;


end FLTK.Callbacks;

