

package FLTK.Callbacks is


    type Callback is private;


    function Create
           (Call : access procedure)
        return Callback;


private


    type Callback is null record;


end FLTK.Callbacks;

