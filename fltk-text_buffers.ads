

package FLTK.Text_Buffers is


    type Text_Buffer is new Wrapper with private;
    type Text_Buffer_Access is access all Text_Buffer;


    function Create
           (Requested_Size     : in Natural := 0;
            Preferred_Gap_Size : in Natural := 1024)
        return Text_Buffer;


private


    type Text_Buffer is new Wrapper with null record;


    overriding procedure Finalize
           (This : in out Text_Buffer);


end FLTK.Text_Buffers;

