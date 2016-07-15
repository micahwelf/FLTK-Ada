

package FLTK.Text_Buffers is


    type Text_Buffer is new Wrapper with private;
    type Text_Buffer_Cursor (Data : access Text_Buffer'Class) is limited null record
        with Implicit_Dereference => Data;


    function Create
           (Requested_Size     : in Natural := 0;
            Preferred_Gap_Size : in Natural := 1024)
        return Text_Buffer;


private


    type Text_Buffer is new Wrapper with null record;


    overriding procedure Finalize
           (This : in out Text_Buffer);


end FLTK.Text_Buffers;

