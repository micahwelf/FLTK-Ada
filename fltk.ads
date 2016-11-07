

with Ada.Finalization;
private with System;


package FLTK is


    function Run return Integer;


    --  ugly implementation detail, never use this
    --  just ignore the hand moving behind the curtain
    --  (this is necessary so things like text_buffers and
    --  widgets can talk to each other behind the binding)
    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with private;


private


    function Has_Valid_Ptr
           (This : in Wrapper)
        return Boolean;


    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with
        record
            Void_Ptr : System.Address;
        end record;
        --  with Type_Invariant => Has_Valid_Ptr (Wrapper);

    --  unsure if the above invariant is doing what I'm after
    --  oh well, something to work on


    overriding procedure Initialize
           (This : in out Wrapper);


end FLTK;

